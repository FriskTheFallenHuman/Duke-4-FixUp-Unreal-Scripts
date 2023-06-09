/*******************************************************************************
 * dnExplosion3_SElect_Smoke generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnExplosion3_SElect_Smoke extends dnExplosion3_SmallElectronic
    collapsecategories
    hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

defaultproperties
{
    AdditionalSpawn(0)=(SpawnClass='dnExplosion3_SElec_Fire',TakeParentTag=false,Mount=false,MountOrigin=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountType=0,AppendToTag=None,SpawnRotation=(Pitch=0,Yaw=0,Roll=0),SpawnRotationVariance=(Pitch=0,Yaw=0,Roll=0),SpawnRotationNotRelative=false,SpawnSpeed=0,SpawnSpeedVariance=0,DestroyOnDeath=false,SpawnDelay=0,MaxConcurrentSpawns=0,SpawnedActors=none)
    AdditionalSpawn(1)=(SpawnClass=none,TakeParentTag=false,Mount=false,MountOrigin=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountType=0,AppendToTag=None,SpawnRotation=(Pitch=0,Yaw=0,Roll=0),SpawnRotationVariance=(Pitch=0,Yaw=0,Roll=0),SpawnRotationNotRelative=false,SpawnSpeed=0,SpawnSpeedVariance=0,DestroyOnDeath=false,SpawnDelay=0,MaxConcurrentSpawns=0,SpawnedActors=none)
    PrimeCount=3
    Lifetime=3
    InitialVelocity=(X=0,Y=0,Z=32)
    MaxVelocityVariance=(X=48,Y=48,Z=16)
    AlphaEnd=0
    Textures(0)='dt_effects.Smoke.gensmoke1dRC'
    StartDrawScale=0.5
    EndDrawScale=2
    RotationVariance=65535
    DamageAmount=0
    DamageRadius=0
    CollisionRadius=24
    CollisionHeight=24
}