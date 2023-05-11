/*******************************************************************************
 * UWindowHSplitter generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowHSplitter extends UWindowWindow;

var UWindowWindow LeftClientWindow;
var UWindowWindow RightClientWindow;
var bool bSizing;
var float SplitPos;
var float MinWinWidth;
var float OldWinWidth;
var float MaxSplitPos;
var bool bRightGrow;
var bool bSizable;

function Created()
{
    super.Created();
    bAlwaysBehind = true;
    SplitPos = WinWidth / float(2);
    MinWinWidth = 24;
    OldWinWidth = WinWidth;
    return;
}

function Paint(Canvas C, float X, float Y)
{
    DrawStretchedTexture(C, SplitPos, 0, 7, WinHeight, class'BlackTexture', 1);
    // End:0xB3
    if((bSizable && X >= SplitPos) && X <= (SplitPos + float(7)))
    {
        C.Style = 1;
        C.DrawColor.R = 255;
        C.DrawColor.G = 255;
        C.DrawColor.B = 255;        
    }
    else
    {
        C.Style = 1;
        C.DrawColor.R = 150;
        C.DrawColor.G = 150;
        C.DrawColor.B = 150;
    }
    DrawStretchedTexture(C, SplitPos + float(3), 0, 2, WinHeight, class'WhiteTexture', 1);
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    local float NewW, NewH;

    // End:0x35
    if((OldWinWidth != WinWidth) && ! bRightGrow)
    {
        SplitPos = (SplitPos + WinWidth) - OldWinWidth;
    }
    SplitPos = FClamp(SplitPos, MinWinWidth, (WinWidth - float(7)) - MinWinWidth);
    // End:0x7B
    if(MaxSplitPos != float(0))
    {
        SplitPos = FClamp(SplitPos, 0, MaxSplitPos);
    }
    NewW = SplitPos;
    NewH = WinHeight;
    // End:0xDF
    if((NewH != LeftClientWindow.WinHeight) || NewW != LeftClientWindow.WinWidth)
    {
        LeftClientWindow.SetSize(NewW, NewH);
    }
    LeftClientWindow.WinTop = 0;
    LeftClientWindow.WinLeft = 0;
    NewW = (WinWidth - SplitPos) - float(7);
    // End:0x16E
    if((NewH != RightClientWindow.WinHeight) || NewW != RightClientWindow.WinWidth)
    {
        RightClientWindow.SetSize(NewW, NewH);
    }
    RightClientWindow.WinTop = 0;
    RightClientWindow.WinLeft = SplitPos + float(7);
    OldWinWidth = WinWidth;
    return;
}

function LMouseDown(float X, float Y)
{
    super.LMouseDown(X, Y);
    // End:0x58
    if((bSizable && X >= SplitPos) && X <= (SplitPos + float(7)))
    {
        bSizing = true;
        Root.CaptureMouse();
    }
    return;
}

function MouseMove(float X, float Y)
{
    // End:0x48
    if((bSizable && X >= SplitPos) && X <= (SplitPos + float(7)))
    {
        cursor = Root.HSplitCursor;        
    }
    else
    {
        cursor = Root.NormalCursor;
    }
    // End:0x7F
    if(bSizing && bMouseDown)
    {
        SplitPos = X;        
    }
    else
    {
        bSizing = false;
    }
    return;
}

defaultproperties
{
    bSizable=true
}