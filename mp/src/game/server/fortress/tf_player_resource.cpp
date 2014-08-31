
// Purpose: TF's custom CPlayerResource

#include "cbase.h"
#include "player.h"
#include "player_resource.h"
#include "tf_player_resource.h"

// Datatable
IMPLEMENT_SERVERCLASS_ST(CTFPlayerResource, DT_TFPlayerResource)
END_SEND_TABLE()

LINK_ENTITY_TO_CLASS( tf_player_manager, CTFPlayerResource );

void CTFPlayerResource::Spawn( void )
{
	BaseClass::Spawn();

#if 0
	// Use autodetect, but only once every second.
	NetworkStateSetUpdateInterval( 2.0f );
#endif
}

void CTFPlayerResource::UpdatePlayerData( void )
{
	BaseClass::UpdatePlayerData();
}
