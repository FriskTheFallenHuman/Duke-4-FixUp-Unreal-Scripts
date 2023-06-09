/*******************************************************************************
 * UDukeServerCW generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeServerCW extends UDukePageWindow;

var UDukeCreateMultiCW myParent;
var bool bInitialized;
var UWindowLabelControl GameLabel;
var UWindowComboControl GameCombo;
var localized string GameText;
var localized string GameHelp;
var string Games[64];
var int MaxGames;
var UWindowLabelControl MapLabel;
var UWindowComboControl MapCombo;
var localized string MapText;
var localized string MapHelp;
var UWindowCheckbox ChangeLevelsCheck;
var localized string ChangeLevelsText;
var localized string ChangeLevelsHelp;
var UWindowEditControl GamePasswordEdit;
var localized string GamePasswordText;
var localized string GamePasswordHelp;
var UWindowEditControl FragEdit;
var localized string FragText;
var localized string FragHelp;
var UWindowEditControl TimeEdit;
var localized string TimeText;
var localized string TimeHelp;
var UWindowEditControl MaxPlayersEdit;
var localized string MaxPlayersText;
var localized string MaxPlayersHelp;
var UWindowEditControl MaxSpectatorsEdit;
var localized string MaxSpectatorsText;
var localized string MaxSpectatorsHelp;
var UWindowCheckbox WeaponsCheck;
var localized string WeaponsText;
var localized string WeaponsHelp;
var UWindowCheckbox TourneyCheck;
var localized string TourneyText;
var localized string TourneyHelp;
var UWindowCheckbox ForceRespawnCheck;
var localized string ForceRespawnText;
var localized string ForceRespawnHelp;
var UWindowCheckbox RespawnMarkersCheck;
var localized string RespawnMarkersText;
var localized string RespawnMarkersHelp;

function Created()
{
    local int i, j, Selection;
    local class<GameInfo> TempClass;
    local string tempgame, NextGame, TempGames;

    super.Created();
    myParent = UDukeCreateMultiCW(GetParent(class'UDukeCreateMultiCW'));
    GameLabel = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 1, 1, 1, 1));
    GameLabel.SetText(GameText);
    GameLabel.SetFont(0);
    GameLabel.Align = 1;
    GameCombo = UWindowComboControl(CreateControl(class'UWindowComboControl', 1, 1, 1, 1));
    GameCombo.SetHelpText(GameHelp);
    GameCombo.SetFont(0);
    GameCombo.SetEditable(false);
    GameCombo.Align = 1;
    NextGame = GetPlayerOwner().CreatePlayerProfile("GameInfo", 0);
    J0x110:

    // End:0x15B [Loop If]
    if(NextGame != "")
    {
        TempGames[i] = NextGame;
        ++ i;
        NextGame = GetPlayerOwner().CreatePlayerProfile("GameInfo", i);
        // [Loop Continue]
        goto J0x110;
    }
    i = 0;
    J0x162:

    // End:0x1E6 [Loop If]
    if(i < 64)
    {
        // End:0x1DC
        if(TempGames[i] != "")
        {
            Games[MaxGames] = TempGames[i];
            TempClass = class<GameInfo>(SaveConfigFile(Games[MaxGames], class'Class'));
            GameCombo.AddItem(TempClass.default.GameName);
            ++ MaxGames;
        }
        ++ i;
        // [Loop Continue]
        goto J0x162;
    }
    GameCombo.SetSelectedIndex(0);
    myParent.GameType = Games[0];
    myParent.GameClass = class<GameInfo>(SaveConfigFile(myParent.GameType, class'Class'));
    MapLabel = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 1, 1, 1, 1));
    MapLabel.SetText(MapText);
    MapLabel.SetFont(0);
    MapLabel.Align = 1;
    MapCombo = UWindowComboControl(CreateControl(class'UWindowComboControl', 1, 1, 1, 1));
    MapCombo.SetHelpText(MapHelp);
    MapCombo.SetFont(0);
    MapCombo.SetEditable(false);
    MapCombo.Align = 1;
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    local int CenterWidth, CColLeft, CColRight;

    super(UWindowWindow).BeforePaint(C, X, Y);
    CenterWidth = int(WinWidth / float(4)) * 3;
    CColLeft = int(WinWidth / float(2)) - 51;
    CColRight = int(WinWidth / float(2)) - 44;
    GameCombo.SetSize(200, GameCombo.WinHeight);
    GameCombo.WinLeft = float(CColRight);
    GameCombo.EditBoxWidth = 200;
    GameCombo.WinTop = 10;
    GameLabel.AutoSize(C);
    GameLabel.WinLeft = float(CColLeft) - GameLabel.WinWidth;
    GameLabel.WinTop = GameCombo.WinTop + float(8);
    MapCombo.SetSize(200, MapCombo.WinHeight);
    MapCombo.WinLeft = float(CColRight);
    MapCombo.EditBoxWidth = 200;
    MapCombo.WinTop = 10;
    MapLabel.AutoSize(C);
    MapLabel.WinLeft = float(CColLeft) - MapLabel.WinWidth;
    MapLabel.WinTop = GameCombo.WinTop + float(8);
    return;
}

defaultproperties
{
    GameText="<?int?dnWindow.UDukeServerCW.GameText?>"
    GameHelp="<?int?dnWindow.UDukeServerCW.GameHelp?>"
    MapText="<?int?dnWindow.UDukeServerCW.MapText?>"
    MapHelp="<?int?dnWindow.UDukeServerCW.MapHelp?>"
    ChangeLevelsText="<?int?dnWindow.UDukeServerCW.ChangeLevelsText?>"
    ChangeLevelsHelp="<?int?dnWindow.UDukeServerCW.ChangeLevelsHelp?>"
    GamePasswordText="<?int?dnWindow.UDukeServerCW.GamePasswordText?>"
    GamePasswordHelp="<?int?dnWindow.UDukeServerCW.GamePasswordHelp?>"
}