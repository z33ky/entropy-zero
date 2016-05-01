//===== Copyright © 1996-2005, Valve Corporation, All rights reserved. ======//
//
// Purpose: 
//
// $Workfile:     $
// $NoKeywords: $
//===========================================================================//
#include "cbase.h"
#include "hud_chat.h"
#include "clientmode_commander.h"
#include "vgui_int.h"
#include "ivmodemanager.h"
#include "iinput.h"
#include "kbutton.h"
#include "usercmd.h"
#include "c_basetfplayer.h"
#include "view_shared.h"
#include "in_main.h"
#include "commanderoverlaypanel.h"
#include "IViewRender.h"
#include <vgui/IInput.h>
#include <vgui/IPanel.h>


// memdbgon must be the last include file in a .cpp file!!!
#include "tier0/memdbgon.h"


extern Vector g_vecRenderOrigin;
extern QAngle g_vecRenderAngles;



//-----------------------------------------------------------------------------
// Purpose: 
// Input  : *commander - 
//-----------------------------------------------------------------------------
void CCommanderViewportPanel::SetCommanderView( CClientModeCommander *commander )
{
#if 0
	m_pCommanderView = commander;

	if ( m_pOverlayPanel )
	{
		m_pOverlayPanel->SetCommanderView( m_pCommanderView );
	}
#endif
}

CClientModeCommander::CClientModeCommander() : BaseClass()
{
	m_pClear = NULL;
	m_pSkyBox = NULL;
	
#if 0
	m_pViewport = new CCommanderViewportPanel();
	// Give us a chance to set ourselves up properly...
	m_pViewport->Start( gameuifuncs, gameeventmanager );

	GetCommanderViewport()->SetCommanderView( this );
#endif
}

CClientModeCommander::~CClientModeCommander()
{}

//-----------------------------------------------------------------------------
// returns the viewport panel
//-----------------------------------------------------------------------------
vgui::Panel *CClientModeCommander::GetViewport()
{
	return m_pViewport;
}


