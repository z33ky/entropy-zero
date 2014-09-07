#include "cbase.h"

#include "order_events.h"
#include "tf_team.h"

//-----------------------------------------------------------------------------
// Purpose: Fire an event for all teams telling them to update their orders
//-----------------------------------------------------------------------------
void GlobalOrderEvent( COrderEvent_Base *pOrder )
{
	// Loop through the teams
	// Updated so this starts off with the human team. ~hogsy
	for ( int i = TEAM_HUMANS; i < MAX_TF_TEAMS; i++ )
	{
		CTFTeam *pTeam = GetGlobalTFTeam( i );
		pTeam->UpdateOrdersOnEvent( pOrder );
	}
}
