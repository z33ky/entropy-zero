/*
Copyright (C) Valve Corporation
Copyright (C) 2014-2020 Mark Sowden <markelswo@gmail.com>
*/

#pragma once

/**
 * A shadow object used to bound the position of a player ragdoll
 */
class CRagdollShadow : public CBaseAnimatingOverlay
{
public:
	DECLARE_CLASS( CRagdollShadow, CBaseAnimatingOverlay );
	DECLARE_SERVERCLASS();

	// Transmit ragdolls to everyone.
	virtual int UpdateTransmitState() {
		return SetTransmitState( FL_EDICT_ALWAYS );
	}

	static CRagdollShadow *Create( CBasePlayer *player, const Vector& force );

public:
	CNetworkHandle( CBaseEntity, playerHandle );	// networked entity handle 
	CNetworkVector( ragdollVelocity );
	CNetworkVector( ragdollOrigin );
};
