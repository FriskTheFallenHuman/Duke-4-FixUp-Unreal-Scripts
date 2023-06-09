/*******************************************************************************
 * UDukeMessageBox generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeMessageBox extends UWindowWindow
    dependson(UDukeKeyButton);

var bool bCreated;
var int iResult;
var string MessageText;
var string TitleText;
var UDukeKeyButton KeyButtons[2];
var float TimeoutVal;
var float TimeOutTime;
var Region FillRegion;
var Texture FillTexture;
var Texture BorderTexture;
var Texture CapTexture;
var SSoundInfo MessageBoxOpenedSoundInfo;
var SSoundInfo MessageBoxYesSoundInfo;
var SSoundInfo MessageBoxNoSoundInfo;
var int DesiredWidth;
var int DesiredHeight;
var MaterialEx Logo;
var float WindowCloseDelay;
var float CloseDelayTimer;
var bool AllowWindowClose;

function SetupMessageBox(string Title, string Message, string Affirm, string Cancel, optional int TimeOut)
{
    MessageText = Message;
    TitleText = Title;
    KeyButtons[0].SetText(Affirm);
    KeyButtons[1].SetText(Cancel);
    KeyButtons[0].ShowWindow();
    KeyButtons[1].ShowWindow();
    // End:0x87
    if(Affirm == "")
    {
        KeyButtons[0].HideWindow();
    }
    // End:0xA6
    if(Cancel == "")
    {
        KeyButtons[1].HideWindow();
    }
    TimeoutVal = float(TimeOut);
    return;
}

function Created()
{
    super.Created();
    KeyButtons[0] = UDukeKeyButton(CreateWindow(class'UDukeKeyButton'));
    KeyButtons[1] = UDukeKeyButton(CreateWindow(class'UDukeKeyButton'));
    KeyButtons[0].XBoxButtonRegion = KeyButtons[0].AButton;
    KeyButtons[0].PCButton = class'UWindowScene'.default.ENTText;
    KeyButtons[0].Register(self);
    KeyButtons[1].XBoxButtonRegion = KeyButtons[1].BButton;
    KeyButtons[1].PCButton = class'UWindowScene'.default.ESCText;
    KeyButtons[1].Register(self);
    SetAcceptsFocus();
    return;
}

function AfterCreate()
{
    super.AfterCreate();
    bCreated = true;
    return;
}

function Close(optional bool bByParent)
{
    super.Close(bByParent);
    HideWindow();
    OwnerWindow.DukeMessageBoxDone(self, iResult);
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    super.BeforePaint(C, X, Y);
    WinWidth = float(DesiredWidth) * class'UWindowScene'.default.WinScaleY;
    WinHeight = float(DesiredHeight) * class'UWindowScene'.default.WinScaleY;
    WinTop = (OwnerWindow.WinHeight - WinHeight) / 2;
    WinLeft = (OwnerWindow.WinWidth - WinWidth) / 2;
    // End:0x236
    if(KeyButtons[0].bWindowVisible && KeyButtons[1].bWindowVisible)
    {
        KeyButtons[0].WinLeft = 30 * class'UWindowScene'.default.WinScaleY;
        KeyButtons[0].WinWidth = KeyButtons[0].GetWidth(C);
        KeyButtons[0].WinHeight = 32 * class'UWindowScene'.default.WinScaleY;
        KeyButtons[0].WinTop = WinHeight - (KeyButtons[0].WinHeight + (float(18) * class'UWindowScene'.default.WinScaleY));
        KeyButtons[1].WinLeft = 340 * class'UWindowScene'.default.WinScaleY;
        KeyButtons[1].WinWidth = KeyButtons[1].GetWidth(C);
        KeyButtons[1].WinHeight = 32 * class'UWindowScene'.default.WinScaleY;
        KeyButtons[1].WinTop = WinHeight - (KeyButtons[1].WinHeight + (float(18) * class'UWindowScene'.default.WinScaleY));        
    }
    else
    {
        // End:0x310
        if(KeyButtons[0].bWindowVisible)
        {
            KeyButtons[0].WinWidth = KeyButtons[0].GetWidth(C);
            KeyButtons[0].WinHeight = 32 * class'UWindowScene'.default.WinScaleY;
            KeyButtons[0].WinLeft = (WinWidth - KeyButtons[0].WinWidth) / 2;
            KeyButtons[0].WinTop = WinHeight - (KeyButtons[0].WinHeight + (float(18) * class'UWindowScene'.default.WinScaleY));            
        }
        else
        {
            // End:0x3E7
            if(KeyButtons[1].bWindowVisible)
            {
                KeyButtons[1].WinWidth = KeyButtons[1].GetWidth(C);
                KeyButtons[1].WinHeight = 32 * class'UWindowScene'.default.WinScaleY;
                KeyButtons[1].WinLeft = (WinWidth - KeyButtons[1].WinWidth) / 2;
                KeyButtons[1].WinTop = WinHeight - (KeyButtons[1].WinHeight + (float(18) * class'UWindowScene'.default.WinScaleY));
            }
        }
    }
    return;
}

function DrawBorderCorner(Canvas C, float X, float Y, float Rotation)
{
    C.SetPause(X, Y);
    C.SetClampMode(CapTexture, float(CapTexture.DrawStatic()), float(CapTexture.DrawTile()), 0, 0, float(CapTexture.DrawStatic()), float(CapTexture.DrawTile()), Rotation);
    return;
}

function DrawBackground(Canvas C)
{
    local float BorderThickness, DoubleBorderThickness, borderwidth, BorderHeight;

    BorderThickness = 8;
    DoubleBorderThickness = BorderThickness * float(2);
    borderwidth = WinWidth - DoubleBorderThickness;
    BorderHeight = WinHeight - DoubleBorderThickness;
    C.DrawColor = GetPlayerOwner().NewColorBytes(255, 255, 255);
    DrawStretchedTextureSegment(C, BorderThickness, BorderThickness, WinWidth - (float(2) * BorderThickness), WinHeight - (float(2) * BorderThickness), float(FillRegion.X), float(FillRegion.Y), float(FillRegion.W), float(FillRegion.h), FillTexture, 0.75);
    C.Style = 1;
    C.SetPause(BorderThickness, 0);
    C.SetClampMode(BorderTexture, borderwidth, BorderThickness, 0, 0, borderwidth, BorderThickness);
    C.SetPause(BorderThickness, WinHeight - BorderThickness);
    C.SetClampMode(BorderTexture, borderwidth, BorderThickness, 0, 0, borderwidth, BorderThickness, 3.141593);
    C.SetPause(0.5 * (BorderThickness - BorderHeight), 0.5 * (WinHeight - BorderThickness));
    C.SetClampMode(BorderTexture, WinHeight - DoubleBorderThickness, BorderThickness, 0, 0, BorderHeight, BorderThickness, 3.141593 / float(2));
    C.SetPause(WinWidth - (0.5 * (BorderHeight + BorderThickness)), 0.5 * (WinHeight - BorderThickness));
    C.SetClampMode(BorderTexture, WinHeight - DoubleBorderThickness, BorderThickness, 0, 0, BorderHeight, BorderThickness, (3 * 3.141593) / float(2));
    DrawBorderCorner(C, 0, 0, 0);
    DrawBorderCorner(C, WinWidth - BorderThickness, 0, 3.141593 / float(2));
    DrawBorderCorner(C, WinWidth - BorderThickness, WinHeight - BorderThickness, 3.141593);
    DrawBorderCorner(C, 0, WinHeight - BorderThickness, (3 * 3.141593) / float(2));
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local int numLines;
    local float XL, YL, TitleScale, MessageTop, LogoTop, ContentBottom,
	    TitleWidth;

    super.Paint(C, X, Y);
    DrawBackground(C);
    C.DrawColor = class'UWindowScene'.default.GreyColor;
    C.Font = C.TallFont;
    TitleScale = class'UWindowScene'.default.TTFontScale * 1.5;
    // End:0xFD
    if(TitleText != "")
    {
        TextSize(C, TitleText, TitleWidth, YL, TitleScale, TitleScale);
        ClipText(C, (WinWidth - TitleWidth) / 2, 20 * class'UWindowScene'.default.WinScaleY, TitleText,, TitleScale, TitleScale);
        MessageTop = 80;        
    }
    else
    {
        MessageTop = 20;
    }
    TextSize(C, MessageText, XL, YL, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    // End:0x1D4
    if(XL < (WinWidth * 0.9))
    {
        ClipText(C, (WinWidth - XL) / 2, MessageTop * class'UWindowScene'.default.WinScaleY, MessageText,, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
        LogoTop = (MessageTop * class'UWindowScene'.default.WinScaleY) + YL;        
    }
    else
    {
        numLines = WrapClipText(C, 20 * class'UWindowScene'.default.WinScaleY, MessageTop * class'UWindowScene'.default.WinScaleY, MessageText, false, int(WinWidth - (float(40) * class'UWindowScene'.default.WinScaleY)),, true, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
        LogoTop = (MessageTop * class'UWindowScene'.default.WinScaleY) + (YL * float(numLines));
    }
    // End:0x323
    if(Logo == none)
    {
        XL = float(Logo.DrawStatic()) * class'UWindowScene'.default.WinScaleY;
        YL = float(Logo.DrawTile()) * class'UWindowScene'.default.WinScaleY;
        DrawStretchedTexture(C, (WinWidth - XL) / 2, LogoTop, XL, YL, Logo, 1,,, false);
        ContentBottom = LogoTop + YL;        
    }
    else
    {
        ContentBottom = LogoTop;
    }
    // End:0x420
    if(TimeoutVal != float(0))
    {
        TextSize(C, string(int((TimeOutTime - GetLevel().TimeSeconds) / GetLevel().GameSpeedModifier)), XL, YL, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
        ClipText(C, (WinWidth / float(2)) - (XL / float(2)), (120 + MessageTop) * class'UWindowScene'.default.WinScaleY, string(int((TimeOutTime - GetLevel().TimeSeconds) / GetLevel().GameSpeedModifier)),, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    }
    // End:0x467
    if(KeyButtons[0].bWindowVisible || KeyButtons[1].bWindowVisible)
    {
        ContentBottom += (float(50) * class'UWindowScene'.default.WinScaleY);
    }
    ContentBottom += float(8);
    // End:0x4A4
    if(ContentBottom > (WinHeight * 1.05))
    {
        DesiredHeight = int(ContentBottom / class'UWindowScene'.default.WinScaleY);
    }
    // End:0x505
    if((TitleWidth + (float(40) * class'UWindowScene'.default.WinScaleY)) > (WinWidth * 1.05))
    {
        DesiredWidth = int(float(int(TitleWidth + (float(40) * class'UWindowScene'.default.WinScaleY))) / class'UWindowScene'.default.WinScaleY);
    }
    return;
}

function Tick(float Delta)
{
    // End:0x35
    if((TimeOutTime != float(0)) && TimeOutTime < GetLevel().TimeSeconds)
    {
        iResult = 0;
        Close();
    }
    // End:0x5E
    if(WindowIsVisible())
    {
        CloseDelayTimer -= Delta;
        // End:0x5E
        if(CloseDelayTimer <= float(0))
        {
            AllowWindowClose = true;
        }
    }
    super.Tick(Delta);
    return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
    super.NotifyFromControl(C, E);
    // End:0x50
    if(int(E) == 2)
    {
        // End:0x38
        if(C != KeyButtons[0])
        {
            PushedYes();            
        }
        else
        {
            // End:0x50
            if(C != KeyButtons[1])
            {
                PushedNo();
            }
        }
    }
    return;
}

function WindowEvent(UWindow.UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
    // End:0xEC
    if(int(msg) == int(7))
    {
        // End:0x7D
        if(((Key == int(Root.Console.27)) || Key == int(Root.Console.205)) || Key == int(Root.Console.211))
        {
            PushedNo();
            return;
        }
        // End:0xEC
        if(((Key == int(Root.Console.13)) || Key == int(Root.Console.210)) || Key == int(Root.Console.204))
        {
            PushedYes();
            return;
        }
    }
    super.WindowEvent(msg, C, X, Y, Key);
    return;
}

function PushedYes()
{
    // End:0x0D
    if(! AllowWindowClose)
    {
        return;
    }
    // End:0x26
    if(! KeyButtons[0].bWindowVisible)
    {
        return;
    }
    iResult = 1;
    Close();
    GetPlayerOwner().PlaySoundInfo(0, MessageBoxYesSoundInfo);
    return;
}

function PushedNo()
{
    // End:0x0D
    if(! AllowWindowClose)
    {
        return;
    }
    // End:0x26
    if(! KeyButtons[1].bWindowVisible)
    {
        return;
    }
    iResult = 0;
    Close();
    GetPlayerOwner().PlaySoundInfo(0, MessageBoxNoSoundInfo);
    return;
}

function ShowWindow()
{
    super.ShowWindow();
    // End:0x75
    if(bCreated)
    {
        // End:0x4A
        if(TimeoutVal != float(0))
        {
            TimeOutTime = (TimeoutVal * GetLevel().GameSpeedModifier) + GetLevel().TimeSeconds;
        }
        AllowWindowClose = false;
        CloseDelayTimer = WindowCloseDelay;
        GetPlayerOwner().PlaySoundInfo(0, MessageBoxOpenedSoundInfo);
    }
    return;
}

defaultproperties
{
    FillRegion=(X=360,Y=88,W=2,h=2)
    FillTexture='Menu.Menu.Backdrop'
    BorderTexture='Menu.Menu.Border_Straight'
    CapTexture='Menu.Menu.Border_Cap'
    MessageBoxOpenedSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_menu.Menu.Menu_Appear_ST'),SlotPriority=0,VolumePrefab=0,Slots=(1),Volume=0.5,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
    MessageBoxYesSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_menu.Menu.Menu_QuitYes_01_ST'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=0.5,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
    MessageBoxNoSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_menu.Menu.Menu_Disappear_ST'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=0.5,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
    DesiredWidth=435
    DesiredHeight=250
    AllowWindowClose=true
}