/*******************************************************************************
 * aFinalDecoration_Switches generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class aFinalDecoration_Switches extends dnUsableSomething
    abstract
    collapsecategories;

struct SwitchState
{
    var() noexport bool bAfterSequence "Don't do the changes until after the animation sequence has finished playing. Also disables the trigger ability until the animation is complete.";
    var noexport name Sequence "DEPRECATED PROPERTY... DON'T USE! Use SwitchAnimInfo instead.";
    var() noexport SAnimInfo SwitchAnimInfo "Animation information to play.";
    var() noexport SAnimInfo DisabledSwitchAnimInfo "Animation to play when disabled";
    var SSoundInfo Sound;
    var SSoundInfo DisabledSound;
    var() noexport name SoundName "Name of the VoicePack entry we want to use when enabled.";
    var() noexport name DisabledSoundName "Name of the VoicePack entry we want to use when disabled.";
    var() noexport array<SUpdateMaterialEx> SwitchSkins "Materials to swap out on the switch when this state is engaged.";
    var() noexport name PlayerAnim "Anim Controller name to execute on player";
    var() noexport name DisabledPlayerAnim "Anim Controller name to execute on player when switch is disabled";
    var() noexport array<SActorColor> SwitchActorColors "Actor colors to apply after the switch";
};

struct SSwitchUserState
{
    var() noexport string UsePhrase "UsePhrase to display in this state.";
    var() noexport float SwitchAgainTime "If this is greater than 0, then the switch will automatically go to the next state after the specified amount of time has passed. The switch is disabled during this time and unable to do anything until the time has expired.";
    var() noexport float SwitchPauseTime "Amount of time to pause after switching states before the switch can be hit again.";
    var() noexport name Event "Event to call when this state is engaged.";
};

var(SwitchInfo) noexport array<SwitchState> SwitchStates "The various states the switch can be in.";
var(SwitchInfo) noexport array<SSwitchUserState> SwitchUserStates "Events that this switch is supposed to fire off.";
var(SwitchInfo) noexport name SwitchID "A unique ID to identify groups of switches that should stay synched together.";
var(SwitchInfo) noexport localized string DisabledMessage "Message to display when this switch is disabled.";
var(SwitchInfo) noexport localized string PausedMessage "Message to display when the switch is currently just paused.";
var(SwitchInfo) noexport int CurrentIndex "Index of the state we start out in. Remember that this isn't the first state to occur when the actor is used... it's what state it is in CURRENTLY.";
var(SwitchInfo) noexport bool bAnimUser "Animate this user when using the switch";
var(SwitchInfo) noexport bool bLoop "If this is false, then when the switch gets to the last state in the list, it will not go back around to the start again.";
var(SwitchInfo) noexport bool bQueueSwitchAgainWhenDisabled "If the switch gets disabled while we are waiting to switch again, then if this is true, we'll switch ourselves immediately upon getting enabled again.";
var(SwitchInfo) noexport bool bShootable "Switch can be shot. Will act like it was used each time it is shot.";
var(SwitchInfo) noexport name SE_ToggleSwitchStatus "Calling this will toggle the switch from being Enabled/Disabled";
var(SwitchInfo) noexport name SE_SetEnabled "Triggering this event will enable the switch.";
var(SwitchInfo) noexport name SE_SetDisabled "Triggering this event will disable the switch.";
var bool bDisabledForever;
var bool bDisabled;
var bool bSwitching;
var bool bSynching;
var bool bPausing;
var bool bLastAnimWasStuck;
var bool bQueuedSwitch;
var int QueuedSynchState;
var netupdate(NU_nUsable) int nUsable;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        ClientDecoAnim, ClientEndSwitch, 
        ClientSetUsePhrase, nUsable;
}

simulated function NU_nUsable(int Index)
{
    local int i;

    ClientSetUsePhrase(Index);
    i = string(SwitchStates[Index].SwitchActorColors) - 1;
    J0x25:

    // End:0x53 [Loop If]
    if(i >= 0)
    {
        FinishSlottedSound(SwitchStates[Index].SwitchActorColors[i]);
        -- i;
        // [Loop Continue]
        goto J0x25;
    }
    return;
}

simulated function PreBeginPlay()
{
    GetPointRegion('ToggleSwitchStatus', SE_ToggleSwitchStatus);
    GetPointRegion('SetEnabled', SE_SetEnabled);
    GetPointRegion('SetDisabled', SE_SetDisabled);
    // End:0x39
    if(! bAnimUser)
    {
        ControlRemapperClass = none;
    }
    super.PreBeginPlay();
    return;
}

simulated function bool VerifySelf()
{
    local SAnimInfo AnimInfo;
    local int i;

    // End:0x7E
    if(string(SwitchStates) == 0)
    {
        InvalidAlert(("Warning: " $ string(self)) $ " has 0 switch states. Can't operate without at least one switch state. Removing self.");
        return false;
    }
    i = string(SwitchStates) - 1;
    J0x8D:

    // End:0x10F [Loop If]
    if(i >= 0)
    {
        AnimInfo = SwitchStates[i].SwitchAnimInfo;
        // End:0x105
        if(AnimInfo.Animation != 'None')
        {
            AnimInfo.Animation = SwitchStates[i].Sequence;
            // End:0x105
            if(SwitchStates[i].bAfterSequence)
            {
                SwitchStates[i].bAfterSequence = false;
            }
        }
        -- i;
        // [Loop Continue]
        goto J0x8D;
    }
    return super(Actor).VerifySelf();
    return;
}

simulated function PostVerifySelf()
{
    super.PostVerifySelf();
    Synch(CurrentIndex);
    // End:0x21
    if(bStartupOff)
    {
        SetSwitchStatus(true);
    }
    return;
}

simulated function StartSelfOff()
{
    return;
}

final function Synch(int Index)
{
    // End:0x27
    if(! bSwitching)
    {
        bSynching = true;
        CurrentIndex = Index;
        StartSwitchState();        
    }
    else
    {
        QueuedSynchState = Index;
    }
    return;
}

simulated function TriggerFunc_ToggleSwitchStatus()
{
    ToggleSwitchStatus();
    return;
}

simulated function TriggerFunc_SetEnabled()
{
    SetSwitchStatus(false);
    return;
}

simulated function TriggerFunc_SetDisabled()
{
    SetSwitchStatus(true);
    return;
}

simulated event Trigger(Actor Other, Pawn EventInstigator)
{
    super(dnDecoration).Trigger(Other, EventInstigator);
    UsedNoRelevantPawnAnims(none, true);
    return;
}

simulated event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
    super(dnDecoration).TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
    // End:0x8E
    if((((bShootable && ! bSwitching) && Instigator == none) && Instigator.bIsPlayerPawn) && IsA(DamageType, class'BulletDamage') || IsA(DamageType, class'MeleeDamage'))
    {
        UsedNoRelevantPawnAnims(none, true);
    }
    return;
}

simulated event Destroyed()
{
    super.Destroyed();
    SetSwitchStatus(true);
    bUsable = false;
    return;
}

final simulated function ToggleSwitchStatus()
{
    SetSwitchStatus(! bDisabled);
    return;
}

final simulated function SetSwitchStatus(bool bSwitchDisabled)
{
    bDisabled = bSwitchDisabled;
    SetUsePhrase();
    bUsable = ! bDisabled;
    // End:0x5A
    if(((bQueuedSwitch && ! SwitchIsDisabled()) && ! bPausing) && ! bSwitching)
    {
        UsedNoRelevantPawnAnims(none, true);
    }
    return;
}

simulated function bool SwitchIsDisabled()
{
    // End:0x0B
    if(MPRoundNotInProgress())
    {
        return true;
    }
    return bDisabledForever || bDisabled;
    return;
}

simulated function bool CanAttachPawn(Pawn Attachee)
{
    local bool bHasRelevantAnims;

    // End:0x12
    if(! super.CanAttachPawn(Attachee))
    {
        return false;
    }
    // End:0x2B
    if(bSwitching || bPausing)
    {
        return false;        
    }
    else
    {
        // End:0x6A
        if(SwitchIsDisabled())
        {
            // End:0x65
            if(bAnimUser && NameForString(SwitchStates[CurrentIndex].DisabledPlayerAnim, 'None'))
            {
                bHasRelevantAnims = true;                
            }
            else
            {
                return false;
            }            
        }
        else
        {
            IncrementSwitchState();
            bHasRelevantAnims = bAnimUser;
        }
    }
    // End:0x93
    if(! bHasRelevantAnims)
    {
        UsedNoRelevantPawnAnims(Attachee);
    }
    return bHasRelevantAnims;
    return;
}

final simulated function IncrementSwitchState()
{
    CurrentIndex = (CurrentIndex + 1) % string(SwitchStates);
    return;
}

final simulated function UsedNoRelevantPawnAnims(Pawn User, optional bool bIncrement)
{
    // End:0x0B
    if(SwitchIsDisabled())
    {
        return;
    }
    // End:0x1A
    if(bIncrement)
    {
        IncrementSwitchState();
    }
    // End:0x97
    if(User == none)
    {
        User.HandQuickAction(SwitchStates[CurrentIndex].PlayerAnim);
        // End:0x97
        if(((IsMP()) && int(Role) == int(ROLE_Authority)) && DukePlayer(User) == none)
        {
            DukePlayer(User).ClientHandQuickAction(SwitchStates[CurrentIndex].PlayerAnim);
        }
    }
    StartSwitchState();
    // End:0xB1
    if(IsMP())
    {
        Instigator = User;
    }
    return;
}

final simulated function StartSwitchState()
{
    local aFinalDecoration_Switches SwitchDeco;

    bSwitching = true;
    bQueuedSwitch = false;
    // End:0x5D
    if(! bSynching)
    {
        TickStyle = 3;
        DecoPlayAnimEx(SwitchStates[CurrentIndex].SwitchAnimInfo);
        // End:0x5D
        if((IsMP()) && int(Role) == int(ROLE_Authority))
        {
            ClientDecoAnim(CurrentIndex);
        }
    }
    // End:0xC9
    if(NameForString(SwitchID, 'None') && ! bSynching)
    {
        // End:0xC8
        foreach RotateVectorAroundAxis(class'aFinalDecoration_Switches', SwitchDeco)
        {
            // End:0xC7
            if((SwitchDeco.SwitchID != SwitchID) && SwitchDeco == self)
            {
                SwitchDeco.Synch(CurrentIndex);
            }            
        }        
    }
    // End:0xF0
    if(! SwitchStates[CurrentIndex].bAfterSequence || bSynching)
    {
        EndSwitchState();
    }
    return;
}

simulated delegate ClientDecoAnim(int cIdx)
{
    DecoPlayAnimEx(SwitchStates[cIdx].SwitchAnimInfo);
    return;
}

simulated function AnimEndActivity(int Channel, name AnimName)
{
    super(dnDecoration).AnimEndActivity(Channel, AnimName);
    // End:0x2A
    if(SwitchStates[CurrentIndex].bAfterSequence)
    {
        EndSwitchState();
    }
    return;
}

simulated function EndSwitchState()
{
    local SUpdateMaterialEx UpdateMaterialEx;
    local int i;

    TickStyle = default.TickStyle;
    i = string(SwitchStates[CurrentIndex].SwitchSkins) - 1;
    J0x25:

    // End:0x6D [Loop If]
    if(i >= 0)
    {
        UpdateMaterialEx = SwitchStates[CurrentIndex].SwitchSkins[i];
        VisibleActors(UpdateMaterialEx.Index, UpdateMaterialEx.NewMaterialEx);
        -- i;
        // [Loop Continue]
        goto J0x25;
    }
    i = string(SwitchStates[CurrentIndex].SwitchActorColors) - 1;
    J0x87:

    // End:0xB5 [Loop If]
    if(i >= 0)
    {
        FinishSlottedSound(SwitchStates[CurrentIndex].SwitchActorColors[i]);
        -- i;
        // [Loop Continue]
        goto J0x87;
    }
    // End:0xDD
    if(! bLoop && CurrentIndex == (string(SwitchStates) - 1))
    {
        bDisabledForever = true;
    }
    SetUsePhrase();
    // End:0x126
    if(! bSynching)
    {
        // End:0x126
        if(! bLastAnimWasStuck && string(SwitchUserStates) > CurrentIndex)
        {
            GlobalTrigger(SwitchUserStates[CurrentIndex].Event, Instigator);
        }
    }
    // End:0x13A
    if(IsMP())
    {
        ClientEndSwitch(CurrentIndex);
    }
    // End:0x14E
    if(! SwitchIsDisabled())
    {
        TryToPauseSwitch();        
    }
    else
    {
        TryToCompleteSwitching();
    }
    return;
}

simulated delegate ClientEndSwitch(int cIdx)
{
    local int i;
    local SUpdateMaterialEx UpdateMaterialEx;

    i = string(SwitchStates[cIdx].SwitchSkins) - 1;
    J0x1A:

    // End:0x62 [Loop If]
    if(i >= 0)
    {
        UpdateMaterialEx = SwitchStates[cIdx].SwitchSkins[i];
        VisibleActors(UpdateMaterialEx.Index, UpdateMaterialEx.NewMaterialEx);
        -- i;
        // [Loop Continue]
        goto J0x1A;
    }
    i = string(SwitchStates[cIdx].SwitchActorColors) - 1;
    J0x7C:

    // End:0xAA [Loop If]
    if(i >= 0)
    {
        FinishSlottedSound(SwitchStates[cIdx].SwitchActorColors[i]);
        -- i;
        // [Loop Continue]
        goto J0x7C;
    }
    return;
}

final simulated function TryToPauseSwitch()
{
    bPausing = true;
    SetUsePhrase();
    // End:0x56
    if((string(SwitchUserStates) > CurrentIndex) && SwitchUserStates[CurrentIndex].SwitchPauseTime > 0)
    {
        TraceFire(SwitchUserStates[CurrentIndex].SwitchPauseTime, false, 'TryToSwitchAgain');        
    }
    else
    {
        TryToSwitchAgain();
    }
    return;
}

final simulated function TryToSwitchAgain()
{
    // End:0x59
    if((string(SwitchUserStates) > CurrentIndex) && SwitchUserStates[CurrentIndex].SwitchAgainTime > 0)
    {
        // End:0x3D
        if(bQueueSwitchAgainWhenDisabled)
        {
            bQueuedSwitch = true;
        }
        TraceFire(SwitchUserStates[CurrentIndex].SwitchAgainTime, false, 'SwitchAgainOver');        
    }
    else
    {
        TryToCompleteSwitching();
    }
    return;
}

final simulated function SwitchAgainOver()
{
    TryToCompleteSwitching();
    UsedNoRelevantPawnAnims(none, true);
    return;
}

final simulated function TryToCompleteSwitching()
{
    bPausing = false;
    bSynching = false;
    bSwitching = false;
    SetUsePhrase();
    // End:0x3B
    if(QueuedSynchState != -1)
    {
        TraceFire(1E-05, false, 'QueuedSynch');
    }
    return;
}

simulated function QueuedSynch()
{
    local int synchState;

    synchState = QueuedSynchState;
    QueuedSynchState = -1;
    Synch(synchState);
    return;
}

final simulated function SetUsePhrase()
{
    // End:0x47
    if(bDisabled)
    {
        bNoUseKeyInfo = true;
        UsePhrase = DisabledMessage;
        bForceUsePhrase = true;
        // End:0x44
        if((IsMP()) && int(Role) == int(ROLE_Authority))
        {
            nUsable = 0;
        }        
    }
    else
    {
        // End:0x8E
        if(bPausing)
        {
            bNoUseKeyInfo = true;
            UsePhrase = PausedMessage;
            bForceUsePhrase = true;
            // End:0x8B
            if((IsMP()) && int(Role) == int(ROLE_Authority))
            {
                nUsable = 1;
            }            
        }
        else
        {
            UsePhrase = default.UsePhrase;
            // End:0xBA
            if((IsMP()) && int(Role) == int(ROLE_Authority))
            {
                nUsable = 2;
            }
        }
    }
    return;
}

simulated delegate ClientSetUsePhrase(int phrase)
{
    switch(phrase)
    {
        // End:0x1A
        case 0:
            UsePhrase = DisabledMessage;
            // End:0x42
            break;
        // End:0x2C
        case 1:
            UsePhrase = PausedMessage;
            // End:0x42
            break;
        // End:0x3F
        case 2:
            UsePhrase = default.UsePhrase;
            // End:0x42
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

final simulated function Switch_User_Animate()
{
    // End:0x4A
    if(SwitchIsDisabled())
    {
        bLastAnimWasStuck = true;
        User.SetUsableSomethingAnimation(SwitchStates[CurrentIndex].DisabledPlayerAnim);
        DecoPlayAnimEx(SwitchStates[CurrentIndex].DisabledSwitchAnimInfo);        
    }
    else
    {
        bLastAnimWasStuck = false;
        User.SetUsableSomethingAnimation(SwitchStates[CurrentIndex].PlayerAnim);
        StartSwitchState();
    }
    return;
}

simulated function AttachComplete()
{
    super.AttachComplete();
    // End:0x15
    if(bUseHomePose)
    {
        Switch_User_Animate();
    }
    return;
}

simulated function AttachPawnSuccess(Pawn Attachee, optional bool bForced)
{
    super.AttachPawnSuccess(Attachee, bForced);
    // End:0x22
    if(! bUseHomePose)
    {
        Switch_User_Animate();
    }
    return;
}

simulated function AnimCallback_UserReleased()
{
    super(InteractiveActor).AnimCallback_UserReleased();
    AnimCallback_UserDetached();
    return;
}

animevent simulated function PlayActivate(optional EventInfo EventParms)
{
    // End:0x23
    if(! bSynching)
    {
        FindAndPlaySound(SwitchStates[CurrentIndex].SoundName, 1);
    }
    return;
}

animevent simulated function PlayStuck(optional EventInfo EventParms)
{
    // End:0x23
    if(! bSynching)
    {
        FindAndPlaySound(SwitchStates[CurrentIndex].DisabledSoundName, 1);
    }
    return;
}

simulated event EnumerateRawAnimationSequences(out array<SAnimationEnumeration> References)
{
    local int i;

    super(dnDecoration).EnumerateRawAnimationSequences(References);
    i = 0;
    J0x12:

    // End:0xB6 [Loop If]
    if(i < string(SwitchStates))
    {
        // End:0x67
        if(NameForString(SwitchStates[i].SwitchAnimInfo.Animation, 'None'))
        {
            AddAnimationEnumeration(References, SwitchStates[i].SwitchAnimInfo.Animation, Mesh);
        }
        // End:0xAC
        if(NameForString(SwitchStates[i].DisabledSwitchAnimInfo.Animation, 'None'))
        {
            AddAnimationEnumeration(References, SwitchStates[i].DisabledSwitchAnimInfo.Animation, Mesh);
        }
        ++ i;
        // [Loop Continue]
        goto J0x12;
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    local int i, j;

    super.RegisterPrecacheComponents(PrecacheIndex);
    i = string(SwitchStates) - 1;
    J0x1A:

    // End:0x135 [Loop If]
    if(i >= 0)
    {
        PrecacheIndex.SetAnimPairState(SwitchStates[i].PlayerAnim);
        PrecacheIndex.SetChannelEventState(Mesh, SwitchStates[i].SwitchAnimInfo.Animation);
        PrecacheIndex.SetChannelEventState(Mesh, SwitchStates[i].DisabledSwitchAnimInfo.Animation);
        PrecacheIndex.InitAnimationControllerEx(VoicePack, SwitchStates[i].SoundName);
        PrecacheIndex.InitAnimationControllerEx(VoicePack, SwitchStates[i].DisabledSoundName);
        j = string(SwitchStates[i].SwitchSkins) - 1;
        J0xEE:

        // End:0x12B [Loop If]
        if(j >= 0)
        {
            PrecacheIndex.RegisterAnimationControllerEntry(SwitchStates[i].SwitchSkins[j].NewMaterialEx);
            -- j;
            // [Loop Continue]
            goto J0xEE;
        }
        -- i;
        // [Loop Continue]
        goto J0x1A;
    }
    return;
}

defaultproperties
{
    DisabledMessage="<?int?dnDecorations.aFinalDecoration_Switches.DisabledMessage?>"
    PausedMessage="<?int?dnDecorations.aFinalDecoration_Switches.PausedMessage?>"
    bLoop=true
    bQueueSwitchAgainWhenDisabled=true
    QueuedSynchState=-1
    UserMountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=25,Y=0,Z=-50),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=32768,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0)
    ForwardRotationOffset=(Pitch=0,Yaw=32768,Roll=0)
    bStandardUseRestriction=false
    DetachUserSoundName=None
    HealthPrefab=0
    ShrunkUseStyle=1
    bNeverMeshAccurate=true
    bNoNativeTick=true
    bTickOnlyRecent=false
    bTickOnlyZoneRecent=false
    PlacementZOffset=64
    TickStyle=0
    TransientSoundRadius=128
    TransientSoundInnerRadius=64
    VoicePack='SoundConfig.Interactive.VoicePack_Switches'
}