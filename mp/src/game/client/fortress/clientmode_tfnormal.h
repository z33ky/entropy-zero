/*
Copyright (C) Valve Corporation
Copyright (C) 2014-2016 TalonBrave.info
*/

#include <vgui/Cursor.h>
#include "clientmode_tfbase.h"
#include <vgui_controls/EditablePanel.h>
#include "hud_minimap.h"

class CCommanderOverlayPanel;
namespace vgui
{
	class AnimationController;
}

class ClientModeTFNormal : public ClientModeTFBase, public IMinimapClient
{
DECLARE_CLASS( ClientModeTFNormal, ClientModeTFBase );

// IClientMode overrides.
public:
	ClientModeTFNormal();

	class Viewport : public CBaseViewport
	{
		typedef CBaseViewport BaseClass;
		// Panel overrides.
	public:
		Viewport();
		virtual ~Viewport();

		virtual void	OnThink();
		virtual void	CreateDefaultPanels();
		void			ReloadScheme();

		virtual void ApplySchemeSettings(vgui::IScheme *pScheme)
		{
			BaseClass::ApplySchemeSettings(pScheme);

			gHUD.InitColors(pScheme);

			SetPaintBackgroundEnabled(false);
		}

		IViewPortPanel *CreatePanelByName(const char *szPanelName);

		// hogsy start
		void Enable() {}
		void Disable() {}

		void EnableCommanderMode();
		void DisableCommanderMode();

		void MinimapClicked(const Vector& clickWorldPos);

		CCommanderOverlayPanel *GetCommanderOverlayPanel() { return m_pOverlayPanel; }
		// hogsy end

	private:
		// hogsy start
		CCommanderOverlayPanel	*m_pOverlayPanel;

		vgui::HCursor m_CursorCommander;
		vgui::HCursor m_CursorRightMouseMove;
		// hogsy end

		bool m_bHumanScheme;
	};

	virtual void Update();
	virtual bool CreateMove( float flInputSampleTime, CUserCmd *cmd );

	virtual bool ShouldDrawViewModel( void );
// hogsy start
	virtual bool ShouldDrawEntity(C_BaseEntity *pEnt);
	virtual bool ShouldDrawDetailObjects();
	virtual bool ShouldDrawLocalPlayer(C_BasePlayer *pPlayer);
	virtual bool ShouldDrawCrosshair();
	virtual bool ShouldDrawParticles();
	virtual bool ShouldDrawFog();

	virtual void Init();

	virtual void Enable();
	virtual void Disable();

	virtual void OverrideView(CViewSetup *pSetup);

	virtual void LevelInit(const char *newmap);
	virtual void LevelShutdown();

	virtual void Layout();

	bool IsCommanderMode() { return commander_mode; }
	void EnableCommanderMode();
	void DisableCommanderMode();

	CCommanderOverlayPanel *GetCommanderOverlayPanel();
// hogsy end
	
	virtual vgui::Panel *GetMinimapParent();

// hogsy start
	virtual int	KeyInput(int down, ButtonCode_t keynum, const char *pszCurrentBinding);

	virtual void MinimapClicked(const Vector& clickWorldPos);

	// Makes the mouse sit over a particular world location
	void MoveMouse(Vector& worldPos);

	virtual void PreRender(CViewSetup *pSetup);
	virtual void PostRender();

	Viewport *GetNormalViewport();

private:
	bool commander_mode;

	// Fills in ortho parameters (and near/far Z) in pSetup for how the commander mode renders the world.
	bool GetOrthoParameters(CViewSetup *pSetup);

	float GetScaledSlueSpeed() { return m_ScaledSlueSpeed; }	// Scale commander slue speed based on viewport zoom factor
	float GetHeightForMap(float zoom);

	float Commander_ResampleMove(float in);

	void ResetCommand(CUserCmd *cmd);
	void IsometricMove(CUserCmd *cmd);

	int	m_LastMouseX;
	int	m_LastMouseY;

	float m_ScaledMouseSpeed;
	float m_ScaledSlueSpeed;
	float m_Log_BaseEto2;		// scales logarithms from base E to base 2.	
// hogsy end
};

extern IClientMode *GetClientModeNormal();