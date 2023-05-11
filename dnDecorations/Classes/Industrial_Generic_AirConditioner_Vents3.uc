/*******************************************************************************
 * Industrial_Generic_AirConditioner_Vents3 generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Industrial_Generic_AirConditioner_Vents3 extends Industrial_Generic
    collapsecategories;

defaultproperties
{
    begin object name=DA_Sound_Industrial_Generic_AirConditioner_Vents3_Amb class=DecoActivities_Sound
        SoundNames(0)=CylindricalVent3
    object end
    // Reference: DecoActivities_Sound'Industrial_Generic_AirConditioner_Vents3.DA_Sound_Industrial_Generic_AirConditioner_Vents3_Amb'
    StartupActivities(0)=DA_Sound_Industrial_Generic_AirConditioner_Vents3_Amb
    bSurviveDeath=true
    DestroyedActivities(0)=none
    begin object name=DA_Sound_Industrial_Generic_AirConditioner_Vents3_Brkn class=DecoActivities_Sound
        SoundNames(0)=IndMetal_Destruct
        bClearAmbientSound=true
    object end
    // Reference: DecoActivities_Sound'Industrial_Generic_AirConditioner_Vents3.DA_Sound_Industrial_Generic_AirConditioner_Vents3_Brkn'
    DestroyedActivities(1)=DA_Sound_Industrial_Generic_AirConditioner_Vents3_Brkn
    begin object name=DA_Display_AC_Vents3_Brkn class=DecoActivities_Display
        RenderObject='sm_geo_decorations.AirConditioners.CylindricalVents3LO_brkn'
    object end
    // Reference: DecoActivities_Display'Industrial_Generic_AirConditioner_Vents3.DA_Display_AC_Vents3_Brkn'
    DestroyedActivities(2)=DA_Display_AC_Vents3_Brkn
    HealthPrefab=5
    Health=50
    SpawnOnDestroyed(0)=(SpawnClass='Industrial_Generic_AirConditioner_Vents3_Gib_A',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=0,Y=1,Z=-6),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Industrial_Generic_AirConditioner_Vents3.MP_AC_Vents3_Gibs')
    SpawnOnDestroyed(1)=(SpawnClass='Industrial_Generic_AirConditioner_Vents3_Gib_B',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=0,Y=6,Z=4),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Industrial_Generic_AirConditioner_Vents3.MP_AC_Vents3_Gibs')
    SpawnOnDestroyed(2)=(SpawnClass='Industrial_Generic_AirConditioner_Vents3_Gib_C',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=0,Y=-4,Z=4),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Industrial_Generic_AirConditioner_Vents3.MP_AC_Vents3_Gibs')
    DestroyedParticleFriendEffects(0)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=0,BoneName=None,Location=(X=0,Y=0,Z=0),Rotation=(Pitch=8192,Yaw=0,Roll=0),Effect='p_MapEvents.Map02_RoofTop_Decorations.RoofTop_ACUnitSmall_Spawner')
    PhysicsEntityGroup=Vents3
    CollisionRadius=16
    CollisionHeight=18
    StaticMesh='sm_geo_decorations.AirConditioners.CylindricalVents3LO'
}