/*******************************************************************************
 * dnControl_CoinOp_Poker generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_CoinOp_Poker extends dnControl_CoinOp
    collapsecategories;

enum EPokerDisplayMode
{
    DISPLAYMODE_Off,
    DISPLAYMODE_ScreenSaver,
    DISPLAYMODE_Active
};

struct KeyBox
{
    var float Top;
    var float Left;
    var float Width;
    var float Height;
};

var private dnControl_CoinOp_Poker.EPokerDisplayMode DisplayMode;
var private int DisplaySurfaceID;
var private Texture PowerOffTexture;
var private MaterialEx ScreenSaverMaterial;
var private SmackerTexture ScreenSaverSmacker;
var private VideoPoker VideoPokerAbstractMachine;
var private int VideoPokerKey;
var private KeyBox Keys[6];
var localized string TouchScreenText;

event PostBeginPlay()
{
    local VideoPoker AbstractMachine;

    super.PostBeginPlay();
    // End:0x22
    foreach RotateVectorAroundAxis(class'VideoPoker', AbstractMachine)
    {
        VideoPokerAbstractMachine = AbstractMachine;        
    }    
    // End:0x3D
    if(VideoPokerAbstractMachine != none)
    {
        VideoPokerAbstractMachine = EmptyTouchClasses(class'VideoPoker');
    }
    VideoPokerKey = VideoPokerAbstractMachine.GetKey();
    return;
}

function SetPower(bool bOff)
{
    super(dnControl).SetPower(bOff);
    // End:0x20
    if(bOff)
    {
        SetPanelDisplayMode(0);        
    }
    else
    {
        SetUseable(true);
        SetPanelDisplayMode(1);
    }
    return;
}

function SetPanelDisplayMode(dnControl_CoinOp_Poker.EPokerDisplayMode NewDisplayMode)
{
    // End:0x59
    if(int(NewDisplayMode) != int(DisplayMode))
    {
        switch(DisplayMode)
        {
            // End:0x21
            case 0:
                // End:0x59
                break;
            // End:0x4B
            case 1:
                ScreenSaverSmacker.SetFrame(0);
                ScreenSaverSmacker.SetPause(true);
                // End:0x59
                break;
            // End:0x53
            case 2:
                // End:0x59
                break;
            // End:0xFFFF
            default:
                // End:0x59
                break;
                break;
        }
    }
    DisplayMode = NewDisplayMode;
    switch(DisplayMode)
    {
        // End:0x88
        case 0:
            SetUseable(false);
            VisibleActors(DisplaySurfaceID, PowerOffTexture);
            // End:0x104
            break;
        // End:0xCA
        case 1:
            VisibleActors(DisplaySurfaceID, ScreenSaverMaterial);
            SetHitTexture(ScreenSaverMaterial);
            ScreenSaverSmacker.SetFrame(0);
            ScreenSaverSmacker.SetPause(false);
            // End:0x104
            break;
        // End:0xFE
        case 2:
            VisibleActors(DisplaySurfaceID, VideoPokerAbstractMachine.TableRenderMaterial);
            SetHitTexture(VideoPokerAbstractMachine.TableRenderMaterial);
            // End:0x104
            break;
        // End:0xFFFF
        default:
            // End:0x104
            break;
            break;
    }
    return;
}

function StartCoinOp()
{
    VideoPokerAbstractMachine.Activate(VideoPokerKey);
    SetPanelDisplayMode(2);
    return;
}

function EndCoinOp()
{
    VideoPokerAbstractMachine.Deactivate(VideoPokerKey);
    SetPanelDisplayMode(1);
    return;
}

function bool CanInsertCoin()
{
    // End:0x1B
    if(VideoPokerAbstractMachine.CanBetAmount(1, User))
    {
        return true;
    }
    return false;
    return;
}

function InsertCoin()
{
    VideoPokerAbstractMachine.Bet1Pressed(User);
    return;
}

function bool CanPressStartButton()
{
    return;
}

function PressStartButton()
{
    return;
}

function TouchedPanel(int X, int Y)
{
    local int i;

    // End:0x54
    if(int(DisplayMode) == int(2))
    {
        i = 0;
        J0x15:

        // End:0x54 [Loop If]
        if(i < 6)
        {
            // End:0x4A
            if(IsPressingKey(X, Y, Keys[i]))
            {
                PressKey(i);
            }
            ++ i;
            // [Loop Continue]
            goto J0x15;
        }
    }
    return;
}

function bool IsPressingKey(int X, int Y, KeyBox Box)
{
    // End:0x17
    if(float(X) < Box.Left)
    {
        return false;
    }
    // End:0x3A
    if(float(X) > (Box.Left + Box.Width))
    {
        return false;
    }
    // End:0x51
    if(float(Y) < Box.Top)
    {
        return false;
    }
    // End:0x74
    if(float(Y) > (Box.Top + Box.Height))
    {
        return false;
    }
    return true;
    return;
}

function PressKey(int i)
{
    switch(i)
    {
        // End:0x1F
        case 0:
            VideoPokerAbstractMachine.DrawPressed();
            // End:0x99
            break;
        // End:0x36
        case 1:
            VideoPokerAbstractMachine.ToggleCard1Pressed();
            // End:0x99
            break;
        // End:0x4E
        case 2:
            VideoPokerAbstractMachine.ToggleCard2Pressed();
            // End:0x99
            break;
        // End:0x66
        case 3:
            VideoPokerAbstractMachine.ToggleCard3Pressed();
            // End:0x99
            break;
        // End:0x7E
        case 4:
            VideoPokerAbstractMachine.ToggleCard4Pressed();
            // End:0x99
            break;
        // End:0x96
        case 5:
            VideoPokerAbstractMachine.ToggleCard5Pressed();
            // End:0x99
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

function bool CanTouchScreen()
{
    // End:0x2B
    if(int(VideoPokerAbstractMachine.VPState) == int(0))
    {
        return VideoPokerAbstractMachine.CurrentBet > 0;
    }
    return true;
    return;
}

simulated event UsableSomethingPreRender()
{
    super(dnUsableSomething).UsableSomethingPreRender();
    // End:0x25
    if(int(DisplayMode) == int(2))
    {
        VideoPokerAbstractMachine.RenderGame(true);
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.RegisterMaterialClass(class'VideoPoker');
    return;
}

state() PanelIdle
{
    function bool ControlEventInternal(optional int IntEvent, optional name CustomEventName)
    {
        super.ControlEventInternal(IntEvent, CustomEventName);
        // End:0x34
        if((IntEvent == int(14)) && CanTouchScreen())
        {
            ControlEvent(, 'TouchPanel');
        }
        return;
    }

    simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
    {
        // End:0x23
        if(CanInsertCoin())
        {
            SetHUDKeyInfoState(HUD, 1, true, 26,,, InsertCoinText);            
        }
        else
        {
            // End:0x55
            if(int(VideoPokerAbstractMachine.VPState) == int(0))
            {
                SetHUDKeyInfoState(HUD, 1, true, 26,,, TouchScreenText);                
            }
            else
            {
                // End:0x75
                if(CanTouchScreen())
                {
                    SetHUDKeyInfoState(HUD, 1, true, 26,,, TouchScreenText);
                }
            }
        }
        return;
    }
    stop;
}

defaultproperties
{
    DisplaySurfaceID=1
    PowerOffTexture='dt_effects.Particles.lazerflashfx2RC'
    ScreenSaverMaterial='smt_skins3.PokerMachine.pokermachine_screen_screensaver'
    ScreenSaverSmacker='smk1.s_kpadsaver1'
    Keys[0]=(Top=103,Left=95,Width=86,Height=15)
    Keys[1]=(Top=176,Left=4,Width=48,Height=65)
    Keys[2]=(Top=176,Left=54,Width=48,Height=65)
    Keys[3]=(Top=176,Left=104,Width=48,Height=65)
    Keys[4]=(Top=176,Left=154,Width=48,Height=65)
    Keys[5]=(Top=176,Left=204,Width=48,Height=65)
    TouchScreenText="<?int?dnDecorations.dnControl_CoinOp_Poker.TouchScreenText?>"
    States(0)=(StateName=Useable,OutEvents=none,Transitions=((ControlEvent=3,CustomName=None,NewState=AttachUserLERP)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(1)=(StateName=AttachUserLERP,OutEvents=none,Transitions=((ControlEvent=5,CustomName=None,NewState=AttachUserAnim)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(2)=(StateName=AttachUserAnim,OutEvents=none,Transitions=((ControlEvent=7,CustomName=None,NewState=PanelIdle)),UserAnimName=CoinOp_Activate,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(3)=(StateName=DetachUser,OutEvents=none,Transitions=((ControlEvent=8,CustomName=None,NewState=DetachUserLERP)),UserAnimName=CoinOp_Deactivate,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(4)=(StateName=DetachUserLERP,OutEvents=none,Transitions=((ControlEvent=6,CustomName=None,NewState=Useable)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(5)=(StateName=PanelIdle,OutEvents=none,Transitions=((ControlEvent=4,CustomName=None,NewState=DetachUser),(ControlEvent=0,CustomName=TouchPanel,NewState=TouchPanel),(ControlEvent=0,CustomName=InsertCoin,NewState=InsertCoins)),UserAnimName=CoinOp_Idle,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(6)=(StateName=TouchPanel,OutEvents=none,Transitions=((ControlEvent=9,CustomName=None,NewState=PanelIdle),(ControlEvent=4,CustomName=None,NewState=DetachUser)),UserAnimName=CoinOp_FastPress,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(7)=(StateName=InsertCoins,OutEvents=none,Transitions=((ControlEvent=9,CustomName=None,NewState=PanelIdle)),UserAnimName=CoinOp_InsertCoin,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    UsableExits(0)=(bEnabled=true,EnterInfo=(LocationOffset=(X=0,Y=0,Z=0),RotationOffset=(Pitch=0,Yaw=0,Roll=0),Animation=CoinOp_Activate,SoundName=None),ExitInfo=(LocationOffset=(X=0,Y=0,Z=0),RotationOffset=(Pitch=0,Yaw=0,Roll=0),Animation=CoinOp_Deactivate,SoundName=None),ExitEndInfo=(LocationOffset=(X=-20.107,Y=0,Z=0),RotationOffset=(Pitch=0,Yaw=0,Roll=0),Animation=None,SoundName=None))
    UsableExits(1)=(bEnabled=true,EnterInfo=(LocationOffset=(X=0,Y=0,Z=0),RotationOffset=(Pitch=0,Yaw=0,Roll=0),Animation=CoinOp_Activate,SoundName=None),ExitInfo=(LocationOffset=(X=0,Y=0,Z=0),RotationOffset=(Pitch=0,Yaw=0,Roll=0),Animation=CoinOp_Deactivate_Chair,SoundName=None),ExitEndInfo=(LocationOffset=(X=-55,Y=0,Z=0),RotationOffset=(Pitch=0,Yaw=0,Roll=0),Animation=None,SoundName=None))
    bExitAssumeValid=false
    MouseInputScaleX=-0.00015
    MouseInputScaleY=0.00015
    AnalogInputScaleX=-0.00015
    AnalogInputScaleY=0.00015
    HeadAimMinOffset=(Pitch=-4192,Yaw=-8000,Roll=0)
    HeadAimMaxOffset=(Pitch=12000,Yaw=6000,Roll=0)
    bUsePreRender=true
    MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='dnBreakableGlass_PokerMachineTop',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=9.1,Y=0,Z=24),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(1)=(bSkipVerifySelf=false,SpawnClass='dnBreakableGlass_PokerMachineBottom',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=15.7,Y=0,Z=-16.6),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    bBlockKarma=true
    PlacementZOffset=60
    CollisionRadius=20
    CollisionHeight=31.76
    StaticMesh='sm_class_decorations.Electronics.pokermachine1'
}