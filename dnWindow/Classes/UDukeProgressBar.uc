/*******************************************************************************
 * UDukeProgressBar generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeProgressBar extends UWindowDialogControl;

var Color BarColor;
var Color BarEndColor;
var float BarHeight;
var string HeaderText;
var int StartValue;
var int EndValue;
var int CurrentValue;
var bool bAutoSizeBar;

function Created()
{
    super.Created();
    return;
}

function SetStartEnd(int Start, int End)
{
    StartValue = Start;
    EndValue = End;
    return;
}

function SetCurrentValue(int Value)
{
    CurrentValue = Value;
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local Texture White;
    local Vector P1, P2;
    local float BarWidth, XL, YL;

    White = class'WhiteTexture';
    super(UWindowWindow).Paint(C, X, Y);
    C.DrawColor = BarEndColor;
    P1.X = WinLeft;
    P1.Y = WinTop;
    P2.X = WinLeft;
    P2.Y = WinTop + WinHeight;
    C.DrawIcon(P1, P2);
    P1.X = WinLeft + WinWidth;
    P1.Y = WinTop;
    P2.X = WinLeft + WinWidth;
    P2.Y = WinTop + WinHeight;
    C.DrawIcon(P1, P2);
    C.DrawColor = WhiteColor;
    C.Font = C.MedFont;
    ClipText(C, 2, -5, string(StartValue),, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    TextSize(C, string(EndValue), XL, YL, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    ClipText(C, (WinWidth - XL) - float(2), -5, string(EndValue),, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    // End:0x1F9
    if(EndValue == 0)
    {
        return;
    }
    C.DrawColor = BarColor;
    // End:0x229
    if(bAutoSizeBar)
    {
        BarHeight = WinHeight * 0.2;
    }
    C.SetPause(0, (WinHeight - BarHeight) / 2);
    BarWidth = float(CurrentValue) / float(EndValue);
    C.SetClampMode(White, WinWidth * BarWidth, BarHeight, 0, 0, float(White.DrawStatic()), float(White.DrawTile()));
    C.DrawColor = WhiteColor;
    TextSize(C, string(CurrentValue), XL, YL, class'UWindowScene'.default.TTFontScale * 0.75, class'UWindowScene'.default.TTFontScale * 0.75);
    ClipText(C, (WinWidth * BarWidth) - XL, WinHeight - YL, string(CurrentValue),, class'UWindowScene'.default.TTFontScale * 0.75, class'UWindowScene'.default.TTFontScale * 0.75);
    return;
}

defaultproperties
{
    BarColor=(R=255,G=0,B=0,A=0)
    BarEndColor=(R=192,G=192,B=192,A=0)
    BarHeight=10
    bAutoSizeBar=true
}