/*******************************************************************************
 * UDukeRootWindow generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeRootWindow extends UWindowRootWindow
    config
    dependson(DukeConsole)
    dependson(DukeDialogBoxManager)
    dependson(UDukeSuperMessageBox)
    dependson(UDukeDesktopWindow)
    dependson(UDukeSceneChapterSelect)
    dependson(UDukeScenePressStart);

enum EReturnTo
{
    RT_MainMenu,
    RT_MultiplayerMenu,
    RT_TitleScreen
};

enum EOnlinePermissionCheck
{
    OPCH_Success,
    OPCH_Failure,
    OPCH_Pending
};

var config string UDesktopClassName;
var UDukeDesktopWindow Desktop;
var(MessageBoxQuit) localized string QuitTitle;
var(MessageBoxQuit) localized string QuitText;
var array<UWindowScene> Scenes;
var array<UWindowScene> SceneCache;
var FinalBlend BackgroundMovieMaterial;
var BinkTexture BackgroundMovie;
var OnlineAgent AgentOnline;
var OnlineAgent OnlineAgent;
var OnlineAgentListener AgentListener;
var string AdditionalTravelOptions;
var float AttractTimer;
var bool bNeedsMouseUpdateAfterPaint;
var bool LogInWasCalled;
var bool bSaveExists;
var bool bIsInvitedChatRestrict;
var delegate<NotifyScreenJoinRoomFailed> __NotifyScreenJoinRoomFailed__Delegate;
var delegate<NotifyScreenInviteAcepted> __NotifyScreenInviteAcepted__Delegate;

function Scenes_Remove(int FirstIndex, int Length)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3D [Loop If]
    if(i < Length)
    {
        Scenes[FirstIndex + i].NotifyRemovingFromScenesList();
        ++ i;
        // [Loop Continue]
        goto J0x07;
    }
    Scenes.Remove(FirstIndex, Length);
    return;
}

function Scenes_Empty()
{
    Scenes_Remove(0, string(Scenes));
    return;
}

function NotifyBeforeLevelChange()
{
    super(UWindowWindow).NotifyBeforeLevelChange();
    SceneCache.Remove(0, string(SceneCache));
    Scenes_Remove(0, string(Scenes));
    Console.bBlockShowMenu = true;
    Localize(string(self) @ "::NotifyBeforeLevelChange()");
    return;
}

function NotifyAfterLevelChange()
{
    Localize(string(self) @ "::NotifyAfterLevelChange()");
    super(UWindowWindow).NotifyAfterLevelChange();
    ScoreboardWindow = none;
    // End:0x5E
    if(DukeConsole(Console).bShowConsole)
    {
        DukeConsole(Console).HideConsole();
    }
    // End:0x101
    if(GetEntryLevel() == self.GetLevel())
    {
        SceneCache.Remove(0, string(SceneCache));
        Scenes_Remove(0, string(Scenes));
        FirstChildWindow = none;
        LastChildWindow = none;
        // End:0xE2
        if(DukeConsole(Console).bShowPostGameLobby)
        {
            DukeConsole(Console).bShowPostGameLobby = false;
            DukeConsole(Console).ShowPostGameLobby();
        }
        DukeConsole(Console).DialogMgr.CloseAllDialogs();
    }
    Console.OnNotifyAfterLevelChange();
    Console.bBlockShowMenu = false;
    return;
}

function Created()
{
    local class<UDukeDesktopWindow> UDesktopClass;

    // End:0x27
    if(ObjectDeferredDestroy())
    {        
        GetPlayerOwner().ConsoleCommand("HideDebugInfo");
    }
    super.Created();
    UDesktopClass = class<UDukeDesktopWindow>(SaveConfigFile(UDesktopClassName, class'Class'));
    Desktop = UDukeDesktopWindow(CreateWindow(UDesktopClass, 0, 0, WinWidth, WinHeight));
    Desktop.ClippingRegion.W = int(WinWidth);
    Desktop.ClippingRegion.h = int(WinHeight);
    Resized();
    NormalCursor.Tex = default.NormalCursor.Tex;
    SetCursor(NormalCursor);
    OnlineAgent = OnlineAgent(class'Engine'.static.ClearInput());
    AgentOnline = OnlineAgent;
    Localize((string(self) @ "--- is OnlineAgent Valid:") @ string(OnlineAgent));
    // End:0x135
    if(AgentListener != none)
    {
        AgentListener = new (none) class'OnlineAgentListener';
    }
    Localize((string(self) @ "--- is AgentListener Valid:") @ string(AgentListener));
    OnlineAgent.RegisterListener(AgentListener);
    AgentListener.__OnStartLoading__Delegate = OnStartLoading;
    AgentListener.__OnJoinRoom__Delegate = OnJoinRoom;
    AgentListener.__OnJoinRoomFailed__Delegate = OnJoinRoomFailed;
    AgentListener.__OnInviteAccepted__Delegate = OnInviteAccepted;
    AgentListener.__OnLeaveRoom__Delegate = OnLeaveRoom;
    AgentListener.__OnShutdown__Delegate = OnShutdown;
    AgentListener.__OnLeaderboardError__Delegate = OnLeaderboardError;
    AgentListener.__OnStopWaitingForResponse__Delegate = OnStopWaitingForResponse;
    AgentListener.__OnChatMessageReceived__Delegate = OnChatMessageReceived;
    SelectBackgroundMovie();
    bSaveExists = false;
    return;
}

function Resized()
{
    super.Resized();
    Desktop.WinLeft = 0;
    Desktop.WinTop = 0;
    Desktop.WinWidth = WinWidth;
    Desktop.WinHeight = WinHeight;
    ResizeScenes();
    return;
}

function DoQuitGame()
{
    // End:0x19
    if(LookAndFeel == none)
    {
        LookAndFeel.StaticSaveConfig();
    }
    // End:0x8B
    if(GetLevel().Game == none)
    {
        GetLevel().Game.StaticSaveConfig();
        // End:0x8B
        if(GetLevel().Game.GameReplicationInfo == none)
        {
            GetLevel().Game.GameReplicationInfo.StaticSaveConfig();
        }
    }
    class'Engine'.static.StopServer().BuildServerURL();
    super.DoQuitGame();
    return;
}

function ShowUWindowSystem(UWindow.UWindowRootWindow.EUWindowMode NewWindowMode)
{
    super.ShowUWindowSystem(NewWindowMode);
    Localize("UDukeRootWindow::ShowUWindowSystem" @ string(DynamicLoadObject(class'EUWindowMode', int(NewWindowMode))));
    GetPlayerOwner().ApplyBodyTwist();
    // End:0x83
    if((Console == none) && int(NewWindowMode) != int(9))
    {
        DukeConsole(Console).HideScoreboard();
    }
    switch(NewWindowMode)
    {
        // End:0xB1
        case 0:
            GetPlayerOwner().Enumerate3DAudioProviders();
            Desktop.BeginStartupSequence();
            // End:0x2CE
            break;
        // End:0x137
        case 1:
            GetPlayerOwner().GetAnimGroup(25);
            // End:0xE3
            if(BackgroundMovie == none)
            {
                BackgroundMovie.SetFrame(1);
            }
            LoadFirstScene(class'UDukeScenePressStart');
            // End:0x10D
            if(GetGearboxEngineGlobals())
            {
                UDukeScenePressStart(Scenes[0]).bReturned = true;
            }
            // End:0x134
            if(ObjectDestroy() && ! GetGearboxEngineGlobals())
            {
                UDukeScenePressStart(Scenes[0]).CheckAutoPressStart();
            }
            // End:0x2CE
            break;
        // End:0x14A
        case 3:
            LoadFirstScene(class'UDukeSceneMainMenu');
            // End:0x2CE
            break;
        // End:0x15D
        case 4:
            LoadFirstScene(class'UDukeSceneSinglePlayerPauseMenu');
            // End:0x2CE
            break;
        // End:0x170
        case 5:
            LoadFirstScene(class'UDukeSceneSinglePlayerCredits');
            // End:0x2CE
            break;
        // End:0x1AF
        case 6:
            LoadFirstScene(class'UDukeSceneMultiPlayerPauseMenu');
            // End:0x1AC
            if(class'Engine'.default.NetworkDevice == class'AgentNetDriver')
            {
                Desktop.DukeStartupState = 6;
            }
            // End:0x2CE
            break;
        // End:0x1C2
        case 12:
            LoadFirstScene(class'UDukeSceneDigsPauseMenu');
            // End:0x2CE
            break;
        // End:0x1D5
        case 7:
            LoadFirstScene(class'UDukeSceneMultiPlayerMenuLobby');
            // End:0x2CE
            break;
        // End:0x1E8
        case 8:
            LoadFirstScene(class'UDukeSceneMultiPlayerPostGameLobby');
            // End:0x2CE
            break;
        // End:0x1FB
        case 9:
            LoadFirstScene(class'UDukeSceneMultiPlayerScoreboard');
            // End:0x2CE
            break;
        // End:0x20E
        case 10:
            LoadFirstScene(class'UDukeSceneDigs');
            // End:0x2CE
            break;
        // End:0x221
        case 11:
            LoadFirstScene(class'UDukeSceneCustomization');
            // End:0x2CE
            break;
        // End:0x234
        case 13:
            LoadFirstScene(class'UDukeSceneDigsMoreInfo');
            // End:0x2CE
            break;
        // End:0x265
        case 15:
            LoadFirstSceneFromName("DLC02_Game.UDukeSceneHordeGameEnd");
            // End:0x2CE
            break;
        // End:0x298
        case 14:
            LoadFirstSceneFromName("DLC02_Game.UDukeSceneHordeGameStart");
            // End:0x2CE
            break;
        // End:0x2CB
        case 16:
            LoadFirstSceneFromName("DLC02_Game.UDukeSceneHordePauseMenu");
            // End:0x2CE
            break;
        // End:0xFFFF
        default:
            break;
    }
    SendMapNamesToLCDHelper();
    return;
}

function LoadFirstSceneFromName(string WindowName)
{
    local class<UWindowScene> ShowWindowClass;

    ShowWindowClass = class<UWindowScene>(SaveConfigFile(WindowName, class'Class', true));
    // End:0x33
    if(ShowWindowClass == none)
    {
        LoadFirstScene(ShowWindowClass);        
    }
    else
    {
        Localize((string(self) $ "::LoadFirstSceneFromName Failed to load window:") @ WindowName);
        LoadFirstScene(none);
    }
    return;
}

function bool CanShowAttractVideo()
{
    // End:0x19
    if(ObjectIsDestroyed())
    {
        // End:0x19
        if(GetPlayerOwner().Native_ShowNavPoints())
        {
            return false;
        }
    }
    // End:0xAD
    if((((Desktop.IsStartupComplete() && GetEntryLevel() != GetLevel()) && ! OnlineAgent.IsActive()) && string(DukeConsole(Console).DialogMgr.DialogStack) == 0) && (string(Scenes) > 0) && Scenes[string(Scenes) - 1].AllowAttractVideo())
    {
        return true;
    }
    return false;
    return;
}

function Tick(float Delta)
{
    super.Tick(Delta);
    // End:0x7A
    if(CanShowAttractVideo())
    {
        AttractTimer += Delta;
        // End:0x77
        if(AttractTimer > 45)
        {
            GetPlayerOwner().ClearAnimAll(25, 0.5, 0, 1);
            Scenes_Empty();
            FirstChildWindow = Desktop;
            Desktop.StartAttractVideo();
            AttractTimer = 0;
        }        
    }
    else
    {
        AttractTimer = 0;
    }
    return;
}

function HideUWindowSystem()
{
    return;
}

function ConfirmQuit()
{
    Desktop.ConfirmQuit = Desktop.MessageBox(QuitTitle, QuitText, 0, 2, 1);
    return;
}

function SmackerTexture GetOpenSmack()
{
    return Desktop.WindowOpenSmack;
    return;
}

function MaterialEx GetBackgroundMovie()
{
    return BackgroundMovieMaterial;
    return;
}

function SelectBackgroundMovie()
{
    // End:0x68
    if(BackgroundMovie != none)
    {
        BackgroundMovie = class'BinkTexture'.static.DrawTextDropShadowed("Menu");
        // End:0x68
        if(BackgroundMovie == none)
        {
            BackgroundMovie.SetLoop(true);
            BackgroundMovie.SetPause(false);
            BackgroundMovieMaterial.Material = BackgroundMovie;
        }
    }
    return;
}

function CloseBackgroundMovie()
{
    // End:0x25
    if(BackgroundMovie == none)
    {
        class'BinkTexture'.static.DrawTile(BackgroundMovie);
        BackgroundMovie = none;
    }
    BackgroundMovieMaterial.Material = none;
    return;
}

function LoadFirstScene(class<UWindowScene> WindowSceneClass)
{
    Scenes_Empty();
    NavigateForward(WindowSceneClass);
    return;
}

function UWindowScene LoadSceneFromCache(class<UWindowScene> WindowSceneClass)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x61 [Loop If]
    if(i < string(SceneCache))
    {
        // End:0x57
        if(SceneCache[i].Class.Name != WindowSceneClass.Name)
        {
            return SceneCache[i];
        }
        ++ i;
        // [Loop Continue]
        goto J0x07;
    }
    SceneCache[SceneCache.Add(1)] = UWindowScene(CreateWindow(WindowSceneClass, 0, 0, WinWidth, WinHeight, self));
    return SceneCache[string(SceneCache) - 1];
    return;
}

function ResizeScenes()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x8D [Loop If]
    if(i < string(SceneCache))
    {
        SceneCache[i].WinLeft = 0;
        SceneCache[i].WinTop = 0;
        SceneCache[i].WinWidth = WinWidth;
        SceneCache[i].WinHeight = WinHeight;
        ++ i;
        // [Loop Continue]
        goto J0x07;
    }
    return;
}

function WindowEvent(UWindow.UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
    // End:0x17C
    if(Console.bShowConsole)
    {
        // End:0x3B
        if(string(Scenes) > 0)
        {
            Scenes[string(Scenes) - 1].bUWindowActive = true;
        }
        // End:0x85
        if(int(msg) == int(10))
        {
            // End:0x85
            if(string(Scenes) > 0)
            {
                Scenes[string(Scenes) - 1].WindowEvent(10, C, X, Y, Key);
            }
        }
        // End:0x146
        if(int(msg) == int(10))
        {
            Console.ConsoleWindow.ClippingRegion.X = 0;
            Console.ConsoleWindow.ClippingRegion.Y = 0;
            Console.ConsoleWindow.ClippingRegion.W = int(WinWidth);
            Console.ConsoleWindow.ClippingRegion.h = int(WinHeight);
            Console.ConsoleWindow.BeforePaint(C, X, Y);
        }
        Console.ConsoleWindow.WindowEvent(msg, C, X, Y, Key);        
    }
    else
    {
        // End:0x24F
        if(DukeConsole(Console).DialogMgr.GetTopWindow() == none)
        {
            DukeConsole(Console).DialogMgr.WindowEvents(msg, C, X, Y, Key);
            // End:0x202
            if(string(Scenes) > 0)
            {
                Scenes[string(Scenes) - 1].bUWindowActive = true;
            }
            // End:0x24C
            if(int(msg) == int(10))
            {
                // End:0x24C
                if(string(Scenes) > 0)
                {
                    Scenes[string(Scenes) - 1].WindowEvent(10, C, X, Y, Key);
                }
            }            
        }
        else
        {
            // End:0x2AD
            if(string(Scenes) > 0)
            {
                Scenes[string(Scenes) - 1].bUWindowActive = true;
                Scenes[string(Scenes) - 1].WindowEvent(msg, C, X, Y, Key);                
            }
            else
            {
                super.WindowEvent(msg, C, X, Y, Key);
            }
        }
    }
    // End:0x353
    if((int(msg) == int(10)) && bNeedsMouseUpdateAfterPaint)
    {
        bNeedsMouseUpdateAfterPaint = false;
        // End:0x353
        if(! GetPlayerOwner().GetSpeakerType())
        {
            // End:0x33C
            if(string(Scenes) > 0)
            {
                Scenes[string(Scenes) - 1].WindowEvent(10, C, X, Y, Key);
            }
            MouseWindow = none;
            MoveMouse(MouseX, MouseY);
        }
    }
    return;
}

function FindInitialFocusButton()
{
    bNeedsMouseUpdateAfterPaint = true;
    return;
}

function NavigateForward(class<UWindowScene> SceneClass)
{
    Localize("NavigateForward: " $ string(SceneClass));
    // End:0x3F
    if(SceneClass != class'UDukeSceneMainMenu')
    {
        OnlineAgent.Breakpoint();
    }
    Scenes[Scenes.Add(1)] = LoadSceneFromCache(SceneClass);
    Scenes[string(Scenes) - 1].OnNavForward();
    FixUpUWindow();
    FindInitialFocusButton();
    return;
}

function NavigateBack()
{
    // End:0x3F
    if(string(Scenes) > 1)
    {
        Scenes_Remove(string(Scenes) - 1, 1);
        Scenes[string(Scenes) - 1].OnNavReturn();
        FixUpUWindow();        
    }
    else
    {
        Console.CloseUWindow();
        Scenes_Empty();
    }
    FindInitialFocusButton();
    return;
}

function FixUpUWindow()
{
    FirstChildWindow = Scenes[string(Scenes) - 1];
    LastChildWindow = Scenes[string(Scenes) - 1];
    // End:0x8A
    if(Scenes[string(Scenes) - 1].PrevSiblingWindow == none)
    {
        Scenes[string(Scenes) - 1].PrevSiblingWindow.NextSiblingWindow = none;
        Scenes[string(Scenes) - 1].PrevSiblingWindow = none;
    }
    return;
}

function SetAdditionalOptions(string in_Options)
{
    AdditionalTravelOptions = in_Options;
    return;
}

function string GetCustomizationTravelOptions()
{
    local DukeMultiPlayer Player;
    local int i, Idx, idToUse, HatOptionIndex, FaceOptionIndex, ShirtOptionIndex,
	    ShirtLogoOptionIndex, ShirtColorOptionIndex, TitleOptionIdx;

    local array<int> ItemArray;

    Player = DukeMultiPlayer(GetPlayerOwner());
    // End:0x22F
    if((Player == none) && Player.PlayerProgress == none)
    {
        Player.PlayerProgress.LoadPlayerProgression();
        Player.PlayerProgress.GetChallengeIDFromStorage(ItemArray);
        HatOptionIndex = -1;
        FaceOptionIndex = -1;
        ShirtOptionIndex = -1;
        ShirtLogoOptionIndex = -1;
        ShirtColorOptionIndex = -1;
        TitleOptionIdx = -1;
        i = 0;
        J0xB7:

        // End:0x20F [Loop If]
        if(i < string(ItemArray))
        {
            // End:0x205
            if(int(Player.PlayerProgress.GetChallengeStatus(ItemArray[i])) == int(3))
            {
                Idx = class'ChallengeInfo'.static.GetGamepadButtonImageForShortKeyName(ItemArray[i]);
                // End:0x153
                if((Idx == -1) || class'ChallengeInfo'.default.ChallengesArray[Idx].IsPurchased == false)
                {
                    idToUse = -1;                    
                }
                else
                {
                    idToUse = ItemArray[i];
                }
                // End:0x205
                if(Idx != -1)
                {
                    switch(class'ChallengeInfo'.default.ChallengesArray[Idx].Category)
                    {
                        // End:0x1A3
                        case 2:
                            HatOptionIndex = idToUse;
                            // End:0x205
                            break;
                        // End:0x1B6
                        case 3:
                            FaceOptionIndex = idToUse;
                            // End:0x205
                            break;
                        // End:0x1C9
                        case 4:
                            ShirtOptionIndex = idToUse;
                            // End:0x205
                            break;
                        // End:0x1DC
                        case 5:
                            ShirtLogoOptionIndex = idToUse;
                            // End:0x205
                            break;
                        // End:0x1EF
                        case 6:
                            ShirtColorOptionIndex = Idx;
                            // End:0x205
                            break;
                        // End:0x202
                        case 7:
                            TitleOptionIdx = idToUse;
                            // End:0x205
                            break;
                        // End:0xFFFF
                        default:
                            break;
                    }
                }
                else
                {
                }/* !MISMATCHING REMOVE, tried If got Type:Else Position:0x205! */
                ++ i;
                // [Loop Continue]
                goto J0xB7;
            }/* !MISMATCHING REMOVE, tried Loop got Type:If Position:0x0C7! */
            ShirtColorOptionIndex = class'ChallengeInfo'.default.ChallengesArray[ShirtColorOptionIndex].ShirtColorIdx;
        }/* !MISMATCHING REMOVE, tried If got Type:Loop Position:0x0B7! */
        return (((((((((("?Hat=" $ string(HatOptionIndex)) $ "?Face=") $ string(FaceOptionIndex)) $ "?Shirt=") $ string(ShirtOptionIndex)) $ "?ShirtLogo=") $ string(ShirtLogoOptionIndex)) $ "?ShirtColor=") $ string(ShirtColorOptionIndex)) $ "?Title=") $ string(TitleOptionIdx);
        return;
    }/* !MISMATCHING REMOVE, tried Else got Type:If Position:0x011! */
}

function OnStartLoading(string in_MapName, string in_GameModeName)
{
    local string URL;

    URL = (OnlineAgent.GetTravelURL(in_MapName, in_GameModeName) $ AdditionalTravelOptions) $ (GetCustomizationTravelOptions());
    GetPlayerOwner().ClientTravel(URL, 0, false);
    return;
}

function SendMapNamesToLCDHelper()
{
    local int i;
    local string MapName;
    local LCDHelper LCD;

    LCD = GetPlayerOwner().InstallPS3Data();
    // End:0x132
    if(LCD == none)
    {
        // End:0x38
        if(string(LCD.SPMapNames) > 0)
        {
            return;
        }
        i = 0;
        J0x3F:

        // End:0xA5 [Loop If]
        if(i < string(class'UDukeSceneChapterSelect'.default.ChapterNames))
        {
            MapName = class'UDukeSceneChapterSelect'.default.ChapterNames[i];
            LCD.SPMapNames[LCD.SPMapNames.Add(1)] = MapName;
            ++ i;
            // [Loop Continue]
            goto J0x3F;
        }
        i = 0;
        J0xAC:

        // End:0x132 [Loop If]
        if(i < string(class'MPMapInfo'.default.MapList))
        {
            MapName = ClassIsChildOf("MapNames", class'MPMapInfo'.default.MapList[i].MapName, "Maps");
            LCD.AddMPMapName(class'MPMapInfo'.default.MapList[i].id, MapName);
            ++ i;
            // [Loop Continue]
            goto J0xAC;
        }
    }
    return;
}

function OnJoinRoom(bool in_bIsHost)
{
    DukeMultiPlayer(GetPlayerOwner()).LoadAll();
    Console.LaunchUWindow();
    ShowUWindowSystem(7);
    DukeConsole(Console).DialogMgr.CloseAllDialogs();
    Desktop.StopBinks(false);
    return;
}

function OnJoinRoomFailed(int in_Reason)
{
    local Engine.Object.EConsole_Dialog l_DialogType;

    DukeConsole(Console).DialogMgr.CloseAllDialogs();
    l_DialogType = OnlineAgent.TranslateJoinFailReason(in_Reason);
    // End:0x74
    if(GetGearboxEngineGlobals() && OnlineAgent.IsWaitingForResponse())
    {
        DukeConsole(Console).DialogMgr.ShowWaitingForResponseDialog();
    }
    // End:0xB5
    if(int(l_DialogType) != int(0))
    {
        NotifyScreenJoinRoomFailed(in_Reason);
        DukeConsole(Console).DialogMgr.ShowDialogBox(l_DialogType);
    }
    return;
}

function NotifyScreenJoinRoomFailed(int in_Reason)
{
    Localize("UDukeRootWindow::NotifyScreenJoinRoomFailed Screen Doesn't care if Join Room Failed!!!");
    return;
}

function OnInviteAccepted()
{
    local Engine.OnlineAgent.EOnlinePermission ChatPermission;

    // End:0x2D
    if(GetLevel() == GetEntryLevel())
    {
        GetLevel().Game.OnInviteAccepted();
    }
    DukeConsole(Root.Console).DialogMgr.CloseAllDialogs();
    DukeConsole(Root.Console).DialogMgr.ShowWaitingDialog();
    NotifyScreenInviteAcepted();
    // End:0xBB
    if(GetGearboxEngineGlobals())
    {
        ChatPermission = OnlineAgent.GetChatPermission();
        // End:0xBB
        if(int(ChatPermission) == int(1))
        {
            bIsInvitedChatRestrict = true;
        }
    }
    return;
}

function NotifyScreenInviteAcepted()
{
    Localize("* UDukeRootWindow::NotifyScreenInviteAcepted Screen Doesn't care if Invite Acepted!!!");
    return;
}

function OnChatMessageReceived(string msg, string senderName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < string(Scenes))
    {
        Scenes[i].OnChatMessageReceived(msg, senderName);
        ++ i;
        // [Loop Continue]
        goto J0x07;
    }
    return;
}

function bool DoesScreenExist(name ScreenName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4D [Loop If]
    if(i < string(Scenes))
    {
        // End:0x43
        if(Scenes[i].Class.Name != ScreenName)
        {
            return true;
        }
        ++ i;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    return;
}

function ReturnToMainMenu(UDukeRootWindow.EReturnTo ReturnTo)
{
    // End:0xBB
    if((DukeMultiPlayer(GetPlayerOwner()) == none) || DoesScreenExist('UDukeSceneMultiPlayerMenuLobby'))
    {
        OnlineAgent.DisconnectUnreal();
        Root.Console.bReturnToMainMenu = ! OnlineAgent.IsInMainMenu() && int(ReturnTo) == int(0);
        Console.bReturnToMultiplayerMenu = int(ReturnTo) == int(1);
        // End:0xA4
        if(int(ReturnTo) == int(2))
        {
            ShowUWindowSystem(1);            
        }
        else
        {
            ShowUWindowSystem(3);
            GetPlayerOwner().Native_GetDisplayMode(false);
        }
    }
    return;
}

function OnLeaveRoom()
{
    // End:0x30
    if(Console.bMP_ReturnToTitleScreen)
    {
        Console.bMP_ReturnToTitleScreen = false;
        ReturnToMainMenu(2);        
    }
    else
    {
        ReturnToMainMenu(1);
    }
    return;
}

function OnShutdown(int ErrorCode)
{
    local Engine.Object.EConsole_Dialog l_DialogType;

    DukeConsole(Console).DialogMgr.CloseAllDialogs();
    l_DialogType = OnlineAgent.TranslateShutdownReason(ErrorCode);
    // End:0x73
    if(int(l_DialogType) == int(56))
    {
        DukeConsole(Root.Console).DialogMgr.ShowWaitingDialog();
        return;
    }
    // End:0xCF
    if(ObjectIsDestroyed())
    {
        // End:0xA2
        if((int(l_DialogType) == int(50)) || int(l_DialogType) == int(46))
        {
            ReturnToMainMenu(2);            
        }
        else
        {
            // End:0xCC
            if(! DoesScreenExist('UDukeSceneLeaderboard') && ! DoesScreenExist('UAgentSceneBrowserList'))
            {
                ReturnToMainMenu(1);
            }
        }        
    }
    else
    {
        // End:0x102
        if(GetGearboxEngineGlobals())
        {
            // End:0xFF
            if(! DoesScreenExist('UDukeSceneLeaderboard') && ! DoesScreenExist('UAgentSceneBrowserList'))
            {
                ReturnToMainMenu(1);
            }            
        }
        else
        {
            // End:0x121
            if(GetPlayerOwner().IsMyDigs() != true)
            {
                ReturnToMainMenu(1);
            }
        }
    }
    // End:0x15B
    if(GetGearboxEngineGlobals() && OnlineAgent.IsWaitingForResponse())
    {
        DukeConsole(Console).DialogMgr.ShowWaitingForResponseDialog();
    }
    // End:0x1B5
    if(int(l_DialogType) != int(0))
    {
        // End:0x1B5
        if(! ObjectIsDestroyed() || int(l_DialogType) != int(50))
        {
            OnlineAgent.Breakpoint();
            DukeConsole(Console).DialogMgr.ShowDialogBox(l_DialogType);
        }
    }
    return;
}

function OnLeaderboardError(int ErrorCode)
{
    local Engine.Object.EConsole_Dialog l_DialogType;

    // End:0xDA
    if((DoesScreenExist('UDukeSceneMultiplayer')) || DoesScreenExist('UDukeSceneLeaderboard'))
    {
        DukeConsole(Console).DialogMgr.CloseAllDialogs();
        l_DialogType = OnlineAgent.TranslateShutdownReason(ErrorCode);
        // End:0x6E
        if(int(l_DialogType) == int(41))
        {
            l_DialogType = 27;
        }
        // End:0xA8
        if(GetGearboxEngineGlobals() && OnlineAgent.IsWaitingForResponse())
        {
            DukeConsole(Console).DialogMgr.ShowWaitingForResponseDialog();
        }
        // End:0xDA
        if(int(l_DialogType) != int(0))
        {
            DukeConsole(Console).DialogMgr.ShowDialogBox(l_DialogType);
        }
    }
    return;
}

function OnStopWaitingForResponse()
{
    DukeConsole(Console).DialogMgr.CloseAllWaitingDialogs();
    return;
}

function bool DoesTopSceneIgnoreInput()
{
    // End:0x27
    if(string(Scenes) > 0)
    {
        return Scenes[string(Scenes) - 1].bIgnoreAllInputs;
    }
    return false;
    return;
}

function MoveMouse(float X, float Y)
{
    local UWindowWindow NewMouseWindow;
    local float tX, tY;

    MouseX = X;
    MouseY = Y;
    // End:0x9C
    if(! bMouseCapture)
    {
        // End:0x83
        if(string(DukeConsole(Console).DialogMgr.DialogStack) > 0)
        {
            NewMouseWindow = DukeConsole(Console).DialogMgr.GetTopWindow().FindWindowUnder(X, Y);            
        }
        else
        {
            NewMouseWindow = FindWindowUnder(X, Y);
        }        
    }
    else
    {
        NewMouseWindow = MouseWindow;
    }
    // End:0xE2
    if(NewMouseWindow == MouseWindow)
    {
        MouseWindow.MouseLeave();
        NewMouseWindow.MouseEnter();
        MouseWindow = NewMouseWindow;
    }
    // End:0x14C
    if((MouseX != OldMouseX) || MouseY != OldMouseY)
    {
        OldMouseX = MouseX;
        OldMouseY = MouseY;
        MouseWindow.GetMouseXY(tX, tY);
        MouseWindow.MouseMove(tX, tY);
    }
    return;
}

function DukeSuperMessageBoxDone(int Result, Engine.Object.EConsole_Dialog id)
{
    Localize(((((string(self) @ "::DukeSuperMessageBoxDone(") @ string(Result)) @ ", ") @ string(DynamicLoadObject(class'EConsole_Dialog', int(id)))) @ ")");
    // End:0x96
    if((int(id) == int(3)) && Result == 0)
    {
        DukeConsole(Console).DialogMgr.ShowWaitingForResponseDialog();
        OnlineAgent.Cancel();
    }
    return;
}

function ResetOnlinePermissionCheck()
{
    LogInWasCalled = false;
    return;
}

function UDukeRootWindow.EOnlinePermissionCheck TickOnlinePermissionCheck(optional bool CheckChatPermission, optional bool bLogInOnly)
{
    local Engine.OnlineAgent.EOnlinePermission OnlinePermission, ChatPermission;

    // End:0x5B
    if(OnlineAgent.IsWaitingForResponse())
    {
        // End:0x58
        if(! DukeConsole(Console).DialogMgr.IsDialogBoxActive(4))
        {
            DukeConsole(Console).DialogMgr.ShowWaitingForResponseDialog();
        }
        return 2;
    }
    // End:0xEC
    if(! OnlineAgent.IsLoggedIn())
    {
        // End:0xC2
        if(! LogInWasCalled)
        {
            LogInWasCalled = true;
            OnlineAgent.Login();
            DukeConsole(Root.Console).DialogMgr.ShowWaitingForResponseDialog();
            return 2;            
        }
        else
        {
            ResetOnlinePermissionCheck();
            DukeConsole(Console).DialogMgr.ShowDialogBox(52);
            return 1;
        }
    }
    ResetOnlinePermissionCheck();
    // End:0xFE
    if(bLogInOnly)
    {
        return 0;
    }
    OnlinePermission = OnlineAgent.GetOnlinePermission();
    // End:0x1DD
    if(int(OnlinePermission) == int(0))
    {
        // End:0x1D7
        if(CheckChatPermission)
        {
            ChatPermission = OnlineAgent.GetChatPermission();
            // End:0x174
            if(int(ChatPermission) == int(1))
            {
                DukeConsole(Console).DialogMgr.ShowDialogBox(18, self);                
            }
            else
            {
                // End:0x1A7
                if(int(ChatPermission) == int(2))
                {
                    DukeConsole(Console).DialogMgr.ShowDialogBox(52, self);                    
                }
                else
                {
                    // End:0x1D7
                    if(int(ChatPermission) == int(3))
                    {
                        DukeConsole(Console).DialogMgr.ShowDialogBox(41, self);
                    }
                }
            }
        }
        return 0;        
    }
    else
    {
        // End:0x210
        if(int(OnlinePermission) == int(1))
        {
            DukeConsole(Console).DialogMgr.ShowDialogBox(53, self);            
        }
        else
        {
            // End:0x243
            if(int(OnlinePermission) == int(2))
            {
                DukeConsole(Console).DialogMgr.ShowDialogBox(52, self);                
            }
            else
            {
                // End:0x273
                if(int(OnlinePermission) == int(3))
                {
                    DukeConsole(Console).DialogMgr.ShowDialogBox(41, self);
                }
            }
        }
    }
    return 1;
    return;
}

defaultproperties
{
    UDesktopClassName="dnWindow.UDukeDesktopWindow"
    QuitTitle="<?int?dnWindow.UDukeRootWindow.QuitTitle?>"
    QuitText="<?int?dnWindow.UDukeRootWindow.QuitText?>"
    begin object name=UDukeWindow_BackgroundMovieMaterial class=FinalBlend
        FrameBufferBlending=2
        ZTest=false
    object end
    // Reference: FinalBlend'UDukeRootWindow.UDukeWindow_BackgroundMovieMaterial'
    BackgroundMovieMaterial=UDukeWindow_BackgroundMovieMaterial
    NormalCursor=(Tex='Menu.Menu.cursor',HotX=0,HotY=0,WindowsCursor=0)
    LookAndFeelClass="dnWindow.UDukeLookAndFeel"
}