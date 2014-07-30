#include "cbase.h"

#include "tf_hintmanager.h"

#define TFHINTMANAGER_THINK_INTERVAL 1.0f

IMPLEMENT_SERVERCLASS_ST_NOBASE(CTFHintManager, DT_TFHintManager)
END_SEND_TABLE()

LINK_ENTITY_TO_CLASS( tf_hintmanager, CTFHintManager );

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
CTFHintManager::CTFHintManager( void )
{
#ifdef IMPLEMENT_ME // ?
	NetworkStateManualMode( true );
#endif
}

void CTFHintManager::Spawn( void )
{
	Precache();
}

void CTFHintManager::Think( void )
{
	SetNextThink( gpGlobals->curtime + TFHINTMANAGER_THINK_INTERVAL );
}

void CTFHintManager::AddHint( CBaseTFPlayer *player, int hintID, int priority, int entityIndex /*=0*/ )
{
	// Send a message to the client side entity 
}

//-----------------------------------------------------------------------------
// Purpose: Always send
// Input  : **ppSendTable - 
//			*recipient - 
//			*pvs - 
//			clientArea - 
// Output : Returns true on success, false on failure.
//-----------------------------------------------------------------------------
bool CTFHintManager::ShouldTransmit( const edict_t *recipient, const void *pvs, int clientArea )
{
	// Always send the manager, it has no data so it's no big deal
	return true;
}
