/*******************************************************************************
 * UWindowMessageBoxCW generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowMessageBoxCW extends UWindowDialogClientWindow;

var UWindowBase.MessageBoxButtons Buttons;
var UWindowBase.MessageBoxResult EnterResult;
var UWindowSmallButton YesButton;
var UWindowSmallButton NoButton;
var UWindowSmallButton OKButton;
var UWindowSmallButton CancelButton;
var localized string YesText;
var localized string NoText;
var localized string OKText;
var localized string CancelText;
var UWindowMessageBoxArea MessageArea;
var UWindowEditControl EditArea;

function Created()
{
    super(UWindowWindow).Created();
    SetAcceptsFocus();
    MessageArea = UWindowMessageBoxArea(CreateWindow(class'UWindowMessageBoxArea', 10, 10, WinWidth - float(20), WinHeight - float(44)));
    return;
}

function KeyDown(int Key, float X, float Y)
{
    local UWindowMessageBox P;

    P = UWindowMessageBox(ParentWindow);
    // End:0x6D
    if((Key == int(GetPlayerOwner().13)) && int(EnterResult) != int(0))
    {
        P = UWindowMessageBox(ParentWindow);
        P.Result = EnterResult;
        P.Close();
    }
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    super(UWindowWindow).BeforePaint(C, X, Y);
    switch(Buttons)
    {
        // End:0x1AF
        case 3:
            YesButton.AutoSize(C);
            NoButton.AutoSize(C);
            CancelButton.AutoSize(C);
            MessageArea.SetSize(WinWidth - float(10), (WinHeight - YesButton.WinHeight) - float(10));
            CancelButton.WinLeft = (WinWidth - float(20)) - CancelButton.WinWidth;
            CancelButton.WinTop = (WinHeight - CancelButton.WinHeight) - float(10);
            NoButton.WinLeft = (CancelButton.WinLeft - float(5)) - NoButton.WinWidth;
            NoButton.WinTop = (WinHeight - NoButton.WinHeight) - float(10);
            YesButton.WinLeft = (NoButton.WinLeft - float(5)) - YesButton.WinWidth;
            YesButton.WinTop = (WinHeight - YesButton.WinHeight) - float(10);
            // End:0x55F
            break;
        // End:0x2CC
        case 0:
            YesButton.AutoSize(C);
            NoButton.AutoSize(C);
            MessageArea.SetSize(WinWidth - float(10), (WinHeight - YesButton.WinHeight) - float(10));
            NoButton.WinLeft = (WinWidth - float(20)) - NoButton.WinWidth;
            NoButton.WinTop = (WinHeight - NoButton.WinHeight) - float(10);
            YesButton.WinLeft = (NoButton.WinLeft - float(5)) - YesButton.WinWidth;
            YesButton.WinTop = (WinHeight - YesButton.WinHeight) - float(10);
            // End:0x55F
            break;
        // End:0x2D1
        case 1:
        // End:0x4B4
        case 4:
            OKButton.AutoSize(C);
            CancelButton.AutoSize(C);
            CancelButton.WinLeft = (WinWidth - float(20)) - CancelButton.WinWidth;
            CancelButton.WinTop = (WinHeight - CancelButton.WinHeight) - float(10);
            OKButton.WinLeft = (CancelButton.WinLeft - float(5)) - OKButton.WinWidth;
            OKButton.WinTop = (WinHeight - OKButton.WinHeight) - float(10);
            // End:0x47C
            if(int(Buttons) == int(4))
            {
                EditArea.WinLeft = 10;
                EditArea.WinTop = OKButton.WinTop - EditArea.WinHeight;
                MessageArea.SetSize(WinWidth - float(10), ((WinHeight - EditArea.WinHeight) - OKButton.WinHeight) - float(10));
                MessageArea.WinLeft = 10;
                MessageArea.WinTop = 0;                
            }
            else
            {
                MessageArea.SetSize(WinWidth - float(10), (WinHeight - OKButton.WinHeight) - float(10));
            }
            // End:0x55F
            break;
        // End:0x55C
        case 2:
            OKButton.AutoSize(C);
            MessageArea.SetSize(WinWidth - float(10), (WinHeight - OKButton.WinHeight) - float(10));
            OKButton.WinLeft = (WinWidth - float(20)) - OKButton.WinWidth;
            OKButton.WinTop = (WinHeight - OKButton.WinHeight) - float(10);
            // End:0x55F
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

function Resized()
{
    super(UWindowWindow).Resized();
    // End:0x36
    if(MessageArea == none)
    {
        MessageArea.SetSize(WinWidth - float(20), WinHeight - float(44));
    }
    // End:0x61
    if(EditArea == none)
    {
        EditArea.SetSize(WinWidth - float(20), 1);
    }
    return;
}

function float GetHeight(Canvas C)
{
    switch(Buttons)
    {
        // End:0x0D
        case 3:
        // End:0x41
        case 0:
            return (MessageArea.GetHeight(C) + YesButton.WinHeight) + float(10);
            // End:0xBF
            break;
        // End:0x46
        case 1:
        // End:0x7A
        case 2:
            return (MessageArea.GetHeight(C) + OKButton.WinHeight) + float(10);
            // End:0xBF
            break;
        // End:0xBC
        case 4:
            return ((MessageArea.GetHeight(C) + EditArea.WinHeight) + OKButton.WinHeight) + float(30);
        // End:0xFFFF
        default:
            break;
    }
    return 0;
    return;
}

function SetupMessageBoxClient(string InMessage, UWindowBase.MessageBoxButtons InButtons, UWindowBase.MessageBoxResult InEnterResult)
{
    MessageArea.Message = InMessage;
    Buttons = InButtons;
    EnterResult = InEnterResult;
    switch(Buttons)
    {
        // End:0x1AF
        case 3:
            CancelButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', WinWidth - float(52), WinHeight - float(20), 48, 48));
            CancelButton.SetText(CancelText);
            // End:0xA3
            if(int(EnterResult) == int(4))
            {
                CancelButton.SetFont(1);                
            }
            else
            {
                CancelButton.SetFont(0);
            }
            NoButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', WinWidth - float(104), WinHeight - float(20), 48, 48));
            NoButton.SetText(NoText);
            // End:0x11F
            if(int(EnterResult) == int(2))
            {
                NoButton.SetFont(1);                
            }
            else
            {
                NoButton.SetFont(0);
            }
            YesButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', WinWidth - float(156), WinHeight - float(20), 48, 48));
            YesButton.SetText(YesText);
            // End:0x19B
            if(int(EnterResult) == int(1))
            {
                YesButton.SetFont(1);                
            }
            else
            {
                YesButton.SetFont(0);
            }
            // End:0x57C
            break;
        // End:0x30E
        case 0:
            NoButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', WinWidth - float(52), WinHeight - float(20), 48, 48));
            NoButton.SetText(NoText);
            // End:0x21F
            if(int(EnterResult) == int(2))
            {
                NoButton.SetFont(1);                
            }
            else
            {
                NoButton.SetFont(0);
            }
            YesButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', WinWidth - float(104), WinHeight - float(20), 48, 48));
            YesButton.SetText(YesText);
            // End:0x29B
            if(int(EnterResult) == int(1))
            {
                YesButton.SetFont(1);                
            }
            else
            {
                YesButton.SetFont(0);
            }
            YesButton.NavLeft = NoButton;
            YesButton.NavRight = NoButton;
            NoButton.NavLeft = YesButton;
            NoButton.NavRight = YesButton;
            ChildInFocus = NoButton;
            // End:0x57C
            break;
        // End:0x313
        case 1:
        // End:0x4F5
        case 4:
            CancelButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', WinWidth - float(52), WinHeight - float(20), 48, 48));
            CancelButton.SetText(CancelText);
            // End:0x383
            if(int(EnterResult) == int(4))
            {
                CancelButton.SetFont(1);                
            }
            else
            {
                CancelButton.SetFont(0);
            }
            OKButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', WinWidth - float(104), WinHeight - float(20), 48, 48));
            OKButton.SetText(OKText);
            // End:0x3FF
            if(int(EnterResult) == int(3))
            {
                OKButton.SetFont(1);                
            }
            else
            {
                OKButton.SetFont(0);
            }
            OKButton.NavLeft = CancelButton;
            OKButton.NavRight = CancelButton;
            CancelButton.NavLeft = OKButton;
            CancelButton.NavRight = OKButton;
            ChildInFocus = CancelButton;
            // End:0x4F2
            if(int(Buttons) == int(4))
            {
                EditArea = UWindowEditControl(CreateControl(class'UWindowEditControl', 1, 1, WinWidth - float(10), 32));
                EditArea.SetNoShrinkFont(true);
                EditArea.SetMaxLength(120);
                EditArea.SetNumericOnly(false);
                EditArea.Align = 1;
            }
            // End:0x57C
            break;
        // End:0x579
        case 2:
            OKButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', WinWidth - float(52), WinHeight - float(20), 48, 48));
            OKButton.SetText(OKText);
            // End:0x565
            if(int(EnterResult) == int(3))
            {
                OKButton.SetFont(1);                
            }
            else
            {
                OKButton.SetFont(0);
            }
            // End:0x57C
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
    local UWindowMessageBox P;

    P = UWindowMessageBox(ParentWindow);
    // End:0x108
    if(int(E) == 2)
    {
        switch(C)
        {
            // End:0x52
            case YesButton:
                P.Result = 1;
                P.Close();
                // End:0x105
                break;
            // End:0x7F
            case NoButton:
                P.Result = 2;
                P.Close();
                // End:0x105
                break;
            // End:0xD5
            case OKButton:
                P.Result = 3;
                P.StringResult = EditArea.EditBox.Value;
                P.Close();
                // End:0x105
                break;
            // End:0x102
            case CancelButton:
                P.Result = 4;
                P.Close();
                // End:0x105
                break;
            // End:0xFFFF
            default:
                break;
        }        
    }
    else
    {
        // End:0x170
        if(int(E) == 7)
        {
            // End:0x170
            if(C != EditArea)
            {
                P.Result = 3;
                P.StringResult = EditArea.EditBox.Value;
                P.Close();
            }
        }
    }
    return;
}

defaultproperties
{
    YesText="<?int?UWindow.UWindowMessageBoxCW.YesText?>"
    NoText="<?int?UWindow.UWindowMessageBoxCW.NoText?>"
    OKText="<?int?UWindow.UWindowMessageBoxCW.OKText?>"
    CancelText="<?int?UWindow.UWindowMessageBoxCW.CancelText?>"
}