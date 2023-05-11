/*******************************************************************************
 * dnBonePartMapper_Octabrain generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnBonePartMapper_Octabrain extends BonePartMapper
    exportstructs;

defaultproperties
{
    PartMapping(0)=(BoneName=arm_left_upper,Part=8,BoneNameForDestroy=arm_left_upper)
    PartMapping(1)=(BoneName=arm_left_lower,Part=8,BoneNameForDestroy=arm_left_lower)
    PartMapping(2)=(BoneName=hand_left,Part=10,BoneNameForDestroy=arm_left_lower)
    PartMapping(3)=(BoneName=arm_right_upper,Part=9,BoneNameForDestroy=arm_right_upper)
    PartMapping(4)=(BoneName=arm_right_lower,Part=9,BoneNameForDestroy=arm_right_lower)
    PartMapping(5)=(BoneName=hand_right,Part=11,BoneNameForDestroy=arm_right_lower)
    PartMapping(6)=(BoneName=Tail,Part=18,BoneNameForDestroy=Tail)
    PartMapping(7)=(BoneName=tentacle_back_left_09,Part=12,BoneNameForDestroy=tentacle_back_left_05)
    PartMapping(8)=(BoneName=tentacle_back_left_08,Part=12,BoneNameForDestroy=tentacle_back_left_05)
    PartMapping(9)=(BoneName=tentacle_back_left_07,Part=12,BoneNameForDestroy=tentacle_back_left_05)
    PartMapping(10)=(BoneName=tentacle_back_left_06,Part=12,BoneNameForDestroy=tentacle_back_left_05)
    PartMapping(11)=(BoneName=tentacle_back_left_05,Part=12,BoneNameForDestroy=tentacle_back_left_05)
    PartMapping(12)=(BoneName=tentacle_back_left_04,Part=12,BoneNameForDestroy=tentacle_back_left_base)
    PartMapping(13)=(BoneName=tentacle_back_left_03,Part=12,BoneNameForDestroy=tentacle_back_left_base)
    PartMapping(14)=(BoneName=tentacle_back_left_02,Part=12,BoneNameForDestroy=tentacle_back_left_base)
    PartMapping(15)=(BoneName=tentacle_back_left_01,Part=12,BoneNameForDestroy=tentacle_back_left_base)
    PartMapping(16)=(BoneName=tentacle_back_left_base,Part=12,BoneNameForDestroy=tentacle_back_left_base)
    PartMapping(17)=(BoneName=tentacle_mid_left_09,Part=12,BoneNameForDestroy=tentacle_mid_left_05)
    PartMapping(18)=(BoneName=tentacle_mid_left_08,Part=12,BoneNameForDestroy=tentacle_mid_left_05)
    PartMapping(19)=(BoneName=tentacle_mid_left_07,Part=12,BoneNameForDestroy=tentacle_mid_left_05)
    PartMapping(20)=(BoneName=tentacle_mid_left_06,Part=12,BoneNameForDestroy=tentacle_mid_left_05)
    PartMapping(21)=(BoneName=tentacle_mid_left_05,Part=12,BoneNameForDestroy=tentacle_mid_left_05)
    PartMapping(22)=(BoneName=tentacle_mid_left_04,Part=12,BoneNameForDestroy=tentacle_mid_left_base)
    PartMapping(23)=(BoneName=tentacle_mid_left_03,Part=12,BoneNameForDestroy=tentacle_mid_left_base)
    PartMapping(24)=(BoneName=tentacle_mid_left_02,Part=12,BoneNameForDestroy=tentacle_mid_left_base)
    PartMapping(25)=(BoneName=tentacle_mid_left_01,Part=12,BoneNameForDestroy=tentacle_mid_left_base)
    PartMapping(26)=(BoneName=tentacle_mid_left_base,Part=12,BoneNameForDestroy=tentacle_mid_left_base)
    PartMapping(27)=(BoneName=tentacle_front_left_09,Part=12,BoneNameForDestroy=tentacle_front_left_05)
    PartMapping(28)=(BoneName=tentacle_front_left_08,Part=12,BoneNameForDestroy=tentacle_front_left_05)
    PartMapping(29)=(BoneName=tentacle_front_left_07,Part=12,BoneNameForDestroy=tentacle_front_left_05)
    PartMapping(30)=(BoneName=tentacle_front_left_06,Part=12,BoneNameForDestroy=tentacle_front_left_05)
    PartMapping(31)=(BoneName=tentacle_front_left_05,Part=12,BoneNameForDestroy=tentacle_front_left_05)
    PartMapping(32)=(BoneName=tentacle_front_left_04,Part=12,BoneNameForDestroy=tentacle_front_left_base)
    PartMapping(33)=(BoneName=tentacle_front_left_03,Part=12,BoneNameForDestroy=tentacle_front_left_base)
    PartMapping(34)=(BoneName=tentacle_front_left_02,Part=12,BoneNameForDestroy=tentacle_front_left_base)
    PartMapping(35)=(BoneName=tentacle_front_left_01,Part=12,BoneNameForDestroy=tentacle_front_left_base)
    PartMapping(36)=(BoneName=tentacle_front_left_base,Part=12,BoneNameForDestroy=tentacle_front_left_base)
    PartMapping(37)=(BoneName=tentacle_back_right_09,Part=13,BoneNameForDestroy=tentacle_back_right_05)
    PartMapping(38)=(BoneName=tentacle_back_right_08,Part=13,BoneNameForDestroy=tentacle_back_right_05)
    PartMapping(39)=(BoneName=tentacle_back_right_07,Part=13,BoneNameForDestroy=tentacle_back_right_05)
    PartMapping(40)=(BoneName=tentacle_back_right_06,Part=13,BoneNameForDestroy=tentacle_back_right_05)
    PartMapping(41)=(BoneName=tentacle_back_right_05,Part=13,BoneNameForDestroy=tentacle_back_right_05)
    PartMapping(42)=(BoneName=tentacle_back_right_04,Part=13,BoneNameForDestroy=tentacle_back_right_base)
    PartMapping(43)=(BoneName=tentacle_back_right_03,Part=13,BoneNameForDestroy=tentacle_back_right_base)
    PartMapping(44)=(BoneName=tentacle_back_right_02,Part=13,BoneNameForDestroy=tentacle_back_right_base)
    PartMapping(45)=(BoneName=tentacle_back_right_01,Part=13,BoneNameForDestroy=tentacle_back_right_base)
    PartMapping(46)=(BoneName=tentacle_back_right_base,Part=13,BoneNameForDestroy=tentacle_back_right_base)
    PartMapping(47)=(BoneName=tentacle_mid_right_09,Part=13,BoneNameForDestroy=tentacle_mid_right_05)
    PartMapping(48)=(BoneName=tentacle_mid_right_08,Part=13,BoneNameForDestroy=tentacle_mid_right_05)
    PartMapping(49)=(BoneName=tentacle_mid_right_07,Part=13,BoneNameForDestroy=tentacle_mid_right_05)
    PartMapping(50)=(BoneName=tentacle_mid_right_06,Part=13,BoneNameForDestroy=tentacle_mid_right_05)
    PartMapping(51)=(BoneName=tentacle_mid_right_05,Part=13,BoneNameForDestroy=tentacle_mid_right_05)
    PartMapping(52)=(BoneName=tentacle_mid_right_04,Part=13,BoneNameForDestroy=tentacle_mid_right_base)
    PartMapping(53)=(BoneName=tentacle_mid_right_03,Part=13,BoneNameForDestroy=tentacle_mid_right_base)
    PartMapping(54)=(BoneName=tentacle_mid_right_02,Part=13,BoneNameForDestroy=tentacle_mid_right_base)
    PartMapping(55)=(BoneName=tentacle_mid_right_01,Part=13,BoneNameForDestroy=tentacle_mid_right_base)
    PartMapping(56)=(BoneName=tentacle_mid_right_base,Part=13,BoneNameForDestroy=tentacle_mid_right_base)
    PartMapping(57)=(BoneName=tentacle_front_right_09,Part=13,BoneNameForDestroy=tentacle_front_right_05)
    PartMapping(58)=(BoneName=tentacle_front_right_08,Part=13,BoneNameForDestroy=tentacle_front_right_05)
    PartMapping(59)=(BoneName=tentacle_front_right_07,Part=13,BoneNameForDestroy=tentacle_front_right_05)
    PartMapping(60)=(BoneName=tentacle_front_right_06,Part=13,BoneNameForDestroy=tentacle_front_right_05)
    PartMapping(61)=(BoneName=tentacle_front_right_05,Part=13,BoneNameForDestroy=tentacle_front_right_05)
    PartMapping(62)=(BoneName=tentacle_front_right_04,Part=13,BoneNameForDestroy=tentacle_front_right_base)
    PartMapping(63)=(BoneName=tentacle_front_right_03,Part=13,BoneNameForDestroy=tentacle_front_right_base)
    PartMapping(64)=(BoneName=tentacle_front_right_02,Part=13,BoneNameForDestroy=tentacle_front_right_base)
    PartMapping(65)=(BoneName=tentacle_front_right_01,Part=13,BoneNameForDestroy=tentacle_front_right_base)
    PartMapping(66)=(BoneName=tentacle_front_right_base,Part=13,BoneNameForDestroy=tentacle_front_right_base)
    DestroyableBones(0)=(BoneName=tentacle_front_left_base,bAddToLimbCount=true,LimbCapClass=none,LimbCapMountInfo=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),DestroyedEffect=none,FrozenDestroyedEffect='p_Weapons.FreezeRay_Projectile.FreezeRay_Projectile_Small_Spawner',ExplodeSound=Corpse_HeadExplode,FrozenExplodeSound=None)
    DestroyableBones(1)=(BoneName=tentacle_front_left_05,bAddToLimbCount=false,LimbCapClass=none,LimbCapMountInfo=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),DestroyedEffect=none,FrozenDestroyedEffect='p_Weapons.FreezeRay_Projectile.FreezeRay_Projectile_Small_Spawner',ExplodeSound=Corpse_HeadExplode,FrozenExplodeSound=None)
    DestroyableBones(2)=(BoneName=tentacle_mid_left_base,bAddToLimbCount=true,LimbCapClass=none,LimbCapMountInfo=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),DestroyedEffect=none,FrozenDestroyedEffect='p_Weapons.FreezeRay_Projectile.FreezeRay_Projectile_Small_Spawner',ExplodeSound=Corpse_HeadExplode,FrozenExplodeSound=None)
    DestroyableBones(3)=(BoneName=tentacle_mid_left_05,bAddToLimbCount=false,LimbCapClass=none,LimbCapMountInfo=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),DestroyedEffect=none,FrozenDestroyedEffect='p_Weapons.FreezeRay_Projectile.FreezeRay_Projectile_Small_Spawner',ExplodeSound=Corpse_HeadExplode,FrozenExplodeSound=None)
    DestroyableBones(4)=(BoneName=tentacle_back_left_base,bAddToLimbCount=true,LimbCapClass=none,LimbCapMountInfo=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),DestroyedEffect=none,FrozenDestroyedEffect='p_Weapons.FreezeRay_Projectile.FreezeRay_Projectile_Small_Spawner',ExplodeSound=Corpse_HeadExplode,FrozenExplodeSound=None)
    DestroyableBones(5)=(BoneName=tentacle_back_left_05,bAddToLimbCount=false,LimbCapClass=none,LimbCapMountInfo=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),DestroyedEffect=none,FrozenDestroyedEffect='p_Weapons.FreezeRay_Projectile.FreezeRay_Projectile_Small_Spawner',ExplodeSound=Corpse_HeadExplode,FrozenExplodeSound=None)
    DestroyableBones(6)=(BoneName=tentacle_front_right_base,bAddToLimbCount=true,LimbCapClass=none,LimbCapMountInfo=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),DestroyedEffect=none,FrozenDestroyedEffect='p_Weapons.FreezeRay_Projectile.FreezeRay_Projectile_Small_Spawner',ExplodeSound=Corpse_HeadExplode,FrozenExplodeSound=None)
    DestroyableBones(7)=(BoneName=tentacle_front_right_05,bAddToLimbCount=false,LimbCapClass=none,LimbCapMountInfo=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),DestroyedEffect=none,FrozenDestroyedEffect='p_Weapons.FreezeRay_Projectile.FreezeRay_Projectile_Small_Spawner',ExplodeSound=Corpse_HeadExplode,FrozenExplodeSound=None)
    DestroyableBones(8)=(BoneName=tentacle_mid_right_base,bAddToLimbCount=true,LimbCapClass=none,LimbCapMountInfo=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),DestroyedEffect=none,FrozenDestroyedEffect='p_Weapons.FreezeRay_Projectile.FreezeRay_Projectile_Small_Spawner',ExplodeSound=Corpse_HeadExplode,FrozenExplodeSound=None)
    DestroyableBones(9)=(BoneName=tentacle_mid_right_05,bAddToLimbCount=false,LimbCapClass=none,LimbCapMountInfo=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),DestroyedEffect=none,FrozenDestroyedEffect='p_Weapons.FreezeRay_Projectile.FreezeRay_Projectile_Small_Spawner',ExplodeSound=Corpse_HeadExplode,FrozenExplodeSound=None)
    DestroyableBones(10)=(BoneName=tentacle_back_right_base,bAddToLimbCount=true,LimbCapClass=none,LimbCapMountInfo=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),DestroyedEffect=none,FrozenDestroyedEffect='p_Weapons.FreezeRay_Projectile.FreezeRay_Projectile_Small_Spawner',ExplodeSound=Corpse_HeadExplode,FrozenExplodeSound=None)
    DestroyableBones(11)=(BoneName=tentacle_back_right_05,bAddToLimbCount=false,LimbCapClass=none,LimbCapMountInfo=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),DestroyedEffect=none,FrozenDestroyedEffect='p_Weapons.FreezeRay_Projectile.FreezeRay_Projectile_Small_Spawner',ExplodeSound=Corpse_HeadExplode,FrozenExplodeSound=None)
    Gibs(0)=(BoneName=Head,ReqBones=none,RenderObject='sm_class_effects.Octabrain_Gibs.Octabrain_Head_Gib',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=-0.01,Y=-1.61,Z=2.47),RotOffset=(Pitch=4438,Yaw=-16383,Roll=32767),Mass=15,GibChance=1,bKDNoPawnInteractions=false,bExplodeOut=false,bNoBloodyMess=false,bIgnorePawnAirCushion=false,bStaticGib=false,GibBloodyMess=none)
    Gibs(1)=(BoneName=Root,ReqBones=none,RenderObject='sm_class_effects.Octabrain_Gibs.octabrain_body_gib',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=0.018,Y=0.013,Z=0.004),RotOffset=(Pitch=0,Yaw=0,Roll=0),Mass=70,GibChance=0.3,bKDNoPawnInteractions=false,bExplodeOut=false,bNoBloodyMess=false,bIgnorePawnAirCushion=false,bStaticGib=false,GibBloodyMess=none)
    Gibs(2)=(BoneName=Root,ReqBones=none,RenderObject='sm_class_effects.Octabrain_Gibs.octabrain_body_gib_rear',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=-10.063,Y=-0.002,Z=25.736),RotOffset=(Pitch=0,Yaw=0,Roll=0),Mass=50,GibChance=0.6,bKDNoPawnInteractions=false,bExplodeOut=false,bNoBloodyMess=false,bIgnorePawnAirCushion=false,bStaticGib=false,GibBloodyMess=none)
    Gibs(3)=(BoneName=Root,ReqBones=none,RenderObject='sm_class_effects.Octabrain_Gibs.octabrain_brain_gib_l',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=-31.1,Y=-10.002,Z=14.994),RotOffset=(Pitch=0,Yaw=0,Roll=0),Mass=35,GibChance=0.3,bKDNoPawnInteractions=false,bExplodeOut=false,bNoBloodyMess=false,bIgnorePawnAirCushion=false,bStaticGib=false,GibBloodyMess=none)
    Gibs(4)=(BoneName=Root,ReqBones=none,RenderObject='sm_class_effects.Octabrain_Gibs.octabrain_brain_gib_l_rear',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=-31.007,Y=-10.016,Z=14.994),RotOffset=(Pitch=0,Yaw=0,Roll=0),Mass=35,GibChance=0.2,bKDNoPawnInteractions=false,bExplodeOut=false,bNoBloodyMess=false,bIgnorePawnAirCushion=false,bStaticGib=false,GibBloodyMess=none)
    Gibs(5)=(BoneName=Root,ReqBones=none,RenderObject='sm_class_effects.Octabrain_Gibs.octabrain_brain_gib_r',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=-30.979,Y=9.997,Z=14.994),RotOffset=(Pitch=0,Yaw=0,Roll=0),Mass=35,GibChance=0.2,bKDNoPawnInteractions=false,bExplodeOut=false,bNoBloodyMess=false,bIgnorePawnAirCushion=false,bStaticGib=false,GibBloodyMess=none)
    Gibs(6)=(BoneName=Root,ReqBones=none,RenderObject='sm_class_effects.Octabrain_Gibs.octabrain_brain_gib_r_rear',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=-31.104,Y=9.984,Z=15.011),RotOffset=(Pitch=0,Yaw=0,Roll=0),Mass=35,GibChance=0.2,bKDNoPawnInteractions=false,bExplodeOut=false,bNoBloodyMess=false,bIgnorePawnAirCushion=false,bStaticGib=false,GibBloodyMess=none)
    FullyGibbedSoundName=Corpse_Explode
    FullyGibbedFrozenSoundName=IceStatue_Destruct
    NumLimbsUntilDestructible=6
}