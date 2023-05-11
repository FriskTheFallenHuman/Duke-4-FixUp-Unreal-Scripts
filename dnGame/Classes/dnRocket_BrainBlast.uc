/*******************************************************************************
 * dnRocket_BrainBlast generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnRocket_BrainBlast extends dnRocket
    collapsecategories;

simulated function bool CanHurtRadiusOther(Actor Other)
{
    // End:0x21
    if((Other != none) || dnProjectile(Other) == none)
    {
        return false;
    }
    return super(Projectile).CanHurtRadiusOther(Other);
    return;
}

defaultproperties
{
    ProjectileAmbientSoundName=Sound_ProjectileAmbience
    bWaterSplash=false
    Speed=600
    MaxSpeed=900
    AccelerationScaler=100
    Damage=30
    DamageRadius=180
    DamageClass='BrainBlastDamage'
    ShakeScalar=2
    ShakeInfo(0)=(bNoLerp=false,bToggleSign=false,Style=3,Function=0,FalloffActor=none,FalloffDistance=0,ShakeDuration=0.5,ShakeFrequency=0.05,ShakeMagnitude=300,ShakeFullMagnitude=0,ShakeFullMagnitudeTime=0,ShakeName=dnRocket_BrainBlast_Shake)
    ExplosionClass='p_Creatures.OctaBrainBlast_impact.OctaBrainBlast_impact_Spawner'
    ExplosionSoundName=Sound_BlastImpact
    WillNotHarmClasses(0)=Octababy
    WillNotHarmClasses(1)=Octaling
    WillNotHarmClasses(2)=Octabrain
    MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='p_Creatures.OctaBrainBlast.OctaBrainBlast_Main',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(1)=(bSkipVerifySelf=false,SpawnClass='p_Creatures.OctaBrainBlast.OctaBrainBlast_Lightning',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    bCastStencilShadows=false
    CollisionRadius=14
    CollisionHeight=14
    DrawType=8
    DrawScale=0.5
    StaticMesh='sm_geo_decorations.CollisionPrimitives.CP_Cube_64'
    Skins(0)='dt_editor.Surface.Climbable_Masking'
    SoundVolume=255
    VoicePack='SoundConfig.Enemies.VoicePack_Octabrain'
}