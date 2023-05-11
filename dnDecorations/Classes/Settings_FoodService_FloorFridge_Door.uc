/*******************************************************************************
 * Settings_FoodService_FloorFridge_Door generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Settings_FoodService_FloorFridge_Door extends Settings_FoodService_DoorBase
    abstract
    collapsecategories;

defaultproperties
{
    DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(3),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=('dnGame.DecoActivityDeclarations.DA_HUD_bDrawUsePhrase_Disable','dnGame.DecoActivityDeclarations.DA_Interact_bUsable_Disable'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(1)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(DoorOpenComplete),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=('dnGame.DecoActivityDeclarations.DA_HUD_bDrawUsePhrase_Enable','dnGame.DecoActivityDeclarations.DA_Interact_bUsable_Enable','dnGame.DecoActivityDeclarations.DA_HUD_UsePhrase_Close'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(2)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(DoorCloseComplete),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=('dnGame.DecoActivityDeclarations.DA_HUD_bDrawUsePhrase_Enable','dnGame.DecoActivityDeclarations.DA_Interact_bUsable_Enable','dnGame.DecoActivityDeclarations.DA_HUD_UsePhrase_Open'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(3)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(3),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Sound'Settings_FoodService_FloorFridge_Door.DA_Sound_Sett_Food_FloorFridge_Opening',DecoActivities_Keyframes'Settings_FoodService_FloorFridge_Door.DA_Keyframes_Sett_Food_FloorFridge_Opening'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0)),(ActivityRules=none,ActivityElements=(DecoActivities_Sound'Settings_FoodService_FloorFridge_Door.DA_Sound_Sett_Food_FloorFridge_Closing',DecoActivities_Keyframes'Settings_FoodService_FloorFridge_Door.DA_Keyframes_Sett_Food_FloorFridge_Closing'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    UsePhrase="<?int?dnDecorations.Settings_FoodService_FloorFridge_Door.UsePhrase?>"
    CollisionRadius=1
    CollisionHeight=8.7
    DesiredLocation(0)=(bTemporal=false,bComplete=false,bRelativeMotion=false,Target=(X=0,Y=0,Z=0),TargetVariance=(X=0,Y=0,Z=0),RealTarget=(X=0,Y=0,Z=0),Start=(X=0,Y=0,Z=0),Speed=(Value=0,Variance=0),Rate=(X=0,Y=0,Z=0),Exponent=0,TimeTotal=0.6,TimeMid=0,RealTimeMid=0,Timer=0,Style=1,StyleStopped=0,CrushDamage=(DamageHow=0,Damage=(Value=0,Variance=0),Rate=(Value=0,Variance=0),Timer=0),Event=None,EventAbort=None,FunctionComplete=DoorOpenComplete,FunctionAbort=None)
    DesiredLocation(1)=(bTemporal=false,bComplete=false,bRelativeMotion=false,Target=(X=0,Y=0,Z=0),TargetVariance=(X=0,Y=0,Z=0),RealTarget=(X=0,Y=0,Z=0),Start=(X=0,Y=0,Z=0),Speed=(Value=0,Variance=0),Rate=(X=0,Y=0,Z=0),Exponent=0,TimeTotal=0.6,TimeMid=0,RealTimeMid=0,Timer=0,Style=1,StyleStopped=0,CrushDamage=(DamageHow=0,Damage=(Value=0,Variance=0),Rate=(Value=0,Variance=0),Timer=0),Event=None,EventAbort=None,FunctionComplete=DoorCloseComplete,FunctionAbort=None)
    StaticMesh='sm_class_decorations.BeerCooler.BeerFridgeDoor'
}