/*******************************************************************************
 * AssaultTrooperFX_JetpackBurn generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AssaultTrooperFX_JetpackBurn extends AssaultTrooperFX
    collapsecategories
    hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

defaultproperties
{
    UpdateRateEnforced=true
    RelativeSpawnVelocity=true
    RelativeLocation=true
    UseZoneGravity=false
    bUseAlphaRamp=true
    UpdateRateMax=0.02
    AdditionalSpawn(0)=(SpawnClass='AssaultTrooperFX_JetpackTrail',TakeParentTag=false,Mount=true,MountOrigin=(X=14,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountType=0,AppendToTag=None,SpawnRotation=(Pitch=0,Yaw=0,Roll=0),SpawnRotationVariance=(Pitch=0,Yaw=0,Roll=0),SpawnRotationNotRelative=false,SpawnSpeed=0,SpawnSpeedVariance=0,DestroyOnDeath=false,SpawnDelay=0,MaxConcurrentSpawns=0,SpawnedActors=none)
    SpawnPeriod=0.02
    Lifetime=0.25
    InitialVelocity=(X=56,Y=0,Z=0)
    MaxVelocityVariance=(X=0,Y=0,Z=0)
    AlphaMid=1
    AlphaEnd=0
    AlphaRampMid=0.75
    Textures(0)='dt_effects.LensFlares.pflare4ABC'
    StartDrawScale=0.75
    EndDrawScale=0.25
    RotationVariance=6.14
    bForceNonFinalBlendBlooms=true
    NonFinalBlendBloomTint=(R=192,G=96,B=96,A=0)
    bIgnoreBList=true
    CollisionRadius=0.5
    CollisionHeight=0.5
    Style=3
}