/*******************************************************************************
 * UAgentBrowserGrid generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UAgentBrowserGrid extends UWindowGrid;

var localized string GameSuffix;
var localized string NameString;
var localized string MapString;
var localized string GameModeString;
var localized string PingString;
var localized string PlayersString;
var localized string DedicatedString;
var localized string FavoriteString;
var localized string FriendsNameString;
var UAgentGridColumn NameColumn;
var UAgentGridColumn MapColumn;
var UAgentGridColumn GameModeColumn;
var UAgentGridColumn PingColumn;
var UAgentGridColumn PlayersColumn;
var UAgentGridColumn DedicatedColumn;
var UAgentGridColumn FavoriteColumn;
var UAgentGridColumn FilterColumnArray[6];
var array<UDukeCheckbox_Favourite> FavBox;
var int SelectedRow;
var int LastSelectedRow;
var int MaxServers;
var int NumServers;
var int ServersPerPage;
var OnlineServerFactory Factory;
var Texture BkgTexture;
var bool bUpdatingServers;
var float EntrySpaceHeight;

function NotifyFromControl(UWindowDialogControl C, byte E)
{
    local bool newVal;
    local int i;

    super(UWindowWindow).NotifyFromControl(C, E);
    // End:0x9D
    if((UDukeCheckbox_Favourite(C) == none) && int(E) == 2)
    {
        newVal = ! Factory.Servers[UDukeCheckbox_Favourite(C).Idx].Favorite;
        Factory.SetServerFavorite(UDukeCheckbox_Favourite(C).Idx, newVal);
        Factory.SaveFavourites();
    }
    return;
}

function Created()
{
    super.Created();
    NameColumn = UAgentGridColumn(AddColumn(NameString, WinWidth * 0.4));
    NameColumn.bLargeGrid = true;
    MapColumn = UAgentGridColumn(AddColumn(MapString, WinWidth * 0.1675));
    MapColumn.bLargeGrid = true;
    GameModeColumn = UAgentGridColumn(AddColumn(GameModeString, WinWidth * 0.1675));
    GameModeColumn.bLargeGrid = true;
    PlayersColumn = UAgentGridColumn(AddColumn(PlayersString, WinWidth * 0.16));
    PlayersColumn.bLargeGrid = true;
    PingColumn = UAgentGridColumn(AddColumn(PingString, WinWidth * 0.1));
    PingColumn.bLargeGrid = true;
    FavoriteColumn = UAgentGridColumn(AddColumn(FavoriteString, WinWidth * 0.1175));
    FavoriteColumn.bLargeGrid = true;
    SelectedRow = -1;
    NumServers = 0;
    ServersPerPage = 1;
    Factory = UAgentSceneBrowserList(GetParent(class'UAgentSceneBrowserList')).Factory;
    Factory.LoadFavourites();
    FilterColumnArray[0] = NameColumn;
    FilterColumnArray[1] = MapColumn;
    FilterColumnArray[2] = GameModeColumn;
    FilterColumnArray[3] = PlayersColumn;
    FilterColumnArray[4] = PingColumn;
    FilterColumnArray[5] = FavoriteColumn;
    PingColumn.bDrawDivider = ! ObjectDestroy();
    return;
}

function DrawCell(Canvas C, float X, float Y, float W, float h, UWindowGridColumn Column, SAgentServerInfo server_info, bool SelectedRow, bool bMouseHovered, int Idx, int Start)
{
    local float XL, YL, FontScale;
    local array<string> nameArray;
    local string GameName;
    local float FontScaleX;

    // End:0x47
    if(SelectedRow)
    {
        C.DrawColor = class'UWindowScene'.default.OrangeColor;
        FontScale = class'UWindowScene'.default.TTFontScale * 0.8;        
    }
    else
    {
        C.DrawColor = class'UWindowScene'.default.GreyColor;
        FontScale = class'UWindowScene'.default.TTFontScale * 0.75;
    }
    // End:0xAA
    if(bMouseHovered)
    {
        C.DrawColor = class'UWindowScene'.default.WhiteColor;
    }
    C.Font = C.TallFont;
    C.RegisterSound(FontScale);
    FontScaleX = FontScale;
    switch(Column)
    {
        // End:0x243
        case NameColumn:
            // End:0x240
            if(server_info.Name != "")
            {
                // End:0x14E
                if(ObjectIsDestroyed() || ! server_info.Dedicated)
                {
                    nameArray[nameArray.Add(1)] = server_info.Name;
                    GameName = FormatTimeString(GameSuffix, nameArray);                    
                }
                else
                {
                    GameName = server_info.Name;
                }
                TextSize(C, GameName, XL, YL, FontScale, FontScale);
                // End:0x1A4
                if(XL > W)
                {
                    FontScaleX *= (W / XL);
                }
                Column.ClipText(C, X, (Y + (h / 2)) - (YL / 2), GameName,, FontScaleX, FontScale,, 2);
                // End:0x240
                if(SelectedRow)
                {
                    UAgentSceneBrowserList(ParentWindow).DrawSelectionIcon(C, X - float(32), Y + (h / 2), 1, 1, true);
                }
            }
            // End:0x747
            break;
        // End:0x301
        case MapColumn:
            // End:0x2FE
            if(server_info.Map != "")
            {
                TextSize(C, server_info.Map, XL, YL, FontScale, FontScale);
                // End:0x2A8
                if(XL > W)
                {
                    FontScaleX *= (W / XL);
                }
                Column.ClipText(C, X, (Y + (h / 2)) - (YL / 2), server_info.Map,, FontScaleX, FontScale,, 2);
            }
            // End:0x747
            break;
        // End:0x3BF
        case GameModeColumn:
            // End:0x3BC
            if(server_info.GameMode != "")
            {
                TextSize(C, server_info.GameMode, XL, YL, FontScale, FontScale);
                // End:0x366
                if(XL > W)
                {
                    FontScaleX *= (W / XL);
                }
                Column.ClipText(C, X, (Y + (h / 2)) - (YL / 2), server_info.GameMode,, FontScaleX, FontScale,, 2);
            }
            // End:0x747
            break;
        // End:0x46D
        case PingColumn:
            TextSize(C, string(server_info.Ping), XL, YL, FontScale, FontScale);
            // End:0x413
            if(XL > W)
            {
                FontScaleX *= (W / XL);
            }
            Column.ClipText(C, X, (Y + (h / 2)) - (YL / 2), string(server_info.Ping),, FontScaleX, FontScale,, 2);
            // End:0x747
            break;
        // End:0x543
        case PlayersColumn:
            TextSize(C, (string(server_info.PlayerCount) $ "/") $ string(server_info.MaxPlayers), XL, YL, FontScale, FontScale);
            // End:0x4D5
            if(XL > W)
            {
                FontScaleX *= (W / XL);
            }
            Column.ClipText(C, X, (Y + (h / 2)) - (YL / 2), (string(server_info.PlayerCount) $ "/") $ string(server_info.MaxPlayers),, FontScaleX, FontScale,, 2);
            // End:0x747
            break;
        // End:0x54E
        case DedicatedColumn:
            // End:0x747
            break;
        // End:0x744
        case FavoriteColumn:
            // End:0x5B1
            if(FavBox[Idx] != none)
            {
                FavBox[Idx] = UDukeCheckbox_Favourite(CreateWindow(class'UDukeCheckbox_Favourite'));
                FavBox[Idx].Register(self);
                FavBox[Idx].CancelAcceptsFocus();
            }
            FavBox[Idx].WinHeight = h;
            FavBox[Idx].WinWidth = W;
            FavBox[Idx].WinLeft = Column.WinLeft + X;
            FavBox[Idx].WinTop = Column.WinTop + Y;
            FavBox[Idx].Idx = Idx + Start;
            // End:0x6A4
            if(! server_info.Dedicated)
            {
                FavBox[Idx].bGreyedOut = true;
                FavBox[Idx].bChecked = false;                
            }
            else
            {
                // End:0x6FB
                if(server_info.Favorite)
                {
                    FavBox[Idx].bGreyedOut = false;
                    FavBox[Idx].bChecked = true;
                    FavBox[Idx].ShowWindow();                    
                }
                else
                {
                    FavBox[Idx].bGreyedOut = false;
                    FavBox[Idx].bChecked = false;
                    FavBox[Idx].ShowWindow();
                }
            }
            // End:0x747
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

function PaintColumn(Canvas C, UWindowGridColumn Column, float MouseX, float MouseY)
{
    local int Idx;
    local float XPadding, YPadding, SelXL, SelYL, NSXL, NSYL;

    local bool bSelected, bMouseHovered;
    local float SelFontScale, UnselFontScale;

    C.Font = C.TallFont;
    SelFontScale = class'UWindowScene'.default.TTFontScale;
    UnselFontScale = class'UWindowScene'.default.TTFontScale * 0.75;
    C.RegisterSound(SelFontScale);
    C.RegisterSound(UnselFontScale);
    TextSize(C, "WWW", SelXL, SelYL, SelFontScale, SelFontScale);
    TextSize(C, "WWW", NSXL, NSYL, UnselFontScale, UnselFontScale);
    RowHeight = (1.5 + SelYL) + 1.5;
    YPadding = Column.ColumnHeadingHeight;
    XPadding = 0;
    Factory.LockMutex();
    Idx = int(VertSB.pos);
    J0x11B:

    // End:0x2BF [Loop If]
    if(((float(Idx) < (VertSB.pos + float(ServersPerPage))) && Idx < NumServers) && Idx < string(Factory.Servers))
    {
        bSelected = float(Idx) == (VertSB.pos + float(SelectedRow));
        bMouseHovered = ((((! GetPlayerOwner().GetSpeakerType() && MouseY >= YPadding) && MouseY < (YPadding + RowHeight)) && MouseX >= - Column.WinLeft) && MouseX < (WinWidth - Column.WinLeft)) && ! UAgentSceneBrowserList(ParentWindow).bFilterDialogVisible;
        DrawCell(C, XPadding, YPadding, Column.WinWidth * 0.9, RowHeight, Column, Factory.Servers[Idx], bSelected, bMouseHovered, int(float(Idx) - VertSB.pos), int(VertSB.pos));
        YPadding += RowHeight;
        ++ Idx;
        // [Loop Continue]
        goto J0x11B;
    }
    Factory.UnlockMutex();
    return;
}

function SortColumn(UWindowGridColumn Column)
{
    UAgentSceneBrowserList(ParentWindow).SetSortedColumn(Column.ColumnNum);
    return;
}

function SelectRow(int Row, optional bool bFromHold)
{
    bNavDownRepeatBlock = true;
    // End:0x31
    if(bFromHold)
    {
        NavRepeatTimeout = GetLevel().TimeSeconds + NavRepeatTimeHold;        
    }
    else
    {
        NavRepeatTimeout = GetLevel().TimeSeconds + NavRepeatTime;
    }
    // End:0x67
    if(NumServers == 0)
    {
        SelectedRow = -1;        
    }
    else
    {
        SelectedRow = Row;
        SelectedRow = Clamp(SelectedRow, 0, Min(NumServers - 1, ServersPerPage - 1));
        // End:0xCE
        if(SelectedRow != LastSelectedRow)
        {
            GetPlayerOwner().PlaySoundInfo(0, class'UWindowScene'.default.SoundNavigateInfo);
            LastSelectedRow = SelectedRow;
        }
    }
    Localize(((((string(self) @ "::SelectRow(") @ string(Row)) @ ") SelectedRow =") @ string(SelectedRow)) @ "");
    return;
}

function DoubleClickRow(int Row)
{
    local int Idx;

    Localize(((string(self) @ "::DoubleClickRow(") @ string(Row)) @ ")");
    SelectRow(Row);
    // End:0x46
    if(SelectedRow == -1)
    {
        return;
    }
    Idx = int(float(SelectedRow) + VertSB.pos);
    // End:0x149
    if((Idx >= 0) && Idx < NumServers)
    {
        Factory.LockMutex();
        // End:0x139
        if(Idx < string(Factory.Servers))
        {
            Localize("Attempting to connect to " $ string(Factory.Servers[Idx].id));
            DukeConsole(Root.Console).DialogMgr.ShowWaitingDialog();
            Factory.ConnectTo(Factory.Servers[Idx].id);
        }
        Factory.UnlockMutex();
    }
    return;
}

function ScrollDown()
{
    Localize(string(self) @ "::ScrollDown()");
    return;
}

function ScrollUp()
{
    Localize(string(self) @ "::ScrollUp()");
    return;
}

function KeyDown(int Key, float X, float Y)
{
    Localize(string(self) @ "::KeyDown()");
    switch(Key)
    {
        // End:0x23
        case int(201):
        // End:0x29
        case int(40):
        // End:0x96
        case int(237):
            // End:0x85
            if(SelectedRow == (ServersPerPage - 1))
            {
                // End:0x82
                if(VertSB.Scroll(1))
                {
                    -- SelectedRow;
                    GetPlayerOwner().PlaySoundInfo(0, class'UWindowScene'.default.SoundNavigateInfo);
                }                
            }
            else
            {
                SelectRow(SelectedRow + 1);
            }
            // End:0x2C2
            break;
        // End:0x9C
        case int(200):
        // End:0xA2
        case int(38):
        // End:0x108
        case int(236):
            // End:0xF7
            if(SelectedRow == 0)
            {
                // End:0xF4
                if(VertSB.Scroll(-1))
                {
                    ++ SelectedRow;
                    GetPlayerOwner().PlaySoundInfo(0, class'UWindowScene'.default.SoundNavigateInfo);
                }                
            }
            else
            {
                SelectRow(SelectedRow - 1);
            }
            // End:0x2C2
            break;
        // End:0x10E
        case int(13):
        // End:0x122
        case int(210):
            DoubleClickRow(SelectedRow);
            // End:0x2C2
            break;
        // End:0x128
        case int(33):
        // End:0x1BD
        case int(208):
            // End:0x14E
            if(VertSB.pos == float(0))
            {
                SelectRow(0);                
            }
            else
            {
                VertSB.Scroll(- VertSB.MaxVisible - float(1));
                GetPlayerOwner().PlaySoundInfo(0, class'UWindowScene'.default.SoundNavigateInfo);
                NavRepeatTimeout = GetLevel().TimeSeconds + NavRepeatTime;
                bNavDownRepeatBlock = true;
            }
            // End:0x2C2
            break;
        // End:0x1C3
        case int(34):
        // End:0x26A
        case int(209):
            // End:0x1FD
            if(VertSB.pos == VertSB.MaxPos)
            {
                SelectRow(ServersPerPage - 1);                
            }
            else
            {
                VertSB.Scroll(VertSB.MaxVisible - float(1));
                GetPlayerOwner().PlaySoundInfo(0, class'UWindowScene'.default.SoundNavigateInfo);
                NavRepeatTimeout = GetLevel().TimeSeconds + NavRepeatTime;
                bNavDownRepeatBlock = true;
            }
            // End:0x2C2
            break;
        // End:0x28F
        case int(36):
            VertSB.Show(0);
            SelectRow(0);
            // End:0x2C2
            break;
        // End:0x2BF
        case int(35):
            VertSB.Show(float(NumServers - 1));
            SelectRow(ServersPerPage - 1);
            // End:0x2C2
            break;
        // End:0xFFFF
        default:
            break;
    }
    UAgentSceneBrowserList(GetParent(class'UAgentSceneBrowserList')).KeyDown(Key, X, Y);
    return;
}

function KeyHold(int Key, float X, float Y)
{
    // End:0x0B
    if(bNavDownRepeatBlock)
    {
        return;
    }
    switch(Key)
    {
        // End:0x19
        case int(201):
        // End:0xA5
        case int(40):
            // End:0x93
            if(SelectedRow == (ServersPerPage - 1))
            {
                // End:0x6B
                if(VertSB.Scroll(1))
                {
                    GetPlayerOwner().PlaySoundInfo(0, class'UWindowScene'.default.SoundNavigateInfo);
                }
                NavRepeatTimeout = GetLevel().TimeSeconds + NavRepeatTimeHold;
                bNavDownRepeatBlock = true;                
            }
            else
            {
                SelectRow(SelectedRow + 1, true);
            }
            // End:0x27B
            break;
        // End:0xAB
        case int(200):
        // End:0x130
        case int(38):
            // End:0x11E
            if(SelectedRow == 0)
            {
                // End:0xF6
                if(VertSB.Scroll(-1))
                {
                    GetPlayerOwner().PlaySoundInfo(0, class'UWindowScene'.default.SoundNavigateInfo);
                }
                NavRepeatTimeout = GetLevel().TimeSeconds + NavRepeatTimeHold;
                bNavDownRepeatBlock = true;                
            }
            else
            {
                SelectRow(SelectedRow - 1, true);
            }
            // End:0x27B
            break;
        // End:0x136
        case int(33):
        // End:0x1CB
        case int(208):
            // End:0x15C
            if(VertSB.pos == float(0))
            {
                SelectRow(0);                
            }
            else
            {
                VertSB.Scroll(- VertSB.MaxVisible - float(1));
                GetPlayerOwner().PlaySoundInfo(0, class'UWindowScene'.default.SoundNavigateInfo);
                NavRepeatTimeout = GetLevel().TimeSeconds + NavRepeatTimeHold;
                bNavDownRepeatBlock = true;
            }
            // End:0x27B
            break;
        // End:0x1D1
        case int(34):
        // End:0x278
        case int(209):
            // End:0x20B
            if(VertSB.pos == VertSB.MaxPos)
            {
                SelectRow(ServersPerPage - 1);                
            }
            else
            {
                VertSB.Scroll(VertSB.MaxVisible - float(1));
                GetPlayerOwner().PlaySoundInfo(0, class'UWindowScene'.default.SoundNavigateInfo);
                NavRepeatTimeout = GetLevel().TimeSeconds + NavRepeatTimeHold;
                bNavDownRepeatBlock = true;
            }
            // End:0x27B
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

function UWindowGridColumn AddColumn(string ColumnHeading, float DefaultWidth)
{
    local UAgentGridColumn NewColumn;
    local UWindowGridColumn OldLastColumn;

    OldLastColumn = LastColumn;
    // End:0x6A
    if(LastColumn != none)
    {
        NewColumn = UAgentGridColumn(ClientArea.CreateWindow(class'UAgentGridColumn', 0, 0, DefaultWidth, WinHeight));
        FirstColumn = NewColumn;
        NewColumn.ColumnNum = 0;        
    }
    else
    {
        NewColumn = UAgentGridColumn(ClientArea.CreateWindow(class'UAgentGridColumn', LastColumn.WinLeft + LastColumn.WinWidth, 0, DefaultWidth, WinHeight));
        LastColumn.NextColumn = NewColumn;
        NewColumn.ColumnNum = LastColumn.ColumnNum + 1;
    }
    LastColumn = NewColumn;
    NewColumn.NextColumn = none;
    NewColumn.PrevColumn = OldLastColumn;
    NewColumn.ColumnHeading = ColumnHeading;
    return NewColumn;
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    local float Offset, XL, YL, YPadding;
    local int CurNumServers;
    local bool ReselectRaw;
    local int i;

    super.BeforePaint(C, X, Y);
    // End:0x27
    if(RowHeight == float(-1))
    {
        return;
    }
    NameColumn.WinWidth = WinWidth * 0.3;
    NameColumn.WinHeight = WinHeight;
    MapColumn.WinWidth = WinWidth * 0.1675;
    MapColumn.WinHeight = WinHeight;
    GameModeColumn.WinWidth = WinWidth * 0.1675;
    GameModeColumn.WinHeight = WinHeight;
    PlayersColumn.WinWidth = WinWidth * 0.16;
    PlayersColumn.WinHeight = WinHeight;
    PingColumn.WinWidth = WinWidth * 0.1;
    PingColumn.WinHeight = WinHeight;
    FavoriteColumn.WinWidth = WinWidth * 0.1;
    FavoriteColumn.WinHeight = WinHeight;
    EntrySpaceHeight = WinHeight - NameColumn.ColumnHeadingHeight;
    ServersPerPage = int(EntrySpaceHeight / RowHeight);
    Factory.LockMutex();
    CurNumServers = Min(string(Factory.Servers), MaxServers);
    Factory.UnlockMutex();
    // End:0x235
    if(bUpdatingServers && ! Factory.IsWaitingForResponse())
    {
        bUpdatingServers = false;
        ReselectRaw = true;
        // End:0x235
        if((CurNumServers == 0) && Factory.HasNoErrors())
        {
            DukeConsole(Root.Console).DialogMgr.ShowDialogBox(26, self);
        }
    }
    // End:0x257
    if(NumServers != CurNumServers)
    {
        NumServers = CurNumServers;
        ReselectRaw = true;
    }
    // End:0x26B
    if(ReselectRaw)
    {
        SelectRow(SelectedRow);
    }
    VertSB.SetRange(0, float(NumServers), float(ServersPerPage), 1);
    // End:0x2B3
    if(NumServers <= ServersPerPage)
    {
        VertSB.HideWindow();        
    }
    else
    {
        VertSB.ShowWindow();
        VertSB.BringToFront();
        VertSB.WinLeft = (WinWidth - VertSB.WinWidth) - float(10);
    }
    i = 0;
    J0x305:

    // End:0x335 [Loop If]
    if(i < string(FavBox))
    {
        FavBox[i].HideWindow();
        ++ i;
        // [Loop Continue]
        goto J0x305;
    }
    return;
}

function QueryServers(int modeFilter, int mapFilter)
{
    NumServers = 0;
    bUpdatingServers = true;
    DukeConsole(Root.Console).DialogMgr.ShowWaitingDialog(self);
    Factory.Start(modeFilter, mapFilter);
    return;
}

function InterruptQuery()
{
    bUpdatingServers = false;
    return;
}

function DukeSuperMessageBoxDone(int Result, Engine.Object.EConsole_Dialog id)
{
    Localize(((((string(self) @ "::DukeSuperMessageBoxDone(") @ string(Result)) @ ", ") @ string(DynamicLoadObject(class'EConsole_Dialog', int(id)))) @ ")");
    // End:0xA6
    if(int(id) == int(3))
    {
        // End:0xA6
        if(Result == 0)
        {
            DukeConsole(Root.Console).DialogMgr.ShowWaitingForResponseDialog();
            Factory.InterruptQuery();
            bUpdatingServers = false;
        }
    }
    return;
}

function int GetSelectedSeverIndex()
{
    return int(float(SelectedRow) + VertSB.pos);
    return;
}

defaultproperties
{
    NameString="<?int?dnWindow.UAgentBrowserGrid.NameString?>"
    MapString="<?int?dnWindow.UAgentBrowserGrid.MapString?>"
    GameModeString="<?int?dnWindow.UAgentBrowserGrid.GameModeString?>"
    PingString="<?int?dnWindow.UAgentBrowserGrid.PingString?>"
    PlayersString="<?int?dnWindow.UAgentBrowserGrid.PlayersString?>"
    DedicatedString="<?int?dnWindow.UAgentBrowserGrid.DedicatedString?>"
    FavoriteString="<?int?dnWindow.UAgentBrowserGrid.FavoriteString?>"
    FriendsNameString="<?int?dnWindow.UAgentBrowserGrid.FriendsNameString?>"
    SelectedRow=-1
    LastSelectedRow=-1
    MaxServers=10000
    ServersPerPage=1
    BkgTexture='Menu.Menu.Backdrop'
    bUpdatingServers=true
    RowHeight=-1
    bBrowserGrid=true
}