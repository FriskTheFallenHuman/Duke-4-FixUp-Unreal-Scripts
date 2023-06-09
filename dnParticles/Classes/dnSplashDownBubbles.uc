/*******************************************************************************
 * dnSplashDownBubbles generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnSplashDownBubbles extends dnBubbleFX
    collapsecategories
    hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

defaultproperties
{
    DestroyWhenEmptyAfterSpawn=true
    WaterZoneOnly=true
    UseZoneGravity=false
    bUseAlphaRamp=true
    PrimeCount=200
    SpawnNumber=20
    Lifetime=2
    InitialVelocity=(X=0,Y=0,Z=25)
    MaxVelocityVariance=(X=10,Y=10,Z=10)
    Apex=(X=0,Y=0,Z=76)
    SystemAlphaScaleAcceleration=-0.2
    AlphaMid=1
    AlphaEnd=0
    AlphaRampMid=0.75
    Textures(0)='dt_effects.liquids.bubbles2BC'
    StartDrawScale=0.04
    EndDrawScale=0.04
    DrawScaleVariance=0.04
    RotationVariance=65535
    RotationVelocityMaxVariance=0.75
    TriggerAfterSeconds=0.5
    TriggerType=2
    PulseSeconds=0
    Physics=9
    CollisionRadius=48
    CollisionHeight=64
    Style=3
}