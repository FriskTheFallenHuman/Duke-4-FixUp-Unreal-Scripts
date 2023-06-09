/*******************************************************************************
 * dnSparkEffect_Streamer generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnSparkEffect_Streamer extends dnSparkEffect
    collapsecategories
    hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

defaultproperties
{
    Enabled=false
    RelativeSpawn=true
    RelativeSpawnVelocity=true
    TriggerOnSpawn=true
    AdditionalSpawn(0)=(SpawnClass='dnSparkEffect_Effect3',TakeParentTag=true,Mount=true,MountOrigin=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountType=0,AppendToTag=None,SpawnRotation=(Pitch=0,Yaw=0,Roll=0),SpawnRotationVariance=(Pitch=0,Yaw=0,Roll=0),SpawnRotationNotRelative=false,SpawnSpeed=0,SpawnSpeedVariance=0,DestroyOnDeath=false,SpawnDelay=0,MaxConcurrentSpawns=0,SpawnedActors=none)
    AdditionalSpawn(1)=(SpawnClass='dnSmokeStreamer',TakeParentTag=true,Mount=true,MountOrigin=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountType=0,AppendToTag=None,SpawnRotation=(Pitch=0,Yaw=0,Roll=0),SpawnRotationVariance=(Pitch=0,Yaw=0,Roll=0),SpawnRotationNotRelative=false,SpawnSpeed=0,SpawnSpeedVariance=0,DestroyOnDeath=false,SpawnDelay=0,MaxConcurrentSpawns=0,SpawnedActors=none)
    SpawnNumber=2
    Lifetime=0.1
    InitialAcceleration=(X=0,Y=0,Z=-10)
    MaxVelocityVariance=(X=20,Y=20,Z=20)
    Textures(0)='dt_effects.Sparks.cometspark1RC'
    StartDrawScale=0.7
    EndDrawScale=0.01
    RotationVariance=32767
    TriggerType=4
    PulseSeconds=0.65
    Physics=2
    bCollideWorld=true
    CollisionRadius=16
    CollisionHeight=16
}