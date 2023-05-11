/*******************************************************************************
 * Electronics_Generic_ComputerStation_Thin generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_ComputerStation_Thin extends Electronics_Generic
    collapsecategories;

defaultproperties
{
    bSurviveDeath=true
    FlickerLight=(FlickerLightActor=none,FlickerLightExActor=none,bUseFlickerLight=true,bUseFlickerLightEx=true,bInitialEffect=true,bInitialEffectOnly=false,FlickerLightMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),FlickerLightExRadius=150,FlickerLightExRadius3D=(X=0,Y=0,Z=0),FlickerLightExColor=(R=116,G=124,B=201,A=0),FlickerLightExMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=26,Y=30,Z=1),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),FlickerLightExIntensity=1)
    DestroyedActivities(0)=none
    DestroyedActivities(1)=DecoActivities_Sound'Electronics_Generic.DA_Sound_Destroyed_Electronic'
    begin object name=DA_Display_CompStation_Think class=DecoActivities_Display
        Skins(0)=(Index=0,NewMaterialEx='smt_skins5.ComputerStation.CompStationPanel03_cd_brkn')
        Skins(1)=(Index=1,NewMaterialEx='smt_skins5.IndustrialCompStation.IndCompStatPn03_cd_Brkn')
        Skins(2)=(Index=2,NewMaterialEx='smt_skins5.ComputerStation.CompStationPanel04_cd_brkn')
    object end
    // Reference: DecoActivities_Display'Electronics_Generic_ComputerStation_Thin.DA_Display_CompStation_Think'
    DestroyedActivities(2)=DA_Display_CompStation_Think
    DestroyedActivities(3)='dnGame.DecoActivityDeclarations.DA_Sound_Ambient_Clear'
    HealthPrefab=4
    SpawnOnDestroyedSimple(0)=none
    SpawnOnDestroyedSimple(1)='dnParticles.dnDebris_Smoke'
    SpawnOnDestroyedSimple(2)='dnParticles.dnDebris_Sparks1'
    CollisionHeight=64
    StaticMesh='sm_class_decorations.Electronics.ComputerStation_Thin'
}