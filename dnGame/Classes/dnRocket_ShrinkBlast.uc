/*******************************************************************************
 * dnRocket_ShrinkBlast generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnRocket_ShrinkBlast extends dnRocket
    collapsecategories;

simulated function bool CanHurtRadiusOther(Actor Other)
{
    // End:0x29
    if((Other != Instigator) || ! Other.bIsPawn)
    {
        return false;
    }
    // End:0x5F
    if(Other.bIsPawn && ! Pawn(Other).AcceptsShrinkDamage(Location))
    {
        return false;
    }
    return super(Projectile).CanHurtRadiusOther(Other);
    return;
}

defaultproperties
{
    bWaterSplash=false
    Speed=1500
    MaxSpeed=1500
    DamageRadius=64
    DamageClass='Engine.ShrinkerDamage'
    ShakeScalar=2
    ShakeInfo(0)=(bNoLerp=false,bToggleSign=false,Style=3,Function=0,FalloffActor=none,FalloffDistance=0,ShakeDuration=0.5,ShakeFrequency=0.05,ShakeMagnitude=300,ShakeFullMagnitude=0,ShakeFullMagnitudeTime=0,ShakeName=dnRocket_BrainBlast_Shake)
    ExplosionOffset=0
    ExplosionClass='p_Weapons.ShrinkRay_Impact.ShrinkRay_Impact_Spawner'
    ExplosionSoundName=ProjectileExplode
    bTelekineticable=false
    MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='p_Weapons.ShrinkRay_Projectile.ShrinkRay_Projectile_Main',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(1)=(bSkipVerifySelf=false,SpawnClass='Weapon_LightEx_ShrinkRay_GlowyCrap',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=-12,Y=0,Z=-6),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=-16384),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    bDumbMesh=false
    bCastStencilShadows=false
    DrawType=8
    DrawScale=0.675
    StaticMesh='sm_geo_decorations.CollisionPrimitives.CP_Cube_64'
    Skins(0)='dt_editor.Surface.Climbable_Masking'
    SoundVolume=255
    SoundRadius=1000
    SoundInnerRadius=500
    VoicePack='SoundConfig.Inventory.VoicePack_ShrinkRay'
}