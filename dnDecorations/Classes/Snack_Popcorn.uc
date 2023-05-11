/*******************************************************************************
 * Snack_Popcorn generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Snack_Popcorn extends Snacks_Generic
    collapsecategories;

var bool bPopped;
var int LatePopCount;
var() noexport bool bQuestItemHack "If true, this popcorn will be added as a quest item when grabbed.  This is a super hack for a specific map.";
var() noexport float FirstPopDelay "Delay in seconds before the first pop";
var() noexport float MinPopTime "Starting minimum time in seconds between pops";
var() noexport float PopTimeVar "Variance in pop time";
var() noexport float MinPopTimeDelta "After each pop decrease MinPopTime by this";
var() noexport float LatePopTime "Min pop time for late pops";
var() noexport float LatePopTimeVar "Variance in late pops";
var() noexport float LatePopTimeDelta "After each late pop, increase LatePopTime by this";
var() noexport Vector PoppedMeshOffset "Displace the popped static mesh by this after popping via SetPrePivot";
var SGrabInfo PoppedGrabbedInfo;

simulated function bool CanBeGrabUsedBy(Pawn User)
{
    return bPopped && super(InteractiveActor).CanBeGrabUsedBy(User);
    return;
}

simulated function bool CanBeThrown()
{
    return ! bQuestItemHack && super(InteractiveActor).CanBeThrown();
    return;
}

final function PlayPopSound()
{
    local float Time;

    MinPopTime = FMax(PopTimeVar, MinPopTime - MinPopTimeDelta);
    Time = FVar(MinPopTime, PopTimeVar);
    DecoActivity(0, 'PlayPopSound');
    Destroy(Time, false, 'PlayPopSound');
    return;
}

final function PlayLatePopSound()
{
    local float Time;

    -- LatePopCount;
    // End:0x4E
    if(LatePopCount > 0)
    {
        Time = FVar(LatePopTime, LatePopTimeVar);
        DecoActivity(0, 'PlayPopSound');
        Destroy(Time, false, 'PlayLatePopSound');
        LatePopTime += LatePopTimeDelta;        
    }
    else
    {
        Spawn('PlayLatePopSound');
        DecoEndAnim();
    }
    return;
}

function float StartMicrowaving(InteractiveActor MicrowaveActor)
{
    DecoActivity(0, 'StartMicrowaving');
    // End:0x34
    if(SetScaleModifier() == none)
    {
        MicrowaveInfo.TimeToMicrowave = MeshInstance.IsMyDigs('a_bagopen');
    }
    Destroy(FirstPopDelay, false, 'PlayPopSound');
    return super(dnDecoration).StartMicrowaving(MicrowaveActor);
    return;
}

function PlacedInMicrowave(InteractiveActor MicrowaveActor)
{
    super(InteractiveActor).PlacedInMicrowave(MicrowaveActor);
    DecoActivity(0, 'PlaceInMicrowave');
    return;
}

function CompleteMicrowaving()
{
    super.CompleteMicrowaving();
    Spawn('PlayPopSound');
    EndCallbackTimer(PoppedMeshOffset);
    DecoActivity(0, 'StopMicrowaving');
    bPopped = true;
    HealthPrefab = 2;
    ResetHealthProperties();
    PlayLatePopSound();
    GrabInfo = PoppedGrabbedInfo;
    GrabInfo.MountItemOverride = 'mount_handright';
    // End:0x72
    if(! bQuestItemHack)
    {
        DecoActivity(0, 'UsePhrase_Eat');
    }
    return;
}

function InterruptMicrowaving()
{
    super(InteractiveActor).InterruptMicrowaving();
    Spawn('PlayPopSound');
    RemoveTouchClass();
    return;
}

function Grabbed(Pawn Grabber)
{
    local Snack_Popcorn P;

    super(dnDecoration).Grabbed(Grabber);
    // End:0xDF
    if(bPopped)
    {
        // End:0x9E
        if(bQuestItemHack)
        {
            // End:0x40
            foreach RotateVectorAroundAxis(class'Snack_Popcorn', P)
            {
                P.bQuestItemHack = false;                
            }            
            class'Inventory'.static.AttemptPickup(class'dnQuestItem_Popcorn', none, Grabber, 2);
            GlobalTrigger('Popcorn_QuestItem_Located');
            Grabber.bGrabbing = false;
            Grabber.DropCarriedActor(, true,, true, true);
            bSilentDestroy = true;
            RemoveTouchClass();            
        }
        else
        {
            Grabber.ConsumeFood();
            // End:0xD4
            if(DukePlayer(Grabber) == none)
            {
                DukePlayer(Grabber).NotifyFoodEaten();
            }
            bSilentDestroy = true;
            RemoveTouchClass();
        }
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.SetAnimPairState(PoppedGrabbedInfo.CarrierMountPose);
    // End:0x3D
    if(bQuestItemHack)
    {
        PrecacheIndex.RegisterMaterialClass(class'dnQuestItem_Popcorn');
    }
    return;
}

defaultproperties
{
    LatePopCount=10
    FirstPopDelay=5
    MinPopTime=2
    PopTimeVar=0.1
    MinPopTimeDelta=0.125
    LatePopTime=0.75
    LatePopTimeVar=0.5
    LatePopTimeDelta=0.2
    PoppedMeshOffset=(X=0,Y=0,Z=-5)
    PoppedGrabbedInfo=(bCanDuckWhileHeld=true,MountItemOverride=mount_handright,MountOrigin=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),GrabAnimName=None,CarrierAnimName=None,CarrierMountPose=CarryPosePoppedPopcorn,GrabSoundName=None,ThrowSoundName=None,GrabSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),ThrowSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none))
    DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(32),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Display'Snack_Popcorn.DA_Display_Snacks_Popcorn_Stop_Microwave'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(1)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(PlaceInMicrowave),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Display'Snack_Popcorn.DA_Display_Snacks_Popcorn_PlaceIn_Microwave',DecoActivities_Animation'Snack_Popcorn.DA_Anim_Snacks_Popcorn_Closed_pose'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(2)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(StopMicrowaving),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Display'Snack_Popcorn.DA_Display_Snacks_Popcorn_Stop_Microwave'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(3)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(StartMicrowaving),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Animation'Snack_Popcorn.DA_Anim_Snacks_Popcorn_Popping'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(4)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(PlayPopSound),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Sound'Snack_Popcorn.DA_Sound_Snack_Popcorn_Popping'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(5)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(UsePhrase_Eat),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=('dnGame.DecoActivityDeclarations.DA_HUD_UsePhrase_Eat'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    bUseDecoAnim=false
    UsePhrase="<?int?dnDecorations.Snack_Popcorn.UsePhrase?>"
    GrabInfo=(bCanDuckWhileHeld=true,MountItemOverride=mount_handright,MountOrigin=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),GrabAnimName=None,CarrierAnimName=CarrySnackPopcornFolded,CarrierMountPose=CarryPoseSnackPopcornFolded,GrabSoundName=None,ThrowSoundName=None,GrabSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),ThrowSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none))
    SpawnOnDestroyedSimple(0)='dnParticles.dnDebris_Popcorn1'
    CollisionRadius=6
    CollisionHeight=0
    StaticMesh='sm_class_decorations.Default.PopcornBag_Folded'
}