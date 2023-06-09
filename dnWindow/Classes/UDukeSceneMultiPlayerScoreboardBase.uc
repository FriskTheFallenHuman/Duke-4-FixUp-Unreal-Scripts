/*******************************************************************************
 * UDukeSceneMultiPlayerScoreboardBase generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneMultiPlayerScoreboardBase extends UWindowWindow
    config;

const MaxPlayers = 8;
const KeyButton_A = 0;

var float SBScale;
var Texture BkgTexture;
var float bgAlpha;
var Region BkgRegion;
var localized string SBTitle;
var bool bNoTitle;
var localized string KillDeathStr;
var localized string KillStr;
var localized string DeathStr;
var localized string VoiceStr;
var localized string PlayerName;
var localized string Score;
var localized string Ping;
var localized string Experience;
var localized string LevelLabel;
var int NumOfPlayersInGame;
var float EndOfHeaderY;
var config float ColumnHeadersOffsetY;
var config float NameStringOffsetX;
var config float PanelHeight;
var string timerString;
var Color BorderColor;
var float borderwidth;
var float ButtonStartOffset;
var float HeaderEntryOffset;
var float TopOffsetValue;
var int OrderedPRIIndex[8];
var float WinHalf;
var float WinEighth;
var float WinQuarter;
var float HeaderY;
var Texture VGridLine;
var bool bGameOver;
var MaterialEx Spinner;

function Created()
{
    local string KeyName, Alias;
    local int i;

    super.Created();
    // End:0x29
    if(GetPlayerOwner().GameReplicationInfo == none)
    {
        NumOfPlayersInGame = GetNumPlayersInGame();
    }
    Localize((string(self) @ "::Created::What is NumOfPlayersInGame::") @ string(NumOfPlayersInGame));
    return;
}

function int GetNumPlayersInGame()
{
    local int i, Count;

    Count = 0;
    i = 0;
    J0x0E:

    // End:0x75 [Loop If]
    if(i < string(GetPlayerOwner().GameReplicationInfo.PRIArray))
    {
        // End:0x64
        if(GetPlayerOwner().GameReplicationInfo.PRIArray[i].bIsABot)
        {
            // [Explicit Continue]
            goto J0x6B;
        }
        ++ Count;
        J0x6B:

        ++ i;
        // [Loop Continue]
        goto J0x0E;
    }
    return Count;
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    super.BeforePaint(C, X, Y);
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local float XL, YL, BoxHeight, boxStart;

    BoxHeight = WinHeight;
    boxStart = 0;
    super.Paint(C, X, Y);
    NumOfPlayersInGame = GetNumPlayersInGame();
    C.DrawColor = WhiteColor;
    // End:0x9C
    if(BkgTexture == none)
    {
        DrawStretchedTexture(C, borderwidth, borderwidth, WinWidth - (borderwidth * float(2)), WinHeight - (borderwidth * float(2)), BkgTexture, bgAlpha,,, true);
    }
    C.DrawColor = BorderColor;
    DrawStretchedTexture(C, 0, 0, WinWidth, borderwidth, class'WhiteTexture');
    DrawStretchedTexture(C, 0, borderwidth, borderwidth, WinHeight - borderwidth, class'WhiteTexture');
    DrawStretchedTexture(C, WinWidth - borderwidth, borderwidth, borderwidth, WinHeight - borderwidth, class'WhiteTexture');
    DrawStretchedTexture(C, borderwidth, WinHeight - borderwidth, WinWidth - (borderwidth * float(2)), borderwidth, class'WhiteTexture');
    C.DrawColor = WhiteColor;
    C.Style = 1;
    C.DrawColor = class'UWindowScene'.default.GreyColor;
    C.Font = C.BlockFont;
    C.SetClip(timerString, XL, YL, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    // End:0x2BC
    if(! bNoTitle)
    {
        C.DrawColor = class'DukeHUD'.default.TextColor;
        C.Font = C.HUDFont;
        ClipText(C, (WinWidth / float(2)) - (XL / float(2)), YL / float(2), timerString,, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
        EndOfHeaderY = boxStart + (YL / 2);        
    }
    else
    {
        EndOfHeaderY = boxStart;
    }
    return;
}

function DrawVerticalGridlines(Canvas C, float Y, float YL)
{
    local float LvOffset, StandardOffset, NewX, BorderSize;
    local int i;

    BorderSize = borderwidth + 1;
    LvOffset = class'UDukeScoreboardEntry'.default.NameOffset * 1;
    LvOffset += ((PanelHeight / 2) + float(10));
    StandardOffset = WinEighth * 1.5;
    C.DrawColor = WhiteColor;
    DrawStretchedTexture(C, LvOffset - (WinWidth * 0.01), Y - BorderSize, 8, YL, VGridLine, 0.8,,, true);
    DrawStretchedTexture(C, NameStringOffsetX - (WinWidth * 0.01), Y - BorderSize, 8, YL, VGridLine, 0.8,,, true);
    NewX = (WinHalf + WinEighth) - StandardOffset;
    DrawStretchedTexture(C, NewX - (WinWidth * 0.01), Y - BorderSize, 8, YL, VGridLine, 0.8,,, true);
    i = 0;
    J0x150:

    // End:0x1B3 [Loop If]
    if(i < 4)
    {
        NewX += StandardOffset;
        DrawStretchedTexture(C, NewX - (WinWidth * 0.01), Y - BorderSize, 8, YL, VGridLine, 0.8,,, true);
        ++ i;
        // [Loop Continue]
        goto J0x150;
    }
    return;
}

function Reset()
{
    NumOfPlayersInGame = GetNumPlayersInGame();
    bGameOver = false;
    return;
}

function KeyUp(int Key, float X, float Y)
{
    super.KeyUp(Key, X, Y);
    ParentWindow.KeyUp(Key, X, Y);
    return;
}

function KeyDown(int Key, float X, float Y)
{
    super.KeyDown(Key, X, Y);
    return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
    ParentWindow.NotifyFromControl(C, E);
    return;
}

function bool IsGameTied()
{
    return;
}

function DrawTimer(string timerString)
{
    self.timerString = timerString;
    return;
}

simulated function string TwoDigitString(int Num)
{
    // End:0x1C
    if(Num < 10)
    {
        return "0" $ string(Num);        
    }
    else
    {
        return string(Num);
    }
    return;
}

function PaintTimer(Canvas C)
{
    return;
}

function float DrawButtons(Canvas C, float Y)
{
    return 0;
    return;
}

function float DetermineSize(Canvas C)
{
    return;
}

defaultproperties
{
    BkgTexture='Engine.BlackTexture'
    bgAlpha=0.3
    SBTitle="<?int?dnWindow.UDukeSceneMultiPlayerScoreboardBase.SBTitle?>"
    KillDeathStr="<?int?dnWindow.UDukeSceneMultiPlayerScoreboardBase.KillDeathStr?>"
    KillStr="<?int?dnWindow.UDukeSceneMultiPlayerScoreboardBase.KillStr?>"
    DeathStr="<?int?dnWindow.UDukeSceneMultiPlayerScoreboardBase.DeathStr?>"
    VoiceStr="<?int?dnWindow.UDukeSceneMultiPlayerScoreboardBase.VoiceStr?>"
    PlayerName="<?int?dnWindow.UDukeSceneMultiPlayerScoreboardBase.PlayerName?>"
    Score="<?int?dnWindow.UDukeSceneMultiPlayerScoreboardBase.Score?>"
    Ping="<?int?dnWindow.UDukeSceneMultiPlayerScoreboardBase.Ping?>"
    Experience="<?int?dnWindow.UDukeSceneMultiPlayerScoreboardBase.Experience?>"
    LevelLabel="<?int?dnWindow.UDukeSceneMultiPlayerScoreboardBase.LevelLabel?>"
    ColumnHeadersOffsetY=20
    BorderColor=(R=225,G=123,B=0,A=0)
    borderwidth=5
    ButtonStartOffset=0.02
    HeaderEntryOffset=10
    TopOffsetValue=5
}