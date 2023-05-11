/*******************************************************************************
 * ToolTipWindow generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ToolTipWindow extends UWindowWindow
    transient;

var string ToolTip;
var Color ToolColor;
var Color TextColor;

function Created()
{
    bLeaveOnscreen = true;
    super.Created();
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local float XL, YL;
    local Color OldColor;

    C.Font = C.TallFont;
    TextSize(C, ToolTip, XL, YL);
    SetSize(XL + float(8), YL + float(8));
    OldColor = C.DrawColor;
    C.DrawColor = ToolColor;
    C.DrawColor = TextColor;
    ClipText(C, 4, 4, ToolTip);
    C.DrawColor = OldColor;
    super.Paint(C, X, Y);
    return;
}

defaultproperties
{
    ToolTip="Tool Tip"
}