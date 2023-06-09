/*******************************************************************************
 * UWindowMessageBox generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowMessageBox extends UWindowFramedWindow
    dependson(UWindowMessageBoxCW);

var UWindowBase.MessageBoxResult Result;
var string StringResult;
var float TimeOutTime;
var int TimeOut;
var bool bSetupSize;
var int FrameCount;

function SetupMessageBox(string Title, string Message, UWindowBase.MessageBoxButtons Buttons, UWindowBase.MessageBoxResult InESCResult, optional UWindowBase.MessageBoxResult InEnterResult, optional int InTimeOut)
{
    WindowTitle = Title;
    UWindowMessageBoxCW(ClientArea).SetupMessageBoxClient(Message, Buttons, InEnterResult);
    Result = InESCResult;
    TimeOutTime = 0;
    TimeOut = InTimeOut;
    FrameCount = 0;
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    local Region R;

    // End:0x29
    if(! bSetupSize)
    {
        LookAndFeel.MessageBox_AutoSize(self, C);
        bSetupSize = true;
    }
    super.BeforePaint(C, X, Y);
    return;
}

function AfterPaint(Canvas C, float X, float Y)
{
    super.AfterPaint(C, X, Y);
    // End:0x58
    if(TimeOut != 0)
    {
        ++ FrameCount;
        // End:0x58
        if(FrameCount >= 5)
        {
            TimeOutTime = GetLevel().TimeSeconds + float(TimeOut);
            TimeOut = 0;
        }
    }
    // End:0x91
    if((TimeOutTime != float(0)) && GetLevel().TimeSeconds > TimeOutTime)
    {
        TimeOutTime = 0;
        Close();
    }
    return;
}

function Close(optional bool bByParent)
{
    super.Close(bByParent);
    HideWindow();
    OwnerWindow.MessageBoxDone(self, Result);
    return;
}

defaultproperties
{
    ClientClass='UWindowMessageBoxCW'
    bMessageBoxFrame=true
}