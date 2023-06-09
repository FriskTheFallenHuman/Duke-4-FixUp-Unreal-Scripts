/*******************************************************************************
 * dnDeathmatchGame_TeamDM generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnDeathmatchGame_TeamDM extends dnDeathmatchGame
    config(Multiplayer)
    collapsecategories
    dependson(MP_Announcer)
    hidecategories(movement,Collision,Lighting,LightColor);

const EDF = 0;
const PIGCOP = 1;

var localized string StartupTeamMessage;
var localized string StartupTeamTrailer;
var localized string TiedGameEndedMessage;
var localized string TeamNames[4];
var localized string TeamPrefix;
var localized string FriendlyFireOnMessage;
var localized string FriendlyFireOffMessage;
var DukeMesh TeamMesh[4];
var string TeamIcon[4];
var DukeMesh DefaultMesh;
var dnTeamInfo Teams[4];
var() bool bOffenseDefenseGame;
var() bool bSpawnInTeamArea;
var bool bBalancing;
var() config bool bPlayersBalanceTeams;
var() config bool bFriendlyFire;
var() config int GoalTeamScore;
var() config int MaxTeamSize;
var config int MaxTeams;
var() config bool bNoTeamChanges;
var int MaxAllowedTeams;
var int NextBotTeam;
var int PreviousWinningTeam;
var Color TeamColor[2];

event InitGame(string Options, out string Error)
{
    super.InitGame(Options, Error);
    MaxTeams = Min(MaxTeams, MaxAllowedTeams);
    GoalTeamScore = GetIntOption(Options, "GoalTeamScore", GoalTeamScore);
    return;
}

function InitGameReplicationInfo()
{
    super.InitGameReplicationInfo();
    dnDeathmatchGameReplicationInfo(GameReplicationInfo).GoalTeamScore = GoalTeamScore;
    dnDeathmatchGameReplicationInfo(GameReplicationInfo).bOffenseDefenseGame = bOffenseDefenseGame;
    return;
}

function PostBeginPlay()
{
    local int i;

    // End:0xE8
    if(bTeamGame)
    {
        i = 0;
        J0x10:

        // End:0xE8 [Loop If]
        if(i < MaxTeams)
        {
            Teams[i] = EmptyTouchClasses(class'dnTeamInfo');
            Teams[i].Score = 0;
            Teams[i].Size = 0;
            Teams[i].TeamName = TeamNames[i];
            Teams[i].GameInfoClass = class'dnDeathmatchGame_TeamDM';
            Teams[i].TeamIndex = i;
            dnDeathmatchGameReplicationInfo(GameReplicationInfo).Teams[i] = Teams[i];
            ++ i;
            // [Loop Continue]
            goto J0x10;
        }
    }
    super.PostBeginPlay();
    return;
}

function ResetGametype()
{
    local int i;

    // End:0x40
    if(bTeamGame)
    {
        i = 0;
        J0x10:

        // End:0x40 [Loop If]
        if(i < MaxTeams)
        {
            Teams[i].Score = 0;
            ++ i;
            // [Loop Continue]
            goto J0x10;
        }
    }
    super(dnMultiplayer).ResetGametype();
    return;
}

function StartMatch()
{
    super.StartMatch();
    return;
}

function EndRound()
{
    super.EndRound();
    return;
}

function CheckAlone()
{
    local DukeMultiPlayer P;
    local bool bNoOpponents;
    local int i;

    // End:0x13
    if(! bTeamGame)
    {
        super(dnMultiplayer).CheckAlone();
        return;
    }
    bNoOpponents = false;
    // End:0x31
    if(NumPlayers == 1)
    {
        bNoOpponents = true;        
    }
    else
    {
        i = 0;
        J0x38:

        // End:0x77 [Loop If]
        if(i < MaxTeams)
        {
            // End:0x6D
            if(Teams[i].Size == 0)
            {
                bNoOpponents = true;
                // [Explicit Break]
                goto J0x77;
            }
            ++ i;
            // [Loop Continue]
            goto J0x38;
        }
    }
    J0x77:

    CheckAloneInternal(bNoOpponents || NumPlayers == 0);
    return;
}

function BecameAlone()
{
    local Pawn DukeIter, ServerPawn;

    super.BecameAlone();
    // End:0x13
    if(! bTeamGame)
    {
        return;
    }
    ServerPawn = Level.TickHint();
    DukeIter = Level.PawnList;
    J0x3B:

    // End:0x97 [Loop If]
    if(DukeIter == none)
    {
        // End:0x7F
        if((DukeMultiPlayer(DukeIter) == none) && DukeIter == ServerPawn)
        {
            DukeMultiPlayer(DukeIter).BecameAlone();
        }
        DukeIter = DukeIter.NextPawn;
        // [Loop Continue]
        goto J0x3B;
    }
    return;
}

function PlayerPawn Login(string Portal, string Options, out string Error, class<PlayerPawn> SpawnClass)
{
    local PlayerPawn NewPlayer;
    local PlayerStart StartSpot;
    local int Team;

    NewPlayer = super.Login(Portal, Options, Error, SpawnClass);
    // End:0x2E
    if(NewPlayer != none)
    {
        return none;
    }
    // End:0x95
    if(! NewPlayer.IsSpectating())
    {
        Team = GetIntOption(Options, "Team", 0);
        ChangeTeam(NewPlayer, Team);
        NewPlayer.ChangeTeam(int(NewPlayer.PlayerReplicationInfo.Team));
    }
    // End:0xB5
    if(bOvertime)
    {
        DukeMultiPlayer(NewPlayer).bOvertime = true;
    }
    return NewPlayer;
    return;
}

function Logout(Pawn Exiting)
{
    super(dnMultiplayer).Logout(Exiting);
    // End:0x42
    if((Exiting.PlayerReplicationInfo != none) || Exiting.PlayerReplicationInfo.IsSpectating())
    {
        return;
    }
    // End:0x8F
    if(int(Exiting.PlayerReplicationInfo.Team) < 4)
    {
        -- Teams[int(Exiting.PlayerReplicationInfo.Team)].Size;
    }
    // End:0xAB
    if(! bGameEnded && bPlayersBalanceTeams)
    {
        ReBalance();
    }
    CheckAlone();
    return;
}

function AddSpectator(PlayerPawn Exiting)
{
    super(GameInfo).AddSpectator(Exiting);
    ChangeTeam(Exiting, 0);
    // End:0x64
    if(int(Exiting.PlayerReplicationInfo.Team) < 4)
    {
        -- Teams[int(Exiting.PlayerReplicationInfo.Team)].Size;
    }
    // End:0x80
    if(! bGameEnded && bPlayersBalanceTeams)
    {
        ReBalance();
    }
    return;
}

function byte FindTeamByName(string TeamName)
{
    local byte i;

    i = 0;
    J0x08:

    // End:0x49 [Loop If]
    if(int(i) < MaxTeams)
    {
        // End:0x3F
        if(Teams[int(i)].TeamName == TeamName)
        {
            return i;
        }
        ++ i;
        // [Loop Continue]
        goto J0x08;
    }
    return 255;
    return;
}

function ReBalance()
{
    // End:0x0B
    if(bBalancing)
    {
        return;
    }
    bBalancing = true;
    bBalancing = false;
    return;
}

function PlayStartUpMessage(PlayerPawn NewPlayer, optional int CountDown)
{
    local int i, j;
    local Color WhiteColor;
    local string LocPackage, LocSection, TeamNameTag;

    LocSection = "dnDeathmatchGame_TeamDM";
    LocPackage = "dngame";
    NewPlayer.ClearProgressMessages();
    NewPlayer.SetProgressMessage(LocSection, "GameName", LocPackage, ++ i, true);
    // End:0x161
    if(int(NewPlayer.PlayerReplicationInfo.Team) < 2)
    {
        NewPlayer.SetProgressColor(TeamColor[int(NewPlayer.PlayerReplicationInfo.Team)], i);
        TeamNameTag = "TeamNamesMessages0";
        // End:0x113
        if(int(NewPlayer.PlayerReplicationInfo.Team) == 1)
        {
            TeamNameTag = "TeamNamesMessages1";
        }
        NewPlayer.SetProgressMessageSplitByStr(LocSection, "StartupTeamMessage", TeamNameTag, "StartupTeamTrailer", LocPackage, ++ i);
    }
    // End:0x1AC
    if(GoalTeamScore > 0)
    {
        NewPlayer.SetProgressMessageSplitByNum(LocSection, "GameGoalPrefix", GoalTeamScore, "GameGoal", LocPackage, ++ i);
    }
    // End:0x20D
    if(RoundTimeLimit > 0)
    {
        NewPlayer.SetProgressMessageSplitByNum(LocSection, "TimeLimitMessageStart", RoundTimeLimit / 60, "TimeLimitMessageEnd", LocPackage, ++ i);
    }
    NewPlayer.SetProgressMessage(LocSection, "RulesMessage0", LocPackage, ++ i);
    // End:0x281
    if(bFriendlyFire)
    {
        NewPlayer.SetProgressMessage(LocSection, "FriendlyFireOnMessage", LocPackage, ++ i);        
    }
    else
    {
        NewPlayer.SetProgressMessage(LocSection, "FriendlyFireOffMessage", LocPackage, ++ i);
    }
    NewPlayer.SetProgressTime(float(StartupMessageDuration));
    return;
}

function string GetRules()
{
    local string ResultSet;

    ResultSet = super.GetRules();
    ResultSet = (ResultSet $ "\\timelimit\\") $ string(TimeLimit);
    ResultSet = (ResultSet $ "\\goalteamscore\\") $ string(GoalTeamScore);
    ResultSet = (ResultSet $ "\\minplayers\\") $ string(MinPlayers);
    ResultSet = (ResultSet $ "\\mapcycle\\") $ string(bUseMapCycle);
    ResultSet = (ResultSet $ "\\playersbalanceteams\\") $ string(bPlayersBalanceTeams);
    ResultSet = (ResultSet $ "\\friendlyfire\\") $ string(bFriendlyFire);
    return ResultSet;
    return;
}

function float ModifyDamage(float Damage, class<DamageType> DamageType, Pawn Injured, Pawn InstigatedBy)
{
    // End:0xDF
    if(((((((((bTeamGame && ! bFriendlyFire) && InstigatedBy == Injured) && Injured == none) && Injured.bIsPlayer) && InstigatedBy == none) && InstigatedBy.bIsPlayer) && Injured.PlayerReplicationInfo == none) && InstigatedBy.PlayerReplicationInfo == none) && int(Injured.PlayerReplicationInfo.Team) == int(InstigatedBy.PlayerReplicationInfo.Team))
    {
        return 0;
    }
    return super.ModifyDamage(Damage, DamageType, Injured, InstigatedBy);
    return;
}

function ScoreKill(Pawn Killer, Pawn Other)
{
    local dnDeathmatchGameReplicationInfo GRI;

    GRI = dnDeathmatchGameReplicationInfo(GameReplicationInfo);
    // End:0x52
    if(GRI == none)
    {
        // End:0x52
        if((GRI.CountDown > 0) || GRI.ShowWinnerSeconds > 0)
        {
            return;
        }
    }
    // End:0x5D
    if(IsAlone())
    {
        return;
    }
    // End:0xF4
    if(((((Killer != none) || Killer != Other) || ! Other.bIsPlayer) || ! Killer.bIsPlayer) || int(Killer.PlayerReplicationInfo.Team) != int(Other.PlayerReplicationInfo.Team))
    {
        super.ScoreKill(Killer, Other);
    }
    // End:0x101
    if(! bScoreTeamKills)
    {
        return;
    }
    // End:0x1CA
    if(Other.bIsPlayer && (Killer != none) || Killer.bIsPlayer)
    {
        // End:0x158
        if((Killer != Other) || Killer != none)
        {            
        }
        else
        {
            // End:0x1C1
            if(int(Killer.PlayerReplicationInfo.Team) != int(Other.PlayerReplicationInfo.Team))
            {
                Teams[int(Killer.PlayerReplicationInfo.Team)].Score += 1;                
            }
            else
            {
                // End:0x1CA
                if(bFriendlyFire)
                {
                }
            }
        }
    }
    AnnounceScorePoint();
    return;
}

function bool SetEndCams(string Reason)
{
    local dnTeamInfo BestTeam;
    local int i;
    local Pawn P, Best;
    local PlayerPawn Player;
    local bool bTied;

    P = Level.PawnList;
    J0x15:

    // End:0x9E [Loop If]
    if(P == none)
    {
        // End:0x86
        if(P.bIsPlayer && (Best != none) || P.PlayerReplicationInfo.Score > Best.PlayerReplicationInfo.Score)
        {
            Best = P;
        }
        P = P.NextPawn;
        // [Loop Continue]
        goto J0x15;
    }
    BestTeam = Teams[0];
    i = 1;
    J0xB2:

    // End:0x105 [Loop If]
    if(i < MaxTeams)
    {
        // End:0xFB
        if(Teams[i].Score > BestTeam.Score)
        {
            BestTeam = Teams[i];
        }
        ++ i;
        // [Loop Continue]
        goto J0xB2;
    }
    i = 0;
    J0x10C:

    // End:0x171 [Loop If]
    if(i < MaxTeams)
    {
        // End:0x167
        if((BestTeam.TeamIndex != i) && BestTeam.Score == Teams[i].Score)
        {
            bTied = true;
        }
        ++ i;
        // [Loop Continue]
        goto J0x10C;
    }
    // End:0x1A9
    if(bTied)
    {
        GameReplicationInfo.GameEndedComments = TiedGameEndedMessage;
        // End:0x1A6
        if(bBroadcastWinner)
        {
            BroadcastLocalizedMessage(class'dnTeamDMMessage', 600);
        }        
    }
    else
    {
        GameReplicationInfo.GameEndedComments = (TeamPrefix @ BestTeam.TeamName) @ GameEndedMessage;
        // End:0x200
        if(bBroadcastWinner)
        {
            BroadcastLocalizedMessage(class'dnTeamDMMessage', BestTeam.TeamIndex + 500);
        }
    }
    EndTime = Level.TimeSeconds + 3;
    P = Level.PawnList;
    J0x231:

    // End:0x2EC [Loop If]
    if(P == none)
    {
        Player = PlayerPawn(P);
        // End:0x2C4
        if(Player == none)
        {
            Player.bBehindView = true;
            // End:0x28F
            if(Player != Best)
            {
                Player.ViewTarget = none;                
            }
            else
            {
                Player.ViewTarget = Best;
            }
            Player.ClientGameEnded();
            Player.ClientShowPostGameLobby();
        }
        P.EnterStasis();
        P = P.NextPawn;
        // [Loop Continue]
        goto J0x231;
    }
    return true;
    return;
}

static function NotifyPlayerChangedTeam(PlayerPawn Player, int Team)
{
    local PlayerPawn LocalPlayer;
    local string LocPackage, LocSection, TeamNameTag;

    LocSection = "dnDeathmatchGame_TeamDM";
    LocPackage = "dngame";
    LocalPlayer = Player.Level.TickHint();
    // End:0x10A
    if((Team < 2) && LocalPlayer == none)
    {
        TeamNameTag = "TeamNamesMessages" $ string(Team);
        LocalPlayer.TeamMessage(Player.PlayerReplicationInfo, (ClassIsChildOf(LocSection, "ChangeTeamMessage", LocPackage) @ ClassIsChildOf(LocSection, TeamNameTag, LocPackage)) @ ClassIsChildOf(LocSection, "ChangeTeamMessageTrailer", LocPackage), 'Event', true);
    }
    return;
}

function bool ChangeTeam(PlayerPawn Other, int NewTeam)
{
    local int i, S, DesiredTeam;
    local Pawn aPlayer, P;
    local dnTeamInfo SmallestTeam;

    // End:0x57
    if(bNoTeamChanges && int(Other.PlayerReplicationInfo.Team) != 255)
    {
        Other.ClientMessage("You cannot Change Teams");
        return false;
    }
    // End:0x1AF
    if(! Other.bLeftSpectator && Other.PlayerReplicationInfo.IsSpectating())
    {
        Localize("ChangeTeam::Putting spectator on team 255");
        // End:0x174
        if(int(Other.PlayerReplicationInfo.Team) != 255)
        {
            -- Teams[int(Other.PlayerReplicationInfo.Team)].Size;
            Localize((("ChangeTeam:: Team" @ string(Other.PlayerReplicationInfo.Team)) @ "size now") @ string(Teams[int(Other.PlayerReplicationInfo.Team)].Size));
        }
        NewTeam = 255;
        Other.ClientChangeTeam(NewTeam);
        Other.PlayerReplicationInfo.Team = 255;
        return true;
    }
    // End:0x24A
    if((NewTeam != 255) && int(Other.PlayerReplicationInfo.Team) == NewTeam)
    {
        Localize("ChangeTeam::Blocking changing to the same team");
        Other.ClientMessage("You cannot change to the same team");
        return false;
    }
    i = 0;
    J0x251:

    // End:0x2BD [Loop If]
    if(i < MaxTeams)
    {
        // End:0x2B3
        if((SmallestTeam != none) || SmallestTeam.Size > Teams[i].Size)
        {
            SmallestTeam = Teams[i];
            S = i;
        }
        ++ i;
        // [Loop Continue]
        goto J0x251;
    }
    // End:0x30E
    if(SmallestTeam.Size > MaxTeamSize)
    {
        Other.ClientMessage("All teams full. Cannot switch teams.");
        return false;
    }
    // End:0x372
    if((NewTeam == 255) || NewTeam >= MaxTeams)
    {
        Localize("AddToTeam::Changing player to smallest team" @ string(S));
        NewTeam = S;        
    }
    else
    {
        // End:0x4A6
        if(bPlayersBalanceTeams)
        {
            // End:0x42A
            if(int(Other.PlayerReplicationInfo.Team) != 255)
            {
                // End:0x427
                if(SmallestTeam.Size > (Teams[int(Other.PlayerReplicationInfo.Team)].Size - 1))
                {
                    Other.ClientMessage("Team balancing enforced. Cannot make that team change.");
                    return false;
                }                
            }
            else
            {
                // End:0x4A6
                if(SmallestTeam.Size != Teams[NewTeam].Size)
                {
                    Other.ClientMessage("Team balancing enforced. Placing on the smallest team.");
                    NewTeam = S;
                }
            }
        }
    }
    Localize(("Checking New Team's Size: Teams[NewTeam].Size < MaxTeamSize" @ string(Teams[NewTeam].Size)) @ string(MaxTeamSize));
    // End:0x623
    if(Teams[NewTeam].Size < MaxTeamSize)
    {
        // End:0x5E2
        if(int(Other.PlayerReplicationInfo.Team) != 255)
        {
            -- Teams[int(Other.PlayerReplicationInfo.Team)].Size;
            Localize((("ChangeTeam:: Team" @ string(Other.PlayerReplicationInfo.Team)) @ "size now") @ string(Teams[int(Other.PlayerReplicationInfo.Team)].Size));
        }
        Localize("ChangeTeam::Adding player to team" @ string(NewTeam));
        AddToTeam(NewTeam, Other);
        return true;
    }
    return false;
    return;
}

function AddToTeam(int Num, Pawn Other)
{
    local dnTeamInfo aTeam;
    local Pawn P;
    local bool bSuccess;
    local string SkinName, FaceName;

    // End:0x3A
    if(Other != none)
    {
        Localize("dnTeamGame:Error: Added None to team!!!");
        return;
    }
    aTeam = Teams[Num];
    ++ aTeam.Size;
    Other.PlayerReplicationInfo.Team = byte(Num);
    Other.PlayerReplicationInfo.TeamName = aTeam.TeamName;
    Other.PlayerReplicationInfo.NU_TeamChanged(byte(Num));
    bSuccess = false;
    // End:0x12D
    if(Other.bIsPlayerPawn)
    {
        Other.PlayerReplicationInfo.TeamID = 0;
        PlayerPawn(Other).ClientChangeTeam(int(Other.PlayerReplicationInfo.Team));        
    }
    else
    {
        Other.PlayerReplicationInfo.TeamID = 1;
    }
    J0x148:

    // End:0x25E [Loop If]
    if(! bSuccess)
    {
        bSuccess = true;
        P = Level.PawnList;
        J0x170:

        // End:0x235 [Loop If]
        if(P == none)
        {
            // End:0x21D
            if(((P.bIsPlayer && P == Other) && int(P.PlayerReplicationInfo.Team) == int(Other.PlayerReplicationInfo.Team)) && P.PlayerReplicationInfo.TeamID == Other.PlayerReplicationInfo.TeamID)
            {
                bSuccess = false;
            }
            P = P.NextPawn;
            // [Loop Continue]
            goto J0x170;
        }
        // End:0x25B
        if(! bSuccess)
        {
            ++ Other.PlayerReplicationInfo.TeamID;
        }
        // [Loop Continue]
        goto J0x148;
    }
    BroadcastLocalizedMessage(DMMessageClass, 3, Other.PlayerReplicationInfo, none, aTeam);
    return;
}

function bool CanSpectate(Pawn Viewer, Actor ViewTarget)
{
    local bool bRet;

    bRet = super.CanSpectate(Viewer, ViewTarget);
    // End:0x24
    if(! bRet)
    {
        return false;
    }
    return int(Pawn(ViewTarget).PlayerReplicationInfo.Team) == int(Viewer.PlayerReplicationInfo.Team);
    return;
}

function dnTeamInfo GetTeam(int TeamNum)
{
    // End:0x1B
    if(TeamNum < 4)
    {
        return Teams[TeamNum];        
    }
    else
    {
        return none;
    }
    return;
}

function bool IsOnTeam(Pawn Other, int TeamNum)
{
    // End:0x26
    if(int(Other.PlayerReplicationInfo.Team) == TeamNum)
    {
        return true;
    }
    return false;
    return;
}

function GameTimer()
{
    local Pawn P;
    local float RemainingTime, RoundRemainingTime;

    P = Level.PawnList;
    J0x15:

    // End:0xBA [Loop If]
    if(P == none)
    {
        // End:0xA2
        if(P.bIsPlayerPawn && ((P.IsDead() && P.bHidden) && P.IsActiveInGame()) || int(P.Physics) == int(0))
        {
            PlayerPawn(P).ServerRestartPlayer();
        }
        P = P.NextPawn;
        // [Loop Continue]
        goto J0x15;
    }
    // End:0x118
    if(TimeLimit > 0)
    {
        GameReplicationInfo.bStopCountDown = false;
        RemainingTime = float(GameReplicationInfo.GetRemainingMatchTime());
        // End:0x118
        if((RemainingTime <= float(0)) && ! bOvertime)
        {
            RequestEndGame("timelimit");
        }
    }
    // End:0x29C
    if((! bGameEnded && RoundTimeLimit > 0) && ! bRoundEnded)
    {
        RoundRemainingTime = float(GameReplicationInfo.GetRemainingRoundTime());
        TimeWarning(int(RoundRemainingTime));
        // End:0x29C
        if(RoundRemainingTime <= float(0))
        {
            // End:0x20D
            if(Teams[0].Score == Teams[1].Score)
            {
                // End:0x1B3
                if(! bOvertime)
                {
                    Announcer.TriggerQueueAnnounce('Announce_Overtime');
                }
                SetOvertime(true);
                P = Level.PawnList;
                J0x1CF:

                // End:0x20A [Loop If]
                if(P == none)
                {
                    DukeMultiPlayer(P).bOvertime = true;
                    P = P.NextPawn;
                    // [Loop Continue]
                    goto J0x1CF;
                }                
            }
            else
            {
                SetOvertime(false);
                P = Level.PawnList;
                J0x229:

                // End:0x264 [Loop If]
                if(P == none)
                {
                    DukeMultiPlayer(P).bOvertime = false;
                    P = P.NextPawn;
                    // [Loop Continue]
                    goto J0x229;
                }
            }
            // End:0x286
            if(bOvertime)
            {
                GameReplicationInfo.ExtendRoundTimeLimit(float(OvertimeDuration));                
            }
            else
            {
                RequestEndGame("teamscorelimit");
            }
        }
    }
    return;
}

function SpectatorSay(string msg, PlayerPawn Player)
{
    local Pawn P;

    P = Level.PawnList;
    J0x15:

    // End:0xBF [Loop If]
    if(P == none)
    {
        // End:0xA7
        if(P.bIsPlayer && P.IsSpectating() || P.IsDead() && Level.Game.bDeadTalkAsSpectator)
        {
            P.TeamMessage(Player.PlayerReplicationInfo, msg, 'SpectatorSay', true);
        }
        P = P.NextPawn;
        // [Loop Continue]
        goto J0x15;
    }
    return;
}

exec function FF(bool bEnable)
{
    local Pawn P;

    bFriendlyFire = bEnable;
    // End:0x24
    if(bFriendlyFire)
    {
        BroadcastMessage(FriendlyFireOnMessage);        
    }
    else
    {
        BroadcastMessage(FriendlyFireOffMessage);
    }
    return;
}

function ScorePoint(DukeMultiPlayer P)
{
    super(dnMultiplayer).ScorePoint(P);
    AnnounceScorePoint();
    return;
}

function AnnounceScorePoint()
{
    // End:0x75
    if(Teams[0].Score > Teams[1].Score)
    {
        // End:0x6B
        if(PreviousWinningTeam != 0)
        {
            // End:0x56
            if(FRand() <= 0.5)
            {
                Announcer.TriggerQueueAnnounce('Announce_Lead_Blue');                
            }
            else
            {
                Announcer.TriggerQueueAnnounce('Announce_LeadSteal_Blue');
            }
        }
        PreviousWinningTeam = 0;        
    }
    else
    {
        // End:0xE7
        if(Teams[1].Score > Teams[0].Score)
        {
            // End:0xE0
            if(PreviousWinningTeam != 1)
            {
                // End:0xCB
                if(FRand() <= 0.5)
                {
                    Announcer.TriggerQueueAnnounce('Announce_Lead_Red');                    
                }
                else
                {
                    Announcer.TriggerQueueAnnounce('Announce_LeadSteal_Red');
                }
            }
            PreviousWinningTeam = 1;
        }
    }
    return;
}

function CheckWinLimit(Pawn Killer)
{
    // End:0x6C
    if(((GoalTeamScore > 0) && Killer.bIsPlayer) && Teams[int(Killer.PlayerReplicationInfo.Team)].Score >= GoalTeamScore)
    {
        RequestEndGame("teamscorelimit");
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.InitAnimationControllerEx(class'VoicePack_MP_Announcer', 'Announce_Overtime');
    PrecacheIndex.InitAnimationControllerEx(class'VoicePack_MP_Announcer', 'Announce_Lead_Blue');
    PrecacheIndex.InitAnimationControllerEx(class'VoicePack_MP_Announcer', 'Announce_LeadSteal_Blue');
    PrecacheIndex.InitAnimationControllerEx(class'VoicePack_MP_Announcer', 'Announce_Lead_Red');
    PrecacheIndex.InitAnimationControllerEx(class'VoicePack_MP_Announcer', 'Announce_LeadSteal_Red');
    return;
}

defaultproperties
{
    TiedGameEndedMessage="<?int?dnGame.dnDeathmatchGame_TeamDM.TiedGameEndedMessage?>"
    TeamNames[0]="<?int?dnGame.dnDeathmatchGame_TeamDM.TeamNames?>"
    TeamNames[1]="<?int?dnGame.dnDeathmatchGame_TeamDM.TeamNames?>"
    TeamPrefix="<?int?dnGame.dnDeathmatchGame_TeamDM.TeamPrefix?>"
    TeamMesh[0]='c_characters.duke_mp'
    TeamMesh[1]='c_characters.duke_mp'
    bSpawnInTeamArea=true
    GoalTeamScore=50
    MaxTeamSize=16
    MaxTeams=2
    MaxAllowedTeams=2
    PreviousWinningTeam=-1
    TeamColor[0]=(R=70,G=70,B=240,A=0)
    TeamColor[1]=(R=153,G=0,B=0,A=0)
    FragLimit=0
    GameGoalPrefix="<?int?dnGame.dnDeathmatchGame_TeamDM.GameGoalPrefix?>"
    GameGoal="<?int?dnGame.dnDeathmatchGame_TeamDM.GameGoal?>"
    GameEndedMessage="<?int?dnGame.dnDeathmatchGame_TeamDM.GameEndedMessage?>"
    GameType=3
    bTeamGame=true
    bScoreTeamKills=true
    ScoreboardType='dnDeathmatchGameScoreboard_TeamDM'
    RulesMenuType="dnWindow.UDukeTeamDMRulesSC"
    HUDType='dnTeamDeathmatchHUD'
    GameName="<?int?dnGame.dnDeathmatchGame_TeamDM.GameName?>"
    ShortGameName="<?int?dnGame.dnDeathmatchGame_TeamDM.ShortGameName?>"
    bOverridePlayerMesh=true
}