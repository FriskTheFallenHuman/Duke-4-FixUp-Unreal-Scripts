/*******************************************************************************
 * UDukeSceneMultiPlayerScoreboard generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneMultiPlayerScoreboard extends UWindowScene;

var float SBScale;
var UDukeSceneMPSB_Solo SoloScoreBoard;
var UDukeSceneMPSB_Team TeamScoreBoard;
var UDukeSceneMultiPlayerScoreboardBase ScoreBoard;
var array<int> CloseKeys;
var array<int> RespawnKeys;
var string timerString;
var localized string ScoreboardTitle;
var localized string mapNamePrefix;
var localized string MutatorNamePrefix;
var localized string timeLimitStr;
var localized string GameModePrefix;
var string MapNameStr;
var string objNameStr;
var string MutatorNameStr;
var string GameModeTxt;

function BeforeCreate()
{
    Localize(string(self) @ "::BeforeCreate::Creating a Solo Scoreboard");
    SoloScoreBoard = UDukeSceneMPSB_Solo(CreateWindow(class'UDukeSceneMPSB_Solo', 1, 1, 1, 1, self));
    Localize(string(self) @ "::BeforeCreate::Creating a Team Scoreboard");
    TeamScoreBoard = UDukeSceneMPSB_Team(CreateWindow(class'UDukeSceneMPSB_Team', 1, 1, 1, 1, self));
    SoloScoreBoard.HideWindow();
    TeamScoreBoard.HideWindow();
    return;
}

function Created()
{
    local int i, j;
    local string KeyName, Alias, Part;
    local array<string> out_array;
    local OnlineAgent Online;
    local class<Mutator> MutatorTypeClass;
    local dnDeathmatchGameReplicationInfo GRI;
    local class<GameInfo> GameTypeClass;

    super.Created();
    KeyButtons[0].HideWindow();
    KeyButtons[1].HideWindow();
    i = 0;
    J0x31:

    // End:0x297 [Loop If]
    if(i < 255)
    {
        KeyName = Root.Console.Viewport.Actor.ConsoleCommand("KEYNAME " $ string(i));
        // End:0x28D
        if(KeyName != "")
        {
            Alias = Root.Console.Viewport.Actor.ConsoleCommand("KEYBINDING " $ KeyName);
            // End:0x28D
            if(Alias != "")
            {
                out_array.Remove(0, string(out_array));
                Split(Alias, "|", out_array);
                j = 0;
                J0x10B:

                // End:0x28D [Loop If]
                if(j < string(out_array))
                {
                    Part = FormatString(out_array[j], true, true);
                    // End:0x1AF
                    if(Part == "ScoreboardToggle")
                    {
                        Localize((("Found Key for ScoreboardToggle:" @ KeyName) @ ".....") @ string(i));
                        CloseKeys.Insert(string(CloseKeys), 1);
                        CloseKeys[string(CloseKeys) - 1] = i;
                    }
                    // End:0x215
                    if(Part == "Fire")
                    {
                        Localize((("Found Key for Fire:" @ KeyName) @ ".....") @ string(i));
                        RespawnKeys.Insert(string(RespawnKeys), 1);
                        RespawnKeys[string(RespawnKeys) - 1] = i;
                    }
                    // End:0x283
                    if(! ObjectDestroy())
                    {
                        // End:0x283
                        if(Part == "Jump")
                        {
                            Localize((("Found Key for Jump:" @ KeyName) @ ".....") @ string(i));
                            RespawnKeys.Insert(string(RespawnKeys), 1);
                            RespawnKeys[string(RespawnKeys) - 1] = i;
                        }
                    }
                    ++ j;
                    // [Loop Continue]
                    goto J0x10B;
                }
            }
        }
        ++ i;
        // [Loop Continue]
        goto J0x31;
    }
    Online = UDukeRootWindow(Root).AgentOnline;
    i = 0;
    J0x2B8:

    // End:0x348 [Loop If]
    if(i < string(class'MPMapInfo'.default.MapList))
    {
        // End:0x33E
        if(class'MPMapInfo'.default.MapList[i].id == Online.CurrentMapId)
        {
            MapNameStr = mapNamePrefix @ ClassIsChildOf("MapNames", class'MPMapInfo'.default.MapList[i].MapName, "Maps");
            // [Explicit Break]
            goto J0x348;
        }
        ++ i;
        // [Loop Continue]
        goto J0x2B8;
    }
    J0x348:

    i = 0;
    J0x34F:

    // End:0x3EE [Loop If]
    if(i < string(class'MPMapInfo'.default.GameTypes))
    {
        // End:0x3E4
        if(class'MPMapInfo'.default.GameTypes[i].id == Online.CurrentGameModeId)
        {
            GameTypeClass = class<GameInfo>(SaveConfigFile(class'MPMapInfo'.default.GameTypes[i].EntryName, class'Class'));
            GameModeTxt = GameModePrefix @ GameTypeClass.default.GameName;
            // [Explicit Break]
            goto J0x3EE;
        }
        ++ i;
        // [Loop Continue]
        goto J0x34F;
    }
    J0x3EE:

    i = 0;
    J0x3F5:

    // End:0x4C1 [Loop If]
    if(i < string(class'MPMapInfo'.default.MutatorTypes))
    {
        // End:0x4B7
        if(class'MPMapInfo'.default.MutatorTypes[i].id == Online.CurrentMutatorId)
        {
            MutatorTypeClass = class<Mutator>(SaveConfigFile(class'MPMapInfo'.default.MutatorTypes[i].EntryName, class'Class', true));
            // End:0x497
            if(MutatorTypeClass == none)
            {
                MutatorNameStr = MutatorNamePrefix @ MutatorTypeClass.default.MutatorName;                
            }
            else
            {
                MutatorNameStr = MutatorNamePrefix @ class'UDukeSceneMPPrivateMatch'.default.MutatatorNoneText;
            }
            // [Explicit Break]
            goto J0x4C1;
        }
        ++ i;
        // [Loop Continue]
        goto J0x3F5;
    }
    J0x4C1:

    GRI = dnDeathmatchGameReplicationInfo(GetPlayerOwner().GameReplicationInfo);
    // End:0x540
    if(GRI.FragLimit > 0)
    {
        objNameStr = ClassIsChildOf("dnDeathmatchGameHUD", "targetScoreString", "dngame") @ string(GRI.FragLimit);        
    }
    else
    {
        // End:0x5A4
        if(GRI.GoalTeamScore > 0)
        {
            objNameStr = ClassIsChildOf("dnDeathmatchGameHUD", "targetScoreString", "dngame") @ string(GRI.GoalTeamScore);            
        }
        else
        {
            objNameStr = ClassIsChildOf("dnDeathmatchGameHUD", "targetScoreString", "dngame") @ timeLimitStr;
        }
    }
    return;
}

function OnNavForward()
{
    super.OnNavForward();
    SoloScoreBoard.HideWindow();
    TeamScoreBoard.HideWindow();
    ScoreBoard = UDukeSceneMultiPlayerScoreboardBase(Root.GetScoreboardWindow());
    // End:0x87
    if(ScoreBoard != none)
    {
        // End:0x79
        if(GetPlayerOwner().GameReplicationInfo.bTeamGame)
        {
            ScoreBoard = TeamScoreBoard;            
        }
        else
        {
            ScoreBoard = SoloScoreBoard;
        }        
    }
    else
    {
        Localize("###Using special scoreboard");
        ScoreBoard.SetParent(self);
    }
    ScoreBoard.Reset();
    ScoreBoard.ShowWindow();
    // End:0x13D
    if(dnDeathmatchGameHUD(GetPlayerOwner().MyHUD) == none)
    {
        Localize(string(self) @ "Setting Delegate");
        dnDeathmatchGameHUD(GetPlayerOwner().MyHUD).__OverrideDrawTimer__Delegate = ScoreBoard.DrawTimer;
    }
    GetPlayerOwner().StopSoundInfo(SoundMenuAmbience);
    return;
}

function CloseScoreboard()
{
    // End:0x76
    if(dnDeathmatchGameHUD(GetPlayerOwner().MyHUD) == none)
    {
        Localize(string(self) @ "Setting Clearing Delegate");
        dnDeathmatchGameHUD(GetPlayerOwner().MyHUD).__OverrideDrawTimer__Delegate = None;
        ScoreBoard.DrawTimer("");
    }
    GetPlayerOwner().HideScoreboard();
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local float XL, YL, textscale, XPos, textSpacing;

    super.Paint(C, X, Y);
    ScoreBoard.WinLeft = Abs(float(C.SizeX) - (float(C.SizeX) * SBScale)) / float(2);
    ScoreBoard.WinWidth = float(C.SizeX) * SBScale;
    ScoreBoard.WinHeight = ScoreBoard.DetermineSize(C);
    ScoreBoard.WinTop = 225 * WinScaleY;
    XPos = ScoreBoard.WinLeft;
    textSpacing = 25 * WinScaleX;
    C.DrawColor = class'UWindowScene'.default.WhiteColor;
    textscale = class'UWindowScene'.default.TTFontScale;
    C.Font = C.TallFont;
    C.SetClip(GameModeTxt, XL, YL, textscale, textscale);
    ClipText(C, XPos, ScoreBoard.WinTop - YL, GameModeTxt,, textscale, textscale,, 2);
    XPos += (XL + textSpacing);
    C.SetClip(MapNameStr, XL, YL, textscale, textscale);
    ClipText(C, XPos, ScoreBoard.WinTop - YL, MapNameStr,, textscale, textscale,, 2);
    XPos += (XL + textSpacing);
    C.SetClip(objNameStr, XL, YL, textscale, textscale);
    ClipText(C, XPos, ScoreBoard.WinTop - YL, objNameStr,, textscale, textscale,, 2);
    XPos += (XL + textSpacing);
    C.SetClip(MutatorNameStr, XL, YL, textscale, textscale);
    ClipText(C, XPos, ScoreBoard.WinTop - YL, MutatorNameStr,, textscale, textscale,, 2);
    return;
}

function KeyDown(int Key, float X, float Y)
{
    super(UWindowWindow).KeyDown(Key, X, Y);
    return;
}

function KeyUp(int Key, float X, float Y)
{
    local int i;

    super(UWindowWindow).KeyUp(Key, X, Y);
    i = 0;
    J0x1C:

    // End:0x51 [Loop If]
    if(i < string(CloseKeys))
    {
        // End:0x47
        if(Key == CloseKeys[i])
        {
            CloseScoreboard();
        }
        ++ i;
        // [Loop Continue]
        goto J0x1C;
    }
    return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
    local bool IsMuted;
    local SAgentPlayer lPlayer;

    // End:0x30
    if((string(KeyButtons) > 0) && C == KeyButtons[1])
    {
        super.NotifyFromControl(C, E);
    }
    Localize(((((string(self) @ "NotifyFromControl(") @ string(C)) @ ", ") @ string(DynamicLoadObject(class'EDE_Debug', int(E)))) @ ")");
    // End:0xE9
    if((int(E) == 2) && ObjectDestroy())
    {
        Localize(string(self) @ "Doing GamerCard stuff");
        UDukeRootWindow(Root).AgentOnline.ShowGamerCard(UDukeScoreboardEntry(C).GetPRI().RoomMemberID);        
    }
    else
    {
        // End:0x1F1
        if(int(E) == 20)
        {
            Localize(string(self) @ "Doing Muting stuff");
            UDukeRootWindow(Root).AgentOnline.GetLocalAgentPlayer(lPlayer);
            // End:0x166
            if(lPlayer.PlayerRef == UDukeScoreboardEntry(C).GetPRI().RoomMemberID)
            {
                return;
            }
            IsMuted = UDukeRootWindow(Root).AgentOnline.IsPlayerMuted(UDukeScoreboardEntry(C).GetPRI().RoomMemberID);
            UDukeRootWindow(Root).AgentOnline.MutePlayer(UDukeScoreboardEntry(C).GetPRI().RoomMemberID, ! IsMuted);
        }
    }
    return;
}

function EscClose()
{
    return;
}

function NavigateBack()
{
    CloseScoreboard();
    super.NavigateBack();
    return;
}

defaultproperties
{
    SBScale=0.8
    ScoreboardTitle="<?int?dnWindow.UDukeSceneMultiPlayerScoreboard.ScoreboardTitle?>"
    mapNamePrefix="<?int?dnWindow.UDukeSceneMultiPlayerScoreboard.mapNamePrefix?>"
    MutatorNamePrefix="<?int?dnWindow.UDukeSceneMultiPlayerScoreboard.MutatorNamePrefix?>"
    timeLimitStr="<?int?dnWindow.UDukeSceneMultiPlayerScoreboard.timeLimitStr?>"
    FilmGrainMaterial=none
    bNoLogo=true
    bNoBackground=true
    bNoLines=true
    SoundMenuAmbience=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=(none),SlotPriority=0,VolumePrefab=0,Slots=(25),Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=true,bMenuSound=false,bNoFilter=true,bNoOcclude=true,bNoAIHear=false,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=true),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
    bIgnoreAllInputs=true
}