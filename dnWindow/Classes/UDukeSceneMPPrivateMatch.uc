/*******************************************************************************
 * UDukeSceneMPPrivateMatch generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneMPPrivateMatch extends UWindowScene
    dependson(UDukeCreateGameCheckBox);

var float LeftArrowPlacement;
var UDukeListSlider MapSelect;
var localized string MapSelectText;
var UDukeListSlider MutatorSelect;
var localized string MutatorSelectText;
var UDukeListSlider ModeSelect;
var localized string ModeSelectText;
var UDukeListSlider MaxPlayerSelect;
var localized string MaxPlayerSelectText;
var localized string MaxPlayerSelectHelp;
var UDukeListSlider MaxScoreSelect;
var localized string MaxScoreSelectHelp;
var string MaxScoreURLText;
var UDukeListSlider TimeLimitSelect;
var localized string TimeLimitSelectText;
var localized string TimeLimitSelectHelp;
var UDukeListSlider RotationTypeSelect;
var localized string RotationTypeSelectText;
var localized string RotationTypeSelectHelp;
var UDukeCreateGameCheckBox PrivateFlagBox;
var localized string PrivateFlagBoxText;
var localized string PrivateFlagBoxHelp;
var localized string Any;
var UDukeMenuNavigationButton CreateGameBttn;
var localized string CreateGameText;
var localized string CreateGameHelp;
var localized string NoLimitStr;
var localized string MutatatorNoneText;
var localized string RotationTypeRepeatText;
var localized string RotationTypeRandomText;
var string RotationTypeRepeatValue;
var string RotationTypeRandomValue;
var bool bValidData;
var int MaxPlayers;
var string MutatorBaseClass;
var class<GameInfo> GameClass;
var MPMapInfo MapList;
var int MutatorSelection;
var bool bItemRejected;

function Created()
{
    local int i;

    super.Created();
    // End:0x2B
    if(MapList != none)
    {
        MapList = GetPlayerOwner().EmptyTouchClasses(class'MPMapInfo');
    }
    ModeSelect = UDukeListSlider(CreateWindow(class'UDukeListSlider', 1, 1, 1, 1));
    ModeSelect.bCyclic = true;
    ModeSelect.ArrowLeft = LeftArrowPlacement;
    ModeSelect.setTextScaleMod(0.8, 0.8);
    MapSelect = UDukeListSlider(CreateWindow(class'UDukeListSlider', 1, 1, 1, 1));
    MapSelect.bCyclic = true;
    MapSelect.ArrowLeft = LeftArrowPlacement;
    MapSelect.setTextScaleMod(0.8, 0.8);
    MutatorSelect = UDukeListSlider(CreateWindow(class'UDukeListSlider', 1, 1, 1, 1));
    MutatorSelect.bCyclic = true;
    MutatorSelect.ArrowLeft = LeftArrowPlacement;
    MutatorSelect.setTextScaleMod(0.8, 0.8);
    MaxPlayerSelect = UDukeListSlider(CreateWindow(class'UDukeListSlider', 1, 1, 1, 1));
    MaxPlayerSelect.ArrowLeft = LeftArrowPlacement;
    MaxPlayerSelect.setTextScaleMod(0.8, 0.8);
    MaxScoreSelect = UDukeListSlider(CreateWindow(class'UDukeListSlider', 1, 1, 1, 1));
    MaxScoreSelect.ArrowLeft = LeftArrowPlacement;
    MaxScoreSelect.setTextScaleMod(0.8, 0.8);
    TimeLimitSelect = UDukeListSlider(CreateWindow(class'UDukeListSlider', 1, 1, 1, 1));
    TimeLimitSelect.ArrowLeft = LeftArrowPlacement;
    TimeLimitSelect.setTextScaleMod(0.8, 0.8);
    RotationTypeSelect = UDukeListSlider(CreateWindow(class'UDukeListSlider', 1, 1, 1, 1));
    RotationTypeSelect.ArrowLeft = LeftArrowPlacement;
    RotationTypeSelect.setTextScaleMod(0.8, 0.8);
    PrivateFlagBox = UDukeCreateGameCheckBox(CreateWindow(class'UDukeCreateGameCheckBox', 1, 1, 1, 1));
    PrivateFlagBox.setTextScaleMod(0.8, 0.8);
    CreateGameBttn = UDukeMenuNavigationButton(CreateWindow(class'UDukeMenuNavigationButton', 1, 1, 1, 1));
    CreateGameBttn.setTextScaleMod(0.8, 0.8);
    MapSelect.ArrowAnchorPoint = 0;
    ModeSelect.ArrowAnchorPoint = 0;
    MutatorSelect.ArrowAnchorPoint = 0;
    MaxPlayerSelect.ArrowAnchorPoint = 0;
    MaxScoreSelect.ArrowAnchorPoint = 0;
    TimeLimitSelect.ArrowAnchorPoint = 0;
    RotationTypeSelect.ArrowAnchorPoint = 0;
    MapSelect.SetText(MapSelectText);
    MutatorSelect.SetText(MutatorSelectText);
    ModeSelect.SetText(ModeSelectText);
    MaxPlayerSelect.SetText(MaxPlayerSelectText);
    MaxPlayerSelect.SetHelpText(MaxPlayerSelectHelp);
    MaxScoreSelect.SetText("");
    MaxScoreSelect.SetHelpText(MaxScoreSelectHelp);
    TimeLimitSelect.SetText(TimeLimitSelectText);
    TimeLimitSelect.SetHelpText(TimeLimitSelectHelp);
    RotationTypeSelect.SetText(RotationTypeSelectText);
    RotationTypeSelect.SetHelpText(RotationTypeSelectHelp);
    PrivateFlagBox.SetText(PrivateFlagBoxText);
    PrivateFlagBox.SetHelpText(PrivateFlagBoxHelp);
    CreateGameBttn.SetText(CreateGameText);
    CreateGameBttn.SetHelpText(CreateGameHelp);
    ModeSelect.NavDown = MapSelect;
    MapSelect.NavDown = MutatorSelect;
    MutatorSelect.NavDown = MaxPlayerSelect;
    MaxPlayerSelect.NavDown = MaxScoreSelect;
    MaxScoreSelect.NavDown = TimeLimitSelect;
    TimeLimitSelect.NavDown = RotationTypeSelect;
    RotationTypeSelect.NavDown = PrivateFlagBox;
    PrivateFlagBox.NavDown = CreateGameBttn;
    CreateGameBttn.NavDown = ModeSelect;
    ModeSelect.NavUp = CreateGameBttn;
    MapSelect.NavUp = ModeSelect;
    MutatorSelect.NavUp = MapSelect;
    MaxPlayerSelect.NavUp = MutatorSelect;
    MaxScoreSelect.NavUp = MaxPlayerSelect;
    TimeLimitSelect.NavUp = MaxScoreSelect;
    RotationTypeSelect.NavUp = TimeLimitSelect;
    PrivateFlagBox.NavUp = RotationTypeSelect;
    CreateGameBttn.NavUp = PrivateFlagBox;
    FirstControlToFocus = ModeSelect;
    PopulateMutatorList();
    PopulateGameTypeList();
    PopulateMapList();
    PopulateMaxScoreList();
    PopulateTimeLimitList();
    PopulateRotationTypeList();
    SetScoreListToDefault();
    MapSelect.SetSelectedIndex(0);
    UpdateFields(MapSelect);
    ModeSelect.SetSelectedIndex(0);
    UpdateFields(ModeSelect);
    MutatorSelect.SetSelectedIndex(0);
    UpdateFields(MutatorSelect);
    TimeLimitSelect.SetSelectedIndex(0);
    RotationTypeSelect.SetSelectedIndex(0);
    ModeSelect.Register(self);
    MapSelect.Register(self);
    MutatorSelect.Register(self);
    MaxPlayerSelect.Register(self);
    MaxScoreSelect.Register(self);
    TimeLimitSelect.Register(self);
    RotationTypeSelect.Register(self);
    PrivateFlagBox.Register(self);
    CreateGameBttn.Register(self);
    return;
}

function OnNavForward()
{
    super.OnNavForward();
    PopulateMapList();
    MapSelect.SetSelectedIndex(0);
    UpdateFields(MapSelect);
    PopulateGameTypeList();
    ModeSelect.SetSelectedIndex(0);
    UpdateFields(ModeSelect);
    MutatorSelect.SetSelectedIndex(0);
    UpdateFields(MutatorSelect);
    SetScoreListToDefault();
    PrivateFlagBox.bChecked = false;
    TimeLimitSelect.SetSelectedIndex(0);
    RotationTypeSelect.SetSelectedIndex(0);
    FirstControlToFocus = ModeSelect;
    MutatorSelection = default.MutatorSelection;
    bItemRejected = default.bItemRejected;
    PopulateMutatorList();
    return;
}

function PopulateTimeLimitList()
{
    TimeLimitSelect.AddItem("10");
    TimeLimitSelect.AddItem("15");
    TimeLimitSelect.AddItem("20");
    return;
}

function PopulateRotationTypeList()
{
    RotationTypeSelect.AddItem(RotationTypeRepeatText, RotationTypeRepeatValue);
    RotationTypeSelect.AddItem(RotationTypeRandomText, RotationTypeRandomValue);
    return;
}

function PopulateMutatorList()
{
    local int i, ii;
    local string LocalizedMutatorName, PackageName, objName, DlcName;
    local bool bRejected;
    local int Index;
    local bool bWasAReject;

    Index = MutatorSelect.GetSelectedIndex();
    // End:0x27
    if(bItemRejected)
    {
        bWasAReject = true;
    }
    bItemRejected = false;
    MutatorSelect.Clear();
    i = 0;
    J0x46:

    // End:0x1CB [Loop If]
    if(i < string(class'MPMapInfo'.default.MutatorTypes))
    {
        IsInState(class'MPMapInfo'.default.MutatorTypes[i].EntryName, PackageName, objName, DlcName);
        // End:0xC0
        if(class'MPMapInfo'.default.MutatorTypes[i].EntryName == "None")
        {
            LocalizedMutatorName = MutatatorNoneText;            
        }
        else
        {
            LocalizedMutatorName = ClassIsChildOf(objName, "MutatorName", PackageName);
        }
        bRejected = false;
        ii = 0;
        J0xEF:

        // End:0x187 [Loop If]
        if(ii < string(class'MPMapInfo'.default.GameTypes[ModeSelect.GetSelectedIndex()].ExcludedMutators))
        {
            // End:0x17D
            if(class'MPMapInfo'.default.GameTypes[ModeSelect.GetSelectedIndex()].ExcludedMutators[ii] == class'MPMapInfo'.default.MutatorTypes[i].EntryName)
            {
                bItemRejected = true;
                bRejected = true;
                // [Explicit Break]
                goto J0x187;
            }
            ++ ii;
            // [Loop Continue]
            goto J0xEF;
        }
        J0x187:

        // End:0x1C1
        if(! bRejected)
        {
            MutatorSelect.AddItem(LocalizedMutatorName, class'MPMapInfo'.default.MutatorTypes[i].EntryName);
        }
        ++ i;
        // [Loop Continue]
        goto J0x46;
    }
    // End:0x200
    if(bItemRejected && Index > 1)
    {
        MutatorSelection = Index;
        MutatorSelect.SetSelectedIndex(0);        
    }
    else
    {
        // End:0x26A
        if(((! bWasAReject || bItemRejected && Index <= 1) || bWasAReject && Index > 0) || bWasAReject && Abs(float(MutatorSelection - Index)) < float(2))
        {
            MutatorSelection = Index;
        }
        MutatorSelect.SetSelectedIndex(MutatorSelection);
    }
    return;
}

function UpdateFields(UWindowDialogControl SliderChanged)
{
    local int minPlayer, maxPlayer, MapIndex, numPlayerOffset, i;

    local GameInfo Info;
    local AvailableGameTypes GameTypeScoreSettings;

    switch(SliderChanged)
    {
        // End:0x52
        case MapSelect:
            MapSelect.SetHelpText(ClassIsChildOf("MapHintText", MapSelect.SelectedItem.Value, "Maps"));
            // End:0x1BA
            break;
        // End:0x165
        case ModeSelect:
            ModeSelect.SetHelpText(ClassIsChildOf("GameModeHintText", ModeSelect.SelectedItem.Value, "dnWindow"));
            MapIndex = PopulateMapList(MapSelect.SelectedItem.Text);
            MapSelect.SetSelectedIndex(MapIndex);
            PopulateMaxScoreList();
            PopulateMutatorList();
            SetScoreListToDefault();
            // End:0x12F
            if(MapList.GetOptionsForGameType(ModeSelect.SelectedItem.Value, GameTypeScoreSettings))
            {
                numPlayerOffset = GameTypeScoreSettings.PlayerStep;
            }
            // End:0x141
            if(numPlayerOffset <= 0)
            {
                numPlayerOffset = 1;
            }
            PopulateMaxPlayerList(numPlayerOffset);
            MaxPlayerSelect.SetSelectedItem(string(MaxPlayers));
            // End:0x1BA
            break;
        // End:0x1B7
        case MutatorSelect:
            MutatorSelect.SetHelpText(ClassIsChildOf("MutatorHintText", MutatorSelect.SelectedItem.Value, "dnWindow"));
            // End:0x1BA
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

function Paint(Canvas C, float X, float Y)
{
    super.Paint(C, X, Y);
    ButtonHeight = int(float(33) * WinScaleY);
    ButtonWidth = int(float(491) * WinScaleY);
    ButtonLeft = int(float(78) * WinScaleY);
    MapSelect.WinWidth = float(ButtonWidth);
    MapSelect.WinHeight = float(ButtonHeight);
    ModeSelect.WinWidth = float(ButtonWidth);
    ModeSelect.WinHeight = float(ButtonHeight);
    MutatorSelect.WinWidth = float(ButtonWidth);
    MutatorSelect.WinHeight = float(ButtonHeight);
    MaxPlayerSelect.WinWidth = float(ButtonWidth);
    MaxPlayerSelect.WinHeight = float(ButtonHeight);
    MaxScoreSelect.WinWidth = float(ButtonWidth);
    MaxScoreSelect.WinHeight = float(ButtonHeight);
    TimeLimitSelect.WinWidth = float(ButtonWidth);
    TimeLimitSelect.WinHeight = float(ButtonHeight);
    RotationTypeSelect.WinWidth = float(ButtonWidth);
    RotationTypeSelect.WinHeight = float(ButtonHeight);
    PrivateFlagBox.WinWidth = float(ButtonWidth);
    PrivateFlagBox.WinHeight = float(ButtonHeight);
    MapSelect.ArrowLeft = LeftArrowPlacement * WinScaleY;
    ModeSelect.ArrowLeft = LeftArrowPlacement * WinScaleY;
    MutatorSelect.ArrowLeft = LeftArrowPlacement * WinScaleY;
    MaxPlayerSelect.ArrowLeft = LeftArrowPlacement * WinScaleY;
    MaxScoreSelect.ArrowLeft = LeftArrowPlacement * WinScaleY;
    TimeLimitSelect.ArrowLeft = LeftArrowPlacement * WinScaleY;
    RotationTypeSelect.ArrowLeft = LeftArrowPlacement * WinScaleY;
    ModeSelect.WinLeft = float(ButtonLeft);
    ModeSelect.WinTop = float(ControlStart);
    MapSelect.WinLeft = float(ButtonLeft);
    MapSelect.WinTop = (ModeSelect.WinTop + ModeSelect.WinHeight) + float(ControlBuffer);
    MutatorSelect.WinLeft = float(ButtonLeft);
    MutatorSelect.WinTop = (MapSelect.WinTop + MapSelect.WinHeight) + float(ControlBuffer);
    MaxPlayerSelect.WinLeft = float(ButtonLeft);
    MaxPlayerSelect.WinTop = (MutatorSelect.WinTop + MutatorSelect.WinHeight) + float(ControlBuffer);
    MaxScoreSelect.WinLeft = float(ButtonLeft);
    MaxScoreSelect.WinTop = (MaxPlayerSelect.WinTop + MaxScoreSelect.WinHeight) + float(ControlBuffer);
    TimeLimitSelect.WinLeft = float(ButtonLeft);
    TimeLimitSelect.WinTop = (MaxScoreSelect.WinTop + MaxScoreSelect.WinHeight) + float(ControlBuffer);
    RotationTypeSelect.WinLeft = float(ButtonLeft);
    RotationTypeSelect.WinTop = (TimeLimitSelect.WinTop + TimeLimitSelect.WinHeight) + float(ControlBuffer);
    PrivateFlagBox.WinLeft = float(ButtonLeft);
    PrivateFlagBox.WinTop = (RotationTypeSelect.WinTop + RotationTypeSelect.WinHeight) + float(ControlBuffer);
    CreateGameBttn.WinWidth = float(ButtonWidth);
    CreateGameBttn.WinHeight = float(ButtonHeight);
    CreateGameBttn.WinLeft = float(ButtonLeft);
    CreateGameBttn.WinTop = (PrivateFlagBox.WinTop + PrivateFlagBox.WinHeight) + float(ControlBuffer);
    return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
    super.NotifyFromControl(C, E);
    switch(E)
    {
        // End:0x2B
        case 1:
            UpdateFields(C);
            // End:0x61
            break;
        // End:0x5E
        case 2:
            // End:0x5E
            if(C != CreateGameBttn)
            {
                GetPlayerOwner().PlaySoundInfo(0, SoundNavigateForwardInfo);
                CreatePressed();
            }
        // End:0xFFFF
        default:
            break;
    }
    return;
}

function PopulateGameTypeList()
{
    local int i;
    local class<GameInfo> GameTypeClass;
    local string PackageName, objName, DlcName;

    ModeSelect.Clear();
    i = 0;
    J0x17:

    // End:0xC8 [Loop If]
    if(i < string(class'MPMapInfo'.default.GameTypes))
    {
        // End:0xBE
        if(! class'MPMapInfo'.default.GameTypes[i].bUIExclude)
        {
            IsInState(class'MPMapInfo'.default.GameTypes[i].EntryName, PackageName, objName, DlcName);
            ModeSelect.AddItem(ClassIsChildOf(objName, "GameName", PackageName), class'MPMapInfo'.default.GameTypes[i].EntryName);
        }
        ++ i;
        // [Loop Continue]
        goto J0x17;
    }
    ModeSelect.SetSelectedIndex(0);
    return;
}

function int PopulateMapList(optional string DefaultMap)
{
    local array<AvailableMaps> mapnames;
    local string LocalizedMapName;
    local int i;

    MapSelect.Clear();
    MapList.GetMapsForGameType(ModeSelect.SelectedItem.Value, mapnames);
    i = 0;
    J0x45:

    // End:0xAD [Loop If]
    if(i < string(mapnames))
    {
        LocalizedMapName = ClassIsChildOf("MapNames", mapnames[i].MapName, "Maps");
        MapSelect.AddItem(LocalizedMapName, mapnames[i].MapName);
        ++ i;
        // [Loop Continue]
        goto J0x45;
    }
    // End:0xD3
    if(DefaultMap != "")
    {
        return Max(0, MapSelect.FindItemByText(DefaultMap));
    }
    return 0;
    return;
}

function PopulateMaxScoreList()
{
    local int maxScore;
    local AvailableGameTypes GameTypeScoreSettings;

    MaxScoreSelect.Clear();
    // End:0x10E
    if(MapList.GetOptionsForGameType(ModeSelect.SelectedItem.Value, GameTypeScoreSettings))
    {
        MaxScoreSelect.SetText(ClassIsChildOf("UDukeSceneMPPrivateMatch", GameTypeScoreSettings.WinConditionText, "dnWindow"));
        maxScore = GameTypeScoreSettings.WinConditionMin;
        J0x92:

        // End:0xD0 [Loop If]
        if(maxScore <= GameTypeScoreSettings.WinConditionMax)
        {
            MaxScoreSelect.AddItem(string(maxScore));
            maxScore += GameTypeScoreSettings.WinConditionStep;
            // [Loop Continue]
            goto J0x92;
        }
        MaxScoreURLText = GameTypeScoreSettings.WinConditionOptionName;
        MaxScoreSelect.AddItem(NoLimitStr, string(-1));
        MaxScoreSelect.ShowWindow();        
    }
    else
    {
        MaxScoreSelect.HideWindow();
    }
    return;
}

function PopulateMaxPlayerList(int Step)
{
    local int i;

    MaxPlayerSelect.Clear();
    i = 2;
    J0x18:

    // End:0x4C [Loop If]
    if(i <= MaxPlayers)
    {
        MaxPlayerSelect.AddItem(string(i));
        i += Step;
        // [Loop Continue]
        goto J0x18;
    }
    return;
}

function SetScoreListToDefault()
{
    local int defaultScore, defaultIdx;
    local AvailableGameTypes GameTypeScoreSettings;

    MapList.GetOptionsForGameType(ModeSelect.SelectedItem.Value, GameTypeScoreSettings);
    defaultScore = GameTypeScoreSettings.WinConditionDefault;
    defaultIdx = MaxScoreSelect.FindItemByText(string(defaultScore));
    // End:0x7A
    if(defaultIdx >= 0)
    {
        MaxScoreSelect.SetSelectedIndex(defaultIdx);
    }
    return;
}

function CreatePressed()
{
    local array<AvailableMaps> mapnames;
    local string URL, PlayerName;
    local SAgentCreateGameOptions Params;
    local int TimeLimit, i, randNum;
    local string NewGameMode;

    Params.IsPrivate = PrivateFlagBox.bChecked;
    Params.Playlist.EntryName = class'OnlineAgent'.default.CustomMatchString;
    Params.Playlist.id = -2;
    Params.Playlist.IsInfinite = true;
    Params.Playlist.MaxPlayers = int(MaxPlayerSelect.SelectedItem.Text);
    // End:0x33D
    if(RotationTypeSelect.SelectedItem.Value == RotationTypeRandomValue)
    {
        Seed(GetPlayerOwner().SetCollision());
        MapList.GetMapsForGameType(ModeSelect.SelectedItem.Value, mapnames);
        i = 0;
        J0xF5:

        // End:0x141 [Loop If]
        if(i < string(mapnames))
        {
            // End:0x137
            if(mapnames[i].MapName == MapSelect.SelectedItem.Value)
            {
                // [Explicit Break]
                goto J0x141;
            }
            ++ i;
            // [Loop Continue]
            goto J0xF5;
        }
        J0x141:

        // End:0x158
        if(i >= string(mapnames))
        {
            i = 0;
        }
        Params.Playlist.Entry.Insert(0, 1);
        Params.Playlist.Entry[0].MapName = mapnames[i].MapName;
        MapList.GetMapPackageSwap(ModeSelect.SelectedItem.Value, MapSelect.SelectedItem.Value, NewGameMode);
        Params.Playlist.Entry[0].GameType = NewGameMode;
        Params.Playlist.Entry[0].Mutator = MutatorSelect.SelectedItem.Value;
        mapnames.Remove(i, 1);
        i = 1;
        J0x237:

        // End:0x33A [Loop If]
        if(string(mapnames) > 0)
        {
            randNum = Rand(string(mapnames));
            Params.Playlist.Entry.Insert(i, 1);
            Params.Playlist.Entry[i].MapName = mapnames[randNum].MapName;
            MapList.GetMapPackageSwap(ModeSelect.SelectedItem.Value, mapnames[randNum].MapName, NewGameMode);
            Params.Playlist.Entry[i].GameType = NewGameMode;
            Params.Playlist.Entry[i].Mutator = MutatorSelect.SelectedItem.Value;
            mapnames.Remove(randNum, 1);
            ++ i;
            // [Loop Continue]
            goto J0x237;
        }        
    }
    else
    {
        Params.Playlist.Entry.Insert(0, 1);
        MapList.GetMapPackageSwap(ModeSelect.SelectedItem.Value, MapSelect.SelectedItem.Value, NewGameMode);
        Params.Playlist.Entry[0].MapName = MapSelect.SelectedItem.Value;
        Params.Playlist.Entry[0].GameType = NewGameMode;
        Params.Playlist.Entry[0].Mutator = MutatorSelect.SelectedItem.Value;
    }
    TimeLimit = int(TimeLimitSelect.SelectedItem.Text) * 60;
    // End:0x4BA
    if(MaxScoreSelect.SelectedItem.Value == "")
    {
        UDukeRootWindow(Root).SetAdditionalOptions((((("?" $ MaxScoreURLText) $ "=") $ MaxScoreSelect.SelectedItem.Text) $ "?RoundTimeLimit=") $ string(TimeLimit));        
    }
    else
    {
        UDukeRootWindow(Root).SetAdditionalOptions((((("?" $ MaxScoreURLText) $ "=") $ MaxScoreSelect.SelectedItem.Value) $ "?RoundTimeLimit=") $ string(TimeLimit));
    }
    DukeConsole(Root.Console).DialogMgr.ShowWaitingDialog();
    UDukeRootWindow(Root).AgentOnline.CreateGame(Params);
    return;
}

function Tick(float Delta)
{
    super.Tick(Delta);
    // End:0x6A
    if(! GetGearboxEngineGlobals() && ! UDukeRootWindow(Root).AgentOnline.IsSignedIn())
    {
        NavigateBack();
        DukeConsole(Root.Console).DialogMgr.ShowDialogBox(47);
    }
    return;
}

defaultproperties
{
    LeftArrowPlacement=285
    MapSelectText="<?int?dnWindow.UDukeSceneMPPrivateMatch.MapSelectText?>"
    MutatorSelectText="<?int?dnWindow.UDukeSceneMPPrivateMatch.MutatorSelectText?>"
    ModeSelectText="<?int?dnWindow.UDukeSceneMPPrivateMatch.ModeSelectText?>"
    MaxPlayerSelectText="<?int?dnWindow.UDukeSceneMPPrivateMatch.MaxPlayerSelectText?>"
    MaxPlayerSelectHelp="<?int?dnWindow.UDukeSceneMPPrivateMatch.MaxPlayerSelectHelp?>"
    MaxScoreSelectHelp="<?int?dnWindow.UDukeSceneMPPrivateMatch.MaxScoreSelectHelp?>"
    MaxScoreURLText="FRAG LIMIT"
    TimeLimitSelectText="<?int?dnWindow.UDukeSceneMPPrivateMatch.TimeLimitSelectText?>"
    TimeLimitSelectHelp="<?int?dnWindow.UDukeSceneMPPrivateMatch.TimeLimitSelectHelp?>"
    RotationTypeSelectText="<?int?dnWindow.UDukeSceneMPPrivateMatch.RotationTypeSelectText?>"
    RotationTypeSelectHelp="<?int?dnWindow.UDukeSceneMPPrivateMatch.RotationTypeSelectHelp?>"
    PrivateFlagBoxText="<?int?dnWindow.UDukeSceneMPPrivateMatch.PrivateFlagBoxText?>"
    PrivateFlagBoxHelp="<?int?dnWindow.UDukeSceneMPPrivateMatch.PrivateFlagBoxHelp?>"
    Any="<?int?dnWindow.UDukeSceneMPPrivateMatch.Any?>"
    CreateGameText="<?int?dnWindow.UDukeSceneMPPrivateMatch.CreateGameText?>"
    CreateGameHelp="<?int?dnWindow.UDukeSceneMPPrivateMatch.CreateGameHelp?>"
    NoLimitStr="<?int?dnWindow.UDukeSceneMPPrivateMatch.NoLimitStr?>"
    MutatatorNoneText="<?int?dnWindow.UDukeSceneMPPrivateMatch.MutatatorNoneText?>"
    RotationTypeRepeatText="<?int?dnWindow.UDukeSceneMPPrivateMatch.RotationTypeRepeatText?>"
    RotationTypeRandomText="<?int?dnWindow.UDukeSceneMPPrivateMatch.RotationTypeRandomText?>"
    RotationTypeRepeatValue="0"
    RotationTypeRandomValue="1"
    MaxPlayers=8
    MutatorBaseClass="Engine.Mutator"
    MutatorSelection=-1
    LineBottomY=565
    TitleText="<?int?dnWindow.UDukeSceneMPPrivateMatch.TitleText?>"
}