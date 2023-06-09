/*******************************************************************************
 * dnHitFX_Effect_Smoke generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnHitFX_Effect_Smoke extends dnHitFX_Effects
    collapsecategories
    hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

defaultproperties
{
    UseZoneGravity=false
    bUseAlphaRamp=true
    Lifetime=0.75
    LifetimeVariance=0.75
    InitialVelocity=(X=64,Y=0,Z=0)
    MaxVelocityVariance=(X=96,Y=16,Z=16)
    AlphaStart=0.6
    AlphaMid=0.6
    AlphaEnd=0
    Textures(0)='dt_effects.Smoke.gensmoke1dRC'
    StartDrawScale=0.01
    EndDrawScale=0.3
    DrawScaleVariance=0.075
    RotationVariance=65535
    RotationVelocityMaxVariance=1
    KLinearDamping=1
}