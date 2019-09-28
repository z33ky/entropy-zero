#include "cbase.h"
#include "usermessages.h"
#include "shake.h"
#include "voice_gamemgr.h"

#include "haptics/haptic_msgs.h"

void RegisterUserMessages( void )
{
	usermessages->Register( "ResetHUD", 1 );				// called every respawn
	usermessages->Register( "Fade", sizeof(ScreenFade_t) );
	usermessages->Register( "CloseCaption", -1 );			// Show a caption (by string id number)(duration in 10th of a second)
	usermessages->Register( "Train", 1 );
	usermessages->Register( "HudText", -1 );
	usermessages->Register( "GameTitle", 0 );
	usermessages->Register( "SayText", -1 );
	usermessages->Register( "SayText2", -1 );
	usermessages->Register( "Geiger", 1 );
	usermessages->Register( "TextMsg", -1 );
	usermessages->Register( "InitHUD", 0 );		// called every time a new player joins the server
	usermessages->Register( "MOTD", -1 );
	usermessages->Register( "ItemPickup", -1 );	// unused
	usermessages->Register( "ShowMenu", -1 );	// unused
	usermessages->Register( "Shake", -1 );
	usermessages->Register( "TeamChange", 1 );
	usermessages->Register( "ClearDecals", 1 );
	usermessages->Register( "GameMode", 1 );
	usermessages->Register( "VGUIMenu", -1 );		// Show VGUI menu
	usermessages->Register( "Rumble", 3 );			// Send a rumble to a controller
	usermessages->Register( "HintText", -1 );		// Displays hint text display
	usermessages->Register( "KeyHintText", -1 );	// Displays hint text display
	usermessages->Register( "HudMsg", -1 );
	usermessages->Register( "AmmoDenied", 2 );
	usermessages->Register( "VoiceMask", VOICE_MAX_PLAYERS_DW*4 * 2 + 1 );
	usermessages->Register( "RequestState", 0 );

	// TF User messages
	usermessages->Register( "Damage", 13 );
	usermessages->Register( "Accuracy", 2 );		// unused
	usermessages->Register( "ZoneState", 1 );		// unused
	usermessages->Register( "Technology", -1 );
	usermessages->Register( "MinimapPulse", -1 );
	usermessages->Register( "ActBegin", -1 );
	usermessages->Register( "ActEnd", -1 );
	usermessages->Register( "PickupRes", 1 );

	// Timer
	usermessages->Register("StartTimer", 1);
	usermessages->Register("SetTimer", 4);
	usermessages->Register("UpdateTimer", 4);

	// NVNT register haptic user messages
	RegisterHapticMessages();
}