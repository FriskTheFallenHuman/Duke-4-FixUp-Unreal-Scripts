/*******************************************************************************
 * UDukeConsoleClientWindow generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeConsoleClientWindow extends UWindowConsoleClientWindow;

var Texture BackgroundTexture;

function Created()
{
    super.Created();
    EditControl.SetFont(7);
    TextArea.ClientAreaAlpha = 0;
    ChildInFocus = EditControl;
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local float UL, VL, XL, YL;

    UL = 512;
    VL = 138;
    YL = WinHeight * 0.7;
    XL = (UL * YL) / VL;
    C.Style = 3;
    C.DrawColor = WhiteColor;
    C.SetPause(WinLeft + (0.5 * (WinWidth - XL)), WinTop + (0.5 * (WinHeight - YL)));
    C.SetClampMode(BackgroundTexture, XL, YL, 0, 0, UL, VL,,,, true, 0.65);
    C.Style = 5;
    C.DrawColor = WhiteColor;
    C.SetPause(WinLeft, WinTop);
    C.SetClampMode(class'BlackTexture', WinWidth, WinHeight, 0, 0, 1, 1,,,, true, 0.65);
    C.Style = 1;
    C.DrawColor = WhiteColor;
    LookAndFeel.DrawBorder(self, C, int(WinLeft), int(WinTop), int(WinWidth), int(WinHeight), 1);
    return;
}

defaultproperties
{
    BackgroundTexture='Menu.Menu.Logo'
    EditControlClass='UDukeConsoleEditControl'
    ClientAreaAlpha=0.6
}