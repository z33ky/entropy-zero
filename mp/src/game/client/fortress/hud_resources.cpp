//========= Copyright © 1996-2001, Valve LLC, All rights reserved. ============
//
// Purpose: Hud display of the local player's resource counts
//
// $NoKeywords: $
//=============================================================================
#include "cbase.h"
#include "hud_numeric.h"
#ifdef IMPLEMENT_ME
#include "c_basetfplayer.h"
#endif
#include "hud_macros.h"
#ifdef IMPLEMENT_ME
#include "parsemsg.h"
#endif

// memdbgon must be the last include file in a .cpp file!!!
#include "tier0/memdbgon.h"

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
class CHudResources : public CHudNumeric
{
	DECLARE_CLASS_SIMPLE( CHudResources, CHudNumeric )
public:
	CHudResources( const char *pElementName );

	virtual const char *GetLabelText() { return m_szResourcesLabel; }
	virtual const char *GetPulseEvent( bool increment ) { return increment ? "ResourceIncrement" : "ResourceDecrement"; }
	virtual bool		GetValue( char *val, int maxlen );

private:
	bool				GetResourceCount( int& value );

	CPanelAnimationStringVar( 128, m_szResourcesLabel, "ResourcesLabel", "Resources" );
};

DECLARE_HUDELEMENT( CHudResources );

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
CHudResources::CHudResources( const char *pElementName ) : CHudNumeric( pElementName, "HudResources")
{
}

bool CHudResources::GetValue( char *val, int maxlen )
{
	int bank = 0;
	if ( !GetResourceCount( bank ) )
		return false;

	Q_snprintf( val, maxlen, "%i", bank );
	return true;
}

bool CHudResources::GetResourceCount( int& value )
{
#ifdef IMPLEMENT_ME
	C_BaseTFPlayer *pPlayer = C_BaseTFPlayer::GetLocalPlayer();
	if ( !pPlayer )
		return false;
	if ( pPlayer->GetTeamNumber() == 0)
		return false;

	value = pPlayer->m_TFLocal.m_iBankResources;
	return true;
#else
	return false;
#endif
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
class CHudResourcesPickup : public CHudNumeric
{
	DECLARE_CLASS_SIMPLE( CHudResourcesPickup, CHudNumeric )
public:
	CHudResourcesPickup( const char *pElementName );

	virtual void		Init( void );
	virtual const char *GetLabelText() { return m_szResourcesPickupLabel; }
	virtual const char *GetPulseEvent( bool increment ) { return "ResourcePickup"; }
	virtual bool		GetValue( char *val, int maxlen );

	// Handler for our message
	void MsgFunc_PickupRes( const char *pszName, int iSize, void *pbuf );

private:
	int		m_iPickupAmount;

	CPanelAnimationStringVar( 128, m_szResourcesPickupLabel, "ResourcesPickupLabel", "" );
};

DECLARE_HUDELEMENT( CHudResourcesPickup );
#ifdef IMPLEMENT_ME
DECLARE_HUD_MESSAGE( CHudResourcesPickup, PickupRes );
#endif

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
CHudResourcesPickup::CHudResourcesPickup( const char *pElementName ) : CHudNumeric( pElementName, "HudResourcesPickup")
{
	m_iPickupAmount = 0;
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void CHudResourcesPickup::Init( void )
{
#ifdef IMPLEMENT_ME
	HOOK_MESSAGE( PickupRes );
#endif
}

//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
bool CHudResourcesPickup::GetValue( char *val, int maxlen )
{
	if ( !m_iPickupAmount )
		return false;

	Q_snprintf( val, maxlen, "+%i", m_iPickupAmount );
	return true;
}

//-----------------------------------------------------------------------------
// Purpose: Message handler for PickupRes message
//-----------------------------------------------------------------------------
void CHudResourcesPickup::MsgFunc_PickupRes( const char *pszName, int iSize, void *pbuf )
{
#ifdef IMPLEMENT_ME
	BEGIN_READ( pbuf, iSize );

	m_iPickupAmount = READ_BYTE();
#endif

	ForcePulse();
}