#include "cbase.h"

#include "vgui_teammenu.h"

#include <vgui/IVGUI.h>

#include <vgui_controls/RichText.h>

#include "c_basetfplayer.h"
#include "c_team.h"

using namespace vgui;

CFortressTeamMenu::CFortressTeamMenu(IViewPort *pViewPort) : CTeamMenu(pViewPort)
{
	//SetTitle("Team Selection",true);
	SetTitleBarVisible(true);
	SetMinimizeButtonVisible(false);
	SetMaximizeButtonVisible(false);

	iLastPreview = 0;	// Initially preview human team information.
	
	bAlienButton	= new Button(this,"AlienButton","Aliens");	// Alien team button.
	bHumanButton	= new Button(this,"HumanButton","Humans");	// Human team button.
	bAutoButton		= new Button(this,"AutoButton","Auto");		// Automatic team selection button.
	bCancelButton	= new Button(this,"CancelButton","Cancel");	// Cancel, duh.

	vTeamDescription	= new RichText(this,"TeamInfo");	// Team description.

	mTeamPreviewPanel	= new CModelPanel(this,"TeamPreview");	// Model preview.

	ivgui()->AddTickSignal(GetVPanel());

	LoadControlSettings("resource/ui/teammenu.res");
}

CFortressTeamMenu::~CFortressTeamMenu()
{
}

void CFortressTeamMenu::OnTick(void)
{
	if(bHumanButton->IsCursorOver() && (iLastPreview != 0))
	{
		mTeamPreviewPanel->SwapModel("models/player/human_commando.mdl");

		// TODO: This shouldn't be hard-coded!! ~hogsy
		vTeamDescription->SetText(
			"The Humans aren't quite technically advanced compared to their adversaries, " 
			"but they make up for it with cheaper equipment and faster respawn times.");

		iLastPreview = 0;
	}
	else if(bAlienButton->IsCursorOver() && (iLastPreview != 1))
	{
		mTeamPreviewPanel->SwapModel("models/player/alien_commando.mdl");

		// TODO: This shouldn't be hard-coded!! ~hogsy
		vTeamDescription->SetText(
			"The Aliens are highly advanced, however their equipment is more costly and takes longer to produce.");

		iLastPreview = 1;
	}
	else if(bAutoButton->IsCursorOver() && (iLastPreview != 2))
	{
		mTeamPreviewPanel->DeleteModelData();

		// TODO: This shouldn't be hard-coded!! ~hogsy
		vTeamDescription->SetText(
			"Automatic team assignment.\n"
			"This will assign you to the most appropriate team.");

		iLastPreview = 2;
	}
}

void CFortressTeamMenu::OnCommand(const char *command)
{
	C_BaseTFPlayer	*pLocalPlayer = C_BaseTFPlayer::GetLocalPlayer();
	if(!pLocalPlayer)
		return;

	if(Q_strstr(command,"changeteam "))
		// TODO: Check if this is valid before sending... ~hogsy
		engine->ClientCmd(command);

	BaseClass::OnCommand(command);

	ShowPanel(false);
	OnClose();
}