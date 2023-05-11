/*******************************************************************************
 * UDukeRespawnWindow generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeRespawnWindow extends UWindowWindow;

var UDukeScoreboard ScoreBoard;
var bool bClosing;

function LMouseDown(float X, float Y)
{
    super.LMouseDown(X, Y);
    return;
}

function Paint(Canvas C, float X, float Y)
{
    super.Paint(C, X, Y);
    return;
}

function Close(optional bool bByParent)
{
    // End:0x0B
    if(bClosing)
    {
        return;
    }
    super.Close(bByParent);
    bClosing = true;
    Root.Console.HideScoreboard();
    bClosing = false;
    return;
}