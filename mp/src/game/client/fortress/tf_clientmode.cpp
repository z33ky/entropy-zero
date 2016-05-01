#include "cbase.h"
#include "hud.h"
#include "hud_macros.h"
#include "clientmode_tfnormal.h"
#include "clientmode.h"
#include "clientmode_commander.h"
#include "mapdata.h"
#include "ivmodemanager.h"
#include "hud_timer.h"
#include "hud_technologytreedoc.h"
#include "CommanderOverlay.h"
#include "c_tf2rootpanel.h"
#include "c_info_act.h"

// default FOV for TF2
ConVar default_fov( "default_fov", "90", FCVAR_CHEAT );

//-----------------------------------------------------------------------------
// Purpose: Handles switching to/from commander mode
//-----------------------------------------------------------------------------
class CTFModeManager : public IVModeManager
{
public:
	virtual void	Init( void );
	virtual void	SwitchMode( bool commander, bool force );
	virtual void	LevelInit( const char *newmap );
	virtual void	LevelShutdown( void );

	void			UserCmd_Commander( void );
	void			UserCmd_Normal( void );

};

static CTFModeManager g_ModeManager;
IVModeManager *modemanager = ( IVModeManager * )&g_ModeManager;

// The current client mode. Always ClientModeNormal in HL.
IClientMode *g_pClientMode = NULL;

DECLARE_COMMAND( g_ModeManager, Commander );
DECLARE_COMMAND( g_ModeManager, Normal );

HOOK_COMMAND( commander, Commander );
HOOK_COMMAND( normal, Normal );

void __MsgFunc_ActBegin(bf_read &msg);
void __MsgFunc_ActEnd(bf_read &msg);

#define MINIMAP_FILE	"scripts/minimap_overlays.txt"
#define SCREEN_FILE		"scripts/vgui_screens.txt"

//-----------------------------------------------------------------------------
// Purpose: Intialize the mode manager
//-----------------------------------------------------------------------------
void CTFModeManager::Init( void )
{
	g_pClientMode = GetClientModeNormal();
	
	// These define the panels that can be used by the engine
	PanelMetaClassMgr()->LoadMetaClassDefinitionFile( MINIMAP_FILE );
	PanelMetaClassMgr()->LoadMetaClassDefinitionFile( SCREEN_FILE );

	// FIXME: Turn these into client systems
	HudCommanderOverlayMgr()->GameInit();
	MapData().Init();
	GetTechnologyTreeDoc().Init();

	HOOK_MESSAGE( ActBegin );
	HOOK_MESSAGE( ActEnd );
}

void CTFModeManager::UserCmd_Commander( void )
{
	engine->ServerCmd( "tactical 1\n" );
}

void CTFModeManager::UserCmd_Normal( void )
{
	engine->ServerCmd( "tactical 0\n" );
}

//-----------------------------------------------------------------------------
// Purpose: Switch to / from commander mode ( won't change if current mode is already
//  correct
// Input  : commander - 
//-----------------------------------------------------------------------------
void CTFModeManager::SwitchMode( bool commander, bool force )
{
	// hogsy start
	ClientModeTFNormal *mode = (ClientModeTFNormal *)g_pClientMode;
	if (!mode)
	{
		Assert( 0 );
		return;
	}

	if (commander && (!mode->IsCommanderMode() || force))
		mode->EnableCommanderMode();
	else if (!commander && (mode->IsCommanderMode() || force))
		mode->DisableCommanderMode();
	// hogsy end
}

void CTFModeManager::LevelInit( const char *newmap )
{
	GetTechnologyTreeDoc().LevelInit();
	g_pTF2RootPanel->LevelInit();

	CHudTimer *timer = GET_HUDELEMENT( CHudTimer );
	if ( timer )
		timer->Init();

	// Tell all modes about the map change
	g_pClientMode->LevelInit(newmap);
}

void CTFModeManager::LevelShutdown( void )
{
	g_pClientMode->LevelShutdown();

	g_pTF2RootPanel->LevelShutdown();
	GetTechnologyTreeDoc().LevelShutdown();
}

//-----------------------------------------------------------------------------
// Purpose: A new act has just begun
//-----------------------------------------------------------------------------
void __MsgFunc_ActBegin(bf_read &msg)
{
	int iActNumber = (char)msg.ReadByte();
	float flStartTime = msg.ReadFloat();

	StartAct( iActNumber, flStartTime );
}

//-----------------------------------------------------------------------------
// Purpose: An act has just ended
//-----------------------------------------------------------------------------
void __MsgFunc_ActEnd(bf_read &msg)
{
	CHudTimer *timer = GET_HUDELEMENT( CHudTimer );
	if ( timer )
		timer->SetNoFixedTimer( 0.0f );
}
