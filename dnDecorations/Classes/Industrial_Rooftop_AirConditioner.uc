/*******************************************************************************
 * Industrial_Rooftop_AirConditioner generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Industrial_Rooftop_AirConditioner extends Industrial_Generic
    collapsecategories;

event Destroyed()
{
    RemoveMountedActorListActors(false, false);
    super(dnDecoration).Destroyed();
    return;
}

defaultproperties
{
    begin object name=DA_Sound_Industrial_Rooftop_AirConditioner_Amb class=DecoActivities_Sound
        SoundNames(0)=Rooftop_AC
    object end
    // Reference: DecoActivities_Sound'Industrial_Rooftop_AirConditioner.DA_Sound_Industrial_Rooftop_AirConditioner_Amb'
    StartupActivities(0)=DA_Sound_Industrial_Rooftop_AirConditioner_Amb
    bSurviveDeath=true
    DestroyedActivities(0)=none
    begin object name=DA_Sound_Industrial_Rooftop_AirConditioner_Brkn class=DecoActivities_Sound
        SoundNames(0)=IndMetal_Destruct
        bClearAmbientSound=true
    object end
    // Reference: DecoActivities_Sound'Industrial_Rooftop_AirConditioner.DA_Sound_Industrial_Rooftop_AirConditioner_Brkn'
    DestroyedActivities(1)=DA_Sound_Industrial_Rooftop_AirConditioner_Brkn
    begin object name=DA_Display_Rooftop_AirConditioner_Brkn class=DecoActivities_Display
        RenderObject='sm_geo_decorations.AirConditioners.acunit_brkn'
    object end
    // Reference: DecoActivities_Display'Industrial_Rooftop_AirConditioner.DA_Display_Rooftop_AirConditioner_Brkn'
    DestroyedActivities(2)=DA_Display_Rooftop_AirConditioner_Brkn
    SpawnOnDestroyed(0)=(SpawnClass='Industrial_Rooftop_AirConditioner_Gib_A',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=76,Y=67,Z=1),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Industrial_Rooftop_AirConditioner.MP_Rooftop_AirConditioner_Gibs')
    SpawnOnDestroyed(1)=(SpawnClass='Industrial_Rooftop_AirConditioner_Gib_D',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-76,Y=1,Z=1),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Industrial_Rooftop_AirConditioner.MP_Rooftop_AirConditioner_Gibs')
    SpawnOnDestroyed(2)=(SpawnClass='Industrial_Rooftop_AirConditioner_Gib_E',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=0,Y=127,Z=1),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Industrial_Rooftop_AirConditioner.MP_Rooftop_AirConditioner_Gibs')
    SpawnOnDestroyed(3)=(SpawnClass='Industrial_Rooftop_AirConditioner_Gib_F',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=0,Y=113,Z=53),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Industrial_Rooftop_AirConditioner.MP_Rooftop_AirConditioner_Gibs')
    SpawnOnDestroyed(4)=(SpawnClass='Industrial_Rooftop_AirConditioner_Gib_G',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-60,Y=-31,Z=53),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Industrial_Rooftop_AirConditioner.MP_Rooftop_AirConditioner_Gibs')
    DestroyedParticleFriendEffects(0)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=0,BoneName=None,Location=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),Effect='p_MapEvents.Map02_RoofTop_Decorations.RoofTop_ACUnit_Spawner')
    CollisionRadius=170
    CollisionHeight=74
    StaticMesh='sm_geo_decorations.AirConditioners.acunit'
}