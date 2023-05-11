/*******************************************************************************
 * ShrinkMachine generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ShrinkMachine extends RenderActor
    collapsecategories;

struct SShrinkMachine
{
    var() float Delta;
    var() SSoundInfo StartSound;
    var() SSoundInfo EndSound;
    var() Vector moveDelta;
    var() float moveTime;
    var() bool bVolumeActive;
    var() name BroadcastEvent;
    var bool bComplete;
};

var() array<SShrinkMachine> TimeLine;
var Pawn EventInstigator;
var() name StartSequenceTag;
var int TimeLineIndex;
var float CurrentTime;
var float LastStapTime;
var Vector OriginalLocation;
var Vector CurrentDestination;
var Vector CurrentDestinationStart;
var float CurrentDestinationTime;
var float CurrentDestinationTimeStart;
var bool bActive;
var ShrinkMachineVolume Volume;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        Finished;
}

function PostBeginPlay()
{
    super.PostBeginPlay();
    OriginalLocation = Location;
    CurrentDestination = Location;
    return;
}

simulated function PostNetInitial()
{
    super.PostNetInitial();
    GetPointRegion('StartSequence', StartSequenceTag);
    TraceFire(1, false, 'SetupOwner');
    return;
}

simulated function SetupOwner()
{
    // End:0x43
    if(int(Role) != int(ROLE_Authority))
    {
        // End:0x35
        if(Level.TickHint() == none)
        {
            CreateDesiredLocationEx(Level.TickHint());            
        }
        else
        {
            TraceFire(1, false, 'SetupOwner');
        }
    }
    return;
}

simulated function TriggerFunc_StartSequence()
{
    local Actor Other;
    local int SpecialEventID;

    TraceWaterPoint(Other, EventInstigator, SpecialEventID);
    StartSequence();
    return;
}

simulated function StartSequence()
{
    local int i;

    J0x00:
    // End:0x2D [Loop If]
    if(i < string(TimeLine))
    {
        TimeLine[i].bComplete = false;
        ++ i;
        // [Loop Continue]
        goto J0x00;
    }
    CurrentDestination = OriginalLocation;
    CurrentDestinationTime = 0;
    bActive = true;
    CurrentTime = 0;
    LastStapTime = 0;
    TimeLineIndex = default.TimeLineIndex;
    NextStep();
    return;
}

simulated function NextStep()
{
    ++ TimeLineIndex;
    // End:0x25
    if(string(TimeLine) == TimeLineIndex)
    {
        bActive = false;
        Finished();
    }
    return;
}

noexport simulated delegate Finished()
{
    FinishAnim();
    return;
}

simulated function PlayStep(SShrinkMachine Current)
{
    // End:0x10
    if(int(Role) < int(ROLE_Authority))
    {
        return;
    }
    LastStapTime = CurrentTime;
    // End:0x7D
    if(string(Current.StartSound.Sounds) > 0)
    {
        // End:0x6B
        if(string(Current.StartSound.Slots) == 0)
        {
            Current.StartSound.Slots[Current.StartSound.Slots.Add(1)] = 3;
        }
        PlaySoundInfo(3, Current.StartSound);
    }
    // End:0xDF
    if(string(Current.EndSound.Sounds) > 0)
    {
        // End:0xCD
        if(string(Current.EndSound.Slots) == 0)
        {
            Current.EndSound.Slots[Current.EndSound.Slots.Add(1)] = 3;
        }
        StopSoundInfo(Current.EndSound, 0);
    }
    // End:0x143
    if(Current.moveDelta != Vect(0, 0, 0))
    {
        CurrentDestinationStart = Location;
        CurrentDestination = Location + Current.moveDelta;
        CurrentDestinationTime = CurrentTime + Current.moveTime;
        CurrentDestinationTimeStart = CurrentTime;
    }
    // End:0x16D
    if(NameForString(Current.BroadcastEvent, 'None'))
    {
        GlobalTrigger(Current.BroadcastEvent, EventInstigator);
    }
    NextStep();
    return;
}

simulated event Tick(float DeltaSeconds)
{
    local Vector Dir;
    local float destinationTime;

    super(Actor).Tick(DeltaSeconds);
    // End:0x1B
    if(int(Role) < int(ROLE_Authority))
    {
        return;
    }
    // End:0x80
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x80
        if(CurrentDestination != Location)
        {
            Dir = VLerp(1 - FClamp((CurrentDestinationTime - CurrentTime) / (CurrentDestinationTime - CurrentDestinationTimeStart), 0, 1), CurrentDestinationStart, CurrentDestination);
            SetDesiredRotation(Dir);
        }
    }
    CurrentTime += DeltaSeconds;
    // End:0x99
    if(! bActive)
    {
        return;
    }
    J0x99:

    // End:0xD9 [Loop If]
    if(bActive && CurrentTime >= (LastStapTime + TimeLine[TimeLineIndex].Delta))
    {
        PlayStep(TimeLine[TimeLineIndex]);
        // [Loop Continue]
        goto J0x99;
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    local int i;

    super(Actor).RegisterPrecacheComponents(PrecacheIndex);
    i = string(TimeLine) - 1;
    J0x1A:

    // End:0x69 [Loop If]
    if(i >= 0)
    {
        PrecacheIndex.GetColorForPosition(TimeLine[i].StartSound);
        PrecacheIndex.GetColorForPosition(TimeLine[i].EndSound);
        -- i;
        // [Loop Continue]
        goto J0x1A;
    }
    return;
}

defaultproperties
{
    TimeLine(0)=(Delta=0,StartSound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_ambient.Machine.GeneratorValveAlarm03'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=2,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),EndSound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),moveDelta=(X=0,Y=0,Z=0),moveTime=0,bVolumeActive=false,BroadcastEvent=None,bComplete=false)
    TimeLine(1)=(Delta=4,StartSound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),EndSound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),moveDelta=(X=0,Y=0,Z=100),moveTime=1,bVolumeActive=false,BroadcastEvent=None,bComplete=false)
    TimeLine(2)=(Delta=0,StartSound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),EndSound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_ambient.Machine.GeneratorValveAlarm03'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=2,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),moveDelta=(X=0,Y=0,Z=0),moveTime=0,bVolumeActive=false,BroadcastEvent=None,bComplete=false)
    TimeLine(3)=(Delta=4,StartSound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),EndSound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),moveDelta=(X=0,Y=0,Z=-100),moveTime=1,bVolumeActive=false,BroadcastEvent=None,bComplete=false)
    TimeLineIndex=-1
    bNoDamage=true
    bTraceShootable=false
    bAlwaysRelevant=true
    CollisionRadius=10
    CollisionHeight=10
    TickStyle=1
    DrawType=8
    StaticMesh='SM-Industrial.Furnace.goopplane'
    RemoteRole=1
    SoundOcclusionScale=0
}