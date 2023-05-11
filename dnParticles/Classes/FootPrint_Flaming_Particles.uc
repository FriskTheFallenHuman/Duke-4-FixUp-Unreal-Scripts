/*******************************************************************************
 * FootPrint_Flaming_Particles generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class FootPrint_Flaming_Particles extends SoftParticleSystem
    collapsecategories
    hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

defaultproperties
{
    DestroyWhenEmptyAfterSpawn=true
    UseZoneGravity=false
    bUseAlphaRamp=true
    GroupID=100
    SpawnPeriod=0.075
    Lifetime=0.5
    LifetimeVariance=0.125
    InitialVelocity=(X=0,Y=0,Z=32)
    MaxVelocityVariance=(X=12,Y=12,Z=0)
    AlphaMid=1
    AlphaEnd=0
    Textures(0)='dt_effects.Fire.flame1aRC'
    Textures(1)='dt_effects.Fire.flame2aRC'
    Textures(2)='dt_effects.Fire.flame3aRC'
    Textures(3)='dt_effects.Fire.flame4aRC'
    StartDrawScale=0.2
    EndDrawScale=0.2
    RotationVariance=65535
    RotationVelocityMaxVariance=3
    TriggerAfterSeconds=2
    TriggerType=2
    bIgnoreBList=true
    CollisionRadius=4
    CollisionHeight=0
    TickStyle=3
    Style=3
}