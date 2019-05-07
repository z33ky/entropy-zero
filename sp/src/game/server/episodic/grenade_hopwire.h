//========= Copyright Valve Corporation, All rights reserved. ============//
//
// Purpose: 
//
//=============================================================================//

#ifndef GRENADE_HOPWIRE_H
#define GRENADE_HOPWIRE_H
#ifdef _WIN32
#pragma once
#endif

#include "basegrenade_shared.h"
#include "Sprite.h"

extern ConVar hopwire_trap;

class CGravityVortexController;

class CGrenadeHopwire : public CBaseGrenade
{
	DECLARE_CLASS( CGrenadeHopwire, CBaseGrenade );
	DECLARE_DATADESC();
	DECLARE_SERVERCLASS();

public:
	void	Spawn( void );
	void	Precache( void );
	bool	CreateVPhysics( void );
	void	SetTimer( float timer );
	void	SetVelocity( const Vector &velocity, const AngularImpulse &angVelocity );
	void	Detonate( void );
	
	void	EndThink( void );		// Last think before going away
	void	CombatThink( void );	// Makes the main explosion go off

	void SetWorldModelClosed(const char * modelName) { Q_strncpy(szWorldModelClosed, modelName, MAX_WEAPON_STRING); }
	void SetWorldModelOpen(const char * modelName) { Q_strncpy(szWorldModelOpen, modelName, MAX_WEAPON_STRING); }

protected:

	void	KillStriders( void );

	char	szWorldModelClosed[MAX_WEAPON_STRING]; // "models/roller.mdl"
	char	szWorldModelOpen[MAX_WEAPON_STRING]; // "models/roller_spikes.mdl"

	CHandle<CGravityVortexController>	m_hVortexController;
};

extern CBaseGrenade *HopWire_Create( const Vector &position, const QAngle &angles, const Vector &velocity, const AngularImpulse &angVelocity, CBaseEntity *pOwner, float timer, const char * modelClosed, const char * modelOpen );

#endif // GRENADE_HOPWIRE_H
