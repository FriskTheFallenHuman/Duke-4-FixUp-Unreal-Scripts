/*******************************************************************************
 * dnDebris_Wood1 generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnDebris_Wood1 extends dnDebris
    hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

defaultproperties
{
    Enabled=false
    DestroyWhenEmpty=true
    PrimeCount=45
    SpawnNumber=0
    MaximumParticles=45
    Lifetime=2
    LifetimeVariance=1
    InitialVelocity=(X=0,Y=0,Z=256)
    MaxVelocityVariance=(X=480,Y=480,Z=256)
    LocalFriction=256
    BounceElasticity=0.325
    Textures(0)='dt_effects.Debris.woodshard4aRC'
    Textures(1)='dt_effects.Debris.woodshard4bRC'
    Textures(2)='dt_effects.Debris.woodshard4cRC'
    Textures(3)='dt_effects.Debris.woodshard4dRC'
    Textures(4)='dt_effects.Debris.woodshard4eRC'
    StartDrawScale=0.325
    EndDrawScale=0.325
    DrawScaleVariance=0.1
    RotationVariance=65535
    TriggerType=0
    CollisionRadius=16
    CollisionHeight=16
    Style=2
}