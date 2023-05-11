/*******************************************************************************
 * dnBonePartMapper_Enforcer_LeftArm generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnBonePartMapper_Enforcer_LeftArm extends BonePartMapper
    exportstructs;

defaultproperties
{
    PartMapping(0)=(BoneName=LeftShoulder,Part=6,BoneNameForDestroy=None)
    PartMapping(1)=(BoneName=LeftArm,Part=8,BoneNameForDestroy=None)
    PartMapping(2)=(BoneName=LeftForeArm,Part=8,BoneNameForDestroy=LeftForeArm)
    PartMapping(3)=(BoneName=LeftForeArmRoll,Part=8,BoneNameForDestroy=LeftForeArm)
    PartMapping(4)=(BoneName=lefthand,Part=10,BoneNameForDestroy=LeftForeArm)
    PartMapping(5)=(BoneName=lefthandring1,Part=10,BoneNameForDestroy=LeftForeArm)
    PartMapping(6)=(BoneName=lefthandring2,Part=10,BoneNameForDestroy=LeftForeArm)
    PartMapping(7)=(BoneName=LeftHandThumb1,Part=10,BoneNameForDestroy=LeftForeArm)
    PartMapping(8)=(BoneName=LeftHandThumb2,Part=10,BoneNameForDestroy=LeftForeArm)
    PartMapping(9)=(BoneName=LeftHandIndex1,Part=10,BoneNameForDestroy=LeftForeArm)
    PartMapping(10)=(BoneName=LeftHandIndex2,Part=10,BoneNameForDestroy=LeftForeArm)
    PartMapping(11)=(BoneName=LeftHandPinky1,Part=10,BoneNameForDestroy=LeftForeArm)
    PartMapping(12)=(BoneName=LeftHandPinky2,Part=10,BoneNameForDestroy=LeftForeArm)
    DestroyableBones(0)=(BoneName=LeftForeArm,bAddToLimbCount=true,LimbCapClass='dnCorpse_LimbCap_Enforcer_ArmLeft_Lower',LimbCapMountInfo=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0.972,Y=-0.603,Z=10.245),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=-1048,Yaw=-18387,Roll=21124),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),DestroyedEffect=none,FrozenDestroyedEffect='p_Weapons.FreezeRay_Projectile.FreezeRay_Projectile_Small_Spawner',ExplodeSound=Corpse_LimbExplode,FrozenExplodeSound=IcePart_Shatter_Small)
    Gibs(0)=(BoneName=LeftForeArm,ReqBones=none,RenderObject='sm_class_effects.Enforcer_Gibs.Enforcer_ForearmL_Gib',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=-2.44,Y=-0.56,Z=13),RotOffset=(Pitch=3859,Yaw=-10928,Roll=26924),Mass=10,GibChance=0,bKDNoPawnInteractions=false,bExplodeOut=false,bNoBloodyMess=false,bIgnorePawnAirCushion=false,bStaticGib=false,GibBloodyMess=none)
    FullyGibbedSoundName=Corpse_LimbExplode
    FullyGibbedFrozenSoundName=IcePart_Shatter_Small
    NumLimbsUntilDestructible=1
}