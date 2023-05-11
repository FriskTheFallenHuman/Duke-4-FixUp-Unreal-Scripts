/*******************************************************************************
 * Details_Generic_Vibrator generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Generic_Vibrator extends Details_Generic
    collapsecategories;

enum EVIBRATOR_State
{
    EVIBRATOR_Off,
    EVIBRATOR_On
};

var() bool bQuestItemHack;
var localized string QuestItemUsePhrase;
var Details_Generic_Vibrator.EVIBRATOR_State VibratorState;

function StartSelfOff()
{
    DecoActivity(0, 'TurnVibOff');
    super(dnDecoration).StartSelfOff();
    return;
}

function PostVerifySelf()
{
    DecoActivity(0, 'StartOn');
    super(dnDecoration).PostVerifySelf();
    bUsable = ! bQuestItemHack;
    bGrabbable = bQuestItemHack;
    // End:0x43
    if(bGrabbable)
    {
        UsePhrase = QuestItemUsePhrase;
    }
    return;
}

function DoThatVibratorThing()
{
    DecoActivity(0, 'Vibrate');
    TraceFire(FVar(0.06, 0.05), false, 'DoThatVibratorThing');
    return;
}

function HitByEMP(optional float Duration, optional Pawn Instigator)
{
    super(dnDecoration).HitByEMP(Duration, Instigator);
    DecoActivity(0, 'TurnVibEMP');
    return;
}

function EMPDone()
{
    super(dnDecoration).EMPDone();
    SetState(VibratorState);
    return;
}

event Used(Actor Other, Pawn EventInstigator)
{
    local Details_Generic_Vibrator.EVIBRATOR_State NewState;

    super(dnDecoration).Used(Other, EventInstigator);
    // End:0x1B
    if(bEMPulsed)
    {
        return;
    }
    switch(VibratorState)
    {
        // End:0x33
        case 0:
            NewState = 1;
            // End:0x46
            break;
        // End:0x43
        case 1:
            NewState = 0;
            // End:0x46
            break;
        // End:0xFFFF
        default:
            break;
    }
    SetState(NewState);
    return;
}

function Grabbed(Pawn Grabber)
{
    local Details_Generic_Vibrator V;

    super(dnDecoration).Grabbed(Grabber);
    // End:0x90
    foreach RotateVectorAroundAxis(class'Details_Generic_Vibrator', V)
    {
        // End:0x2B
        if(V != self)
        {
            continue;            
        }
        V.bQuestItemHack = false;
        V.bGrabbable = false;
        V.bUsable = V.default.bUsable;
        V.UsePhrase = V.default.UsePhrase;        
    }    
    class'Inventory'.static.AttemptPickup(class'dnQuestItem_Vibrator', none, Grabber, 2);
    GlobalTrigger('Vibrator_QuestItem_Located');
    Grabber.bGrabbing = false;
    Grabber.DropCarriedActor(, true,, true, true);
    bSilentDestroy = true;
    RemoveTouchClass();
    return;
}

final function SetState(Details_Generic_Vibrator.EVIBRATOR_State NewState)
{
    VibratorState = NewState;
    switch(NewState)
    {
        // End:0x28
        case 0:
            DecoActivity(0, 'TurnVibOff');
            // End:0x40
            break;
        // End:0x3D
        case 1:
            DecoActivity(0, 'TurnVibOn');
            // End:0x40
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
    // End:0x26
    if(bQuestItemHack)
    {
        PrecacheIndex.RegisterMaterialClass(class'dnQuestItem_Vibrator');
    }
    return;
}

defaultproperties
{
    QuestItemUsePhrase="<?int?dnDecorations.Details_Generic_Vibrator.QuestItemUsePhrase?>"
    DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(StartOn),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Events'Details_Generic_Vibrator.DA_Event_Vibrator_TurnedOn'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(1)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(Vibrate),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_KarmaImpulse'Details_Generic_Vibrator.DA_Impulse_Vibrator_Vibrate'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(2)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(TurnVibOff),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Sound'Details_Generic_Vibrator.DA_Sound_Vibrator_TurnedOff',DecoActivities_Events'Details_Generic_Vibrator.DA_Event_Vibrator_TurnedOff'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(3)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(TurnVibOn),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Sound'Details_Generic_Vibrator.DA_Sound_Vibrator_TurnedOn',DecoActivities_Events'Details_Generic_Vibrator.DA_Event_Vibrator_TurnedOn'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(4)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(TurnVibEMP),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Sound'Details_Generic_Vibrator.DA_Sound_Vibrator_TurnedOff',DecoActivities_Events'Details_Generic_Vibrator.DA_Event_Vibrator_TurnedOff'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    bStartupOff=true
    HealthPrefab=0
    bUsable=true
    EMPDisableTime=15
    bTickOnlyWhenPhysicsAwake=true
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Rubber'
    PhysicsMassType=1
    EnableDisableThreshold=0.005
    PhysicsSoundOverrides(0)=(SoundType=0,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=('a_impact.SpecialCase.Dildo_Impact_01','a_impact.SpecialCase.Dildo_Impact_02','a_impact.SpecialCase.Dildo_Impact_03'),SoundInfo=(InputRange=(Min=64,Max=1280),OutputPitchRange=(Min=0.75,Max=1),OutputVolumeRange=(Min=0.4,Max=0.8)),bDisableSoundInWater=true)
    PhysicsSoundOverrides(1)=(SoundType=1,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=('a_impact.SpecialCase.Dildo_Roll_01'),SoundInfo=(InputRange=(Min=8,Max=50),OutputPitchRange=(Min=0.75,Max=1),OutputVolumeRange=(Min=0.5,Max=0.75)),bDisableSoundInWater=true)
    Physics=18
    bGoryActor=true
    CollisionRadius=1.2
    CollisionHeight=6
    Mass=10
    StaticMesh='sm_class_decorations.vibrater.VibraterunBoxedDukes'
}