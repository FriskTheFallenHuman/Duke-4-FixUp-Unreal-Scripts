/*******************************************************************************
 * dnBonePartMapper_CorpseC generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnBonePartMapper_CorpseC extends dnBonePartMapper_Worker
    exportstructs;

defaultproperties
{
    Gibs(0)=(BoneName=neck,ReqBones=none,RenderObject='sm_class_effects.Worker_Gibs.CorpseC_Head_Gib',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=0.014,Y=-0.469,Z=5.074),RotOffset=(Pitch=2950,Yaw=-1465,Roll=-434),Mass=10,GibChance=1,bKDNoPawnInteractions=false,bExplodeOut=false,bNoBloodyMess=false,bIgnorePawnAirCushion=false,bStaticGib=false,GibBloodyMess=none)
    Gibs(1)=(BoneName=LeftArm,ReqBones=(LeftForeArm),RenderObject='c_gibs.worker_arm_gib_l',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=0,Y=0,Z=0),RotOffset=(Pitch=0,Yaw=0,Roll=0),Mass=20,GibChance=1,bKDNoPawnInteractions=false,bExplodeOut=false,bNoBloodyMess=false,bIgnorePawnAirCushion=false,bStaticGib=false,GibBloodyMess=none)
    Gibs(2)=(BoneName=RightArm,ReqBones=(RightForeArm),RenderObject='c_gibs.worker_arm_gib_r',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=0,Y=0,Z=0),RotOffset=(Pitch=0,Yaw=0,Roll=0),Mass=20,GibChance=0.5,bKDNoPawnInteractions=false,bExplodeOut=false,bNoBloodyMess=false,bIgnorePawnAirCushion=false,bStaticGib=false,GibBloodyMess=none)
    Gibs(3)=(BoneName=LeftForeArm,ReqBones=none,RenderObject='sm_class_effects.Worker_Gibs.Worker_ForearmL_Gib',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=-0.443,Y=-0.109,Z=-8.534),RotOffset=(Pitch=-824,Yaw=18818,Roll=-9819),Mass=10,GibChance=0,bKDNoPawnInteractions=false,bExplodeOut=false,bNoBloodyMess=false,bIgnorePawnAirCushion=false,bStaticGib=false,GibBloodyMess=none)
    Gibs(4)=(BoneName=RightForeArm,ReqBones=none,RenderObject='sm_class_effects.Worker_Gibs.Worker_ForearmR_Gib',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=0.45,Y=0.064,Z=8.533),RotOffset=(Pitch=823,Yaw=-14988,Roll=-22945),Mass=10,GibChance=0,bKDNoPawnInteractions=false,bExplodeOut=false,bNoBloodyMess=false,bIgnorePawnAirCushion=false,bStaticGib=false,GibBloodyMess=none)
    Gibs(5)=(BoneName=LeftUpLeg,ReqBones=(LeftLeg),RenderObject='c_gibs.worker_leg_gib_l',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=0,Y=0,Z=0),RotOffset=(Pitch=0,Yaw=0,Roll=0),Mass=30,GibChance=0.5,bKDNoPawnInteractions=false,bExplodeOut=false,bNoBloodyMess=false,bIgnorePawnAirCushion=false,bStaticGib=false,GibBloodyMess=none)
    Gibs(6)=(BoneName=RightUpLeg,ReqBones=(RightLeg),RenderObject='c_gibs.worker_leg_gib_r',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=0,Y=0,Z=0),RotOffset=(Pitch=0,Yaw=0,Roll=0),Mass=30,GibChance=1,bKDNoPawnInteractions=false,bExplodeOut=false,bNoBloodyMess=false,bIgnorePawnAirCushion=false,bStaticGib=false,GibBloodyMess=none)
    Gibs(7)=(BoneName=LeftLeg,ReqBones=none,RenderObject='sm_class_effects.Worker_Gibs.Worker_FootL_Gib',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=2.426,Y=0.453,Z=-9.516),RotOffset=(Pitch=1153,Yaw=288,Roll=-895),Mass=15,GibChance=0,bKDNoPawnInteractions=false,bExplodeOut=false,bNoBloodyMess=false,bIgnorePawnAirCushion=false,bStaticGib=false,GibBloodyMess=none)
    Gibs(8)=(BoneName=RightLeg,ReqBones=none,RenderObject='sm_class_effects.Worker_Gibs.Worker_FootR_Gib',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=-2.386,Y=-0.644,Z=9.519),RotOffset=(Pitch=-1153,Yaw=-32483,Roll=-31872),Mass=15,GibChance=0,bKDNoPawnInteractions=false,bExplodeOut=false,bNoBloodyMess=false,bIgnorePawnAirCushion=false,bStaticGib=false,GibBloodyMess=none)
    Gibs(9)=(BoneName=Root,ReqBones=none,RenderObject='sm_class_effects.common_gibs.commonC_Gib',DrawScale=0,DrawScaleVariance=0,LocOffset=(X=1.418,Y=0.314,Z=10.356),RotOffset=(Pitch=8151,Yaw=-15471,Roll=2075),Mass=20,GibChance=0.7,bKDNoPawnInteractions=false,bExplodeOut=false,bNoBloodyMess=false,bIgnorePawnAirCushion=false,bStaticGib=false,GibBloodyMess=none)
}