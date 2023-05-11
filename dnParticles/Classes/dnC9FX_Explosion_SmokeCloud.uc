/*******************************************************************************
 * dnC9FX_Explosion_SmokeCloud generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnC9FX_Explosion_SmokeCloud extends dnC9FX_Explosion_Friends
    collapsecategories
    hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

defaultproperties
{
    bUseAlphaRamp=true
    Lifetime=2
    InitialVelocity=(X=0,Y=0,Z=5)
    MaxVelocityVariance=(X=24,Y=24,Z=0)
    AlphaStart=0.25
    AlphaMid=0.75
    AlphaEnd=0
    Textures(0)='dt_effects.Smoke.alphablacksmoke1RC'
    StartDrawScale=0.5
    DrawScaleVariance=0.25
    DrawScaleEndVariance=0.5
    RotationVariance=0
    RotationVelocityMaxVariance=0.5
    CollisionRadius=48
    CollisionHeight=48
    Style=8
}