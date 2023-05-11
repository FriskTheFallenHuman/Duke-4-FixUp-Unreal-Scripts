/*******************************************************************************
 * Lights_Generic_Hanging_Fancy_Gold_A generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Lights_Generic_Hanging_Fancy_Gold_A extends Lights_Generic
    collapsecategories;

defaultproperties
{
    AutoConstraints(0)=(bConstraintDisabledOnDeath=false,bConstraintOnDeath=false,BoneName=Root,ConstraintMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),OtherConstraintActor=none,OtherConstraintBone=None,ConstraintClass=none,ConstraintActor=none)
    FlickerLight=(FlickerLightActor=none,FlickerLightExActor=none,bUseFlickerLight=true,bUseFlickerLightEx=true,bInitialEffect=true,bInitialEffectOnly=false,FlickerLightMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=Lamp,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=-16384,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),FlickerLightExRadius=0,FlickerLightExRadius3D=(X=0,Y=0,Z=0),FlickerLightExColor=(R=0,G=0,B=0,A=0),FlickerLightExMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),FlickerLightExIntensity=2)
    DestroyedActivities(0)=none
    DestroyedActivities(1)='dnGame.DecoActivityDeclarations.DA_Sound_Destroyed_Glass_Large'
    DestroyedActivities(2)=DecoActivities_Events'Lights_Generic.DA_Events_Lights_Generic_Destroyed'
    begin object name=DA_Display_Lights_Generic_Hanging_Fancy_Gold_A_Brkn class=DecoActivities_Display
        RenderObject='c_generic.HangingLightGold_brkn'
        Skins(0)=(Index=1,NewMaterialEx=none)
    object end
    // Reference: DecoActivities_Display'Lights_Generic_Hanging_Fancy_Gold_A.DA_Display_Lights_Generic_Hanging_Fancy_Gold_A_Brkn'
    DestroyedActivities(3)=DA_Display_Lights_Generic_Hanging_Fancy_Gold_A_Brkn
    Physics=18
    CollisionRadius=12
    CollisionHeight=40
    Mass=20
    DrawType=2
    PrePivot=(X=0,Y=0,Z=-40)
    Mesh='c_generic.HangingLightGold'
}