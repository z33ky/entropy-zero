/*
Copyright (C) Valve Corporation
Copyright (C) 2014-2020 Mark Sowden <markelswo@gmail.com>
*/

#include "cbase.h"
#include "ragdoll_shadow.h"
#include "tf_player.h"
#include "sendproxy.h"

IMPLEMENT_SERVERCLASS_ST_NOBASE( CRagdollShadow, DT_RagdollShadow )
	SendPropVector( SENDINFO( ragdollOrigin ), -1, SPROP_COORD ),
	SendPropEHandle( SENDINFO( playerHandle ) ),
	SendPropModelIndex( SENDINFO( m_nModelIndex ) ),
	SendPropInt( SENDINFO( m_nForceBone ), 8, 0 ),
	SendPropVector( SENDINFO( m_vecForce ), -1, SPROP_NOSCALE ),
	SendPropVector( SENDINFO( ragdollVelocity ) )
END_SEND_TABLE()

LINK_ENTITY_TO_CLASS( ragdoll_shadow, CRagdollShadow );
PRECACHE_REGISTER( ragdoll_shadow );

/**
 * Create a default ragdoll shadow instance.
 */
CRagdollShadow *CRagdollShadow::Create( CBasePlayer *player, const Vector& force ) {
	CRagdollShadow *ragdollShadow = dynamic_cast< CRagdollShadow* >( CreateEntityByName( "ragdoll_shadow" ) );

	ragdollShadow->playerHandle		= player;
	ragdollShadow->ragdollOrigin	= player->GetAbsOrigin();
	ragdollShadow->ragdollVelocity	= player->GetAbsVelocity();
	ragdollShadow->m_nModelIndex	= player->GetModelIndex();
	ragdollShadow->m_nForceBone		= player->m_nForceBone;
	ragdollShadow->m_vecForce		= force;

	ragdollShadow->SetAbsOrigin( player->GetAbsOrigin() );

	return ragdollShadow;
}