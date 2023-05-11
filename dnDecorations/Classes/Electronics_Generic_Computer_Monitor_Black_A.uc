/*******************************************************************************
 * Electronics_Generic_Computer_Monitor_Black_A generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_Computer_Monitor_Black_A extends Electronics_Generic_Computer_Monitor
    collapsecategories;

function Destroyed()
{
    bIgnorePawnAirCushion = false;
    KFindPhysicsAction(7);
    super.Destroyed();
    return;
}

defaultproperties
{
    DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(3),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=('dnGame.DecoActivityDeclarations.DA_Sound_SmallSwitch_Standard'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(1)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(33),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Sound'Electronics_Generic_Computer_Monitor.DA_Sound_ElctrGen_Cmptr_Monitor_PowerOn','dnGame.DecoActivityDeclarations.DA_Interact_bUsable_Enable','dnGame.DecoActivityDeclarations.DA_HUD_bDrawUsePhrase_Enable','dnGame.DecoActivityDeclarations.DA_HUD_bForceUsePhrase_Enable'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(2)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(34),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Sound'Electronics_Generic_Computer_Monitor.DA_Sound_ElctrGen_Cmptr_Monitor_PowerOff','dnGame.DecoActivityDeclarations.DA_HUD_bDrawUsePhrase_Enable','dnGame.DecoActivityDeclarations.DA_HUD_bForceUsePhrase_Enable'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(3)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(PowerDisabled),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=('dnGame.DecoActivityDeclarations.DA_HUD_bDrawUsePhrase_Disable','dnGame.DecoActivityDeclarations.DA_Interact_bUsable_Disable','dnGame.DecoActivityDeclarations.DA_HUD_bForceUsePhrase_Disable',DecoActivities_Sound'Electronics_Generic_Computer_Monitor.DA_Sound_ElctrGen_Cmptr_Monitor_PowerOff'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(4)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(PowerOn),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Display'Electronics_Generic_Computer_Monitor_Black_A.DA_Display_ElctrGen_Cmptr_Monitor_Black_A_PowerOn'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(5)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(PowerOff),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Display'Electronics_Generic_Computer_Monitor_Black_A.DA_Display_ElctrGen_Cmptr_Monitor_Black_A_PowerOff'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DestroyedActivities(0)=none
    DestroyedActivities(1)=DecoActivities_Sound'Electronics_Generic.DA_Sound_Destroyed_Electronic'
    DestroyedActivities(2)='dnGame.DecoActivityDeclarations.DA_Interact_bUsable_Disable'
    DestroyedActivities(3)='dnGame.DecoActivityDeclarations.DA_HUD_bForceUsePhrase_Disable'
    DestroyedActivities(4)='dnGame.DecoActivityDeclarations.DA_HUD_bDrawUsePhrase_Enable'
    DestroyedActivities(5)=DecoActivities_Sound'Electronics_Generic_Computer_Monitor.DA_Sound_ElctrGen_Cmptr_Monitor_PowerOff'
    DestroyedActivities(6)='dnGame.DecoActivityDeclarations.DA_Physics_PHYS_Karma_Set'
    begin object name=DA_Display_ElctrGen_Cmptr_Monitor_Black_A_PowerOff class=DecoActivities_Display
        Skins(0)=(Index=2,NewMaterialEx='smt_skins3.computer.compmonitor_fblend_off')
    object end
    // Reference: DecoActivities_Display'Electronics_Generic_Computer_Monitor_Black_A.DA_Display_ElctrGen_Cmptr_Monitor_Black_A_PowerOff'
    DestroyedActivities(7)=DA_Display_ElctrGen_Cmptr_Monitor_Black_A_PowerOff
    MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='DecoGlass_Monitor_FlatScreen',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=Glass,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.6,Y=0,Z=0.6),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    bIgnorePawnAirCushion=true
    bIgnorePawnDownwardForce=true
    DynamicInteractionClassification=0
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Metal_Hollow'
    PhysicsMassType=1
    CollisionRadius=14
    CollisionHeight=15
    StaticMesh='sm_class_decorations.Electronics.comp_monitor'
}