//===== Copyright © 1996-2005, Valve Corporation, All rights reserved. ======//
//
// Purpose: 
//
// $NoKeywords: $
//===========================================================================//
#include "cbase.h"
#include "clientmode_tfbase.h"
#include "hud.h"
#include "c_tf_basecombatweapon.h"
#include "ienginevgui.h"
#include "c_tf_hintmanager.h"
#include <vgui_controls/Controls.h>
#include <vgui/IScheme.h>
#include "filesystem.h"

// memdbgon must be the last include file in a .cpp file!!!
#include "tier0/memdbgon.h"


CMinimapPanel *ClientModeTFBase::m_pMinimap = NULL;
CCommanderStatusPanel *ClientModeTFBase::m_pCommanderStatus = nullptr;
vgui::HScheme g_hVGuiObjectScheme = 0;

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
ClientModeTFBase::ClientModeTFBase( void ) {}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
ClientModeTFBase::~ClientModeTFBase( void ) {}

//-----------------------------------------------------------------------------
// Purpose: 
// Output : CMinimapPanel
//-----------------------------------------------------------------------------
CMinimapPanel *ClientModeTFBase::GetMinimap( void )
{
	return m_pMinimap;
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------

void ClientModeTFBase::Init()
{
	BaseClass::Init();

	C_BaseTFCombatWeapon::CreateCrosshairPanels();

	if ( !m_pMinimap )
		m_pMinimap = GET_HUDELEMENT( CMinimapPanel );
	if (!m_pCommanderStatus)
		m_pCommanderStatus = GET_HUDELEMENT(CCommanderStatusPanel);

	// Load up the object control panel scheme
	g_hVGuiObjectScheme = vgui::scheme()->LoadSchemeFromFileEx( enginevgui->GetPanel( PANEL_CLIENTDLL ), "resource/ObjectControlPanelScheme.res", "TFBase" );
	if (!g_hVGuiObjectScheme)
	{
		Warning( "Couldn't load control panel scheme!\n" );
	}

	// Load the objects.txt file.
	LoadObjectInfos( ::filesystem );
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void ClientModeTFBase::Shutdown()
{
	C_BaseTFCombatWeapon::DestroyCrosshairPanels();

	BaseClass::Shutdown();
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void ClientModeTFBase::Enable( void )
{
	BaseClass::Enable();

	// Hook the minimap traces into the minimap
	if ( GetMinimap() )
	{
		GetMinimap()->Activate();
	}
}

void ClientModeTFBase::LevelInit( const char *newmap )
{
	BaseClass::LevelInit( newmap );

	// Tell the radar to load the radar's overlay map
	if ( GetMinimap() )
	{
		GetMinimap()->LevelInit( newmap );
	}
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void ClientModeTFBase::LevelShutdown( void )
{
	BaseClass::LevelShutdown();

	if ( GetMinimap() )
	{
		GetMinimap()->LevelShutdown();
	}
}

void ClientModeTFBase::FireGameEvent( IGameEvent *event ) {
	// TODO: handle any custom events here

	BaseClass::FireGameEvent( event );
}

void ClientModeTFBase::PostRender( void ) {
	BaseClass::PostRender();

	C_BaseTFPlayer *pl = C_BaseTFPlayer::GetLocalPlayer();
	if( pl != nullptr ) {
		pl->UpdateTargetReticles();
	}
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void ClientModeTFBase::Update( void )
{
	BaseClass::Update();
	
	MapData().Update();
}

//-----------------------------------------------------------------------------
// Purpose: We've received a keypress from the engine. Return 1 if the engine is allowed to handle it.
//-----------------------------------------------------------------------------
int	ClientModeTFBase::KeyInput( int down, ButtonCode_t keynum, const char *pszCurrentBinding )
{
	if ( engine->Con_IsVisible() == false )
	{
		// Let hint system snag first escape key release
		if ( down && ( keynum == KEY_ENTER ) && HintSystemEscapeKey() )
		{
			return 0;
		}

		// Has the player hit one of his Order keys?
		if ( pszCurrentBinding && strncmp( pszCurrentBinding, "order", 5 ) == 0 )
		{
			if ( down )
			{
				//int iOrderNumber = (pszCurrentBinding[6] - '0') - 1;
				//GetHudOrderList()->SelectOrder( iOrderNumber );
			}
			return 0;
		}
	}

	return BaseClass::KeyInput( down, keynum, pszCurrentBinding );
}

