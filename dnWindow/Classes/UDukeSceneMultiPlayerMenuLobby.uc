/*******************************************************************************
 * UDukeSceneMultiPlayerMenuLobby generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneMultiPlayerMenuLobby extends UWindowScene
    dependson(UDukeLobbyChat);

var UDukeMenuButton TeamSwitchButton;
var localized string TeamSwitchButtonText;
var UDukeMenuButton ReadyButton;
var localized string ReadyButtonText;
var localized string UnReadyButtonText;
var UDukeMenuButton StartButton;
var localized string StartButtonText;
var localized string InviteFriend;
var localized string InviteParty;
var localized string KickPlayer;
var localized string KickPlayerCallout;
var localized string ShowGamerCardString;
var localized string GameStarting;
var localized string GameCountdown;
var localized string GameTypeLabelStr;
var localized string MapNameLabelStr;
var localized string MutatorNameLabelStr;
var float StoredCountdown;
var bool bPlayedCountDownSound;
var string GameTypeStr;
var string MapNameStr;
var string MutatorNameStr;
var float TeamSwitchGhettoTimer;
var float TeamSwitchDisabledTime;
var bool bRenderTeamStyle;
var Texture PrivateGameLockIcon;
var UDukeLobbyPlayerStateList PlayerList;
var Color GoldColor;
var SSoundInfo ReadyCheckboxInfo;
var SSoundInfo CountdownSoundInfo;
var SSoundInfo MPLobbyAmbienceSoundInfo;
var Region LockIconTextureRegion;
var float TitlePosPct;
var float PLLeftPct;
var float PLTopPct;
var float PLHeightPct;
var float PLWidthPct;
var float PLWidthHostPct;
var float GameInfoXStartPct;
var float GameInfoYStartPct;
var float GIFontScale;
var float StartButtonTopPct;
var bool bReady;
var int KeyButton_RB;
var bool bJustOpened;
var int MaxPlayers;
var float calloutFontScale;
var UDukeLobbyChat LobbyChat;
var bool bMakeRoomForLobbyChat;
var float newLobbyBoundLeft;
var float newLobbyBoundRight;
var float newLobbyBoundTop;
var float newLobbyBoundBottom;
var float newLobbyHeaderBottom;
var float newLobbyPLTop;
var float newLobbyPLLeft;
var float newLobbyChatTop;
var float newLobbyChatRight;
var float GameInfoYStartPct_w_chat;
var float HorizontalTextBuffer;

function Created()
{
    super.Created();
    // End:0x51
    if(! ObjectDestroy())
    {
        bMakeRoomForLobbyChat = true;
        LobbyChat = UDukeLobbyChat(CreateWindow(class'UDukeLobbyChat', 1, 1, 1, 1));
        LobbyChat.Register(self);
    }
    PlayerList = UDukeLobbyPlayerStateList(CreateWindow(class'UDukeLobbyPlayerStateList', 1, 1, 1, 1));
    PlayerList.Register(self);
    StartButton = UDukeMenuNavigationButton(CreateWindow(class'UDukeMenuNavigationButton', 1, 1, 1, 1));
    StartButton.Register(self);
    ReadyButton = UDukeMenuNavigationButton(CreateWindow(class'UDukeMenuNavigationButton', 1, 1, 1, 1));
    ReadyButton.Register(self);
    TeamSwitchButton = UDukeMenuNavigationButton(CreateWindow(class'UDukeMenuNavigationButton', 1, 1, 1, 1));
    TeamSwitchButton.Register(self);
    StartButton.SetText(StartButtonText);
    ReadyButton.SetText(ReadyButtonText);
    TeamSwitchButton.SetText(TeamSwitchButtonText);
    ReadyButton.ShowWindow();
    StartButton.ShowWindow();
    TeamSwitchButton.ShowWindow();
    FirstControlToFocus = ReadyButton;
    // End:0x214
    if(bMakeRoomForLobbyChat)
    {
        ReadyButton.NavRight = PlayerList;
        TeamSwitchButton.NavRight = PlayerList;
        StartButton.NavRight = PlayerList;
        PlayerList.NavLeft = ReadyButton;
    }
    TeamSwitchButton.NavDown = ReadyButton;
    ReadyButton.NavUp = TeamSwitchButton;
    StartButton.NavUp = ReadyButton;
    ReadyButton.NavDown = StartButton;
    PlayerList.NavUp = StartButton;
    StartButton.NavDown = PlayerList;
    KeyButtons[0].setFontScale(calloutFontScale);
    KeyButtons[0].bDo480FontScale = false;
    KeyButtons[1].SetText(ClassIsChildOf("UDukeSceneMainMenu", "QuitTitle", "dnWindow"));
    KeyButtons[1].setFontScale(calloutFontScale);
    KeyButtons[1].bDo480FontScale = false;
    KeyButtons[2].HideWindow();
    KeyButtons[2].SetText(KickPlayerCallout);
    KeyButtons[2].setFontScale(calloutFontScale);
    KeyButtons[2].bDo480FontScale = false;
    KeyButton_RB = 3 + 1;
    KeyButtons[KeyButton_RB].XBoxButtonRegion = KeyButtons[KeyButton_RB].RTButton;
    KeyButtons[KeyButton_RB].PCInputKey = int(77);
    KeyButtons[KeyButton_RB].PCButton = "M";
    KeyButtons[KeyButton_RB].HideWindow();
    KeyButtons[KeyButton_RB].setFontScale(calloutFontScale);
    KeyButtons[KeyButton_RB].bDo480FontScale = false;
    // End:0x46C
    if(UDukeRootWindow(Root).AgentOnline.IsInParty())
    {
        KeyButtons[3].SetText(InviteParty);        
    }
    else
    {
        KeyButtons[3].SetText(InviteFriend);
    }
    KeyButtons[3].ShowWindow();
    KeyButtons[3].PCInputKey = int(89);
    KeyButtons[3].setFontScale(calloutFontScale);
    KeyButtons[3].bDo480FontScale = false;
    PlayerList.__ToggleReadyButton__Delegate = self.ToggleReadyButton;
    PlayerList.__ToggleKickPlayerButton__Delegate = self.ToggleKickPlayerButton;
    // End:0x52B
    if(bMakeRoomForLobbyChat)
    {
        PlayerList.bUsePCIconLocations = true;
    }
    FirstControlToFocus = ReadyButton;
    bSuppressSoundOnNavForward = true;
    Root.SelectBackgroundMovie();
    return;
}

function OnNavForward()
{
    UpdateGameInfoText();
    FirstControlToFocus = ReadyButton;
    ChildInFocus = ReadyButton;
    PlayerList.ChildInFocus = none;
    ResetHelpButtons();
    UDukeRootWindow(Root).AgentOnline.ReadyUp(false);
    ToggleReadyButton(false);
    MaxPlayers = UDukeRootWindow(Root).OnlineAgent.GetGameMaxPlayers();
    GetPlayerOwner().StopSoundInfo(SoundMenuAmbience);
    GetPlayerOwner().PlaySoundInfo(0, MPLobbyAmbienceSoundInfo);
    bJustOpened = true;
    // End:0xCE
    if(bMakeRoomForLobbyChat)
    {
        LobbyChat.Reset();
    }
    return;
}

function PostRestoreKeyButtons()
{
    // End:0x2D
    if(bJustOpened || PlayerList.bKillChildInFocus)
    {
        bJustOpened = false;
        ToggleKickPlayerButton(false);
    }
    return;
}

function NavigateBack()
{
    super.NavigateBack();
    // End:0x1F
    if(bMakeRoomForLobbyChat)
    {
        LobbyChat.Reset();
    }
    DukeConsole(Root.Console).DialogMgr.CloseDialogBoxByID(19);
    DukeConsole(Root.Console).DialogMgr.CloseDialogBoxByID(23);
    return;
}

function UpdateGameInfoText()
{
    local int i;
    local OnlineAgent Online;
    local class<GameInfo> GameTypeClass;
    local class<Mutator> MutatorTypeClass;

    Online = UDukeRootWindow(Root).AgentOnline;
    i = 0;
    J0x21:

    // End:0xA9 [Loop If]
    if(i < string(class'MPMapInfo'.default.MapList))
    {
        // End:0x9F
        if(class'MPMapInfo'.default.MapList[i].id == Online.CurrentMapId)
        {
            MapNameStr = ClassIsChildOf("MapNames", class'MPMapInfo'.default.MapList[i].MapName, "Maps");
            // [Explicit Break]
            goto J0xA9;
        }
        ++ i;
        // [Loop Continue]
        goto J0x21;
    }
    J0xA9:

    i = 0;
    J0xB0:

    // End:0x17F [Loop If]
    if(i < string(class'MPMapInfo'.default.GameTypes))
    {
        // End:0x175
        if(class'MPMapInfo'.default.GameTypes[i].id == Online.CurrentGameModeId)
        {
            GameTypeClass = class<GameInfo>(SaveConfigFile(class'MPMapInfo'.default.GameTypes[i].EntryName, class'Class'));
            GameTypeStr = GameTypeClass.default.GameName;
            PlayerList.bRenderTeamStyle = GameTypeClass.default.bTeamGame;
            bRenderTeamStyle = GameTypeClass.default.bTeamGame;
            // [Explicit Break]
            goto J0x17F;
        }
        ++ i;
        // [Loop Continue]
        goto J0xB0;
    }
    J0x17F:

    i = 0;
    J0x186:

    // End:0x242 [Loop If]
    if(i < string(class'MPMapInfo'.default.MutatorTypes))
    {
        // End:0x238
        if(class'MPMapInfo'.default.MutatorTypes[i].id == Online.CurrentMutatorId)
        {
            MutatorTypeClass = class<Mutator>(SaveConfigFile(class'MPMapInfo'.default.MutatorTypes[i].EntryName, class'Class', true));
            // End:0x220
            if(MutatorTypeClass == none)
            {
                MutatorNameStr = MutatorTypeClass.default.MutatorName;                
            }
            else
            {
                MutatorNameStr = class'UDukeSceneMPPrivateMatch'.default.MutatatorNoneText;
            }
            // [Explicit Break]
            goto J0x242;
        }
        ++ i;
        // [Loop Continue]
        goto J0x186;
    }
    J0x242:

    return;
}

function SetupButtons(Canvas C)
{
    ReadyButton.WinWidth = float(ButtonWidth) / 2;
    ReadyButton.WinHeight = float(ButtonHeight);
    StartButton.WinWidth = float(ButtonWidth) / 2;
    StartButton.WinHeight = float(ButtonHeight);
    TeamSwitchButton.WinWidth = float(ButtonWidth) / 2;
    TeamSwitchButton.WinHeight = float(ButtonHeight);
    // End:0x39C
    if(UDukeRootWindow(Root).AgentOnline.IsHost())
    {
        // End:0x219
        if(! bMakeRoomForLobbyChat)
        {
            StartButton.WinLeft = (float(C.SizeX) * 0.925) - StartButton.WinWidth;
            StartButton.WinTop = (float(C.SizeY) * StartButtonTopPct) - StartButton.WinHeight;
            ReadyButton.WinLeft = (float(C.SizeX) * 0.925) - ReadyButton.WinWidth;
            ReadyButton.WinTop = (StartButton.WinTop - ReadyButton.WinHeight) - float(ControlBuffer);
            TeamSwitchButton.WinLeft = (float(C.SizeX) * 0.925) - ReadyButton.WinWidth;
            TeamSwitchButton.WinTop = (ReadyButton.WinTop - TeamSwitchButton.WinHeight) - float(ControlBuffer);            
        }
        else
        {
            StartButton.WinLeft = float(C.SizeX) * newLobbyBoundLeft;
            StartButton.WinTop = (float(C.SizeY) * newLobbyChatTop) - StartButton.WinHeight;
            ReadyButton.WinLeft = float(C.SizeX) * newLobbyBoundLeft;
            ReadyButton.WinTop = (StartButton.WinTop - ReadyButton.WinHeight) - float(ControlBuffer);
            TeamSwitchButton.WinLeft = float(C.SizeX) * newLobbyBoundLeft;
            TeamSwitchButton.WinTop = (ReadyButton.WinTop - TeamSwitchButton.WinHeight) - float(ControlBuffer);
        }
        // End:0x389
        if(UDukeRootWindow(Root).AgentOnline.ShouldShowCountdownTimer())
        {
            // End:0x376
            if(StartButton.WindowIsVisible())
            {
                ChildInFocus = ReadyButton;
            }
            StartButton.HideWindow();            
        }
        else
        {
            StartButton.ShowWindow();
        }        
    }
    else
    {
        StartButton.HideWindow();
        // End:0x481
        if(! bMakeRoomForLobbyChat)
        {
            ReadyButton.WinLeft = (float(C.SizeX) * 0.925) - ReadyButton.WinWidth;
            ReadyButton.WinTop = (float(C.SizeY) * StartButtonTopPct) - ReadyButton.WinHeight;
            TeamSwitchButton.WinLeft = ReadyButton.WinLeft;
            TeamSwitchButton.WinTop = (ReadyButton.WinTop - TeamSwitchButton.WinHeight) - float(ControlBuffer);            
        }
        else
        {
            ReadyButton.WinLeft = float(C.SizeX) * newLobbyBoundLeft;
            ReadyButton.WinTop = (float(C.SizeY) * newLobbyChatTop) - ReadyButton.WinHeight;
            TeamSwitchButton.WinLeft = float(C.SizeX) * newLobbyBoundLeft;
            TeamSwitchButton.WinTop = (ReadyButton.WinTop - TeamSwitchButton.WinHeight) - float(ControlBuffer);
        }
    }
    // End:0x55D
    if(! bRenderTeamStyle)
    {
        TeamSwitchButton.HideWindow();        
    }
    else
    {
        TeamSwitchButton.ShowWindow();
    }
    return;
}

function FixCallouts()
{
    // End:0x3D
    if(UDukeRootWindow(Root).AgentOnline.IsInParty())
    {
        KeyButtons[3].SetText(InviteParty);        
    }
    else
    {
        KeyButtons[3].SetText(InviteFriend);
    }
    // End:0x92
    if((string(PlayerList.PlayerList) < MaxPlayers) && ! bIsHidingKeyButtons)
    {
        KeyButtons[3].ShowWindow();        
    }
    else
    {
        KeyButtons[3].HideWindow();
    }
    // End:0xFB
    if(bMakeRoomForLobbyChat)
    {
        // End:0xE9
        if(LobbyChat.bTyping)
        {
            KeyButtons[3].HideWindow();
            KeyButtons[0].HideWindow();            
        }
        else
        {
            KeyButtons[0].ShowWindow();
        }
    }
    return;
}

function Paint(Canvas C, float MouseX, float MouseY)
{
    local Font OldFont;
    local float XL, YL, xOffset, YOffset, Padding, CountdownTime;

    local string TimeString;
    local DukePlayer P;
    local string S;
    local float GameInfoTextXOffset, GameInfoTextYOffset, FontScale, PlayerListWidthPct;
    local OnlineAgent l_Online;

    FixCallouts();
    super.Paint(C, MouseX, MouseY);
    P = DukePlayer(GetPlayerOwner());
    // End:0x3A
    if(P != none)
    {
        return;
    }
    // End:0xB8
    if(bMakeRoomForLobbyChat)
    {
        DrawBackgroundBox(C, float(C.SizeX) * newLobbyBoundLeft, float(C.SizeY) * newLobbyBoundTop, (newLobbyBoundRight - newLobbyBoundLeft) * float(C.SizeX), (newLobbyHeaderBottom - newLobbyBoundTop) * float(C.SizeY));
    }
    UpdateGameInfoText();
    OldFont = C.Font;
    C.Font = C.TallFont;
    C.DrawColor = GreyColor;
    Padding = 0;
    SetupButtons(C);
    GameInfoTextXOffset = float(C.SizeX) * GameInfoXStartPct;
    // End:0x165
    if(! bMakeRoomForLobbyChat)
    {
        GameInfoTextYOffset = float(C.SizeY) * GameInfoYStartPct;        
    }
    else
    {
        GameInfoTextYOffset = float(C.SizeY) * GameInfoYStartPct_w_chat;
    }
    FontScale = TTFontScale * GIFontScale;
    TextSize(C, GameTypeLabelStr $ GameTypeStr, XL, YL, FontScale, FontScale);
    ClipText(C, GameInfoTextXOffset, GameInfoTextYOffset, GameTypeLabelStr $ GameTypeStr,, FontScale, FontScale,, 2);
    l_Online = OnlineAgent(class'Engine'.static.ClearInput());
    // End:0x28D
    if((l_Online == none) && l_Online.IsPrivateMatch())
    {
        DrawStretchedTextureSegment(C, GameInfoTextXOffset - YL, GameInfoTextYOffset, YL, YL, float(LockIconTextureRegion.X), float(LockIconTextureRegion.Y), float(LockIconTextureRegion.W), float(LockIconTextureRegion.h), PrivateGameLockIcon, 1,,,,, true);
    }
    // End:0x2A7
    if(! bMakeRoomForLobbyChat)
    {
        GameInfoTextYOffset += YL;        
    }
    else
    {
        GameInfoTextXOffset += (XL + (HorizontalTextBuffer * float(C.SizeX)));
    }
    TextSize(C, MapNameLabelStr $ MapNameStr, XL, YL, FontScale, FontScale);
    ClipText(C, GameInfoTextXOffset, GameInfoTextYOffset, MapNameLabelStr $ MapNameStr,, FontScale, FontScale,, 2);
    // End:0x345
    if(! bMakeRoomForLobbyChat)
    {
        GameInfoTextYOffset += YL;        
    }
    else
    {
        GameInfoTextXOffset += (XL + (HorizontalTextBuffer * float(C.SizeX)));
    }
    ClipText(C, GameInfoTextXOffset, GameInfoTextYOffset, MutatorNameLabelStr $ MutatorNameStr,, FontScale, FontScale,, 2);
    // End:0x452
    if(! bMakeRoomForLobbyChat)
    {
        PlayerListWidthPct = PLWidthHostPct;
        PlayerList.WinLeft = float(C.SizeX) * PLLeftPct;
        PlayerList.WinWidth = float(C.SizeX) * PlayerListWidthPct;
        PlayerList.WinTop = PLTopPct * float(C.SizeY);
        PlayerList.WinHeight = PLHeightPct * float(C.SizeY);        
    }
    else
    {
        PlayerListWidthPct = newLobbyBoundRight - newLobbyPLLeft;
        PlayerList.WinLeft = float(C.SizeX) * newLobbyPLLeft;
        PlayerList.WinWidth = float(C.SizeX) * PlayerListWidthPct;
        PlayerList.WinTop = newLobbyPLTop * float(C.SizeY);
        PlayerList.WinHeight = (newLobbyBoundBottom - newLobbyPLTop) * float(C.SizeY);
        LobbyChat.WinLeft = float(C.SizeX) * newLobbyBoundLeft;
        LobbyChat.WinTop = float(C.SizeY) * newLobbyChatTop;
        LobbyChat.WinWidth = float(C.SizeX) * (newLobbyChatRight - newLobbyBoundLeft);
        LobbyChat.WinHeight = float(C.SizeY) * (newLobbyBoundBottom - newLobbyChatTop);
    }
    // End:0x793
    if(UDukeRootWindow(Root).AgentOnline.ShouldShowCountdownTimer())
    {
        CountdownTime = UDukeRootWindow(Root).AgentOnline.GetCountdownTime();
        // End:0x622
        if((CountdownTime <= 5) && int(CountdownTime) != int(StoredCountdown))
        {
            bPlayedCountDownSound = false;
        }
        // End:0x658
        if(! bPlayedCountDownSound)
        {
            bPlayedCountDownSound = true;
            GetPlayerOwner().PlaySoundInfo(0, CountdownSoundInfo);
            StoredCountdown = CountdownTime;
        }
        // End:0x683
        if(CountdownTime > float(0))
        {
            S = GameCountdown $ string(int(CountdownTime + 0.999));            
        }
        else
        {
            DukeConsole(Root.Console).DialogMgr.CloseAllDialogs();
            S = GameStarting;
        }
        TextSize(C, GameStarting, XL, YL, TTFontScale, TTFontScale);
        // End:0x736
        if(! bMakeRoomForLobbyChat)
        {
            ClipText(C, PlayerList.WinWidth - XL, PlayerList.WinTop - YL, S, false, TTFontScale, TTFontScale,, 2);            
        }
        else
        {
            ClipText(C, (newLobbyBoundRight * float(C.SizeX)) - (XL * 1.1), newLobbyBoundBottom * float(C.SizeY), S, false, TTFontScale, TTFontScale,, 2);
        }
    }
    C.Font = OldFont;
    return;
}

function WindowEvent(UWindow.UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
    local Engine.Object.EInputKey EI_Key;

    // End:0xD1
    if(bMakeRoomForLobbyChat)
    {
        // End:0x2F
        if(int(msg) == int(7))
        {
            LobbyChat.KeyEvent(Key);            
        }
        else
        {
            // End:0x52
            if(int(msg) == int(0))
            {
                CheckClickForTyping(C, X, Y);
            }
        }
        // End:0xD1
        if((int(msg) == int(7)) && Key == int(Root.Console.9))
        {
            // End:0xB4
            if(UDukeLobbyChat(ChildInFocus) == none)
            {
                LobbyChat.bTyping = false;
                ChildInFocus = ReadyButton;                
            }
            else
            {
                LobbyChat.bTyping = true;
                ChildInFocus = LobbyChat;
            }
        }
    }
    // End:0x17C
    if((int(msg) == int(7)) && ((Key == int(Root.Console.27)) || Key == int(Root.Console.205)) || Key == int(Root.Console.211))
    {
        DukeConsole(Root.Console).DialogMgr.ShowDialogBox(19, self,,, true);
        return;        
    }
    else
    {
        // End:0x1BD
        if((int(msg) == int(7)) && Key == KeyButtons[3].PCInputKey)
        {
            KeyButtons[3].Notify(21);
        }
    }
    super.WindowEvent(msg, C, X, Y, Key);
    return;
}

function CheckClickForTyping(Canvas C, float X, float Y)
{
    // End:0x73
    if((((X >= (newLobbyBoundLeft * WinWidth)) && X <= (newLobbyChatRight * WinWidth)) && Y >= (newLobbyChatTop * WinHeight)) && Y <= (newLobbyBoundBottom * WinHeight))
    {
        LobbyChat.bTyping = true;        
    }
    else
    {
        LobbyChat.bTyping = false;
    }
    return;
}

function Tick(float Delta)
{
    local SAgentPlayer Player;
    local int i, NumPlayersReady, NumPlayersNotReady;

    super.Tick(Delta);
    // End:0x64
    if(TeamSwitchButton.GreyedOut() && ! bReady)
    {
        TeamSwitchGhettoTimer += Delta;
        // End:0x61
        if(TeamSwitchGhettoTimer >= TeamSwitchDisabledTime)
        {
            TeamSwitchGhettoTimer = 0;
            TeamSwitchButton.Ungrey();
        }        
    }
    else
    {
        TeamSwitchGhettoTimer = 0;
    }
    // End:0x1B6
    if(((string(PlayerList.PlayerList) > 2) && UDukeRootWindow(Root).AgentOnline.IsHost()) && ! UDukeRootWindow(Root).AgentOnline.ShouldShowCountdownTimer())
    {
        NumPlayersReady = 0;
        NumPlayersNotReady = 0;
        UDukeRootWindow(Root).AgentOnline.GetLocalAgentPlayer(Player);
        i = 0;
        J0x109:

        // End:0x188 [Loop If]
        if(i < string(PlayerList.PlayerList))
        {
            // End:0x14F
            if(PlayerList.PlayerList[i].PlayerRef == Player.PlayerRef)
            {
                // [Explicit Continue]
                goto J0x17E;
            }
            // End:0x177
            if(PlayerList.PlayerList[i].IsReady)
            {
                ++ NumPlayersReady;
                // [Explicit Continue]
                goto J0x17E;
            }
            ++ NumPlayersNotReady;
            J0x17E:

            ++ i;
            // [Loop Continue]
            goto J0x109;
        }
        // End:0x1B6
        if(NumPlayersReady > NumPlayersNotReady)
        {
            UDukeRootWindow(Root).AgentOnline.AgentStartGame();
        }
    }
    // End:0x211
    if(UDukeRootWindow(Root).bIsInvitedChatRestrict)
    {
        DukeConsole(Root.Console).DialogMgr.ShowDialogBox(18, self);
        UDukeRootWindow(Root).bIsInvitedChatRestrict = false;
    }
    return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
    local SAgentPlayer l_LocalPlayer;

    // End:0x22
    if(C == KeyButtons[1])
    {
        super.NotifyFromControl(C, E);
    }
    switch(E)
    {
        // End:0x2AA
        case 2:
            switch(C)
            {
                // End:0x103
                case ReadyButton:
                    UDukeRootWindow(Root).AgentOnline.GetLocalAgentPlayer(l_LocalPlayer);
                    bReady = ! l_LocalPlayer.IsReady;
                    ToggleReadyButton(bReady);
                    // End:0xAA
                    if(bReady && bRenderTeamStyle)
                    {
                        TeamSwitchButton.GreyOut();                        
                    }
                    else
                    {
                        // End:0xC3
                        if(bRenderTeamStyle)
                        {
                            TeamSwitchButton.Ungrey();
                        }
                    }
                    UDukeRootWindow(Root).AgentOnline.ReadyUp(bReady);
                    GetPlayerOwner().PlaySoundInfo(0, ReadyCheckboxInfo);
                    // End:0x2A7
                    break;
                // End:0x145
                case StartButton:
                    UDukeRootWindow(Root).AgentOnline.AgentStartGame();
                    GetPlayerOwner().PlaySoundInfo(0, ReadyCheckboxInfo);
                    // End:0x2A7
                    break;
                // End:0x181
                case KeyButtons[1]:
                    DukeConsole(Root.Console).DialogMgr.ShowDialogBox(19, self,,, true);
                    // End:0x2A7
                    break;
                // End:0x1CD
                case KeyButtons[0]:
                    // End:0x1CA
                    if(PlayerList != ChildInFocus)
                    {
                        UDukeRootWindow(Root).AgentOnline.ShowGamerCard(PlayerList.getCurrentSelectionPlayerRef());
                    }
                    // End:0x2A7
                    break;
                // End:0x1EE
                case KeyButtons[KeyButton_RB]:
                    PlayerList.muteSelectedPlayer();
                    // End:0x2A7
                    break;
                // End:0x2A4
                case TeamSwitchButton:
                    // End:0x238
                    if(PlayerList.teamsBalanced())
                    {
                        DukeConsole(Root.Console).DialogMgr.ShowDialogBox(24, self);                        
                    }
                    else
                    {
                        // End:0x2A1
                        if(! TeamSwitchButton.GreyedOut() && ! bReady)
                        {
                            UDukeRootWindow(Root).AgentOnline.RequestChangeTeam();
                            TeamSwitchButton.GreyOut();
                            GetPlayerOwner().PlaySoundInfo(0, ReadyCheckboxInfo);
                        }
                    }
                    // End:0x2A7
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            // End:0x510
            break;
        // End:0x2E1
        case 19:
            DukeConsole(Root.Console).DialogMgr.ShowDialogBox(19, self,,, true);
            // End:0x510
            break;
        // End:0x36C
        case 21:
            // End:0x307
            if(bMakeRoomForLobbyChat && LobbyChat.bTyping)
            {
                // [Explicit Continue]
                goto J0x510;
            }
            // End:0x369
            if(string(PlayerList.PlayerList) < MaxPlayers)
            {
                DukeConsole(Root.Console).DialogMgr.ShowWaitingForResponseDialog();
                UDukeRootWindow(Root).AgentOnline.ShowSystemInviteUI();
            }
            // End:0x510
            break;
        // End:0x371
        case 17:
        // End:0x4D5
        case 12:
            Localize((((string(self) @ "DE_MouseEnter[") @ string(C)) @ "]  What is childFocus?:") @ string(ChildInFocus));
            // End:0x3E7
            if(UDukeVoIPCheckbox(C) == none)
            {
                C = UDukeLobbyPlayerStateList(C.ParentWindow);
            }
            // End:0x446
            if(UDukeLobbyPlayerStateList(C) == none)
            {
                KeyButtons[0].SetText(ShowGamerCardString);
                KeyButtons[3].SetText(KickPlayer);
                ToggleKickPlayerButton(true);
                UDukeLobbyPlayerStateList(C).NavDownFirstPlayer();                
            }
            else
            {
                ToggleKickPlayerButton(false);
            }
            // End:0x492
            if(C.ClassForName('UDukeMenuButton') && ! C.ClassForName('UDukeLobbyMenuButton'))
            {
                ResetHelpButtons();
                PlayerList.ChildInFocus = none;
            }
            // End:0x4D2
            if(bMakeRoomForLobbyChat)
            {
                // End:0x4C0
                if(UDukeLobbyChat(C) == none)
                {
                    PlayerList.ChildInFocus = none;                    
                }
                else
                {
                    LobbyChat.bTyping = false;
                }
            }
            // End:0x510
            break;
        // End:0x4DA
        case 18:
        // End:0x50D
        case 9:
            // End:0x50A
            if(UDukeVoIPCheckbox(C) == none)
            {
                C = UDukeLobbyPlayerStateList(C.ParentWindow);
            }
            // End:0x510
            break;
        // End:0xFFFF
        default:
            break;
    }
    J0x510:

    return;
}

function ResetHelpButtons()
{
    KeyButtons[0].SetText(SelectText);
    KeyButtons[2].HideWindow();
    // End:0x67
    if(UDukeRootWindow(Root).AgentOnline.IsInParty())
    {
        KeyButtons[3].SetText(InviteParty);        
    }
    else
    {
        KeyButtons[3].SetText(InviteFriend);
    }
    return;
}

function ToggleReadyButton(bool IsReady)
{
    // End:0x21
    if(IsReady)
    {
        ReadyButton.SetText(UnReadyButtonText);        
    }
    else
    {
        ReadyButton.SetText(ReadyButtonText);
    }
    return;
}

function ToggleKickPlayerButton(bool bShow)
{
    // End:0x56
    if((bShow && UDukeRootWindow(Root).AgentOnline.IsHost()) && GetPlayerOwner().GetSpeakerType())
    {
        KeyButtons[2].ShowWindow();        
    }
    else
    {
        KeyButtons[2].HideWindow();
    }
    return;
}

function string TwoDigitString(int Num)
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

simulated function string GetTime(int ElapsedTime)
{
    local string S;
    local int seconds, Minutes, Hours;

    seconds = ElapsedTime;
    Minutes = seconds / 60;
    Hours = Minutes / 60;
    seconds = seconds - (Minutes * 60);
    Minutes = Minutes - (Hours * 60);
    // End:0x9C
    if(Hours > 0)
    {
        S = ((((TwoDigitString(Hours)) $ ":") $ (TwoDigitString(Minutes))) $ ":") $ (TwoDigitString(seconds));        
    }
    else
    {
        S = ((TwoDigitString(Minutes)) $ ":") $ (TwoDigitString(seconds));
    }
    return S;
    return;
}

function DukeSuperMessageBoxDone(int Result, Engine.Object.EConsole_Dialog id)
{
    // End:0x91
    if((Result == 1) && int(id) == int(19))
    {
        DukeConsole(Root.Console).DialogMgr.ShowWaitingForResponseDialog();
        UDukeRootWindow(Root).AgentOnline.LeaveGame();
        GetPlayerOwner().StopSoundInfo(MPLobbyAmbienceSoundInfo);
        GetPlayerOwner().PlaySoundInfo(0, SoundMenuAmbience);
    }
    return;
}

function GetLogoLocation(Canvas C, coerce out float X, coerce out float Y, coerce out float W, coerce out float h)
{
    super.GetLogoLocation(C, X, Y, W, h);
    X -= float(15);
    W = 263.6 * WinScaleY;
    h = 70 * WinScaleY;
    return;
}

function GetTitleLocation(Canvas C, coerce out float Top, coerce out float Right)
{
    super.GetTitleLocation(C, Top, Right);
    Top = TitlePosPct * float(C.SizeY);
    return;
}

function updateMuteCallout(string Text, bool bShow)
{
    KeyButtons[KeyButton_RB].SetText(Text);
    // End:0x3D
    if(bShow)
    {
        KeyButtons[KeyButton_RB].ShowWindow();        
    }
    else
    {
        KeyButtons[KeyButton_RB].HideWindow();
    }
    return;
}

exec function SendMSG(string str)
{
    UDukeRootWindow(Root).OnlineAgent.SendChatMessage(str);
    return;
}

function OnChatMessageReceived(string msg, string senderName)
{
    LobbyChat.AddMessage(msg, senderName);
    return;
}

defaultproperties
{
    TeamSwitchButtonText="<?int?dnWindow.UDukeSceneMultiPlayerMenuLobby.TeamSwitchButtonText?>"
    ReadyButtonText="<?int?dnWindow.UDukeSceneMultiPlayerMenuLobby.ReadyButtonText?>"
    UnReadyButtonText="<?int?dnWindow.UDukeSceneMultiPlayerMenuLobby.UnReadyButtonText?>"
    StartButtonText="<?int?dnWindow.UDukeSceneMultiPlayerMenuLobby.StartButtonText?>"
    InviteFriend="<?int?dnWindow.UDukeSceneMultiPlayerMenuLobby.InviteFriend?>"
    InviteParty="<?int?dnWindow.UDukeSceneMultiPlayerMenuLobby.InviteParty?>"
    KickPlayer="<?int?dnWindow.UDukeSceneMultiPlayerMenuLobby.KickPlayer?>"
    KickPlayerCallout="<?int?dnWindow.UDukeSceneMultiPlayerMenuLobby.KickPlayerCallout?>"
    ShowGamerCardString="<?int?dnWindow.UDukeSceneMultiPlayerMenuLobby.ShowGamerCardString?>"
    GameStarting="<?int?dnWindow.UDukeSceneMultiPlayerMenuLobby.GameStarting?>"
    GameCountdown="<?int?dnWindow.UDukeSceneMultiPlayerMenuLobby.GameCountdown?>"
    GameTypeLabelStr="<?int?dnWindow.UDukeSceneMultiPlayerMenuLobby.GameTypeLabelStr?>"
    MapNameLabelStr="<?int?dnWindow.UDukeSceneMultiPlayerMenuLobby.MapNameLabelStr?>"
    MutatorNameLabelStr="<?int?dnWindow.UDukeSceneMultiPlayerMenuLobby.MutatorNameLabelStr?>"
    bPlayedCountDownSound=true
    TeamSwitchDisabledTime=2
    PrivateGameLockIcon='Menu.MP.LockIcon'
    GoldColor=(R=255,G=255,B=0,A=0)
    ReadyCheckboxInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_menu.Menu.Menu_Arrow_R_01_ST'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=0.5,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=true),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
    CountdownSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_menu.Menu.Menu_Arrow_R_01_ST'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=0.8,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=true),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
    MPLobbyAmbienceSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_menu.Menu.Menu_MP_Lobby_01'),SlotPriority=0,VolumePrefab=0,Slots=(25),Volume=1,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=true,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=false,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=true),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
    LockIconTextureRegion=(X=0,Y=0,W=128,h=128)
    TitlePosPct=0.18
    PLLeftPct=0.05
    PLTopPct=0.358
    PLHeightPct=0.5
    PLWidthPct=0.67
    PLWidthHostPct=0.9
    GameInfoXStartPct=0.105
    GameInfoYStartPct=0.247
    GIFontScale=0.85
    StartButtonTopPct=0.315
    calloutFontScale=0.6
    newLobbyBoundLeft=0.05
    newLobbyBoundRight=0.95
    newLobbyBoundTop=0.25
    newLobbyBoundBottom=0.84
    newLobbyHeaderBottom=0.3
    newLobbyPLTop=0.31
    newLobbyPLLeft=0.34
    newLobbyChatTop=0.55
    newLobbyChatRight=0.325
    GameInfoYStartPct_w_chat=0.26
    HorizontalTextBuffer=0.027
    LineTopY=165
    LineBottomY=610
    TitleText="<?int?dnWindow.UDukeSceneMultiPlayerMenuLobby.TitleText?>"
    NumKeyButtons=5
}