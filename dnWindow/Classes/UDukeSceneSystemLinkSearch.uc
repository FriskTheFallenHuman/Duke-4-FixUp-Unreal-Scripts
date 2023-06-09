/*******************************************************************************
 * UDukeSceneSystemLinkSearch generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneSystemLinkSearch extends UWindowScene;

var UWindowSmallButton BackButton;
var localized string BackText;
var UdpSystemLinkQuery SystemLinkQuery;
var UWindowLabelControl ProgressLabel;
var float StartTime;

function Created()
{
    super.Created();
    SystemLinkQuery = GetPlayerOwner().GetStaticMeshInstance().EmptyTouchClasses(class'UdpSystemLinkQuery');
    BackButton = UWindowSmallButton(CreateWindow(class'UWindowSmallButton', 1, 1, 1, 1));
    BackButton.SetText(BackText);
    BackButton.Register(self);
    ProgressLabel = UWindowLabelControl(CreateWindow(class'UWindowLabelControl', 1, 1, 1, 1));
    ProgressLabel.SetFont(0);
    ChildInFocus = BackButton;
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local int ControlStart, ControlBuffer;

    ControlStart = int(float(300) * WinScaleY);
    ControlBuffer = int(float(25) * WinScaleY);
    BackButton.AutoSize(C);
    ProgressLabel.AutoSize(C);
    ProgressLabel.WinLeft = (WinWidth / float(2)) - (ProgressLabel.WinWidth / float(2));
    ProgressLabel.WinTop = float(ControlStart);
    BackButton.WinLeft = (WinWidth / float(2)) - (BackButton.WinWidth / float(2));
    BackButton.WinTop = (ProgressLabel.WinTop + ProgressLabel.WinHeight) + float(ControlBuffer);
    super.Paint(C, X, Y);
    // End:0x14F
    if((StartTime != float(0)) && GetPlayerOwner().Level.TimeSeconds > (StartTime + 1))
    {
        EndQuery();
    }
    return;
}

function OnNavForward()
{
    super.OnNavForward();
    SystemLinkQuery.Query();
    ProgressLabel.SetText("Querying servers");
    StartTime = GetPlayerOwner().Level.TimeSeconds;
    return;
}

function EndQuery()
{
    local int KeyIDUpper, KeyIDLower;
    local string address;

    StartTime = 0;
    // End:0xED
    if(string(SystemLinkQuery.GameList) > 0)
    {
        ProgressLabel.SetText(("Found" @ string(string(SystemLinkQuery.GameList))) @ "servers");
        SystemLinkQuery.BindToSystemLinkGame(0, address, KeyIDUpper, KeyIDLower);
        address = (((address $ "?KEYIDUPPER=") $ string(KeyIDUpper)) $ "?KEYIDLOWER=") $ string(KeyIDLower);
        Root.Console.CloseUWindow();
        GetPlayerOwner().ClientTravel(address, 0, false);        
    }
    else
    {
        ProgressLabel.SetText("No servers found, starting server");
        Root.Console.CloseUWindow();
        GetPlayerOwner().ClientTravel("dm-empty?listen?systemlink", 0, false);
    }
    return;
}

defaultproperties
{
    BackText="<?int?dnWindow.UDukeSceneSystemLinkSearch.BackText?>"
}