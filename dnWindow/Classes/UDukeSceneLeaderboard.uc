/*******************************************************************************
 * UDukeSceneLeaderboard generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneLeaderboard extends UWindowScene
    config;

const KeyRepeatTime = 0.3f;
const NumColumns = 7;
const STATS_VIEW_XP = 2;
const STATS_VIEW_KILLDEATH = 6;
const STATS_VIEW_WINLOSS = 8;
const STATS_VIEW_TIMEPLAYED = 10;

enum EDownKey
{
    DK_None,
    DK_Down,
    DK_Up
};

var int MaxEntries;
var OnlineAgentListener Listener;
var OnlineAgent OnlineAgent;
var int PaintRangeTop;
var int PaintRangeBottom;
var int SelectedIndex;
var localized string HoldToSort;
var bool bRefreshing;
var bool bWasConnected;
var Engine.Object.ELeadboardSortType SortState;
var UDukeSceneLeaderboard.EDownKey DownKey;
var UWindowVScrollbar VScroll;
var localized string SortFriendsText;
var localized string SortNeighboursText;
var localized string SortAllText;
var config int PageStep;
var UDukeKeyButton ShoulderButtons[2];
var localized string NextPageString;
var localized string PrevPageString;
var localized string LBTitle;
var string PlayerName;
var string Score;
var localized string Rank;
var string KDRatio;
var Texture arrowTex;
var int ArrowIdx;
var Region ArrowRegion;
var float RowOffset;
var float SelectedRowOffset;
var Color PlayerEntryColor;
var Color InactiveSortColor;
var localized string sRank;
var localized string sName;
var localized string sLevel;
var localized string sXP;
var localized string sKDRatio;
var localized string sWLRatio;
var localized string sTimePlayed;
var localized string UnrankedRank;
var bool bLeaderboardInited;
var float UnselectedFontScale;
var Texture VGridLine;
var Texture HGridLine;
var float KeyTime;
var float StandardSpacing;
var float RightEdge;
var array<float> ColumnWidths;
var float HeaderFontScaleX;
var float HeaderFontScaleY;
var int HeaderOffsetY;
var UDukeSuperMessageBox msgBox;
var class<UDukeSuperMessageBox> FilterSelectionDialogClass;
var int CurrentLeaderboard;
var float ColumnWidth;
var Engine.Object.ELeaderBoardUpdateState UpdateState;
var float SavedMouseX;
var float SavedMouseY;
var bool bCanceled;
var int SelectedColumnHeading;

function Created()
{
    super.Created();
    PlayerName = ClassIsChildOf("UDukeSceneMultiPlayerScoreboardBase", "PlayerName", "dnWindow");
    Score = ClassIsChildOf("UDukeSceneMultiPlayerScoreboardBase", "PlayerName", "dnWindow");
    KDRatio = ClassIsChildOf("UDukeSceneMultiPlayerScoreboardBase", "KillDeathStr", "dnWindow");
    bWasConnected = false;
    VScroll = UWindowVScrollbar(CreateWindow(class'UWindowVScrollbar', 1, 1, 1, 1, self));
    VScroll.bInBevel = true;
    // End:0x134
    if(Listener != none)
    {
        Listener = new (none) class'OnlineAgentListener';
    }
    OnlineAgent = UDukeRootWindow(Root).OnlineAgent;
    KeyButtons[0].SetText(ClassIsChildOf("UDukeSceneMultiPlayerMenuLobby", "ShowGamerCardString", "dnWindow"));
    KeyButtons[3].SetText(HoldToSort);
    KeyButtons[3].XBoxButtonRegion = KeyButtons[3].RTButton;
    KeyButtons[3].PCInputKey = int(32);
    KeyButtons[3].PCButton = SPCText;
    VScroll.pos = -1;
    PaintRangeBottom = MaxEntries;
    PageStep = MaxEntries;
    UpdateState = 0;
    // End:0x25B
    if(ObjectDestroy())
    {
        InactiveSortColor = class'UWindowScene'.default.GreyColor;
    }
    return;
}

function NavigateBack()
{
    super.NavigateBack();
    OnlineAgent.UnregisterListener(Listener);
    return;
}

function NotifyRemovingFromScenesList()
{
    OnlineAgent.UnregisterListener(Listener);
    return;
}

function OnNavForward()
{
    super.OnNavForward();
    Listener.__OnLeaderboardRefreshed__Delegate = OnLeaderboardUpdate;
    OnlineAgent.RegisterListener(Listener);
    KeyButtons[1].ShowWindow();
    SetSortState(0);
    KeyButtons[3].SetText(HoldToSort);
    KeyButtons[3].ShowWindow();
    SelectedIndex = 0;
    CurrentLeaderboard = 2;
    VScroll.Show(0);
    bRefreshing = true;
    DukeConsole(Root.Console).DialogMgr.ShowWaitingDialog(self);
    bWasConnected = OnlineAgent.IsSignedIn();
    OnlineAgent.RefreshLeaderboard(SortState, CurrentLeaderboard);
    bCanceled = false;
    return;
}

function SetSortState(int nSortState)
{
    local string screenTitle;

    screenTitle = ClassIsChildOf("UDukeSceneLeaderboard", "TitleText", "dnwindow");
    switch(nSortState)
    {
        // End:0x5F
        case 0:
            SortState = 0;
            TitleText = screenTitle @ SortAllText;
            // End:0xAA
            break;
        // End:0x81
        case 1:
            SortState = 1;
            TitleText = screenTitle @ SortFriendsText;
            // End:0xAA
            break;
        // End:0xA4
        case 2:
            SortState = 2;
            TitleText = screenTitle @ SortNeighboursText;
            // End:0xAA
            break;
        // End:0xFFFF
        default:
            // End:0xAA
            break;
            break;
    }
    return;
}

function OnLeaderboardUpdate(Engine.Object.ELeaderBoardUpdateState newUpdateState)
{
    // End:0x51
    if(! GetGearboxEngineGlobals())
    {
        // End:0x43
        if(((int(UpdateState) == int(0)) && int(newUpdateState) != int(4)) && int(newUpdateState) != int(3))
        {
            UpdateState = newUpdateState;
            return;
        }
        UpdateState = 0;
        OnRefreshed();
    }
    return;
}

function OnRefreshed()
{
    local int myRank, firstRank;

    Localize("Leaderboard's have been Updated");
    bRefreshing = false;
    PaintRangeTop = 0;
    PaintRangeBottom = PageStep;
    // End:0x99
    if(int(SortState) != int(2))
    {
        // End:0x7A
        if(string(OnlineAgent.LeaderboardEntries) > 0)
        {
            VScroll.pos = 0;            
        }
        else
        {
            VScroll.pos = -1;
        }
        SelectedIndex = 0;        
    }
    else
    {
        // End:0x192
        if(string(OnlineAgent.LeaderboardEntries) > 0)
        {
            firstRank = OnlineAgent.LeaderboardEntries[0].Rank;
            myRank = OnlineAgent.CurrentPlayerLeaderboardData.Rank;
            // End:0x126
            if(myRank > 0)
            {
                VScroll.pos = float(myRank - firstRank);
                SelectedIndex = int(VScroll.pos);                
            }
            else
            {
                VScroll.pos = 0;
                SelectedIndex = int(VScroll.pos);
            }
            Localize(((("OnRefreshed" @ string(firstRank)) @ string(myRank)) @ string(VScroll.pos)) @ string(SelectedIndex));            
        }
        else
        {
            VScroll.pos = -1;
            SelectedIndex = 0;
        }
    }
    VScroll.SetRange(0, float(string(OnlineAgent.LeaderboardEntries)), float(PageStep), 1);
    Localize("OnRefreshed" @ string(VScroll.pos));
    DownKey = 0;
    return;
}

function GoDown(int Step, optional bool bFromHold, optional bool bScrollView)
{
    // End:0x18
    if(string(OnlineAgent.LeaderboardEntries) == 0)
    {
        return;
    }
    // End:0x2E
    if(bNavDownRepeatBlock && bFromHold)
    {
        return;
    }
    // End:0x4A
    if(SelectedIndex >= string(OnlineAgent.LeaderboardEntries))
    {
        return;
    }
    bNavDownRepeatBlock = true;
    SelectedIndex += Step;
    // End:0x9D
    if(bScrollView)
    {
        VScroll.Show(float(Clamp((PaintRangeBottom + Step) - 1, 0, string(OnlineAgent.LeaderboardEntries) - 1)));
    }
    // End:0xD0
    if(SelectedIndex >= string(OnlineAgent.LeaderboardEntries))
    {
        SelectedIndex = string(OnlineAgent.LeaderboardEntries) - 1;
    }
    // End:0x11B
    if(SelectedIndex >= PaintRangeBottom)
    {
        PaintRangeBottom = SelectedIndex + 1;
        // End:0x106
        if(PaintRangeBottom < MaxEntries)
        {
            PaintRangeTop = 0;            
        }
        else
        {
            PaintRangeTop = PaintRangeBottom - MaxEntries;
        }        
    }
    else
    {
        // End:0x147
        if(SelectedIndex < PaintRangeTop)
        {
            PaintRangeTop = SelectedIndex;
            PaintRangeBottom = PaintRangeTop + MaxEntries;
        }
    }
    VScroll.Show(float(SelectedIndex));
    // End:0x186
    if(bFromHold)
    {
        NavRepeatTimeout = GetLevel().TimeSeconds + NavRepeatTimeHold;        
    }
    else
    {
        NavRepeatTimeout = GetLevel().TimeSeconds + NavRepeatTime;
    }
    GetPlayerOwner().PlaySoundInfo(0, SoundNavigateInfo);
    return;
}

function GoUp(int Step, optional bool bFromHold, optional bool bScrollView)
{
    // End:0x18
    if(string(OnlineAgent.LeaderboardEntries) == 0)
    {
        return;
    }
    // End:0x2E
    if(bNavUpRepeatBlock && bFromHold)
    {
        return;
    }
    // End:0x3B
    if(SelectedIndex == 0)
    {
        return;
    }
    bNavUpRepeatBlock = true;
    SelectedIndex -= Step;
    // End:0x8B
    if(bScrollView)
    {
        VScroll.Show(float(Clamp(PaintRangeTop - Step, 0, string(OnlineAgent.LeaderboardEntries) - 1)));
    }
    // End:0x9D
    if(SelectedIndex < 0)
    {
        SelectedIndex = 0;
    }
    // End:0xE8
    if(SelectedIndex >= PaintRangeBottom)
    {
        PaintRangeBottom = SelectedIndex + 1;
        // End:0xD3
        if(PaintRangeBottom < MaxEntries)
        {
            PaintRangeTop = 0;            
        }
        else
        {
            PaintRangeTop = PaintRangeBottom - MaxEntries;
        }        
    }
    else
    {
        // End:0x114
        if(SelectedIndex < PaintRangeTop)
        {
            PaintRangeTop = SelectedIndex;
            PaintRangeBottom = PaintRangeTop + MaxEntries;
        }
    }
    VScroll.Show(float(SelectedIndex));
    // End:0x153
    if(bFromHold)
    {
        NavRepeatTimeout = GetLevel().TimeSeconds + NavRepeatTimeHold;        
    }
    else
    {
        NavRepeatTimeout = GetLevel().TimeSeconds + NavRepeatTime;
    }
    GetPlayerOwner().PlaySoundInfo(0, SoundNavigateInfo);
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    super.BeforePaint(C, X, Y);
    // End:0x45
    if(PaintRangeBottom > string(OnlineAgent.LeaderboardEntries))
    {
        PaintRangeBottom = string(OnlineAgent.LeaderboardEntries);
    }
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local int i, playerRank;
    local float YPadding, XPadding, XL, YL;
    local string tempstr;
    local float YTop, YBottom, FontScale;
    local int PrevMaxEntries;

    super.Paint(C, X, Y);
    // End:0x8C
    if(! GetGearboxEngineGlobals())
    {
        // End:0x79
        if((! bIsHidingKeyButtons && ! DukeConsole(Root.Console).DialogMgr.IsDialogShown()) && bWasConnected)
        {
            KeyButtons[3].ShowWindow();            
        }
        else
        {
            KeyButtons[3].HideWindow();
        }
    }
    // End:0xB9
    if(! bCanceled && ! bIsHidingKeyButtons)
    {
        KeyButtons[0].ShowWindow();        
    }
    else
    {
        // End:0xD4
        if(bCanceled)
        {
            KeyButtons[0].HideWindow();
        }
    }
    StandardSpacing = WinWidth * 0.09;
    ColumnWidth = WinWidth * 0.01;
    RightEdge = WinWidth * 0.85;
    PaintRangeTop = int(VScroll.pos);
    PaintRangeBottom = PaintRangeTop + MaxEntries;
    C.Font = C.TallFont;
    YPadding = float(ControlStart);
    playerRank = OnlineAgent.CurrentPlayerLeaderboardData.Rank;
    DrawBackgroundBox(C, WinWidth * 0.075, float(LineTopY + 10) * WinScaleY, VScroll.WinLeft - (WinWidth * 0.05), float((LineBottomY - LineTopY) - 5) * WinScaleY);
    DrawHeader(C, YPadding);
    FontScale = class'UWindowScene'.default.TTFontScale * UnselectedFontScale;
    C.RegisterSound(FontScale);
    C.SetClip("This is a test String", XL, YL, FontScale, FontScale);
    RowOffset = YL * 1.05;
    FontScale = class'UWindowScene'.default.TTFontScale;
    C.RegisterSound(FontScale);
    C.SetClip("This is a test String", XL, YL, FontScale, FontScale);
    SelectedRowOffset = YL * 1.05;
    YPadding += (RowOffset * 1.2);
    C.DrawColor = class'UWindowScene'.default.GreyColor;
    DrawStretchedTexture(C, WinWidth * 0.1, YPadding, VScroll.WinLeft - (WinWidth * 0.12), 8, HGridLine, 1,,, true);
    YPadding += float(10);
    VScroll.WinTop = YPadding;
    VScroll.WinWidth = 16;
    YTop = YPadding;
    YBottom = (float(LineBottomY) * WinScaleY) - (RowOffset + float(14));
    PrevMaxEntries = MaxEntries;
    MaxEntries = int(((YBottom - YTop) / RowOffset) + 0.5);
    // End:0x41F
    if(MaxEntries != PrevMaxEntries)
    {
        PageStep = MaxEntries;
        VScroll.SetRange(0, float(string(OnlineAgent.LeaderboardEntries)), float(PageStep), 1);
    }
    PaintRangeBottom = PaintRangeTop + MaxEntries;
    // End:0x4D9
    if(! bRefreshing && ! bCanceled)
    {
        i = PaintRangeTop;
        J0x454:

        // End:0x4D9 [Loop If]
        if((i < PaintRangeBottom) && i < string(OnlineAgent.LeaderboardEntries))
        {
            DrawLBEntry(C, YPadding, i, playerRank, i == SelectedIndex);
            // End:0x4C3
            if(i == SelectedIndex)
            {
                YPadding += SelectedRowOffset;
                // [Explicit Continue]
                goto J0x4CF;
            }
            YPadding += RowOffset;
            J0x4CF:

            ++ i;
            // [Loop Continue]
            goto J0x454;
        }
    }
    YPadding = YBottom;
    DrawColumns(C, YTop, YPadding - YTop);
    VScroll.WinHeight = float(PaintRangeBottom - PaintRangeTop) * RowOffset;
    VScroll.WinLeft = WinWidth * 0.86;
    YPadding += float(10);
    C.DrawColor = class'UWindowScene'.default.GreyColor;
    DrawStretchedTexture(C, WinWidth * 0.1, YPadding, VScroll.WinLeft - (WinWidth * 0.12), 8, HGridLine, 1,,, true);
    YPadding += float(8);
    // End:0x5E6
    if(! bRefreshing && ! bCanceled)
    {
        DrawPlayerEntry(C, YPadding);
    }
    return;
}

function int GetEntryAt(float X, float Y)
{
    local float y1;
    local int i;

    // End:0x12
    if(RowOffset == float(0))
    {
        return -1;
    }
    y1 = float(ControlStart);
    y1 += (RowOffset * 1.2);
    y1 += float(10);
    // End:0x79
    if(((y1 > Y) || X < (WinWidth * 0.1)) || X > RightEdge)
    {
        return -1;
    }
    i = PaintRangeTop;
    J0x84:

    // End:0x10D [Loop If]
    if((i < PaintRangeBottom) && i < string(OnlineAgent.LeaderboardEntries))
    {
        // End:0xE2
        if(i == SelectedIndex)
        {
            y1 += SelectedRowOffset;
            // End:0xDF
            if(Y < y1)
            {
                return i;
            }
            // [Explicit Continue]
            goto J0x103;
        }
        y1 += RowOffset;
        // End:0x103
        if(Y < y1)
        {
            return i;
        }
        J0x103:

        ++ i;
        // [Loop Continue]
        goto J0x84;
    }
    return -1;
    return;
}

function ShowPlayerInfo()
{
    // End:0x23
    if((string(OnlineAgent.LeaderboardEntries) == 0) || bCanceled)
    {
        return;
    }
    // End:0xA0
    if(GetGearboxEngineGlobals())
    {
        Root.Console.Viewport.IsWaitingForResponse();
        DukeConsole(Root.Console).DialogMgr.ShowWaitingForResponseDialog();
        OnlineAgent.ShowGamercardByName(OnlineAgent.LeaderboardEntries[SelectedIndex].PlayerName);        
    }
    else
    {
        // End:0xFA
        if(OnlineAgent.IsSignedIn())
        {
            OnlineAgent.ShowGamercardFromUid(OnlineAgent.LeaderboardEntries[SelectedIndex].UidLeftmostDWord, OnlineAgent.LeaderboardEntries[SelectedIndex].UidRightmostDWord);            
        }
        else
        {
            DukeConsole(Root.Console).DialogMgr.ShowDialogBox(52, self);
        }
    }
    return;
}

function WindowEvent(UWindow.UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
    // End:0x107
    if(int(msg) == int(1))
    {
        // End:0x52
        if((SelectedIndex == (GetEntryAt(Root.MouseX, Root.MouseY))) && ! bCanceled)
        {
            ShowPlayerInfo();            
        }
        else
        {
            // End:0x107
            if(SelectedColumnHeading > 0)
            {
                // End:0x107
                if(GetGearboxEngineGlobals() || OnlineAgent.IsSignedIn())
                {
                    switch(SelectedColumnHeading)
                    {
                        // End:0x90
                        case 4:
                            CurrentLeaderboard = 6;
                            // End:0xC3
                            break;
                        // End:0xA0
                        case 5:
                            CurrentLeaderboard = 8;
                            // End:0xC3
                            break;
                        // End:0xB0
                        case 6:
                            CurrentLeaderboard = 10;
                            // End:0xC3
                            break;
                        // End:0xB5
                        case 3:
                        // End:0xFFFF
                        default:
                            CurrentLeaderboard = 2;
                            // End:0xC3
                            break;
                            break;
                    }
                    DukeConsole(Root.Console).DialogMgr.ShowWaitingDialog(self);
                    OnlineAgent.RefreshLeaderboard(SortState, CurrentLeaderboard);
                }
            }
        }
    }
    super.WindowEvent(msg, C, X, Y, Key);
    return;
}

function DrawShoulderButtons(Canvas C)
{
    ShoulderButtons[0].WinLeft = WinWidth * 0.1;
    ShoulderButtons[0].WinTop = WinHeight * 0.05;
    ShoulderButtons[0].WinWidth = 150 * WinScaleY;
    ShoulderButtons[0].WinHeight = 55 * WinScaleY;
    ShoulderButtons[0].ButtonImageSize = 94;
    ShoulderButtons[1].WinWidth = 150 * WinScaleY;
    ShoulderButtons[1].WinHeight = 55 * WinScaleY;
    ShoulderButtons[1].WinLeft = (WinWidth * 0.9) - (ShoulderButtons[1].WinWidth * 1);
    ShoulderButtons[1].WinTop = WinHeight * 0.05;
    ShoulderButtons[1].ButtonImageSize = 94;
    return;
}

function DrawColumns(Canvas C, float YTop, float YLen)
{
    local float XPadding;
    local int i;

    C.DrawColor = class'UWindowScene'.default.WhiteColor;
    XPadding = WinWidth * 0.14;
    DrawStretchedTexture(C, XPadding, YTop, 8, YLen, VGridLine, 1,,, true);
    XPadding = (RightEdge - (GetAllColumnsWidth())) - ColumnWidth;
    i = 2;
    J0x7F:

    // End:0xDA [Loop If]
    if(i < 7)
    {
        DrawStretchedTexture(C, XPadding, YTop, 8, YLen, VGridLine, 1,,, true);
        XPadding += (StandardSpacing * ColumnWidths[i]);
        ++ i;
        // [Loop Continue]
        goto J0x7F;
    }
    return;
}

function CheckMouseOverAndColorHeading(Canvas C, float EntryY, float EntryHeight, float EntryLeft, int ColumnIndex)
{
    // End:0xA6
    if((((SavedMouseY > EntryY) && SavedMouseY < (EntryY + EntryHeight)) && SavedMouseX >= (EntryLeft - (WinWidth * 0.01))) && SavedMouseX < ((EntryLeft + (StandardSpacing * ColumnWidths[ColumnIndex])) - (WinWidth * 0.01)))
    {
        C.DrawColor = class'UWindowScene'.default.WhiteColor;
        SelectedColumnHeading = ColumnIndex;        
    }
    else
    {
        C.DrawColor = InactiveSortColor;
    }
    return;
}

function DrawHeader(Canvas C, float EntryY)
{
    local float XPadding, RankNameOffset, FontScale, XL, YL;

    FontScale[0] = class'UWindowScene'.default.TTFontScale * HeaderFontScaleX;
    FontScale[1] = class'UWindowScene'.default.TTFontScale * HeaderFontScaleY;
    C.RegisterSound(FontScale[0]);
    C.RegisterSound(FontScale[1]);
    TextSize(C, "A string", XL, YL, FontScale[0], FontScale[1]);
    EntryY = (float(ControlStart) + (RowOffset * 1.2)) - YL;
    RankNameOffset = 20;
    C.DrawColor = class'UWindowScene'.default.GreyColor;
    XPadding = WinWidth * 0.09;
    SelectedColumnHeading = 0;
    ClipText(C, XPadding, EntryY, sRank,, FontScale[0], FontScale[1],, 2);
    XPadding = WinWidth * 0.16;
    ClipText(C, XPadding, EntryY, sName,, FontScale[0], FontScale[1],, 2);
    XPadding = RightEdge - (GetAllColumnsWidth());
    ClipText(C, XPadding, EntryY, sLevel,, FontScale[0], FontScale[1],, 2);
    XPadding += (StandardSpacing * ColumnWidths[2]);
    // End:0x1F9
    if((CurrentLeaderboard == 2) && bCanceled == false)
    {
        C.DrawColor = class'UWindowScene'.default.OrangeColor;        
    }
    else
    {
        CheckMouseOverAndColorHeading(C, EntryY, YL, XPadding, 3);
    }
    ClipText(C, XPadding, EntryY, sXP,, FontScale[0], FontScale[1],, 2);
    XPadding += (StandardSpacing * ColumnWidths[3]);
    // End:0x296
    if((CurrentLeaderboard == 6) && bCanceled == false)
    {
        C.DrawColor = class'UWindowScene'.default.OrangeColor;        
    }
    else
    {
        CheckMouseOverAndColorHeading(C, EntryY, YL, XPadding, 4);
    }
    ClipText(C, XPadding, EntryY, sKDRatio,, FontScale[0], FontScale[1],, 2);
    XPadding += (StandardSpacing * ColumnWidths[4]);
    // End:0x333
    if((CurrentLeaderboard == 8) && bCanceled == false)
    {
        C.DrawColor = class'UWindowScene'.default.OrangeColor;        
    }
    else
    {
        CheckMouseOverAndColorHeading(C, EntryY, YL, XPadding, 5);
    }
    ClipText(C, XPadding, EntryY, sWLRatio,, FontScale[0], FontScale[1],, 2);
    XPadding += (StandardSpacing * ColumnWidths[5]);
    // End:0x3D0
    if((CurrentLeaderboard == 10) && bCanceled == false)
    {
        C.DrawColor = class'UWindowScene'.default.OrangeColor;        
    }
    else
    {
        CheckMouseOverAndColorHeading(C, EntryY, YL, XPadding, 6);
    }
    ClipText(C, XPadding, EntryY, sTimePlayed,, FontScale[0], FontScale[1],, 2);
    return;
}

function string getMaxString(Canvas C, string PlayerName, float Size, float FontScale)
{
    local string tmp;
    local int Index;
    local float XL, YL;

    XL = 0;
    Index = 1;
    J0x12:

    // End:0x86 [Loop If]
    if((XL < Size) && Index < Len(PlayerName))
    {
        tmp = Left(PlayerName, Index);
        tmp = tmp @ "...  ";
        TextSize(C, tmp, XL, YL, FontScale);
        ++ Index;
        // [Loop Continue]
        goto J0x12;
    }
    return tmp;
    return;
}

function DrawAnyLBEntry(Canvas C, float EntryY, int Rank, string PlayerName, int Score, float Kills, float Deaths, float Wins, float Losses, int TimePlayed, bool bHighlight)
{
    local int Hours, Minutes, seconds;
    local string sTimePlayed, sHour, sMin, sSec;
    local Color saveColour;
    local float XL, YL, FontScale, MaxNameWidth;
    local int Level;
    local float XPadding, RankNameOffset, FontScaleXForGamerTag;

    RankNameOffset = 20;
    XPadding = WinWidth * 0.1;
    FontScale = class'UWindowScene'.default.TTFontScale * UnselectedFontScale;
    C.RegisterSound(FontScale);
    // End:0x103
    if(bHighlight)
    {
        FontScale = class'UWindowScene'.default.TTFontScale;
        C.RegisterSound(FontScale);
        TextSize(C, string(Rank), XL, YL,, FontScale);
        saveColour = C.DrawColor;
        class'UWindowScene'.static.DrawSelectionIcon(C, XPadding - float(32), EntryY + (YL / 2), 1, 1, true);
        C.DrawColor = saveColour;
    }
    // End:0x13D
    if(Rank > 0)
    {
        ClipText(C, XPadding, EntryY, string(Rank),, FontScale, FontScale,, 2);        
    }
    else
    {
        ClipText(C, XPadding, EntryY, UnrankedRank,, FontScale, FontScale,, 2);
    }
    XPadding = WinWidth * 0.15;
    MaxNameWidth = ((RightEdge - (GetAllColumnsWidth())) - ColumnWidth) - XPadding;
    TextSize(C, PlayerName, XL, YL, FontScale, FontScale);
    FontScaleXForGamerTag = FontScale;
    // End:0x21D
    if(XL > MaxNameWidth)
    {
        // End:0x204
        if(! ObjectDestroy())
        {
            PlayerName = getMaxString(C, PlayerName, MaxNameWidth, FontScale);            
        }
        else
        {
            FontScaleXForGamerTag = FontScale * (MaxNameWidth / XL);
        }
    }
    ClipText(C, XPadding, EntryY, PlayerName,, FontScaleXForGamerTag, FontScale,, 2);
    XPadding = RightEdge - (GetAllColumnsWidth());
    Level = DukeMultiPlayer(GetPlayerOwner()).PlayerProgress.CalculateLevel(Score);
    // End:0x2BD
    if(Level > 0)
    {
        ClipText(C, XPadding, EntryY, string(Level),, FontScale, FontScale,, 2);
    }
    XPadding += (StandardSpacing * ColumnWidths[2]);
    ClipText(C, XPadding, EntryY, string(Score),, FontScale, FontScale,, 2);
    XPadding += (StandardSpacing * ColumnWidths[3]);
    // End:0x357
    if(Deaths <= float(0))
    {
        ClipText(C, XPadding, EntryY, FloatToString(Kills, 2),, FontScale, FontScale,, 2);        
    }
    else
    {
        ClipText(C, XPadding, EntryY, FloatToString(Kills / Deaths, 2),, FontScale, FontScale,, 2);
    }
    XPadding += (StandardSpacing * ColumnWidths[4]);
    // End:0x3E9
    if(Losses <= float(0))
    {
        ClipText(C, XPadding, EntryY, FloatToString(Wins, 2),, FontScale, FontScale,, 2);        
    }
    else
    {
        ClipText(C, XPadding, EntryY, FloatToString(Wins / Losses, 2),, FontScale, FontScale,, 2);
    }
    XPadding += (StandardSpacing * ColumnWidths[5]);
    Hours = TimePlayed / 3600;
    Minutes = (TimePlayed % 3600) / 60;
    seconds = TimePlayed % 60;
    // End:0x48D
    if(Hours < 10)
    {
        sHour = "0" $ string(Hours);        
    }
    else
    {
        sHour = string(Hours);
    }
    // End:0x4BA
    if(Minutes < 10)
    {
        sMin = "0" $ string(Minutes);        
    }
    else
    {
        sMin = string(Minutes);
    }
    // End:0x4E7
    if(seconds < 10)
    {
        sSec = "0" $ string(seconds);        
    }
    else
    {
        sSec = string(seconds);
    }
    sTimePlayed = (((sHour $ ":") $ sMin) $ ":") $ sSec;
    ClipText(C, XPadding, EntryY, sTimePlayed,, FontScale, FontScale,, 2);
    return;
}

function DrawLBEntry(Canvas C, float EntryY, int Index, int playerRank, bool bHighlight)
{
    local string PlayerName;
    local int Rank, Score, TimePlayed;
    local float Kills, Deaths, Wins, Losses;

    Rank = OnlineAgent.LeaderboardEntries[Index].Rank;
    PlayerName = OnlineAgent.LeaderboardEntries[Index].PlayerName;
    Score = OnlineAgent.LeaderboardEntries[Index].Exp;
    Kills = float(OnlineAgent.LeaderboardEntries[Index].Kills);
    Deaths = float(OnlineAgent.LeaderboardEntries[Index].Deaths);
    Wins = float(OnlineAgent.LeaderboardEntries[Index].Wins);
    Losses = float(OnlineAgent.LeaderboardEntries[Index].Losses);
    TimePlayed = OnlineAgent.LeaderboardEntries[Index].TimePlayedInSeconds;
    // End:0x111
    if(Rank == 0)
    {
        return;
    }
    // End:0x13C
    if(bHighlight)
    {
        C.DrawColor = class'UWindowScene'.default.OrangeColor;        
    }
    else
    {
        // End:0x163
        if(Rank == playerRank)
        {
            C.DrawColor = PlayerEntryColor;            
        }
        else
        {
            C.DrawColor = class'UWindowScene'.default.GreyColor;
        }
    }
    DrawAnyLBEntry(C, EntryY, Rank, PlayerName, Score, Kills, Deaths, Wins, Losses, TimePlayed, bHighlight);
    return;
}

function DrawPlayerEntry(Canvas C, float EntryY)
{
    local string PlayerName;
    local int Rank, Score, TimePlayed;
    local float Kills, Deaths, Wins, Losses;
    local int Hours, Minutes, seconds;
    local string sTimePlayed, sMin, sSec;
    local float XPadding, RankNameOffset;

    RankNameOffset = 20;
    Rank = Min(99999, OnlineAgent.CurrentPlayerLeaderboardData.Rank);
    PlayerName = OnlineAgent.CurrentPlayerLeaderboardData.PlayerName;
    Score = OnlineAgent.CurrentPlayerLeaderboardData.Exp;
    Kills = float(OnlineAgent.CurrentPlayerLeaderboardData.Kills);
    Deaths = float(OnlineAgent.CurrentPlayerLeaderboardData.Deaths);
    Wins = float(OnlineAgent.CurrentPlayerLeaderboardData.Wins);
    Losses = float(OnlineAgent.CurrentPlayerLeaderboardData.Losses);
    TimePlayed = OnlineAgent.CurrentPlayerLeaderboardData.TimePlayedInSeconds;
    DrawAnyLBEntry(C, EntryY, Rank, PlayerName, Score, Kills, Deaths, Wins, Losses, TimePlayed, false);
    return;
}

function MoveSelectionArrow(int Step, bool Down)
{
    // End:0x32
    if(Down)
    {
        ArrowIdx += Step;
        // End:0x2F
        if(ArrowIdx > MaxEntries)
        {
            ArrowIdx = MaxEntries;
        }        
    }
    else
    {
        ArrowIdx -= Step;
        // End:0x50
        if(ArrowIdx < 0)
        {
            ArrowIdx = 0;
        }
    }
    return;
}

function KeyDown(int Key, float X, float Y)
{
    super(UWindowWindow).KeyDown(Key, X, Y);
    switch(Key)
    {
        // End:0x23
        case int(33):
        // End:0x3C
        case int(208):
            GoUp(PageStep - 1,, true);
            // End:0x146
            break;
        // End:0x42
        case int(34):
        // End:0x5B
        case int(209):
            GoDown(PageStep - 1,, true);
            // End:0x146
            break;
        // End:0x61
        case int(38):
        // End:0x71
        case int(200):
            GoUp(1);
            // End:0x146
            break;
        // End:0x8F
        case int(236):
            VScroll.Scroll(-1);
            // End:0x146
            break;
        // End:0xAD
        case int(237):
            VScroll.Scroll(1);
            // End:0x146
            break;
        // End:0xB3
        case int(40):
        // End:0xC3
        case int(201):
            GoDown(1);
            // End:0x146
            break;
        // End:0xC9
        case int(215):
        // End:0xF0
        case int(32):
            ShowFilterDialog();
            GetPlayerOwner().PlaySoundInfo(0, SoundNavigateForwardInfo);
            // End:0x146
            break;
        // End:0xF6
        case int(13):
        // End:0x105
        case int(210):
            ShowPlayerInfo();
            // End:0x146
            break;
        // End:0x124
        case int(36):
            GoUp(string(OnlineAgent.LeaderboardEntries));
            // End:0x146
            break;
        // End:0x143
        case int(35):
            GoDown(string(OnlineAgent.LeaderboardEntries));
            // End:0x146
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

function KeyHold(int Key, float X, float Y)
{
    super(UWindowWindow).KeyHold(Key, X, Y);
    switch(Key)
    {
        // End:0x23
        case int(33):
        // End:0x3C
        case int(208):
            GoUp(PageStep - 1, true, true);
            // End:0x8C
            break;
        // End:0x42
        case int(34):
        // End:0x5B
        case int(209):
            GoDown(PageStep - 1, true, true);
            // End:0x8C
            break;
        // End:0x61
        case int(201):
        // End:0x72
        case int(40):
            GoDown(1, true);
            // End:0x8C
            break;
        // End:0x78
        case int(200):
        // End:0x89
        case int(38):
            GoUp(1, true);
            // End:0x8C
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

function ShowFilterDialog()
{
    local int i;

    // End:0x1DA
    if(GetGearboxEngineGlobals() || OnlineAgent.IsSignedIn())
    {
        msgBox = DukeConsole(Root.Console).DialogMgr.ShowDialogBox(25, self,, FilterSelectionDialogClass);
        UDukeLeaderboardMessageBox(msgBox).AddSortEntry(sXP, string(2));
        UDukeLeaderboardMessageBox(msgBox).AddSortEntry(sKDRatio, string(6));
        UDukeLeaderboardMessageBox(msgBox).AddSortEntry(sWLRatio, string(8));
        UDukeLeaderboardMessageBox(msgBox).AddSortEntry(sTimePlayed, string(10));
        i = UDukeLeaderboardMessageBox(msgBox).SortType.FindItemByValue(string(CurrentLeaderboard));
        // End:0x128
        if(i != -1)
        {
            UDukeLeaderboardMessageBox(msgBox).SortType.SetSelectedIndex(i);            
        }
        else
        {
            UDukeLeaderboardMessageBox(msgBox).SortType.SetSelectedIndex(0);
        }
        i = 0;
        UDukeLeaderboardMessageBox(msgBox).AddFilterTypeEntry(SortAllText, string(++ i));
        UDukeLeaderboardMessageBox(msgBox).AddFilterTypeEntry(SortFriendsText, string(++ i));
        UDukeLeaderboardMessageBox(msgBox).AddFilterTypeEntry(SortNeighboursText, string(++ i));
        UDukeLeaderboardMessageBox(msgBox).FilterType.SetSelectedIndex(int(SortState));
    }
    return;
}

function DukeSuperMessageBoxDone(int Result, Engine.Object.EConsole_Dialog id)
{
    local int SortIdxReturned, TypeIdxReturned;

    Localize(((((string(self) @ "::DukeSuperMessageBoxDone(") @ string(Result)) @ ", ") @ string(DynamicLoadObject(class'EConsole_Dialog', int(id)))) @ ")");
    // End:0x143
    if(int(id) == int(25))
    {
        // End:0x7B
        if(! GetGearboxEngineGlobals() && ! OnlineAgent.IsSignedIn())
        {
            return;
        }
        TypeIdxReturned = UDukeLeaderboardMessageBox(msgBox).GetSelectedSortType();
        SortIdxReturned = UDukeLeaderboardMessageBox(msgBox).GetSelectedFilterType();
        // End:0xD4
        if(SortIdxReturned != int(SortState))
        {
            SetSortState(SortIdxReturned);
            bRefreshing = true;
        }
        // End:0xF6
        if(TypeIdxReturned != CurrentLeaderboard)
        {
            CurrentLeaderboard = TypeIdxReturned;
            bRefreshing = true;
        }
        // End:0x143
        if(bRefreshing)
        {
            DukeConsole(Root.Console).DialogMgr.ShowWaitingDialog(self);
            OnlineAgent.RefreshLeaderboard(SortState, CurrentLeaderboard);
        }
    }
    // End:0x1B3
    if(int(id) == int(3))
    {
        // End:0x1A0
        if(Result == 0)
        {
            DukeConsole(Root.Console).DialogMgr.ShowWaitingForResponseDialog();
            OnlineAgent.StopAsyncLeaderboardOperations();
            bCanceled = true;            
        }
        else
        {
            // End:0x1B3
            if(Result == 1)
            {
                bCanceled = false;
            }
        }
    }
    return;
}

function Tick(float Delta)
{
    local bool bConnected;
    local int i;

    super.Tick(Delta);
    // End:0x41
    if((GetGearboxEngineGlobals() && bRefreshing) && ! OnlineAgent.IsWaitingForResponse())
    {
        bRefreshing = false;
        OnRefreshed();
    }
    // End:0x11B
    if(! bRefreshing || bCanceled)
    {
        bConnected = OnlineAgent.IsSignedIn();
        // End:0x10E
        if(bWasConnected && ! bConnected)
        {
            DukeConsole(Root.Console).DialogMgr.CloseAllDialogs();
            // End:0xE2
            if(ObjectDestroy())
            {
                DukeConsole(Root.Console).DialogMgr.ShowDialogBox(50, self);                
            }
            else
            {
                DukeConsole(Root.Console).DialogMgr.ShowDialogBox(47, self);
            }
        }
        bWasConnected = bConnected;
    }
    // End:0x1F7
    if(! GetPlayerOwner().GetSpeakerType() && (msgBox != none) || ! msgBox.bWindowVisible)
    {
        // End:0x1F7
        if((SavedMouseX != Root.MouseX) || SavedMouseY != Root.MouseY)
        {
            SavedMouseX = Root.MouseX;
            SavedMouseY = Root.MouseY;
            i = GetEntryAt(Root.MouseX, Root.MouseY);
            // End:0x1F7
            if(i != -1)
            {
                SelectedIndex = i;
                return;
            }
        }
    }
    return;
}

function float GetAllColumnsWidth()
{
    local int i;
    local float RetVal;

    i = 2;
    J0x08:

    // End:0x3B [Loop If]
    if(i < string(ColumnWidths))
    {
        RetVal += (StandardSpacing * ColumnWidths[i]);
        ++ i;
        // [Loop Continue]
        goto J0x08;
    }
    return RetVal;
    return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
    super.NotifyFromControl(C, E);
    // End:0x50
    if(int(E) == 2)
    {
        // End:0x38
        if(C != KeyButtons[0])
        {
            ShowPlayerInfo();            
        }
        else
        {
            // End:0x50
            if(C != KeyButtons[1])
            {
                NavigateBack();
            }
        }
    }
    return;
}

defaultproperties
{
    MaxEntries=10
    PaintRangeBottom=8
    SortState=1
    SortFriendsText="<?int?dnWindow.UDukeSceneLeaderboard.SortFriendsText?>"
    SortNeighboursText="<?int?dnWindow.UDukeSceneLeaderboard.SortNeighboursText?>"
    SortAllText="<?int?dnWindow.UDukeSceneLeaderboard.SortAllText?>"
    PageStep=8
    NextPageString="<?int?dnWindow.UDukeSceneLeaderboard.NextPageString?>"
    PrevPageString="<?int?dnWindow.UDukeSceneLeaderboard.PrevPageString?>"
    LBTitle="<?int?dnWindow.UDukeSceneLeaderboard.LBTitle?>"
    Rank="<?int?dnWindow.UDukeSceneLeaderboard.Rank?>"
    arrowTex='Menu.Menu.Backdrop'
    ArrowRegion=(X=235,Y=72,W=28,h=40)
    PlayerEntryColor=(R=153,G=204,B=255,A=0)
    InactiveSortColor=(R=200,G=180,B=160,A=0)
    sRank="<?int?dnWindow.UDukeSceneLeaderboard.sRank?>"
    sName="<?int?dnWindow.UDukeSceneLeaderboard.sName?>"
    sLevel="<?int?dnWindow.UDukeSceneLeaderboard.sLevel?>"
    sXP="<?int?dnWindow.UDukeSceneLeaderboard.sXP?>"
    sKDRatio="<?int?dnWindow.UDukeSceneLeaderboard.sKDRatio?>"
    sWLRatio="<?int?dnWindow.UDukeSceneLeaderboard.sWLRatio?>"
    sTimePlayed="<?int?dnWindow.UDukeSceneLeaderboard.sTimePlayed?>"
    UnrankedRank="<?int?dnWindow.UDukeSceneLeaderboard.UnrankedRank?>"
    UnselectedFontScale=0.8
    VGridLine='Menu.MP.Divider_Vert'
    HGridLine='Menu.MP.divider_horiz'
    ColumnWidths(0)=0
    ColumnWidths(1)=0
    ColumnWidths(2)=0.8
    ColumnWidths(3)=1.1
    ColumnWidths(4)=0.8
    ColumnWidths(5)=0.8
    ColumnWidths(6)=1
    HeaderFontScaleX=1
    HeaderFontScaleY=1
    HeaderOffsetY=20
    FilterSelectionDialogClass='UDukeLeaderboardMessageBox'
    LineBottomY=610
    TitleText="<?int?dnWindow.UDukeSceneLeaderboard.TitleText?>"
}