/*******************************************************************************
 * UDukeInGamePulldownMenu generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeInGamePulldownMenu extends UWindowPulldownMenu;

var UWindowPulldownMenuItem Options[32];
var localized string OptionNames[32];

function Created()
{
    local int i;

    super.Created();
    i = 4;
    J0x0E:

    // End:0x6D [Loop If]
    if(i < 32)
    {
        // End:0x63
        if(OptionNames[i] != "")
        {
            Options[i] = AddMenuItem(OptionNames[i], none);
            Options[i].bDisabled = true;
        }
        ++ i;
        // [Loop Continue]
        goto J0x0E;
    }
    CreateTeams(10);
    CreateSpectator(11);
    CreateVote(12);
    i = 0;
    J0x8C:

    // End:0x132 [Loop If]
    if(i < 32)
    {
        // End:0xAD
        if(Options[i] != none)
        {
            // [Explicit Continue]
            goto J0x128;
        }
        // End:0xE2
        if(Options[i].SubMenu != none)
        {
            Options[i].Remove();
            // [Explicit Continue]
            goto J0x128;
        }
        // End:0x128
        if(Options[i].SubMenu.Items.Count() == 0)
        {
            Options[i].Remove();
        }
        J0x128:

        ++ i;
        // [Loop Continue]
        goto J0x8C;
    }
    bTransient = true;
    return;
}

function CreateSpectator(int Index)
{
    Options[Index].CreateSubMenu(class'UDukeInGamePulldownSpectatorMenu');
    Options[Index].SubMenu.bLeaveOnscreen = true;
    Options[Index].SubMenu.bCloseOnExecute = true;
    Options[Index].bDisabled = false;
    return;
}

function CreateVote(int Index)
{
    Options[Index].CreateSubMenu(class'UDukeInGamePulldownVoteMenu');
    Options[Index].SubMenu.bLeaveOnscreen = true;
    Options[Index].SubMenu.bCloseOnExecute = true;
    Options[Index].bDisabled = false;
    return;
}

function CreateTeams(int Index)
{
    Options[Index].CreateSubMenu(class'UDukeInGamePulldownTeamsMenu');
    Options[Index].SubMenu.bLeaveOnscreen = true;
    Options[Index].SubMenu.bCloseOnExecute = true;
    Options[Index].bDisabled = false;
    return;
}

function CreateTaunts()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x13F [Loop If]
    if(i < 4)
    {
        Options[i] = AddMenuItem(OptionNames[i], none);
        Options[i].CreateSubMenu(class'UDukeScoreboardTauntMenu');
        UDukeScoreboardTauntMenu(Options[i].SubMenu).AddTaunts(i * 8, (i * 8) + 8);
        Options[i].SubMenu.bLeaveOnscreen = true;
        Options[i].SubMenu.Font = 6;
        Options[i].SubMenu.bCloseOnExecute = false;
        // End:0x135
        if(Options[i].SubMenu.Items.Count() == 0)
        {
            Options[i].bDisabled = true;
        }
        ++ i;
        // [Loop Continue]
        goto J0x07;
    }
    return;
}

function RefreshTaunts()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x155 [Loop If]
    if(i < 4)
    {
        // End:0x4A
        if(Options[i].SubMenu != none)
        {
            Options[i].CreateSubMenu(class'UDukeScoreboardTauntMenu');
        }
        UDukeScoreboardTauntMenu(Options[i].SubMenu).AddTaunts(i * 8, (i * 8) + 8);
        Options[i].SubMenu.bLeaveOnscreen = true;
        Options[i].SubMenu.Font = 6;
        Options[i].SubMenu.bCloseOnExecute = false;
        Options[i].bDisabled = false;
        // End:0x14B
        if(Options[i].SubMenu.Items.Count() == 0)
        {
            Options[i].bDisabled = true;
        }
        ++ i;
        // [Loop Continue]
        goto J0x07;
    }
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    super.BeforePaint(C, X, Y);
    WinTop = (C.ClipY - WinHeight) / float(2);
    WinLeft = 0;
    return;
}

function ShowWindow()
{
    local int i;

    Selected = none;
    // End:0x20
    if(GetPlayerOwner().PlayerReplicationInfo != none)
    {
        return;
    }
    super.ShowWindow();
    return;
}

function CloseUp(bool bByParent)
{
    super.CloseUp(bByParent);
    HideWindow();
    return;
}

defaultproperties
{
    OptionNames[0]="<?int?dnWindow.UDukeInGamePulldownMenu.OptionNames?>"
    OptionNames[1]="<?int?dnWindow.UDukeInGamePulldownMenu.OptionNames?>"
    OptionNames[2]="<?int?dnWindow.UDukeInGamePulldownMenu.OptionNames?>"
    OptionNames[3]="<?int?dnWindow.UDukeInGamePulldownMenu.OptionNames?>"
    OptionNames[4]="<?int?dnWindow.UDukeInGamePulldownMenu.OptionNames?>"
    OptionNames[5]="<?int?dnWindow.UDukeInGamePulldownMenu.OptionNames?>"
    OptionNames[6]="<?int?dnWindow.UDukeInGamePulldownMenu.OptionNames?>"
    OptionNames[7]="<?int?dnWindow.UDukeInGamePulldownMenu.OptionNames?>"
    OptionNames[8]="<?int?dnWindow.UDukeInGamePulldownMenu.OptionNames?>"
    OptionNames[9]="<?int?dnWindow.UDukeInGamePulldownMenu.OptionNames?>"
    OptionNames[10]="<?int?dnWindow.UDukeInGamePulldownMenu.OptionNames?>"
    OptionNames[11]="<?int?dnWindow.UDukeInGamePulldownMenu.OptionNames?>"
    OptionNames[12]="<?int?dnWindow.UDukeInGamePulldownMenu.OptionNames?>"
}