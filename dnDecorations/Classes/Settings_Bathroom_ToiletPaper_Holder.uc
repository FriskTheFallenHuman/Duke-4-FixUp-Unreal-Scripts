/*******************************************************************************
 * Settings_Bathroom_ToiletPaper_Holder generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Settings_Bathroom_ToiletPaper_Holder extends Settings_Bathroom
    collapsecategories;

event BeginPlay()
{
    ForceOneMountOnSpawn();
    super(dnDecoration).BeginPlay();
    return;
}

defaultproperties
{
    HealthPrefab=0
    MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='Settings_Bathroom_ToiletPaper_HolderRoll',SpawnChance=0.5,MountPrefab=(bDontActuallyMount=true,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=6,Z=0.1),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=16384),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(1)=(bSkipVerifySelf=false,SpawnClass='Settings_Bathroom_ToiletPaper_HolderRoll',SpawnChance=0.5,MountPrefab=(bDontActuallyMount=true,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=-6,Z=0.1),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=16384),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    PhysicsEntityGroup=ToilerPaperHolderEntityGroup
    bCollideWorld=false
    CollisionRadius=16
    CollisionHeight=6
    StaticMesh='sm_class_decorations.ToiletPaperHolder.TPHolder'
}