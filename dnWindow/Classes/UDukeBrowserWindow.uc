/*******************************************************************************
 * UDukeBrowserWindow generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeBrowserWindow extends UWindowWindow
    config
    dependson(UDukeBrowserPage)
    dependson(UDukeServerFilterWindow)
    dependson(UDukeBrowserTab);

var UDukeBrowserTab Tabs[10];
var int TabCount;
var int TabX;
var UDukeBrowserPage CurrentPage;
var UDukeBrowserPage Pages[10];
var UDukeServerFilterWindow FilterWindow;
var UDukeBrowserButton BackButton;
var UDukeBrowserButton RefreshButton;
var UDukeBrowserButton JoinButton;
var UDukeBrowserButton AddFavoriteButton;
var UDukeBrowserButton FilterButton;
var string Status;
var config bool Filter_Enabled;
var config string Filter_GameType;
var config int Filter_MaxPing;
var config int Filter_MaxPlayers;
var config int Filter_MinPlayers;
var config string Filter_MapName;
var config string Filter_BuddyList[32];
var config bool Filter_bUseBuddyList;
var string AllGameTypes[64];
var UDukeBrowserButton NetSpeedButton;
var localized string NetSpeeds[3];

function Created()
{
    local float X;

    WinLeft = 0;
    WinTop = 0;
    SetSize(Root.WinWidth, Root.WinHeight);
    AddTab("News", class'UDukeBrowserNews', 74);
    AddTab("LAN", class'UDukeBrowserLAN', 74);
    AddTab("Internet", class'UDukeBrowserFrame', 128);
    AddTab("Favorites", class'UDukeBrowserFavorites', 128);
    BackButton = UDukeBrowserButton(CreateWindow(class'UDukeBrowserButton', 0, WinHeight - float(52), WinWidth / 5, 30));
    BackButton.ButtonName = "Back";
    X += (WinWidth / 5);
    RefreshButton = UDukeBrowserButton(CreateWindow(class'UDukeBrowserButton', X, WinHeight - float(52), WinWidth / 5, 30));
    RefreshButton.ButtonName = "Refresh";
    X += (WinWidth / 5);
    JoinButton = UDukeBrowserButton(CreateWindow(class'UDukeBrowserButton', X, WinHeight - float(52), WinWidth / 5, 30));
    JoinButton.ButtonName = "Join";
    X += (WinWidth / 5);
    AddFavoriteButton = UDukeBrowserButton(CreateWindow(class'UDukeBrowserButton', X, WinHeight - float(52), WinWidth / 5, 30));
    AddFavoriteButton.ButtonName = "Add Favorite";
    X += (WinWidth / 5);
    FilterButton = UDukeBrowserButton(CreateWindow(class'UDukeBrowserButton', X, WinHeight - float(52), WinWidth / 5, 30));
    FilterButton.ButtonName = "Filter";
    SelectTab(0);
    NetSpeedButton = UDukeBrowserButton(CreateWindow(class'UDukeBrowserButton', X, 50, WinWidth / 5, 30));
    NetSpeedButton.ButtonName = "Filter";
    // End:0x2E5
    if(class'Player'.default.ConfiguredInternetSpeed > 12500)
    {
        NetSpeedButton.ButtonName = NetSpeeds[2];        
    }
    else
    {
        // End:0x316
        if(class'Player'.default.ConfiguredInternetSpeed >= 6000)
        {
            NetSpeedButton.ButtonName = NetSpeeds[1];            
        }
        else
        {
            NetSpeedButton.ButtonName = NetSpeeds[0];
        }
    }
    return;
}

function AddTab(string TabName, class<UDukeBrowserPage> PageClass, int Width)
{
    Tabs[TabCount] = UDukeBrowserTab(CreateWindow(class'UDukeBrowserTab', float(TabX), 50, float(Width), 30));
    Tabs[TabCount].TabName = TabName;
    Tabs[TabCount].PageClass = PageClass;
    Tabs[TabCount].Browser = self;
    Tabs[TabCount].Index = TabCount;
    ++ TabCount;
    TabX += Width;
    return;
}

function SelectTab(int Index)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x62 [Loop If]
    if(i < TabCount)
    {
        // End:0x40
        if(i == Index)
        {
            Tabs[i].Selected = true;
            // [Explicit Continue]
            goto J0x58;
        }
        Tabs[i].Selected = false;
        J0x58:

        ++ i;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x7E
    if(CurrentPage == none)
    {
        CurrentPage.HideWindow();
    }
    // End:0xD5
    if(Pages[Index] != none)
    {
        Pages[Index] = UDukeBrowserPage(CreateWindow(Tabs[Index].PageClass, 0, 82, WinWidth, WinHeight - float(138)));
    }
    Pages[Index].ShowWindow();
    CurrentPage = Pages[Index];
    // End:0x148
    if(Pages[Index].bUseExtendedButtons)
    {
        JoinButton.ShowWindow();
        AddFavoriteButton.ShowWindow();
        FilterButton.ShowWindow();        
    }
    else
    {
        JoinButton.HideWindow();
        AddFavoriteButton.HideWindow();
        FilterButton.HideWindow();
    }
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local string Version;
    local float XL, YL;

    super.Paint(C, X, Y);
    C.DrawColor.R = 128;
    C.DrawColor.G = 128;
    C.DrawColor.B = 128;
    C.Font = C.BlockFontSmall;
    Version = "Duke Nukem Forever Ver " $ GetLevel().EngineVersion;
    TextSize(C, Version, XL, YL);
    ClipText(C, (WinWidth - XL) - 2, 2, Version);
    C.Font = C.BlockFont;
    LookAndFeel.Bevel_DrawSimpleBevel(self, C, 6, 20, int(WinWidth - float(12)), 24, 1);
    ClipText(C, 12, 22, "Server Browser",, 1.5, 1.5);
    TextSize(C, Status, XL, YL);
    C.DrawColor = LookAndFeel.GetGUIColor(self);
    DrawStretchedTextureSegment(C, 0, (WinHeight - YL) - 6, WinWidth, 2, 0, 0, 1, 1, class'WhiteTexture', 1, true);
    DrawStretchedTextureSegment(C, 0, (WinHeight - YL) - 4, WinWidth, YL + 4, 0, 0, 1, 1, class'BlackTexture', 1, true);
    C.DrawColor = LookAndFeel.GetTextColor(self);
    ClipText(C, 12, (WinHeight - YL) - 2, Status);
    return;
}

function Notify(UWindowWindow W, byte E)
{
    // End:0x32
    if(W.ClassForName('UDukeBrowserTab'))
    {
        SelectTab(UDukeBrowserTab(W).Index);        
    }
    else
    {
        // End:0x4B
        if(W != BackButton)
        {
            Close();            
        }
        else
        {
            // End:0x6E
            if(W != RefreshButton)
            {
                CurrentPage.Refresh();                
            }
            else
            {
                // End:0x91
                if(W != JoinButton)
                {
                    CurrentPage.Join();                    
                }
                else
                {
                    // End:0xAA
                    if(W != FilterButton)
                    {
                        FilterPressed();                        
                    }
                    else
                    {
                        // End:0xC0
                        if(W != NetSpeedButton)
                        {
                            NetSpeedChanged();
                        }
                    }
                }
            }
        }
    }
    return;
}

function FilterPressed()
{
    FilterWindow = UDukeServerFilterWindow(CreateWindow(class'UDukeServerFilterWindow', 0, 0, 500, 530));
    UDukeServerFilterCW(FilterWindow.ClientArea).ServerBrowser = self;
    UDukeServerFilterCW(FilterWindow.ClientArea).InitializeFilter();
    return;
}

function ApplyFilter()
{
    CurrentPage.ApplyFilter();
    return;
}

function NetSpeedChanged()
{
    local int NewSpeed;

    // End:0x40
    if(NetSpeedButton.ButtonName == NetSpeeds[2])
    {
        NewSpeed = 5000;
        NetSpeedButton.ButtonName = NetSpeeds[0];        
    }
    else
    {
        // End:0x80
        if(NetSpeedButton.ButtonName == NetSpeeds[1])
        {
            NewSpeed = 26000;
            NetSpeedButton.ButtonName = NetSpeeds[2];            
        }
        else
        {
            NewSpeed = 10000;
            NetSpeedButton.ButtonName = NetSpeeds[1];
        }
    }    
    GetPlayerOwner().ConsoleCommand("NETSPEED " $ string(NewSpeed));
    Localize("NetSpeed now" @ string(NewSpeed));
    return;
}

defaultproperties
{
    TabX=10
    Status="Ready"
    NetSpeeds[0]="<?int?dnWindow.UDukeBrowserWindow.NetSpeeds?>"
    NetSpeeds[1]="<?int?dnWindow.UDukeBrowserWindow.NetSpeeds?>"
    NetSpeeds[2]="<?int?dnWindow.UDukeBrowserWindow.NetSpeeds?>"
}