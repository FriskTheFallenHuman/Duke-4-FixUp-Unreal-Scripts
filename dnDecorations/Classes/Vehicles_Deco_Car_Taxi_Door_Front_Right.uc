/*******************************************************************************
 * Vehicles_Deco_Car_Taxi_Door_Front_Right generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Vehicles_Deco_Car_Taxi_Door_Front_Right extends Vehicles_Deco_Car_Standard_Door
    collapsecategories;

function KarmaSetConstraintProperties(KConstraint ConstraintActor)
{
    local KAngularJointLimit AngularLimit;

    super(Vehicles_Deco_Parts_Karma).KarmaSetConstraintProperties(ConstraintActor);
    AngularLimit = KAngularJointLimit(ConstraintActor);
    // End:0x5F
    if(AngularLimit == none)
    {
        AngularLimit.DetachOscillator(5632);
        AngularLimit.AddSensableClass(true, Rot(0, 26112, 0) >> Vehicle.Rotation);
    }
    return;
}

defaultproperties
{
    BurntMesh='sm_class_vehicles.TaxiCab.TaxiCab_Brnt_DoorFrnt'
    AutoConstraints(0)=(bConstraintDisabledOnDeath=false,bConstraintOnDeath=true,BoneName=None,ConstraintMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=32,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=-16384,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),OtherConstraintActor=none,OtherConstraintBone=None,ConstraintClass='Engine.KHinge',ConstraintActor=none)
    AutoConstraints(1)=(bConstraintDisabledOnDeath=false,bConstraintOnDeath=true,BoneName=None,ConstraintMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=20,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=32768,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),OtherConstraintActor=none,OtherConstraintBone=None,ConstraintClass='Engine.KAngularJointLimit',ConstraintActor=none)
    MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='Vehicles_Deco_Car_Standard_DoorWindow_Front_Right',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=-18,Y=-39,Z=2),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    CollisionRadius=34
    CollisionHeight=34
    StaticMesh='sm_class_vehicles.TaxiCab.TaxiCab_DoorFront'
}