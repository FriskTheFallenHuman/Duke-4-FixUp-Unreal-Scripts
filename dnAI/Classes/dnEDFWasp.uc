/*******************************************************************************
 * dnEDFWasp generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnEDFWasp extends dnGunship_Base
    collapsecategories;

var() name DropOffTag;
var() name PickupTag;
var() name FireRocketLeft1Tag;
var() name FireRocketLeft2Tag;
var() name FireRocketRight1Tag;
var() name FireRocketRight2Tag;
var dnRocket_EDFWasp_Proxy Left1;
var dnRocket_EDFWasp_Proxy Left2;
var dnRocket_EDFWasp_Proxy Right1;
var dnRocket_EDFWasp_Proxy Right2;

function Destroyed()
{
    // End:0x19
    if(Left1 == none)
    {
        Left1.RemoveTouchClass();
    }
    // End:0x32
    if(Left2 == none)
    {
        Left1.RemoveTouchClass();
    }
    // End:0x4B
    if(Right1 == none)
    {
        Left1.RemoveTouchClass();
    }
    // End:0x64
    if(Right2 == none)
    {
        Left1.RemoveTouchClass();
    }
    return;
}

function PostVerifySelf()
{
    super.PostVerifySelf();
    GetPointRegion('DropOff', DropOffTag);
    GetPointRegion('Pickup', PickupTag);
    GetPointRegion('FireRocketLeft1', FireRocketLeft1Tag);
    GetPointRegion('FireRocketLeft2', FireRocketLeft2Tag);
    GetPointRegion('FireRocketRight1', FireRocketRight1Tag);
    GetPointRegion('FireRocketRight2', FireRocketRight2Tag);
    Left1 = dnRocket_EDFWasp_Proxy(FindMountedActor('Rocket_Left1'));
    Left2 = dnRocket_EDFWasp_Proxy(FindMountedActor('Rocket_Left2'));
    Right1 = dnRocket_EDFWasp_Proxy(FindMountedActor('Rocket_Right1'));
    Right2 = dnRocket_EDFWasp_Proxy(FindMountedActor('Rocket_Right2'));
    // End:0x134
    if(NameForString(PhysicsEntityGroup, 'None'))
    {
        // End:0xDA
        if(Left1 == none)
        {
            Left1.KSetJointsFrozenPercent(PhysicsEntityGroup);
        }
        // End:0xF8
        if(Left2 == none)
        {
            Left2.KSetJointsFrozenPercent(PhysicsEntityGroup);
        }
        // End:0x116
        if(Right1 == none)
        {
            Right1.KSetJointsFrozenPercent(PhysicsEntityGroup);
        }
        // End:0x134
        if(Right2 == none)
        {
            Right2.KSetJointsFrozenPercent(PhysicsEntityGroup);
        }
    }
    return;
}

function TriggerFunc_DropOff()
{
    DecoActivity(0, 'DropOff');
    return;
}

function TriggerFunc_Pickup()
{
    DecoActivity(0, 'Pickup');
    return;
}

function TriggerFunc_FireRocketLeft1()
{
    FireRocket(Left1);
    return;
}

function TriggerFunc_FireRocketLeft2()
{
    FireRocket(Left2);
    return;
}

function TriggerFunc_FireRocketRight1()
{
    FireRocket(Right1);
    return;
}

function TriggerFunc_FireRocketRight2()
{
    FireRocket(Right2);
    return;
}

function FireRocket(dnRocket_EDFWasp_Proxy rocket)
{
    FindAndPlaySound('Fire_Rocket');
    // End:0x27
    if(rocket == none)
    {
        rocket.Fire();
    }
    return;
}

simulated event AnimEndEx(SAnimEndInfo AnimEndInfo)
{
    super(dnDecoration).AnimEndEx(AnimEndInfo);
    // End:0x30
    if(AnimEndInfo.AnimName != 'claw_pickup')
    {
        DecoActivity(0, 'PickupIdle');        
    }
    else
    {
        // End:0x52
        if(AnimEndInfo.AnimName != 'claw_dropoff')
        {
            DecoActivity(0, 'DropOffIdle');
        }
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'Fire_Rocket');
    return;
}

defaultproperties
{
    AimInfo(0)=(GunPosition=1,GunType=1,BoneName=gun_front_aimer,bDebug=false,bFiringDisabled=false,MuzzleNames=(gun_front_barrel_right_muzzle,gun_front_barrel_right_muzzle),MuzzleIndex=0,bFireThisFrame=false,FireGate=0,MinFOVDot=0.1,MaxFOVDir=(X=1,Y=0,Z=-1),MaxDist=6000,bCheckLOS=true,LOSGate=0,bLastLOS=false,PosThisFrame=(X=0,Y=0,Z=0),TargetActor=none,TargetTag=None)
    AimInfo(1)=(GunPosition=6,GunType=1,BoneName=gun_rear_aimer,bDebug=false,bFiringDisabled=false,MuzzleNames=(gun_rear_barrel_left_muzzle,gun_rear_barrel_right_muzzle),MuzzleIndex=0,bFireThisFrame=false,FireGate=0,MinFOVDot=0.707,MaxFOVDir=(X=-1,Y=0,Z=-1),MaxDist=6000,bCheckLOS=true,LOSGate=0,bLastLOS=false,PosThisFrame=(X=0,Y=0,Z=0),TargetActor=none,TargetTag=None)
    InitialTargetTag=DukePlayer
    MaxSpeed=2800
    MaxIdleSpeed=1500
    DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(Pickup),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Animation'dnEDFWasp.DA_Anim_Claw_Pickup',DecoActivities_Sound'dnEDFWasp.DA_Sound_Wasp_ArmsOpen'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(1)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(DropOff),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Animation'dnEDFWasp.DA_Anim_Claw_DropOff',DecoActivities_Sound'dnEDFWasp.DA_Sound_Wasp_ArmsClose'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(2)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(PickupIdle),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Animation'dnEDFWasp.DA_Anim_Claw_Pickup_Idle'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(3)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(DropOffIdle),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Animation'dnEDFWasp.DA_Anim_Claw_DropOff_Idle'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    bEnemy=false
    MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='dnGame.dnShipThrusterEffect_Wasp',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_thruster_front_left,MountOrigin=(X=-1,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(1)=(bSkipVerifySelf=false,SpawnClass='dnGame.dnShipThrusterEffect',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_thruster_front_left,MountOrigin=(X=-1,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject='sm_class_effects.AttackShip_Thrusters.AttackShip_Thrusters_02',DrawScale=0)
    MountOnSpawn(2)=(bSkipVerifySelf=false,SpawnClass='dnGame.dnShipThrusterEffect_Wasp',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_thruster_front_right,MountOrigin=(X=-1,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(3)=(bSkipVerifySelf=false,SpawnClass='dnGame.dnShipThrusterEffect',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_thruster_front_right,MountOrigin=(X=-1,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject='sm_class_effects.AttackShip_Thrusters.AttackShip_Thrusters_02',DrawScale=0)
    MountOnSpawn(4)=(bSkipVerifySelf=false,SpawnClass='dnGame.dnShipThrusterEffect_Wasp',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_thruster_rear_left,MountOrigin=(X=-1,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(5)=(bSkipVerifySelf=false,SpawnClass='dnGame.dnShipThrusterEffect',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_thruster_rear_left,MountOrigin=(X=-1,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject='sm_class_effects.AttackShip_Thrusters.AttackShip_Thrusters_02',DrawScale=0)
    MountOnSpawn(6)=(bSkipVerifySelf=false,SpawnClass='dnGame.dnShipThrusterEffect_Wasp',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_thruster_rear_right,MountOrigin=(X=-1,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(7)=(bSkipVerifySelf=false,SpawnClass='dnGame.dnShipThrusterEffect',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_thruster_rear_right,MountOrigin=(X=-1,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject='sm_class_effects.AttackShip_Thrusters.AttackShip_Thrusters_02',DrawScale=0)
    MountOnSpawn(8)=(bSkipVerifySelf=false,SpawnClass='p_Vehicles.Wasp.Wasp_Exhaust_Main',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_thruster_side_left,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=32768,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(9)=(bSkipVerifySelf=false,SpawnClass='p_Vehicles.Wasp.Wasp_Exhaust_Main',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_thruster_side_right,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=32768,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(10)=(bSkipVerifySelf=false,SpawnClass='dnGame.dnRocket_EDFWasp_Proxy',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=Rocket_Left1,ForceEvent=None,MountMeshItem=mount_rocket_left_01,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(11)=(bSkipVerifySelf=false,SpawnClass='dnGame.dnRocket_EDFWasp_Proxy',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=Rocket_Left2,ForceEvent=None,MountMeshItem=mount_rocket_left_02,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(12)=(bSkipVerifySelf=false,SpawnClass='dnGame.dnRocket_EDFWasp_Proxy',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=Rocket_Right1,ForceEvent=None,MountMeshItem=mount_rocket_right_01,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(13)=(bSkipVerifySelf=false,SpawnClass='dnGame.dnRocket_EDFWasp_Proxy',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=Rocket_Right2,ForceEvent=None,MountMeshItem=mount_rocket_right_02,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(14)=(bSkipVerifySelf=false,SpawnClass='dnGame.dnBomb_EDFWasp',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_bomb_left,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(15)=(bSkipVerifySelf=false,SpawnClass='dnGame.dnBomb_EDFWasp',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_bomb_right,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    PhysicsEntityGroup=EDFWasp
    bAcceptMeshAccurateMoveActorTrace=true
    CollisionRadius=350
    CollisionHeight=150
    Mesh='c_vehicles.edf_wasp'
    VoicePack='SoundConfig.Vehicles.VoicePack_Wasp'
}