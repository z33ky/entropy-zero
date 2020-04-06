/*
Copyright (C) Valve Corporation
Copyright (C) 2014-2020 Mark Sowden <markelswo@gmail.com>
*/

#include "cbase.h"
#include "c_baseplayer.h"

class C_RagdollShadow : public C_BaseAnimatingOverlay {
public:
	DECLARE_CLASS( C_RagdollShadow, C_BaseAnimatingOverlay );
	DECLARE_CLIENTCLASS();

	C_RagdollShadow();
	~C_RagdollShadow();

	virtual void OnDataChanged( DataUpdateType_t type );

	int GetPlayerEntIndex() const;
	IRagdoll* GetIRagdoll() const;

	void ImpactTrace( trace_t *pTrace, int iDamageType, const char *pCustomImpactName );
	void UpdateOnRemove( void );
	virtual void SetupWeights( const matrix3x4_t *pBoneToWorld, int nFlexWeightCount, float *pFlexWeights, float *pFlexDelayedWeights );

private:
	C_RagdollShadow( const C_RagdollShadow & ) {}

	void Interp_Copy( C_BaseAnimatingOverlay *pDestinationEntity );
	void CreateRagdollShadow();

	EHANDLE	playerHandle;
	CNetworkVector( ragdollVelocity );
	CNetworkVector( ragdollOrigin );
};

IMPLEMENT_CLIENTCLASS_DT_NOBASE( C_RagdollShadow, DT_RagdollShadow, CRagdollShadow )
	RecvPropVector( RECVINFO( ragdollOrigin ) ),
	RecvPropEHandle( RECVINFO( playerHandle ) ),
	RecvPropInt( RECVINFO( m_nModelIndex ) ),
	RecvPropInt( RECVINFO( m_nForceBone ) ),
	RecvPropVector( RECVINFO( m_vecForce ) ),
	RecvPropVector( RECVINFO( ragdollVelocity ) )
END_RECV_TABLE()


C_RagdollShadow::C_RagdollShadow() {}

C_RagdollShadow::~C_RagdollShadow() {
	PhysCleanupFrictionSounds( this );

	if ( playerHandle ) {
		playerHandle->CreateModelInstance();
	}
}

void C_RagdollShadow::Interp_Copy( C_BaseAnimatingOverlay *pSourceEntity ) {
	if ( !pSourceEntity )
		return;

	VarMapping_t *pSrc = pSourceEntity->GetVarMapping();
	VarMapping_t *pDest = GetVarMapping();

	// Find all the VarMapEntry_t's that represent the same variable.
	for ( int i = 0; i < pDest->m_Entries.Count(); i++ ) {
		VarMapEntry_t *pDestEntry = &pDest->m_Entries[ i ];
		const char *pszName = pDestEntry->watcher->GetDebugName();
		for ( int j = 0; j < pSrc->m_Entries.Count(); j++ ) {
			VarMapEntry_t *pSrcEntry = &pSrc->m_Entries[ j ];
			if ( !Q_strcmp( pSrcEntry->watcher->GetDebugName(), pszName ) ) {
				pDestEntry->watcher->Copy( pSrcEntry->watcher );
				break;
			}
		}
	}
}

void C_RagdollShadow::ImpactTrace( trace_t *pTrace, int iDamageType, const char *pCustomImpactName ) {
	IPhysicsObject *pPhysicsObject = VPhysicsGetObject();

	if ( !pPhysicsObject )
		return;

	Vector dir = pTrace->endpos - pTrace->startpos;

	if ( iDamageType == DMG_BLAST ) {
		dir *= 4000;  // adjust impact strenght

		// apply force at object mass center
		pPhysicsObject->ApplyForceCenter( dir );
	} else {
		Vector hitpos;

		VectorMA( pTrace->startpos, pTrace->fraction, dir, hitpos );
		VectorNormalize( dir );

		dir *= 4000;  // adjust impact strenght

		// apply force where we hit it
		pPhysicsObject->ApplyForceOffset( dir, hitpos );

		// Blood spray!
		//		FX_CS_BloodSpray( hitpos, dir, 10 );
	}

	m_pRagdoll->ResetRagdollSleepAfterTime();
}


void C_RagdollShadow::CreateRagdollShadow( void ) {
	// First, initialize all our data. If we have the player's entity on our client,
	// then we can make ourselves start out exactly where the player is.
	C_BasePlayer *pPlayer = dynamic_cast< C_BasePlayer* >( playerHandle.Get() );

	if ( pPlayer && !pPlayer->IsDormant() ) {
		// move my current model instance to the ragdoll's so decals are preserved.
		pPlayer->SnatchModelInstance( this );

		VarMapping_t *varMap = GetVarMapping();

		// Copy all the interpolated vars from the player entity.
		// The entity uses the interpolated history to get bone velocity.
		bool bRemotePlayer = ( pPlayer != C_BasePlayer::GetLocalPlayer() );
		if ( bRemotePlayer ) {
			Interp_Copy( pPlayer );

			SetAbsAngles( pPlayer->GetRenderAngles() );
			GetRotationInterpolator().Reset();

			m_flAnimTime = pPlayer->m_flAnimTime;
			SetSequence( pPlayer->GetSequence() );
			m_flPlaybackRate = pPlayer->GetPlaybackRate();
		} else {
			// This is the local player, so set them in a default
			// pose and slam their velocity, angles and origin
			SetAbsOrigin( ragdollOrigin );

			SetAbsAngles( pPlayer->GetRenderAngles() );

			SetAbsVelocity( ragdollVelocity );

			int iSeq = pPlayer->GetSequence();
			if ( iSeq == -1 ) {
				Assert( false );	// missing walk_lower?
				iSeq = 0;
			}

			SetSequence( iSeq );	// walk_lower, basic pose
			SetCycle( 0.0 );

			Interp_Reset( varMap );
		}
	} else {
		// overwrite network origin so later interpolation will
		// use this position
		SetNetworkOrigin( ragdollOrigin );

		SetAbsOrigin( ragdollOrigin );
		SetAbsVelocity( ragdollVelocity );

		Interp_Reset( GetVarMapping() );

	}

	SetModelIndex( m_nModelIndex );

	// Make us a ragdoll..
	m_nRenderFX = kRenderFxRagdoll;

	matrix3x4_t boneDelta0[ MAXSTUDIOBONES ];
	matrix3x4_t boneDelta1[ MAXSTUDIOBONES ];
	matrix3x4_t currentBones[ MAXSTUDIOBONES ];
	const float boneDt = 0.05f;

	if ( pPlayer && !pPlayer->IsDormant() ) {
		pPlayer->GetRagdollInitBoneArrays( boneDelta0, boneDelta1, currentBones, boneDt );
	} else {
		GetRagdollInitBoneArrays( boneDelta0, boneDelta1, currentBones, boneDt );
	}

	InitAsClientRagdoll( boneDelta0, boneDelta1, currentBones, boneDt );
}


void C_RagdollShadow::OnDataChanged( DataUpdateType_t type ) {
	BaseClass::OnDataChanged( type );

	if ( type == DATA_UPDATE_CREATED ) {
		CreateRagdollShadow();
	}
}

IRagdoll* C_RagdollShadow::GetIRagdoll() const {
	return m_pRagdoll;
}

void C_RagdollShadow::UpdateOnRemove( void ) {
	VPhysicsSetObject( NULL );

	BaseClass::UpdateOnRemove();
}

//-----------------------------------------------------------------------------
// Purpose: clear out any face/eye values stored in the material system
//-----------------------------------------------------------------------------
void C_RagdollShadow::SetupWeights( const matrix3x4_t *pBoneToWorld, int nFlexWeightCount, float *pFlexWeights, float *pFlexDelayedWeights ) {
	BaseClass::SetupWeights( pBoneToWorld, nFlexWeightCount, pFlexWeights, pFlexDelayedWeights );

	static float destweight[ 128 ];
	static bool bIsInited = false;

	CStudioHdr *hdr = GetModelPtr();
	if ( !hdr )
		return;

	int nFlexDescCount = hdr->numflexdesc();
	if ( nFlexDescCount ) {
		Assert( !pFlexDelayedWeights );
		memset( pFlexWeights, 0, nFlexWeightCount * sizeof( float ) );
	}

	if ( m_iEyeAttachment > 0 ) {
		matrix3x4_t attToWorld;
		if ( GetAttachment( m_iEyeAttachment, attToWorld ) ) {
			Vector local, tmp;
			local.Init( 1000.0f, 0.0f, 0.0f );
			VectorTransform( local, attToWorld, tmp );
			modelrender->SetViewTarget( GetModelPtr(), GetBody(), tmp );
		}
	}
}
