/*******************************************************************************
 * UDukeServerBrowserCW generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeServerBrowserCW extends UDukePageWindow
    config
    dependson(UDukeBrowserWindow)
    dependson(UDukeInfoCW)
    dependson(UDukeServerListFactory)
    dependson(UDukeServerGrid)
    dependson(UDukePlayerList);

enum EPingState
{
    PS_QueryServer,
    PS_QueryFailed,
    PS_Pinging,
    PS_RePinging,
    PS_Done
};

var UWindowVSplitter VSplitter;
var UDukeInfoCW InfoClient;
var UDukeServerList InfoItem;
var UWindowLabelControl StatusLabel;
var UDukeServerGrid Grid;
var string serverListClassName;
var class<UDukeServerList> serverListClass;
var UDukeServerListFactory serverListFactory;
var string serverListFactoryType;
var bool serverListQueryDone;
var UDukeServerList PingedList;
var UDukeServerList UnpingedList;
var int AutoRefreshTime;
var int TimeElapsed;
var bool bHadInitialRefresh;
var bool bNoSort;
var bool bPingSuspend;
var bool bPingResume;
var bool bPingResumeIntial;
var bool bSuspendPingOnClose;
var localized string PlayerCountName;
var localized string ServerCountName;
var localized string QueryServerText;
var localized string QueryFailedText;
var localized string PingingText;
var localized string CompleteText;
var localized string ShownText;
var localized string FilterText;
var string URLAppend;
var UDukeServerBrowserCW.EPingState PingState;
var string ErrorString;
var config bool bNoAutoSort;
var bool bShowFailedServers;
var class<UDukeRightClickMenu> RightClickMenuClass;
var UDukeServerFilterCW ServerFilter;
var UDukeBrowserWindow BrowserWindow;

function Created()
{
    super.Created();
    serverListClass = class<UDukeServerList>(SaveConfigFile(serverListClassName, class'Class'));
    VSplitter = UWindowVSplitter(CreateWindow(class'UWindowVSplitter', 0, 0, WinWidth, WinHeight));
    Grid = UDukeServerGrid(VSplitter.CreateWindow(class'UDukeServerGrid', 0, 0, WinWidth, WinHeight / float(2), self));
    Grid.SetAcceptsFocus();
    InfoClient = UDukeInfoCW(VSplitter.CreateWindow(class'UDukeInfoCW', 0, 0, WinWidth, WinHeight / float(2), self));
    VSplitter.TopClientWindow = Grid;
    VSplitter.BottomClientWindow = InfoClient;
    VSplitter.SplitPos = (Grid.WinHeight + InfoClient.WinHeight) * 0.5;
    VSplitter.MinWinHeight = 0;
    VSplitter.bSizable = true;
    VSplitter.bBottomGrow = true;
    BrowserWindow = UDukeBrowserWindow(ParentWindow.ParentWindow);
    return;
}

function Resized()
{
    super(UWindowWindow).Resized();
    Grid.SetSize(WinWidth, WinHeight / float(2));
    InfoClient.SetSize(WinWidth, WinHeight / float(2));
    VSplitter.SetSize(WinWidth, WinHeight);
    VSplitter.SplitPos = (Grid.WinHeight + InfoClient.WinHeight) * 0.5;
    return;
}

function ShowInfoArea(bool bShow)
{
    // End:0x8A
    if(bShow)
    {
        VSplitter.ShowWindow();
        VSplitter.SetSize(WinWidth, WinHeight);
        Grid.SetParent(VSplitter);
        InfoClient.SetParent(VSplitter);
        VSplitter.TopClientWindow = Grid;
        VSplitter.BottomClientWindow = InfoClient;        
    }
    else
    {
        VSplitter.HideWindow();
        VSplitter.TopClientWindow = none;
        VSplitter.BottomClientWindow = none;
        Grid.SetParent(self);
        Grid.SetSize(WinWidth, WinHeight);
    }
    return;
}

function TagServersAsOld()
{
    local UDukeServerList l;

    l = UDukeServerList(PingedList.Next);
    J0x1A:

    // End:0x55 [Loop If]
    if(l == none)
    {
        l.bOldServer = true;
        l = UDukeServerList(l.Next);
        // [Loop Continue]
        goto J0x1A;
    }
    return;
}

function RemoveOldServers()
{
    local UDukeServerList l, n;

    l = UDukeServerList(PingedList.Next);
    J0x1A:

    // End:0xA0 [Loop If]
    if(l == none)
    {
        n = UDukeServerList(l.Next);
        // End:0x92
        if(l.bOldServer)
        {
            // End:0x82
            if(Grid.SelectedServer != l)
            {
                Grid.SelectedServer = n;
            }
            l.Remove();
        }
        l = n;
        // [Loop Continue]
        goto J0x1A;
    }
    return;
}

function ClearInfo()
{
    InfoItem = none;
    InfoClient.Server = none;
    return;
}

function ShowInfo(UDukeServerList i)
{
    // End:0x0E
    if(i != none)
    {
        return;
    }
    ShowInfoArea(true);
    InfoItem = i;
    InfoClient.Server = InfoItem;
    i.ServerStatus();
    return;
}

function AutoInfo(UDukeServerList i)
{
    ShowInfo(i);
    return;
}

function QueryFinished(UDukeServerListFactory Fact, bool bSuccess, optional string ErrorMsg)
{
    local int i;
    local bool bDone;

    serverListQueryDone = true;
    // End:0x41
    if(! bSuccess)
    {
        PingState = 1;
        ErrorString = ErrorMsg;
        // End:0x3E
        if(UnpingedList.Count() == 0)
        {
            return;
        }        
    }
    else
    {
        ErrorString = "";
    }
    RemoveOldServers();
    PingState = 2;
    // End:0x89
    if(! bNoSort && ! Fact.bIncrementalPing)
    {
        PingedList.Sort();
    }
    UnpingedList.PingServers(true, bNoSort || Fact.bIncrementalPing);
    return;
}

function ResumePinging()
{
    // End:0x13
    if(! bHadInitialRefresh)
    {
        Refresh(false, true);
    }
    bPingSuspend = false;
    // End:0x48
    if(bPingResume)
    {
        bPingResume = false;
        UnpingedList.PingNext(bPingResumeIntial, bNoSort);
    }
    return;
}

function SuspendPinging()
{
    // End:0x11
    if(bSuspendPingOnClose)
    {
        bPingSuspend = true;
    }
    return;
}

function PingFinished()
{
    PingState = 4;
    BuildGameTypes();
    return;
}

function RePing()
{
    PingState = 3;
    PingedList.InvalidatePings();
    PingedList.PingServers(true, false);
    return;
}

function TestList()
{
    local int i, j;
    local string GameType;
    local UDukeServerList NewListEntry;
    local UDukePlayerList PlayerEntry;
    local string mapnames[10], gamenames, playernames;

    mapnames[0] = "Fish";
    mapnames[1] = "Apple";
    mapnames[2] = "Train";
    mapnames[3] = "Mini";
    mapnames[4] = "Me";
    mapnames[5] = "Evil";
    mapnames[6] = "Duke";
    mapnames[7] = "Proton";
    mapnames[8] = "Loser";
    mapnames[9] = "Shit";
    gamenames[0] = "Deathmatch";
    gamenames[1] = "CTF";
    gamenames[2] = "Assault";
    gamenames[3] = "War";
    gamenames[4] = "Lame";
    gamenames[5] = "FFA";
    gamenames[6] = "Team";
    gamenames[7] = "Counterstrike";
    gamenames[8] = "DoD";
    gamenames[9] = "Shack";
    playernames[0] = "Joe";
    playernames[1] = "Scott";
    playernames[2] = "Brandon";
    playernames[3] = "Nick";
    playernames[4] = "Jess";
    playernames[5] = "George";
    playernames[6] = "Tim";
    playernames[7] = "John";
    playernames[8] = "Andy";
    playernames[9] = "Ruben";
    i = 0;
    J0x1DA:

    // End:0x476 [Loop If]
    if(i < 100)
    {
        // End:0x205
        if((i % 10) == 0)
        {
            GameType = gamenames[Rand(10)];
        }
        NewListEntry = UDukeServerList(PingedList.CreateItem(PingedList.Class));
        NewListEntry.IP = "192.168.1.112";
        NewListEntry.QueryPort = 7777;
        NewListEntry.Ping = float(Rand(9999));
        NewListEntry.Category = "TestCat";
        NewListEntry.GameName = "TestGameName";
        NewListEntry.bLocalServer = false;
        NewListEntry.HostName = NewListEntry.IP;
        NewListEntry.GameType = GameType;
        NewListEntry.MapName = mapnames[Rand(10)];
        NewListEntry.MapName = mapnames[Rand(10)];
        NewListEntry.MapDisplayName = NewListEntry.MapName;
        NewListEntry.MaxPlayers = Rand(64);
        NewListEntry.NumPlayers = Min(Rand(64), NewListEntry.MaxPlayers);
        NewListEntry.PlayerList = new (none) class'UDukePlayerList';
        NewListEntry.PlayerList.SetupSentinel();
        j = 0;
        J0x3BA:

        // End:0x457 [Loop If]
        if(j < NewListEntry.NumPlayers)
        {
            PlayerEntry = UDukePlayerList(NewListEntry.PlayerList.Append(class'UDukePlayerList'));
            PlayerEntry.PlayerID = j;
            PlayerEntry.PlayerName = playernames[Rand(10)];
            // End:0x44D
            if(Rand(100) == 0)
            {
                PlayerEntry.PlayerName = "Zippy";
            }
            ++ j;
            // [Loop Continue]
            goto J0x3BA;
        }
        PingedList.AppendItem(NewListEntry);
        ++ i;
        // [Loop Continue]
        goto J0x1DA;
    }
    BuildGameTypes();
    return;
}

function bool CheckGameType(UDukeServerList l)
{
    local int i;

    // End:0x19
    if(l.GameType == "")
    {
        return false;
    }
    i = 0;
    J0x20:

    // End:0xAA [Loop If]
    if(i < 64)
    {
        // End:0x73
        if(BrowserWindow.AllGameTypes[i] == "")
        {
            BrowserWindow.AllGameTypes[i] = l.GameType;
            return true;
            // [Explicit Break]
            goto J0xAA;
        }
        // End:0xA0
        if(l.GameType == BrowserWindow.AllGameTypes[i])
        {
            // [Explicit Break]
            goto J0xAA;
        }
        ++ i;
        // [Loop Continue]
        goto J0x20;
    }
    J0xAA:

    return false;
    return;
}

function BuildGameTypes(optional UDukeServerList newServer)
{
    local UDukeServerList l;
    local bool NewGameTypeFound;

    // End:0x21
    if(newServer == none)
    {
        NewGameTypeFound = CheckGameType(newServer);        
    }
    else
    {
        l = UDukeServerList(PingedList.Next);
        J0x3B:

        // End:0x76 [Loop If]
        if(l == none)
        {
            NewGameTypeFound = CheckGameType(l);
            l = UDukeServerList(l.Next);
            // [Loop Continue]
            goto J0x3B;
        }
    }
    // End:0x85
    if(NewGameTypeFound)
    {
        SaveConfigs();
    }
    return;
}

function UpdateFilters(UDukeServerList newServer)
{
    // End:0x0E
    if(ServerFilter != none)
    {
        return;
    }
    BuildGameTypes(newServer);
    return;
}

function ApplyFilter()
{
    local UDukeServerList l, NewItem, Swap;
    local UDukePlayerList P;
    local string Type, BuddyName;
    local int i;

    StaticSaveConfig();
    // End:0x11
    if(PingedList != none)
    {
        return;
    }
    l = UDukeServerList(PingedList.Next);
    J0x2B:

    // End:0x2FB [Loop If]
    if(l == none)
    {
        l.bHidden = false;
        // End:0x61
        if(! BrowserWindow.Filter_Enabled)
        {            
        }
        else
        {
            // End:0xCD
            if((BrowserWindow.Filter_GameType != "") && BrowserWindow.Filter_GameType != "All")
            {
                // End:0xCD
                if(l.GameType != BrowserWindow.Filter_GameType)
                {
                    l.bHidden = true;
                    // [Explicit Continue]
                    goto J0x2DE;
                }
            }
            // End:0x11B
            if(BrowserWindow.Filter_MaxPing > 0)
            {
                // End:0x11B
                if(l.Ping > float(BrowserWindow.Filter_MaxPing))
                {
                    l.bHidden = true;
                    // [Explicit Continue]
                    goto J0x2DE;
                }
            }
            // End:0x168
            if(BrowserWindow.Filter_MinPlayers > 0)
            {
                // End:0x168
                if(l.NumPlayers < BrowserWindow.Filter_MinPlayers)
                {
                    l.bHidden = true;
                    // [Explicit Continue]
                    goto J0x2DE;
                }
            }
            // End:0x1B5
            if(BrowserWindow.Filter_MaxPlayers > 0)
            {
                // End:0x1B5
                if(l.NumPlayers > BrowserWindow.Filter_MaxPlayers)
                {
                    l.bHidden = true;
                    // [Explicit Continue]
                    goto J0x2DE;
                }
            }
            // End:0x2DE
            if(BrowserWindow.Filter_bUseBuddyList)
            {
                i = 0;
                J0x1CF:

                // End:0x2DE [Loop If]
                if(i < 32)
                {
                    BuddyName = BrowserWindow.Filter_BuddyList[i];
                    // End:0x206
                    if(BuddyName == "")
                    {
                        // [Explicit Break]
                        goto J0x2DE;
                    }
                    l.bHidden = true;
                    // End:0x2D1
                    if(l.PlayerList == none)
                    {
                        P = l.PlayerList;
                        P = UDukePlayerList(P.Next);
                        J0x25D:

                        // End:0x2B5 [Loop If]
                        if(P == none)
                        {
                            // End:0x298
                            if(P.PlayerName ~= BuddyName)
                            {
                                l.bHidden = false;
                                // [Explicit Break]
                                goto J0x2B5;
                            }
                            P = UDukePlayerList(P.Next);
                            // [Loop Continue]
                            goto J0x25D;
                        }
                        J0x2B5:

                        // End:0x2CE
                        if(l.bHidden == false)
                        {
                            // [Explicit Break]
                            goto J0x2DE;
                        }
                        // [Explicit Continue]
                        goto J0x2D4;
                    }
                    // [Explicit Break]
                    goto J0x2DE;
                    J0x2D4:

                    ++ i;
                    // [Loop Continue]
                    goto J0x1CF;
                }
            }
        }
        J0x2DE:

        l = UDukeServerList(l.Next);
        // [Loop Continue]
        goto J0x2B;
    }
    // End:0x32F
    if(Grid.SelectedServer.bHidden)
    {
        ClearInfo();
        Grid.SelectedServer = none;
    }
    PingedList.UpdateShownCount();
    return;
}

function Query(optional bool bBySuperset, optional bool bInitial, optional bool bInNoSort)
{
    bNoSort = bInNoSort;
    // End:0x35
    if(serverListFactory == none)
    {
        serverListFactory.Query(bBySuperset, bInitial);
    }
    return;
}

function Refresh(optional bool bBySuperset, optional bool bInitial, optional bool bSaveExistingList, optional bool bInNoSort)
{
    bHadInitialRefresh = true;
    // End:0x2B
    if(! bSaveExistingList)
    {
        InfoItem = none;
        InfoClient.Server = none;
    }
    // End:0x6C
    if(! bSaveExistingList && PingedList == none)
    {
        PingedList.DestroyList();
        PingedList = none;
        Grid.SelectedServer = none;
    }
    // End:0xBE
    if(PingedList != none)
    {
        PingedList = new serverListClass;
        PingedList.Owner = self;
        PingedList.SetupSentinel(true);
        PingedList.bSuspendableSort = true;        
    }
    else
    {
        TagServersAsOld();
    }
    // End:0xE0
    if(UnpingedList == none)
    {
        UnpingedList.DestroyList();
    }
    // End:0x11C
    if(! bSaveExistingList)
    {
        UnpingedList = new serverListClass;
        UnpingedList.Owner = self;
        UnpingedList.SetupSentinel(false);
    }
    PingState = 0;
    ShutdownFactories(bBySuperset);
    CreateFactories(bSaveExistingList);
    Query(bBySuperset, bInitial, bInNoSort);
    return;
}

function CreateFactories(bool bUsePingedList)
{
    serverListFactory = UDukeServerListFactory(BuildObjectWithProperties(serverListFactoryType));
    // End:0x4F
    if(serverListFactory != none)
    {
        Localize("Could not create ServerFactory" @ serverListFactoryType);
        return;
    }
    serverListFactory.PingedList = PingedList;
    serverListFactory.UnpingedList = UnpingedList;
    // End:0x9A
    if(bUsePingedList)
    {
        serverListFactory.Owner = PingedList;        
    }
    else
    {
        serverListFactory.Owner = UnpingedList;
    }
    serverListQueryDone = false;
    return;
}

function ShutdownFactories(optional bool bBySuperset)
{
    local int i;

    // End:0x29
    if(serverListFactory == none)
    {
        serverListFactory.Shutdown(bBySuperset);
        serverListFactory = none;
    }
    return;
}

function WindowShown()
{
    super(UWindowWindow).WindowShown();
    InfoClient.SetParent(VSplitter);
    InfoClient.Server = InfoItem;
    ResumePinging();
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    local UDukeServerBrowserCW.EPingState P;
    local string E;
    local int PercentComplete, TotalReturnedServers, TotalServers, PingedServers, MyServers, ShownServers;

    local string SBText;

    super(UWindowWindow).BeforePaint(C, X, Y);
    P = PingState;
    // End:0x44
    if(int(P) == int(0))
    {
        TotalReturnedServers = UnpingedList.Count();
    }
    // End:0x8C
    if(int(P) == int(3))
    {
        PingedServers = PingedList.PingedCount();
        TotalServers = PingedList.Count();
        MyServers = TotalServers;        
    }
    else
    {
        PingedServers = PingedList.Count();
        TotalServers = UnpingedList.Count() + PingedServers;
        MyServers = PingedList.Count();
        ShownServers = PingedList.ShownCount;
    }
    E = ErrorString;
    // End:0x11C
    if(TotalServers > 0)
    {
        PercentComplete = int((float(PingedServers) * 100) / float(TotalServers));
    }
    switch(P)
    {
        // End:0x174
        case 0:
            // End:0x166
            if(TotalReturnedServers > 0)
            {
                SBText = ((((QueryServerText $ " (") $ string(TotalReturnedServers)) $ " ") $ ServerCountName) $ ")";                
            }
            else
            {
                SBText = QueryServerText;
            }
            // End:0x280
            break;
        // End:0x187
        case 1:
            SBText = E;
            // End:0x280
            break;
        // End:0x18C
        case 2:
        // End:0x203
        case 3:
            SBText = (((((((((((PingingText $ " ") $ string(PercentComplete)) $ "% ") $ CompleteText) $ ". ") $ string(MyServers)) $ " ") $ ServerCountName) $ ", ") $ string(PingedList.TotalPlayers)) $ " ") $ PlayerCountName;
            // End:0x280
            break;
        // End:0x27D
        case 4:
            SBText = ((((((ServerCountName @ string(MyServers)) @ "(") $ string(ShownServers)) @ ShownText) $ ")") @ PlayerCountName) @ string(PingedList.TotalPlayers);
            // End:0x27A
            if(BrowserWindow.Filter_Enabled)
            {
                SBText = SBText @ FilterText;
            }
            // End:0x280
            break;
        // End:0xFFFF
        default:
            break;
    }
    UDukeBrowserWindow(ParentWindow.ParentWindow).Status = SBText;
    return;
}

function Paint(Canvas C, float X, float Y)
{
    super(UWindowWindow).Paint(C, X, Y);
    return;
}

function Tick(float Delta)
{
    PingedList.Tick(Delta);
    // End:0x4A
    if(PingedList.bNeedUpdateCount)
    {
        PingedList.UpdateServerCount();
        PingedList.bNeedUpdateCount = false;
    }
    // End:0x87
    if(AutoRefreshTime > 0)
    {
        TimeElapsed += int(Delta);
        // End:0x87
        if(TimeElapsed > AutoRefreshTime)
        {
            TimeElapsed = 0;
            Refresh(,, true, bNoAutoSort);
        }
    }
    return;
}

function AddFavorite(UDukeServerList i)
{
    return;
}

defaultproperties
{
    serverListClassName="dnWindow.UDukeServerList"
    PlayerCountName="<?int?dnWindow.UDukeServerBrowserCW.PlayerCountName?>"
    ServerCountName="<?int?dnWindow.UDukeServerBrowserCW.ServerCountName?>"
    QueryServerText="<?int?dnWindow.UDukeServerBrowserCW.QueryServerText?>"
    QueryFailedText="<?int?dnWindow.UDukeServerBrowserCW.QueryFailedText?>"
    PingingText="<?int?dnWindow.UDukeServerBrowserCW.PingingText?>"
    CompleteText="<?int?dnWindow.UDukeServerBrowserCW.CompleteText?>"
    ShownText="<?int?dnWindow.UDukeServerBrowserCW.ShownText?>"
    FilterText="<?int?dnWindow.UDukeServerBrowserCW.FilterText?>"
    RightClickMenuClass='UDukeRightClickMenu'
    bBuildDefaultButtons=false
    bNoScanLines=true
    bNoClientTexture=true
}