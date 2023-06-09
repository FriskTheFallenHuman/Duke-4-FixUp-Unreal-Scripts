/*******************************************************************************
 * dnSparkEffect_Effect3 generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnSparkEffect_Effect3 extends dnSparkEffect
    collapsecategories
    hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

defaultproperties
{
    Enabled=false
    RelativeSpawn=true
    RelativeSpawnVelocity=true
    TriggerOnSpawn=true
    AdditionalSpawn(0)=(SpawnClass=none,TakeParentTag=false,Mount=false,MountOrigin=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountType=0,AppendToTag=None,SpawnRotation=(Pitch=0,Yaw=0,Roll=0),SpawnRotationVariance=(Pitch=0,Yaw=0,Roll=0),SpawnRotationNotRelative=false,SpawnSpeed=0,SpawnSpeedVariance=0,DestroyOnDeath=false,SpawnDelay=0,MaxConcurrentSpawns=0,SpawnedActors=none)
    SpawnNumber=1
    Lifetime=0.5
    InitialAcceleration=(X=0,Y=0,Z=-50)
    MaxAccelerationVariance=(X=0,Y=0,Z=10)
    AlphaRampMid=0.25
    LineStartColor=(R=128,G=128,B=128,A=0)
    LineEndColor=(R=128,G=128,B=128,A=0)
    LineStartWidth=4
    LineEndWidth=4
    Textures(0)='dt_effects.Sparks.comettrail4RC'
    StartDrawScale=0.125
    EndDrawScale=0.25
    RotationVariance=32767
    TriggerType=4
    PulseSeconds=0.65
    Physics=2
    bCollideWorld=true
    CollisionRadius=16
    CollisionHeight=16
}