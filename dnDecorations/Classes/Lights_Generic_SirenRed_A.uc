/*******************************************************************************
 * Lights_Generic_SirenRed_A generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Lights_Generic_SirenRed_A extends Lights_Generic
    collapsecategories;

defaultproperties
{
    DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(LightOn),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Events'Lights_Generic.DA_Events_Lights_Generic_Toggled'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(1)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(LightOff),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Events'Lights_Generic.DA_Events_Lights_Generic_Toggled'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(2)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(LightOn),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Display'Lights_Generic_SirenRed_A.DA_Display_Lights_Generic_SirenRed_A_On',DecoActivities_Animation'Lights_Generic_SirenRed_A.DA_Anim_Lights_Generic_SirenRed_A_On'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(3)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(LightOff),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Display'Lights_Generic_SirenRed_A.DA_Display_Lights_Generic_SirenRed_A_Off',DecoActivities_Animation'Lights_Generic_SirenRed_A.DA_Anim_Lights_Generic_SirenRed_A_Off'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    begin object name=DA_Anim_Lights_Generic_SirenRed_A_On class=DecoActivities_Animation
        AnimActivities(0)=(Flags=(bLoop=true,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=rotate,Channel=0,Rate=0,TweenTime=0)
    object end
    // Reference: DecoActivities_Animation'Lights_Generic_SirenRed_A.DA_Anim_Lights_Generic_SirenRed_A_On'
    StartupActivities(0)=DA_Anim_Lights_Generic_SirenRed_A_On
    FlickerLight=(FlickerLightActor=none,FlickerLightExActor=none,bUseFlickerLight=true,bUseFlickerLightEx=true,bInitialEffect=true,bInitialEffectOnly=false,FlickerLightMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=16384,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),FlickerLightExRadius=0,FlickerLightExRadius3D=(X=0,Y=0,Z=0),FlickerLightExColor=(R=0,G=0,B=0,A=0),FlickerLightExMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),FlickerLightExIntensity=2)
    DestroyedActivities(0)=none
    DestroyedActivities(1)='dnGame.DecoActivityDeclarations.DA_Sound_Destroyed_Glass_Large'
    DestroyedActivities(2)=DecoActivities_Events'Lights_Generic.DA_Events_Lights_Generic_Destroyed'
    begin object name=DA_Display_Lights_Generic_SirenRed_A_Brkn class=DecoActivities_Display
        RenderObject='c_generic.redsirenbrkn'
    object end
    // Reference: DecoActivities_Display'Lights_Generic_SirenRed_A.DA_Display_Lights_Generic_SirenRed_A_Brkn'
    DestroyedActivities(3)=DA_Display_Lights_Generic_SirenRed_A_Brkn
    begin object name=DA_Anim_Lights_Generic_SirenRed_A_Off class=DecoActivities_Animation
        StopAnimChannels(0)=0
    object end
    // Reference: DecoActivities_Animation'Lights_Generic_SirenRed_A.DA_Anim_Lights_Generic_SirenRed_A_Off'
    DestroyedActivities(4)=DA_Anim_Lights_Generic_SirenRed_A_Off
    HealthPrefab=1
    bLowerByCollision=true
    CollisionRadius=5.2
    CollisionHeight=6.5
    DrawType=2
    Mesh='c_generic.RedSiren'
}