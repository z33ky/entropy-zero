#ifndef __VGUI_CLASSMENU__
#define	__VGUI_CLASSMENU__

#include <vgui_controls/Frame.h>
#include <vgui_controls/Button.h>

#include <game/client/iviewport.h>

#include "basemodelpanel.h"

class CFortressClassMenu : public vgui::Frame, public IViewPortPanel
{
private:
	DECLARE_CLASS_SIMPLE(CFortressClassMenu,vgui::Frame);

public:
	CFortressClassMenu(IViewPort *pViewport);
	virtual ~CFortressClassMenu();

protected:
	virtual const char	*GetName(void) { return PANEL_CLASS; }

	virtual void	SetData(KeyValues *data) {};
	virtual void	ApplySchemeSettings(vgui::IScheme *pScheme);
	virtual void	OnCommand(const char *command);
	virtual void	OnTick(void);
	virtual void	Update(void);
	virtual void	ShowPanel(bool bShow);
	virtual void	Reset(void) {};
	virtual void	Activate(void);

	vgui::VPANEL GetVPanel( void ) { return BaseClass::GetVPanel(); }

  	virtual bool	IsVisible(void)			{ return BaseClass::IsVisible();	}
	virtual bool	NeedsUpdate(void)		{ return false;						}
	virtual bool	HasInputElements(void)	{ return true;						}

	virtual void SetParent( vgui::VPANEL parent ) { BaseClass::SetParent( parent ); }

	IViewPort	*m_pViewPort;

private:
	int	iLastPreview;

	vgui::RichText	*rtClassDescription;

	CModelPanel	*mClassPreview;

	vgui::Button	
		*bReconButton,
		*bCommandoButton,
		*bMedicButton,
		*bDefenderButton,
		*bSniperButton,
		*bSupportButton,
		*bEscortButton,
		*bSapperButton,
		*bInfiltratorButton,
		*bPyroButton,
		*bRandomButton,
		*bCancelButton;
};

#endif