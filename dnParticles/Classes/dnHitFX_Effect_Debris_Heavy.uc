/*******************************************************************************
 * dnHitFX_Effect_Debris_Heavy generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnHitFX_Effect_Debris_Heavy extends dnHitFX_Effects
    collapsecategories
    hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

defaultproperties
{
    ParticlesCollideWithWorld=true
    UseZoneFluidFriction=true
    bUseAlphaRamp=true
    Lifetime=3
    LifetimeVariance=2
    InitialVelocity=(X=288,Y=0,Z=0)
    MaxVelocityVariance=(X=576,Y=256,Z=256)
    BounceElasticity=0.5
    ParticlesCollidePercent=0.25
    AlphaMid=1
    AlphaEnd=0
    AlphaRampMid=0.9
    RotationVelocity=2.5
    RotationVelocityMaxVariance=4
}