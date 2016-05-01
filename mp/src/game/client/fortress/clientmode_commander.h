//========= Copyright © 1996-2005, Valve Corporation, All rights reserved. ============//
//
// Purpose: 
//
// $Workfile:     $
// $Date:         $
// $NoKeywords: $
//=============================================================================//
#if !defined( CLIENTMODE_COMMANDER_H )
#define CLIENTMODE_COMMANDER_H
#ifdef _WIN32
#pragma once
#endif

#include "clientmode_tfbase.h"
#include <vgui/Cursor.h>
#include "hud_minimap.h"
#include <vgui_controls/Panel.h>

class IMaterial;
class CCommanderViewportPanel;
class Vector;
class CCommanderOverlayPanel;
namespace vgui
{
	class Panel;
	class AnimationController;
}

class CClientModeCommander : public ClientModeTFBase, public IMinimapClient
{
	DECLARE_CLASS( CClientModeCommander, ClientModeTFBase );

// IClientMode overrides.
public:
	
					CClientModeCommander();
	virtual			~CClientModeCommander();

	virtual vgui::Panel		*GetViewport();
	virtual vgui::AnimationController *GetViewportAnimationController() { return NULL; }

private:
	float	Commander_ResampleMove( float in );

private:

	ConVar*	m_pClear;
	ConVar*	m_pSkyBox;
	float	m_fOldClear;
	float	m_fOldSkybox;
};


//-----------------------------------------------------------------------------
// The panel responsible for rendering the 3D view in orthographic mode
//-----------------------------------------------------------------------------
class CCommanderViewportPanel : public CBaseViewport
{
	typedef CBaseViewport BaseClass;

// Panel overrides.
public:
					CCommanderViewportPanel( void );
	virtual			~CCommanderViewportPanel( void );

	void			SetCommanderView( CClientModeCommander *commander );

	virtual void ApplySchemeSettings( vgui::IScheme *pScheme )
	{
		BaseClass::ApplySchemeSettings( pScheme );

		gHUD.InitColors( pScheme );
	}

private:
	//CClientModeCommander *m_pCommanderView;
};

#endif // CLIENTMODE_COMMANDER_H