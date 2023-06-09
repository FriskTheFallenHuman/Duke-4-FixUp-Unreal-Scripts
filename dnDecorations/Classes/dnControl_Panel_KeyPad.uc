/*******************************************************************************
 * dnControl_Panel_KeyPad generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_Panel_KeyPad extends dnControl_Panel
    collapsecategories;

enum EKeyPadDisplayMode
{
    DISPLAYMODE_Off,
    DISPLAYMODE_ScreenSaver,
    DISPLAYMODE_Active
};

struct SKeyBox
{
    var float Top;
    var float Left;
    var float Width;
    var float Height;
};

var() noexport name SuccessEvents[4] "Event to trigger when keypad is unlocked.";
var() noexport name FailEvent "Event to trigger when attempt fails.";
var() noexport int PassCode[4] "A list of up to 4 passcodes to be matched against. (PassCodes all need to be the same length.)";
var() noexport bool bUnlockTarget "Some things, like doors, check to see if this is	true when triggered.  If it is, they stay unlocked.";
var() noexport bool bRelocking "If true, the keypad will return to the locked state after being tripped.";
var private dnControl_Panel_KeyPad.EKeyPadDisplayMode DisplayMode;
var private int DisplaySurfaceID;
var private Texture PowerOffTexture;
var private MaterialEx ScreenSaverMaterial;
var private SmackerTexture ScreenSaverSmacker;
var private MaterialEx CanvasMaterial;
var private TextureCanvas CanvasTexture;
var private Texture KeyPadTex;
var private Texture LockedPadTex;
var private Texture UnlockedPadTex;
var private Texture DigitsTex[12];
var private SKeyBox KeyBoxes[12];
var private int TouchedKey;
var private string EnteredCode;
var private bool bDirty;
var private bool bLocked;

event PostBeginPlay()
{
    super.PostBeginPlay();
    return;
}

event Tick(float DeltaTime)
{
    super(dnControl).Tick(DeltaTime);
    switch(DisplayMode)
    {
        // End:0x1B
        case 0:
            // End:0x3C
            break;
        // End:0x23
        case 1:
            // End:0x3C
            break;
        // End:0x36
        case 2:
            Tick_Active(DeltaTime);
            // End:0x3C
            break;
        // End:0xFFFF
        default:
            // End:0x3C
            break;
            break;
    }
    return;
}

function Tick_Active(float DeltaTime)
{
    local float XL, YL;
    local Font pFont;
    local int i;

    // End:0x13F
    if(bDirty)
    {
        CanvasTexture.DrawBitmap(KeyPadTex, 0, 0);
        // End:0x69
        if(TouchedKey >= 0)
        {
            CanvasTexture.DrawBitmap(DigitsTex[TouchedKey], int(KeyBoxes[TouchedKey].Left), int(KeyBoxes[TouchedKey].Top), true);
        }
        // End:0x11E
        if(bLocked)
        {
            // End:0x9B
            if(EnteredCode == "")
            {
                CanvasTexture.DrawBitmap(LockedPadTex, 0, 32, true);                
            }
            else
            {
                // End:0xBC
                if(User == none)
                {
                    pFont = class'Canvas'.default.LargeFont;
                }
                CanvasTexture.GetSmackerTextureInstance(EnteredCode, XL, YL, pFont);
                CanvasTexture.GetFrameCount(pFont, int(float(DisplayX) - XL) / 2, int(float(32) + ((float(32) - YL) / float(2))), EnteredCode);
            }            
        }
        else
        {
            CanvasTexture.DrawBitmap(UnlockedPadTex, 0, 32, true);
        }
        bDirty = false;
    }
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

function TouchedPanel(int X, int Y)
{
    local int i;

    // End:0x19F
    if(int(DisplayMode) == int(2))
    {
        TouchedKey = -1;
        i = 0;
        J0x20:

        // End:0xE5 [Loop If]
        if(i < 12)
        {
            // End:0xDB
            if((((float(X) > KeyBoxes[i].Left) && float(X) < (KeyBoxes[i].Left + KeyBoxes[i].Width)) && float(Y) > KeyBoxes[i].Top) && float(Y) < (KeyBoxes[i].Top + KeyBoxes[i].Height))
            {
                TouchedKey = i;
                Destroy(0.5, false, 'TouchTimerExpired');
            }
            ++ i;
            // [Loop Continue]
            goto J0x20;
        }
        // End:0xF6
        if(TouchedKey == -1)
        {
            return;
        }
        bDirty = true;
        // End:0x126
        if(Len(EnteredCode) < Len(string(PassCode[0])))
        {
            FindAndPlaySound('KeyPad_Press', 1);            
        }
        else
        {
            FindAndPlaySound('KeyPad_InvalidPress', 1);
        }
        // End:0x19F
        if(bLocked)
        {
            // End:0x15E
            if(TouchedKey == 10)
            {
                FindAndPlaySound('KeyPad_Reset', 1);
                ResetKeypad();                
            }
            else
            {
                // End:0x173
                if(TouchedKey == 11)
                {
                    TryCode();                    
                }
                else
                {
                    // End:0x19F
                    if(Len(EnteredCode) < Len(string(PassCode[0])))
                    {
                        EnteredCode = EnteredCode $ string(TouchedKey);
                    }
                }
            }
        }
    }
    return;
}

function TouchTimerExpired()
{
    bDirty = true;
    TouchedKey = -1;
    return;
}

function SetPanelDisplayMode(dnControl_Panel_KeyPad.EKeyPadDisplayMode NewDisplayMode)
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
            // End:0x115
            break;
        // End:0xCA
        case 1:
            VisibleActors(DisplaySurfaceID, ScreenSaverMaterial);
            SetHitTexture(ScreenSaverMaterial);
            ScreenSaverSmacker.SetFrame(0);
            ScreenSaverSmacker.SetPause(false);
            // End:0x115
            break;
        // End:0x10F
        case 2:
            VisibleActors(DisplaySurfaceID, CanvasMaterial);
            SetHitTexture(CanvasMaterial);
            CanvasTexture.Palette = KeyPadTex.Palette;
            ResetKeypad();
            // End:0x115
            break;
        // End:0xFFFF
        default:
            // End:0x115
            break;
            break;
    }
    return;
}

function ResetKeypad()
{
    EnteredCode = "";
    // End:0x1F
    if(TouchedKey != 10)
    {
        TouchedKey = -1;
    }
    bDirty = true;
    return;
}

function TryCode()
{
    local Actor A;
    local int i;

    bDirty = true;
    i = 0;
    J0x0F:

    // End:0x83 [Loop If]
    if(i < 4)
    {
        // End:0x79
        if((int(EnteredCode) != 0) && int(EnteredCode) == PassCode[i])
        {
            FindAndPlaySound('KeyPad_CodeAccepted', 1);
            bLocked = false;
            Destroy(0.8, false, 'RemoveUser');
            GlobalTrigger(SuccessEvents[i], User, self);
        }
        ++ i;
        // [Loop Continue]
        goto J0x0F;
    }
    // End:0xAC
    if(bLocked)
    {
        EnteredCode = "";
        FindAndPlaySound('KeyPad_CodeRejected', 1);
        GlobalTrigger(FailEvent);
    }
    // End:0xBD
    if(bRelocking)
    {
        bLocked = true;
    }
    return;
}

function RemoveUser()
{
    // End:0x13
    if(User == none)
    {
        DetachPawnSuccess(false);
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    local int i;

    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.RegisterAnimation(PowerOffTexture);
    PrecacheIndex.RegisterAnimationControllerEntry(ScreenSaverMaterial);
    PrecacheIndex.RegisterAnimationControllerEntry(ScreenSaverSmacker);
    PrecacheIndex.RegisterAnimationControllerEntry(CanvasMaterial);
    PrecacheIndex.RegisterAnimation(KeyPadTex);
    PrecacheIndex.RegisterAnimation(LockedPadTex);
    PrecacheIndex.RegisterAnimation(UnlockedPadTex);
    i = 0;
    J0x90:

    // End:0xBE [Loop If]
    if(i < 12)
    {
        PrecacheIndex.RegisterAnimation(DigitsTex[i]);
        ++ i;
        // [Loop Continue]
        goto J0x90;
    }
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'KeyPad_Press');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'KeyPad_InvalidPress');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'KeyPad_Reset');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'KeyPad_CodeAccepted');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'KeyPad_CodeRejected');
    return;
}

state() AttachUserAnim
{
    event BeginState()
    {
        super(Object).BeginState();
        SetPanelDisplayMode(2);
        return;
    }
    stop;
}

state() DetachUser
{
    event BeginState()
    {
        super.BeginState();
        SetPanelDisplayMode(1);
        return;
    }
    stop;
}

state() TouchPanel
{
    event BeginState()
    {
        super(Object).BeginState();
        DoTouch();
        return;
    }

    function DoTouch()
    {
        local Vector StartTrace, EndTrace;
        local STraceHitResult TraceHitResult;

        StartTrace = User.SetDestinationActor();
        EndTrace = StartTrace + (Vector(User.ViewRotation) * User.UseDistance);
        HandleInitialMountParent(User, StartTrace, EndTrace, TraceHitResult);
        // End:0x87
        if(TraceHitResult.UV.Y < 0)
        {
            TraceHitResult.UV.Y += 1;
        }
        // End:0xD3
        if(TraceHitResult.Texture != (GetHitTexture()))
        {
            TouchedPanel(int(TraceHitResult.UV.X * float(DisplayX)), int(TraceHitResult.UV.Y * float(DisplayY)));
        }
        return;
    }

    function bool ControlEvent(optional dnGame.dnControl.EControlEvent ControlEvent, optional name CustomEventName)
    {
        global.ControlEvent(ControlEvent, CustomEventName);
        return;
    }
    stop;
}

defaultproperties
{
    PassCode=1234
    bUnlockTarget=true
    bRelocking=true
    PowerOffTexture='dt_effects.Particles.lazerflashfx2RC'
    ScreenSaverMaterial='mt_skins2.keypad.keypad2bc_screensaver'
    ScreenSaverSmacker='smk1.s_kpadsaver1'
    CanvasMaterial='mt_skins2.keypad.keypad2bc_main'
    CanvasTexture='keypads.keypad_canv'
    KeyPadTex='keypads.keypad3.bkeypmain1BC'
    LockedPadTex='keypads.keypad3.bkeyplockedBC'
    UnlockedPadTex='keypads.keypad3.bkeypunlockedBC'
    DigitsTex[0]='keypads.keypad3.bkeypnum0BC'
    DigitsTex[1]='keypads.keypad3.bkeypnum1BC'
    DigitsTex[2]='keypads.keypad3.bkeypnum2BC'
    DigitsTex[3]='keypads.keypad3.bkeypnum3BC'
    DigitsTex[4]='keypads.keypad3.bkeypnum4BC'
    DigitsTex[5]='keypads.keypad3.bkeypnum5BC'
    DigitsTex[6]='keypads.keypad3.bkeypnum6BC'
    DigitsTex[7]='keypads.keypad3.bkeypnum7BC'
    DigitsTex[8]='keypads.keypad3.bkeypnum8BC'
    DigitsTex[9]='keypads.keypad3.bkeypnum9BC'
    DigitsTex[10]='keypads.keypad3.bkeypnumstarBC'
    DigitsTex[11]='keypads.keypad3.bkeypnumpondBC'
    KeyBoxes[0]=(Top=186,Left=48,Width=32,Height=32)
    KeyBoxes[1]=(Top=72,Left=10,Width=32,Height=32)
    KeyBoxes[2]=(Top=72,Left=48,Width=32,Height=32)
    KeyBoxes[3]=(Top=72,Left=86,Width=32,Height=32)
    KeyBoxes[4]=(Top=110,Left=10,Width=32,Height=32)
    KeyBoxes[5]=(Top=110,Left=48,Width=32,Height=32)
    KeyBoxes[6]=(Top=110,Left=86,Width=32,Height=32)
    KeyBoxes[7]=(Top=148,Left=10,Width=32,Height=32)
    KeyBoxes[8]=(Top=148,Left=48,Width=32,Height=32)
    KeyBoxes[9]=(Top=148,Left=86,Width=32,Height=32)
    KeyBoxes[10]=(Top=186,Left=10,Width=32,Height=32)
    KeyBoxes[11]=(Top=186,Left=86,Width=32,Height=32)
    bLocked=true
    DisplayX=128
    UsableExits(0)=(bEnabled=true,EnterInfo=(LocationOffset=(X=0,Y=0,Z=0),RotationOffset=(Pitch=0,Yaw=0,Roll=0),Animation=None,SoundName=None),ExitInfo=(LocationOffset=(X=0,Y=0,Z=0),RotationOffset=(Pitch=0,Yaw=0,Roll=0),Animation=None,SoundName=None),ExitEndInfo=(LocationOffset=(X=-20.077,Y=0,Z=0),RotationOffset=(Pitch=0,Yaw=0,Roll=0),Animation=None,SoundName=None))
    UserMountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=32,Y=0,Z=-66),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=32768,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0)
    MouseInputScaleX=-0.00012
    MouseInputScaleY=0.00012
    AnalogInputScaleX=-0.00012
    AnalogInputScaleY=0.00012
    CollisionRadius=5
    CollisionHeight=8
    Mesh='c_generic.keypad3'
}