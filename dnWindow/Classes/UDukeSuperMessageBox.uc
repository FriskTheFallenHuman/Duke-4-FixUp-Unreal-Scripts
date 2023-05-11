/*******************************************************************************
 * UDukeSuperMessageBox generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSuperMessageBox extends UWindowWindow;

enum EButtonNum
{
    BN_None,
    BN_One,
    BN_CancelOne,
    BN_Two
};

var bool bCreated;
var int iResult;
var string MessageText;
var string TitleText;
var string PulseText;
var UDukeKeyButton KeyButtons[2];
var int TimeoutVal;
var int TimeOutTime;
var Region FillRegion;
var Texture FillTexture;
var Texture BorderTexture;
var Texture CapTexture;
var SSoundInfo MessageBoxOpenedSoundInfo;
var SSoundInfo MessageBoxYesSoundInfo;
var SSoundInfo MessageBoxNoSoundInfo;
var DukeDialogBoxManager Mgr;
var MaterialEx WaitingSpinner;
var bool bShowSpinner;
var bool bShowBackground;
var float SpinnerSize;
var float SpacingBuffer;
var float EdgeBuffer;
var float ButtonHeight;
var float ButtonWidth;
var float DialogDefaultWidthPct;
var MaterialEx CustomDialogImage;
var Engine.Object.EConsole_Dialog DialogType;
var float CustomOverlayAlpha;
var Texture CustomOverlayTexture;
var bool bPlayOpenedSound;
var float TitleTextScale;
var float BodyTextScale;
var bool bIsConsoleErrorMsg;
var int iDrawPriority;
var float BorderThickness;
var UDukeSuperMessageBox.EButtonNum NumOfButtons;

function SetupMessageBox(string Title, optional string Message, optional string Affirm, optional string Cancel, optional int TimeOut)
{
    TitleText = Title;
    MessageText = Message;
    KeyButtons[0].SetText(Affirm);
    KeyButtons[1].SetText(Cancel);
    KeyButtons[0].ShowWindow();
    KeyButtons[1].ShowWindow();
    NumOfButtons = 0;
    KeyButtons[0].HideWindow();
    KeyButtons[1].HideWindow();
    // End:0xBB
    if((Affirm != "") && Cancel == "")
    {
        NumOfButtons = 1;        
    }
    else
    {
        // End:0xE2
        if((Affirm == "") && Cancel != "")
        {
            NumOfButtons = 2;            
        }
        else
        {
            // End:0x109
            if((Affirm != "") && Cancel != "")
            {
                NumOfButtons = 3;                
            }
            else
            {
                NumOfButtons = 0;
            }
        }
    }
    TimeoutVal = TimeOut;
    PulseText = default.PulseText;
    bShowSpinner = default.bShowSpinner;
    bShowBackground = default.bShowBackground;
    iResult = default.iResult;
    return;
}

function Created()
{
    super.Created();
    KeyButtons[0] = UDukeKeyButton(CreateWindow(class'UDukeKeyButton', 1, 1, 1, 1));
    KeyButtons[1] = UDukeKeyButton(CreateWindow(class'UDukeKeyButton', 1, 1, 1, 1));
    KeyButtons[0].XBoxButtonRegion = KeyButtons[0].AButton;
    KeyButtons[0].PCButton = class'UWindowScene'.default.ENTText;
    KeyButtons[0].Register(self);
    KeyButtons[1].XBoxButtonRegion = KeyButtons[1].BButton;
    KeyButtons[1].PCButton = class'UWindowScene'.default.ESCText;
    KeyButtons[1].Register(self);
    SetAcceptsFocus();
    BorderThickness = 8;
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
    local LevelInfo Level;

    Level = GetLevel();
    // End:0x99
    if(((bIsConsoleErrorMsg && Level == none) && Level.bPaused) && Level.Pauser == "__UDukeSuperMessageBox")
    {
        Level.TickHint().SetPause(false, "__UDukeSuperMessageBox", true);
    }
    Mgr.DukeMessageBoxDone(self, iResult);
    Mgr.CloseDialog(self);
    HideWindow();
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    local float dx, dy, dw, dh;

    super.BeforePaint(C, X, Y);
    GetDialogDimensions(C, dx, dy, dw, dh);
    WinLeft = dx;
    WinTop = dy;
    WinWidth = dw;
    WinHeight = dh;
    AdjustButtons(C);
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
    local float DoubleBorderThickness, borderwidth, BorderHeight;

    DoubleBorderThickness = BorderThickness * float(2);
    borderwidth = WinWidth - DoubleBorderThickness;
    BorderHeight = WinHeight - DoubleBorderThickness;
    C.DrawColor = GetPlayerOwner().NewColorBytes(255, 255, 255);
    DrawStretchedTextureSegment(C, BorderThickness, BorderThickness, WinWidth - DoubleBorderThickness, WinHeight - DoubleBorderThickness, float(FillRegion.X), float(FillRegion.Y), float(FillRegion.W), float(FillRegion.h), FillTexture, 0.75);
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
    local float SpinnerX, XL, YL, YPadding, Scale, OrigX,
	    OrigY;

    local LevelInfo Level;

    Level = GetLevel();
    // End:0x6C
    if((bIsConsoleErrorMsg && Level == none) && ! Level.bPaused)
    {
        Level.TickHint().SetPause(true, "__UDukeSuperMessageBox", true);
    }
    // End:0x15C
    if(int(DialogType) == int(2))
    {
        C.SetPause(0, 0);
        OrigX = C.OrgX;
        OrigY = C.OrgY;
        C.GetFrameCount(0, 0);
        C.Style = 5;
        C.SetClampMode(CustomOverlayTexture, float(C.SizeX), float(C.SizeY), 0, 0, float(CustomOverlayTexture.DrawStatic()), float(CustomOverlayTexture.DrawTile()),,,,, CustomOverlayAlpha);
        C.GetFrameCount(OrigX, OrigY);
    }
    ClippingRegion.X = 0;
    ClippingRegion.Y = 0;
    ClippingRegion.W = int(WinWidth);
    ClippingRegion.h = int(WinHeight);
    // End:0x1AA
    if(bShowBackground)
    {
        DrawBackground(C);
    }
    C.DrawColor = class'UWindowScene'.default.GreyColor;
    YPadding = EdgeBuffer;
    C.Font = C.BlockFont;
    TextSize(C, TitleText, XL, YL, TitleTextScale * class'UWindowScene'.default.TTFontScale, TitleTextScale * class'UWindowScene'.default.TTFontScale);
    ClipText(C, (WinWidth - XL) / 2, YPadding, TitleText,, TitleTextScale * class'UWindowScene'.default.TTFontScale, TitleTextScale * class'UWindowScene'.default.TTFontScale);
    YPadding += (YL + SpacingBuffer);
    // End:0x38E
    if(CustomDialogImage == none)
    {
        DrawStretchedTexture(C, 0 + EdgeBuffer, YPadding, float(CustomDialogImage.DrawStatic()), float(CustomDialogImage.DrawTile()), CustomDialogImage, 1);
        C.Font = C.BlockFontSmall;
        WrapClipText(C, ((0 + EdgeBuffer) + float(CustomDialogImage.DrawStatic())) + SpacingBuffer, YPadding, MessageText,, int(float(CustomDialogImage.DrawStatic()) * 1.5),, true, class'UWindowScene'.default.TTFontScale * BodyTextScale, class'UWindowScene'.default.TTFontScale * BodyTextScale);        
    }
    else
    {
        // End:0x4E9
        if(bShowSpinner)
        {
            SpinnerX = (WinWidth - SpinnerSize) / 2;
            DrawStretchedTexture(C, SpinnerX, YPadding, SpinnerSize, SpinnerSize, WaitingSpinner, 1,,, false);
            // End:0x4E6
            if(PulseText != "")
            {
                C.Font = C.TallFont;
                C.DrawColor = class'UWindowScene'.default.OrangeColor;
                Scale = 1.5 * class'UWindowScene'.default.TTFontScale;
                TextSize(C, PulseText, XL, YL, Scale, Scale);
                ClipText(C, SpinnerX + float(int(0.5 * (SpinnerSize - XL))), YPadding + float(int(0.5 * (SpinnerSize - YL))), PulseText,, Scale, Scale, 0.5 * (1 + Cos(6 * GetLevel().TimeSeconds)), 2);
            }            
        }
        else
        {
            C.Font = C.BlockFontSmall;
            TextSize(C, MessageText, XL, YL, class'UWindowScene'.default.TTFontScale * BodyTextScale, class'UWindowScene'.default.TTFontScale * BodyTextScale);
            // End:0x5CD
            if(XL < ((WinWidth - (EdgeBuffer * float(2))) - (BorderThickness * float(2))))
            {
                ClipText(C, (WinWidth - XL) / 2, YPadding, MessageText,, class'UWindowScene'.default.TTFontScale * BodyTextScale, class'UWindowScene'.default.TTFontScale * BodyTextScale);                
            }
            else
            {
                WrapClipText(C, EdgeBuffer, YPadding, MessageText, false, int((WinWidth - EdgeBuffer) - (BorderThickness * float(2))),, true, class'UWindowScene'.default.TTFontScale * BodyTextScale, class'UWindowScene'.default.TTFontScale * BodyTextScale);
            }
        }
    }
    return;
}

function Tick(float Delta)
{
    // End:0x2E
    if((TimeOutTime != 0) && float(TimeOutTime) < GetLevel().TimeSeconds)
    {
        Close();
    }
    super.Tick(Delta);
    return;
}

function PushedYes()
{
    Localize(string(self) @ "::PushedYes");
    // End:0x2E
    if(! KeyButtons[0].bWindowVisible)
    {
        return;
    }
    iResult = 1;
    Close();
    GetPlayerOwner().Level.PlaySoundInfo(0, MessageBoxYesSoundInfo);
    return;
}

function PushedNo()
{
    Localize(string(self) @ "::PushedNo");
    // End:0x2D
    if(! KeyButtons[1].bWindowVisible)
    {
        return;
    }
    iResult = 0;
    Close();
    GetPlayerOwner().Level.PlaySoundInfo(0, MessageBoxNoSoundInfo);
    return;
}

function ShowWindow()
{
    local bool bWasVisible;

    bWasVisible = bWindowVisible;
    WindowShown();
    bWindowVisible = true;
    // End:0xCA
    if(bCreated)
    {
        // End:0x4E
        if(TimeoutVal != 0)
        {
            TimeOutTime = int(float(TimeoutVal) + GetLevel().TimeSeconds);
        }
        // End:0xCA
        if((bPlayOpenedSound && ! bWasVisible) && bWindowVisible)
        {
            Localize(string(self) $ ":ShowWindow - Playing MessageBoxOpenedSoundInfo");
            GetPlayerOwner().Level.PlaySoundInfo(0, MessageBoxOpenedSoundInfo);
        }
    }
    return;
}

function HideWindow()
{
    WindowHidden();
    bWindowVisible = false;
    return;
}

function MouseMove(float X, float Y)
{
    super.MouseMove(X, Y);
    return;
}

function AdjustButtons(Canvas C)
{
    local float Top, Width, Height, ScaleX, ScaleY;

    ScaleX = class'UWindowScene'.default.WinScaleX;
    ScaleY = class'UWindowScene'.default.WinScaleY;
    Top = (WinHeight - EdgeBuffer) - (ButtonHeight * ScaleY);
    switch(NumOfButtons)
    {
        // End:0x7E
        case 0:
            KeyButtons[0].HideWindow();
            KeyButtons[1].HideWindow();
            // End:0x34B
            break;
        // End:0x138
        case 1:
            ButtonWidth = KeyButtons[0].GetWidth(C);
            KeyButtons[0].WinLeft = (WinWidth - ButtonWidth) / 2;
            KeyButtons[0].WinTop = Top;
            KeyButtons[0].WinWidth = ButtonWidth;
            KeyButtons[0].WinHeight = ButtonHeight * ScaleY;
            KeyButtons[0].ShowWindow();
            KeyButtons[1].HideWindow();
            // End:0x34B
            break;
        // End:0x1F2
        case 2:
            ButtonWidth = KeyButtons[1].GetWidth(C);
            KeyButtons[1].WinLeft = (WinWidth - ButtonWidth) / 2;
            KeyButtons[1].WinTop = Top;
            KeyButtons[1].WinWidth = ButtonWidth;
            KeyButtons[1].WinHeight = ButtonHeight * ScaleY;
            KeyButtons[1].ShowWindow();
            KeyButtons[0].HideWindow();
            // End:0x34B
            break;
        // End:0x348
        case 3:
            ButtonWidth = KeyButtons[0].GetWidth(C);
            KeyButtons[0].WinLeft = (WinWidth * 0.3) - (ButtonWidth / 2);
            KeyButtons[0].WinTop = Top;
            KeyButtons[0].WinWidth = ButtonWidth;
            KeyButtons[0].WinHeight = ButtonHeight * ScaleY;
            KeyButtons[0].ShowWindow();
            ButtonWidth = KeyButtons[1].GetWidth(C);
            KeyButtons[1].WinLeft = (WinWidth * 0.75) - (ButtonWidth / 2);
            KeyButtons[1].WinTop = Top;
            KeyButtons[1].WinWidth = ButtonWidth;
            KeyButtons[1].WinHeight = ButtonHeight * ScaleY;
            KeyButtons[1].ShowWindow();
            // End:0x34B
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

function GetDialogDimensions(Canvas C, out float X, out float Y, out float W, out float h)
{
    local float XL, YL, BXL, BYL, frameWidth, frameHeight,
	    tmpWidth;

    local int Lines;

    frameWidth = 0;
    frameHeight = 0;
    // End:0x298
    if(CustomDialogImage == none)
    {
        C.Font = C.BlockFont;
        TextSize(C, TitleText, XL, YL, TitleTextScale * class'UWindowScene'.default.TTFontScale, TitleTextScale * class'UWindowScene'.default.TTFontScale);
        frameWidth = (((EdgeBuffer + float(CustomDialogImage.DrawStatic())) + SpacingBuffer) + (float(CustomDialogImage.DrawStatic()) * 1.5)) + EdgeBuffer;
        // End:0xFD
        if(((EdgeBuffer + XL) + EdgeBuffer) > frameWidth)
        {
            frameWidth = (EdgeBuffer + XL) + EdgeBuffer;
        }
        C.Font = C.BlockFontSmall;
        TextSize(C, MessageText, BXL, BYL, class'UWindowScene'.default.TTFontScale * BodyTextScale, class'UWindowScene'.default.TTFontScale * BodyTextScale);
        Lines = WrapClipText(C, ((0 + EdgeBuffer) + float(CustomDialogImage.DrawStatic())) + SpacingBuffer, frameHeight, MessageText,, int(float(CustomDialogImage.DrawStatic()) * 1.5), true, true, class'UWindowScene'.default.TTFontScale * BodyTextScale, class'UWindowScene'.default.TTFontScale * BodyTextScale);
        frameHeight = (EdgeBuffer + YL) + SpacingBuffer;
        // End:0x249
        if((frameHeight + float(CustomDialogImage.DrawTile())) < (frameHeight + (BYL * float(Lines + 1))))
        {
            frameHeight += (BYL * float(Lines + 1));            
        }
        else
        {
            frameHeight += float(CustomDialogImage.DrawTile());
        }
        // End:0x27B
        if(int(NumOfButtons) == int(0))
        {
            frameHeight += EdgeBuffer;            
        }
        else
        {
            frameHeight += ((SpacingBuffer + ButtonHeight) + EdgeBuffer);
        }        
    }
    else
    {
        // End:0x4F2
        if(MessageText == "")
        {
            C.Font = C.BlockFont;
            TextSize(C, TitleText, XL, YL, TitleTextScale * class'UWindowScene'.default.TTFontScale, TitleTextScale * class'UWindowScene'.default.TTFontScale);
            frameWidth = (EdgeBuffer + XL) + EdgeBuffer;
            // End:0x448
            if(bShowSpinner)
            {
                // End:0x35E
                if(frameWidth < (SpinnerSize + (EdgeBuffer * float(2))))
                {
                    frameWidth = SpinnerSize + (EdgeBuffer * float(2));
                }
                frameHeight = ((EdgeBuffer + YL) + SpacingBuffer) + SpinnerSize;
                // End:0x40E
                if(PulseText != "")
                {
                    C.Font = C.TallFont;
                    TextSize(C, PulseText, XL, YL, 1.5 * class'UWindowScene'.default.TTFontScale, 1.5 * class'UWindowScene'.default.TTFontScale);
                    frameWidth = FMax(XL + (EdgeBuffer * float(2)), frameWidth);
                }
                // End:0x42B
                if(int(NumOfButtons) == int(0))
                {
                    frameHeight += EdgeBuffer;                    
                }
                else
                {
                    frameHeight += ((SpacingBuffer + ButtonHeight) + EdgeBuffer);
                }                
            }
            else
            {
                frameHeight = EdgeBuffer + YL;
                // End:0x477
                if(int(NumOfButtons) == int(0))
                {
                    frameHeight += EdgeBuffer;                    
                }
                else
                {
                    frameHeight += ((SpacingBuffer + ButtonHeight) + EdgeBuffer);
                }
            }
            X = (float(C.SizeX) - frameWidth) / 2;
            Y = (float(C.SizeY) - frameHeight) / 2;
            W = frameWidth;
            h = frameHeight;            
        }
        else
        {
            // End:0x74B
            if(MessageText != "")
            {
                C.Font = C.BlockFont;
                TextSize(C, TitleText, XL, YL, TitleTextScale * class'UWindowScene'.default.TTFontScale, TitleTextScale * class'UWindowScene'.default.TTFontScale);
                frameHeight = (EdgeBuffer + YL) + SpacingBuffer;
                frameWidth = (EdgeBuffer + XL) + EdgeBuffer;
                tmpWidth = frameWidth;
                C.Font = C.BlockFontSmall;
                TextSize(C, MessageText, BXL, BYL, class'UWindowScene'.default.TTFontScale * BodyTextScale, class'UWindowScene'.default.TTFontScale * BodyTextScale);
                // End:0x66B
                if(((EdgeBuffer + BXL) + EdgeBuffer) < frameWidth)
                {
                    // End:0x647
                    if(int(NumOfButtons) == int(0))
                    {
                        frameHeight += (BYL + EdgeBuffer);                        
                    }
                    else
                    {
                        frameHeight += (((BYL + SpacingBuffer) + ButtonHeight) + EdgeBuffer);
                    }                    
                }
                else
                {
                    frameWidth = float(Max(int(float(C.SizeX) * DialogDefaultWidthPct), int(frameWidth)));
                    Lines = WrapClipText(C, EdgeBuffer, frameHeight, MessageText, false, int((frameWidth - EdgeBuffer) - (BorderThickness * float(2))), true, true, class'UWindowScene'.default.TTFontScale * BodyTextScale, class'UWindowScene'.default.TTFontScale * BodyTextScale);
                    frameHeight += (BYL * float(Lines + 1));
                    // End:0x72E
                    if(int(NumOfButtons) == int(0))
                    {
                        frameHeight += EdgeBuffer;                        
                    }
                    else
                    {
                        frameHeight += ((SpacingBuffer + ButtonHeight) + EdgeBuffer);
                    }
                }                
            }
            else
            {
                Localize(string(self) @ "::GetDialogDimensions::We should never hit this -- So log spam if we do");
                frameWidth = (float(C.SizeX) * 0.65) - (float(C.SizeX) * 0.35);
                frameHeight = (float(C.SizeY) * 0.7) - (float(C.SizeY) * 0.3);
            }
        }
    }
    X = (float(C.SizeX) - frameWidth) / 2;
    Y = (float(C.SizeY) - frameHeight) / 2;
    W = frameWidth;
    h = frameHeight;
    return;
}

function UWindowWindow FindWindowUnder(float X, float Y)
{
    local UWindowWindow Child, ChildChild;
    local bool bModal;

    Child = LastChildWindow;
    // End:0x4C
    if((Child == none) && Child.ModalWindow == none)
    {
        Child = Child.ModalWindow;
        bModal = true;
    }
    GlobalToWindow(X, Y, X, Y);
    J0x66:

    // End:0x203 [Loop If]
    if(Child == none)
    {
        Child.bUWindowActive = bUWindowActive;
        // End:0xA4
        if(bLeaveOnscreen)
        {
            Child.bLeaveOnscreen = true;
        }
        // End:0x1EB
        if(bUWindowActive || Child.bLeaveOnscreen)
        {
            // End:0x1DC
            if(((((X >= Child.WinLeft) && X <= (Child.WinLeft + Child.WinWidth)) && Y >= Child.WinTop) && Y <= (Child.WinTop + Child.WinHeight)) && ! Child.CheckMousePassThrough(X - Child.WinLeft, Y - Child.WinTop))
            {
                ChildChild = Child.FindWindowUnder(X - Child.WinLeft, Y - Child.WinTop);
                return ChildChild;                
            }
            else
            {
                // End:0x1EB
                if(bModal)
                {
                    return Child;
                }
            }
        }
        Child = Child.PrevSiblingWindow;
        // [Loop Continue]
        goto J0x66;
    }
    return self;
    return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
    super.NotifyFromControl(C, E);
    // End:0x53
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
    else
    {
        // End:0x97
        if(C.ClassForName('UDukeKeyButton'))
        {
            // End:0x83
            if(int(E) == 12)
            {
                ChildInFocus = C;                
            }
            else
            {
                // End:0x97
                if(int(E) == 9)
                {
                    ChildInFocus = none;
                }
            }
        }
    }
    return;
}

function WindowEvent(UWindow.UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
    // End:0x109
    if(int(msg) == int(7))
    {
        // End:0x8A
        if(((Key == int(Root.Console.27)) || (Key == int(Root.Console.205)) && ! bIsConsoleErrorMsg) || Key == int(Root.Console.211))
        {
            PushedNo();
            return;
        }
        // End:0x106
        if(((Key == int(Root.Console.13)) || Key == int(Root.Console.210)) || (Key == int(Root.Console.204)) && ! bIsConsoleErrorMsg)
        {
            PushedYes();
            return;
        }        
    }
    else
    {
        // End:0x136
        if(int(msg) == int(6))
        {
            // End:0x136
            if(Key == int(1))
            {
                LMouseUp(X, Y);
                return;
            }
        }
    }
    super.WindowEvent(msg, C, X, Y, Key);
    return;
}

function bool MessageClients(UWindow.UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
    local UWindowWindow Child;

    Localize(((string(self) @ "::MessageClients(") @ string(DynamicLoadObject(class'WinMessage', int(msg)))) @ ")");
    Child = LastChildWindow;
    J0x3E:

    // End:0x1CE [Loop If]
    if(Child == none)
    {
        Child.bUWindowActive = bUWindowActive;
        // End:0x7C
        if(bLeaveOnscreen)
        {
            Child.bLeaveOnscreen = true;
        }
        // End:0x1B6
        if(bUWindowActive || Child.bLeaveOnscreen)
        {
            // End:0x1B6
            if(((((X >= Child.WinLeft) && X <= (Child.WinLeft + Child.WinWidth)) && Y >= Child.WinTop) && Y <= (Child.WinTop + Child.WinHeight)) && ! Child.CheckMousePassThrough(X - Child.WinLeft, Y - Child.WinTop))
            {
                Child.WindowEvent(msg, C, X - Child.WinLeft, Y - Child.WinTop, Key);
                return true;
            }
        }
        Child = Child.PrevSiblingWindow;
        // [Loop Continue]
        goto J0x3E;
    }
    return false;
    return;
}

function LMouseUp(float X, float Y)
{
    Click(X, Y);
    return;
}

function Click(float X, float Y)
{
    // End:0x26
    if(ChildInFocus == none)
    {
        ChildInFocus.Click(X, Y);
    }
    return;
}

defaultproperties
{
    iResult=-1
    FillRegion=(X=360,Y=88,W=2,h=2)
    FillTexture='Menu.Menu.Backdrop'
    BorderTexture='Menu.Menu.Border_Straight'
    CapTexture='Menu.Menu.Border_Cap'
    MessageBoxOpenedSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_menu.Menu.Menu_Appear_ST'),SlotPriority=0,VolumePrefab=0,Slots=(1),Volume=0.5,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
    MessageBoxYesSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_menu.Menu.Menu_QuitYes_01_ST'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=0.5,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
    MessageBoxNoSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_menu.Menu.Menu_Disappear_ST'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=0.5,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
    WaitingSpinner='smk1.Logo.spinning_nuke_fb'
    bShowBackground=true
    SpinnerSize=128
    SpacingBuffer=15
    EdgeBuffer=15
    ButtonHeight=32
    ButtonWidth=105
    DialogDefaultWidthPct=0.3
    CustomOverlayAlpha=0.8
    CustomOverlayTexture='Engine.BlackTexture'
    bPlayOpenedSound=true
    TitleTextScale=0.7
    BodyTextScale=0.8
    iDrawPriority=999
    BorderThickness=8
    bIgnoreLDoubleClick=true
}