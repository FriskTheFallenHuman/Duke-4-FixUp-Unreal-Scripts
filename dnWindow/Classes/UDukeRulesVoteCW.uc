/*******************************************************************************
 * UDukeRulesVoteCW generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeRulesVoteCW extends UDukePageWindow;

var UWindowLabelControl FragLabel;
var UWindowEditControl FragEdit;
var localized string FragText;
var localized string FragHelp;
var UWindowLabelControl TimeLabel;
var UWindowEditControl TimeEdit;
var localized string TimeText;
var localized string TimeHelp;
var UWindowSmallButton VoteButton;
var localized string VoteText;
var localized string VoteHelp;

function Created()
{
    super.Created();
    FragLabel = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 1, 1, 1, 1));
    FragLabel.SetText(FragText);
    FragLabel.SetFont(0);
    FragLabel.Align = 1;
    FragEdit = UWindowEditControl(CreateControl(class'UWindowEditControl', 1, 1, 1, 1));
    FragEdit.SetHelpText(FragHelp);
    FragEdit.SetFont(0);
    FragEdit.SetNumericOnly(true);
    FragEdit.SetMaxLength(3);
    FragEdit.Align = 1;
    TimeLabel = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 1, 1, 1, 1));
    TimeLabel.SetText(TimeText);
    TimeLabel.SetFont(0);
    TimeLabel.Align = 1;
    TimeEdit = UWindowEditControl(CreateControl(class'UWindowEditControl', 1, 1, 1, 1));
    TimeEdit.SetHelpText(TimeHelp);
    TimeEdit.SetFont(0);
    TimeEdit.SetNumericOnly(true);
    TimeEdit.SetMaxLength(3);
    TimeEdit.Align = 1;
    VoteButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 1, 1, 1, 1));
    VoteButton.SetText(VoteText);
    VoteButton.SetHelpText(VoteHelp);
    VoteButton.SetFont(6);
    // End:0x2B9
    if(dnDeathmatchGameReplicationInfo(GetPlayerOwner().GameReplicationInfo) == none)
    {
        FragEdit.SetValue(string(dnDeathmatchGameReplicationInfo(GetPlayerOwner().GameReplicationInfo).FragLimit));
        TimeEdit.SetValue(string(dnDeathmatchGameReplicationInfo(GetPlayerOwner().GameReplicationInfo).TimeLimit));        
    }
    else
    {
        FragEdit.SetValue(string(0));
        TimeEdit.SetValue(string(0));
    }
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    local int CenterWidth, CColLeft, CColRight;
    local float YOff, W, W2;

    super(UWindowWindow).BeforePaint(C, X, Y);
    CenterWidth = int(WinWidth / float(4)) * 3;
    CColLeft = int(WinWidth / float(2)) - 7;
    CColRight = int(WinWidth / float(2)) + 7;
    FragEdit.SetSize(50, FragEdit.WinHeight);
    FragLabel.AutoSize(C);
    TimeEdit.SetSize(50, TimeEdit.WinHeight);
    TimeLabel.AutoSize(C);
    FragEdit.WinTop = 0;
    FragLabel.WinTop = FragEdit.WinTop + float(12);
    TimeEdit.WinTop = 0;
    TimeLabel.WinTop = TimeEdit.WinTop + float(12);
    W = (FragEdit.WinWidth + FragLabel.WinWidth) + float(14);
    W2 = (TimeEdit.WinWidth + TimeLabel.WinWidth) + float(14);
    FragLabel.WinLeft = (WinWidth - ((W + W2) + float(32))) / float(2);
    FragEdit.WinLeft = (FragLabel.WinLeft + FragLabel.WinWidth) + float(14);
    TimeLabel.WinLeft = ((FragEdit.WinLeft + FragEdit.WinWidth) + float(32)) + float(20);
    TimeEdit.WinLeft = ((TimeLabel.WinLeft + TimeLabel.WinWidth) + float(14)) + float(20);
    VoteButton.AutoSize(C);
    VoteButton.WinLeft = (WinWidth - VoteButton.WinWidth) / float(2);
    VoteButton.WinTop = (WinHeight - VoteButton.WinHeight) - float(10);
    return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
    super.NotifyFromControl(C, E);
    switch(E)
    {
        // End:0x74
        case 2:
            switch(C)
            {
                // End:0x6E
                case VoteButton:
                    GetPlayerOwner().ServerCallVote("changerules", FragEdit.GetValue(), TimeEdit.GetValue());
                    // End:0x74
                    break;
                // End:0xFFFF
                default:
                    // End:0x74
                    break;
                    break;
            }
        // End:0xFFFF
        default:
            return;
            break;
    }
}

function ShowWindow()
{
    super(UWindowWindow).ShowWindow();
    // End:0x82
    if(dnDeathmatchGameReplicationInfo(GetPlayerOwner().GameReplicationInfo) == none)
    {
        FragEdit.SetValue(string(dnDeathmatchGameReplicationInfo(GetPlayerOwner().GameReplicationInfo).FragLimit));
        TimeEdit.SetValue(string(dnDeathmatchGameReplicationInfo(GetPlayerOwner().GameReplicationInfo).TimeLimit));
    }
    return;
}

defaultproperties
{
    FragText="<?int?dnWindow.UDukeRulesVoteCW.FragText?>"
    FragHelp="<?int?dnWindow.UDukeRulesVoteCW.FragHelp?>"
    TimeText="<?int?dnWindow.UDukeRulesVoteCW.TimeText?>"
    TimeHelp="<?int?dnWindow.UDukeRulesVoteCW.TimeHelp?>"
    VoteText="<?int?dnWindow.UDukeRulesVoteCW.VoteText?>"
    VoteHelp="<?int?dnWindow.UDukeRulesVoteCW.VoteHelp?>"
}