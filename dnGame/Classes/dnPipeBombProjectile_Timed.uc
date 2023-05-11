/*******************************************************************************
 * dnPipeBombProjectile_Timed generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnPipeBombProjectile_Timed extends dnPipeBombProjectile
    collapsecategories;

simulated event PostBeginPlay()
{
    AvoidRange = 0;
    super(InteractiveActor).PostBeginPlay();
    return;
}

defaultproperties
{
    DetonatorNotifyClass=none
    MaximumPipebombPickupVelocity=0
    BeepPeriod=0.5
    bPrimeForExplosionOnImpact=true
    ExplosionDelay=2
}