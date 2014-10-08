void CTFGameMovement::WalkMove2( void )
{
	VPROF( "CTFGameMovement::WalkMove2" );

	// Initialize the movement stack.
	VectorCopy( mv->GetAbsOrigin(), m_aMovementStack[0].m_vecPosition );
	VectorCopy( m_vecGroundNormal, m_aMovementStack[0].m_vecImpactNormal );
	m_nMovementStackSize = 1;

	// Calculate the wish velocity and position.  The function returns false if 
	// the velocity is zero, it returns true otherwise.
	Vector vWishPos, vWishDir;
	float flWishSpeed;
	if ( !CalcWishVelocityAndPosition( vWishPos, vWishDir, flWishSpeed ) )
		return;

	// For physics player shadow.
	mv->m_outWishVel += vWishDir * flWishSpeed;

	// Lift up the players feet (bring the minimum z componenet up by the step
	// size) and sweep.
	TryPlayerMove2();

	// Try to stand up at movement's end.
	ResolveStanding();

	// For physics player shadow.
	float flStepHeight = mv->GetAbsOrigin().z - m_aMovementStack[0].m_vecPosition.z;
	if ( flStepHeight > 0.0f )
		mv->m_outStepHeight += flStepHeight;
}

void CTFGameMovement::AccelerateWithoutMomentum( Vector &wishdir, float wishspeed, float accel )
{
	// No acceleration if the player is water-jumping or dead.
	if ( player->pl.deadflag || player->m_flWaterJumpTime )
		return;

	// See if we are changing direction a bit
//	float flCurrentSpeed = mv->m_vecVelocity.Dot( wishdir );
	float flCurrentSpeed = mv->m_vecVelocity.Length();

	// Reduce wishspeed by the amount of veer.
	float flAddSpeed = wishspeed - flCurrentSpeed;

	// If not going to add any speed, done.
	if ( flAddSpeed <= 0.0f )
		return;

	// Determine amount of accleration.
	float flAccelSpeed = accel * gpGlobals->frametime * wishspeed * player->m_surfaceFriction;

	// Cap at addspeed
	if ( flAccelSpeed > flAddSpeed )
		flAccelSpeed = flAddSpeed;

	// Adjust velocity.
	for ( int iAxis = 0; iAxis < 3; iAxis++ )
		mv->m_vecVelocity[iAxis] += flAccelSpeed * wishdir[iAxis];
}