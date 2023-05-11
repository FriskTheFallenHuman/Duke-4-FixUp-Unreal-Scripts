/*******************************************************************************
 * MetagameHUD generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MetagameHUD extends DukeHUD
    native
    config(User)
    collapsecategories;

cpptext
{
// Stripped
}

const kMaxScrollingCombatText = 3;
const EXP_TEXT_SPACING = 2.5f;
const PLAYING_TO_Y_POS = 175;

struct HUDExpScrollingMessage
{
    var string Message;
    var string Reason;
    var Color DrawColor;
    var float ScreenX;
    var float ScreenY;
    var float VelX;
    var float VelY;
    var float Lifetime;
    var float FadeTime;
    var float Time;
    var bool bVertCenterTextAlign;
    var bool bHoriCenterTextAlign;
    var bool bNotDrawn;
};

struct DeathEvent
{
    var float EventTime;
    var MaterialEx Icon;
    var string KillerName;
    var string VictimName;
    var bool bTeamKill;
    var byte KillerTeam;
    var byte VictimTeam;
    var bool bJoinLeaveMsg;
};

var SquareRegion ClippingRegion;
var bool bDebugStats;
var array<string> LatestAchievedStats;
var array<float> LatestAchievedStatsTime;
var array<float> LatestAchievedStatsAlpha;
var float MessageStayTime;
var localized string OverTimeStr;
var localized string FireRespawnStr;
var localized string JumpRespawnStr;
var localized string RespawnTimeStr;
var localized string AutoRespawnStr;
var localized string WaitingForPlayers;
var localized string BalanceTeams;
var config float WaitingForPlayersYPct;
var config float WaitingForPlayersScale;
var localized string ExpGainStr;
var localized string ExpLossStr;
var localized string ExpTotalStr;
var localized string LevelGainedStr;
var localized string ChallengeTitleStr;
var localized string ItemTitleStr;
var localized string TeamScoreStr;
var localized string IndividualScoreStr;
var localized string CountdownMessage;
var localized string EndgameWinMessage;
var localized string EndgameTieMessage;
var localized string EndgameYouWonMessage;
var localized string TimeIsUpMessage;
var localized string TimeWarningMessage;
var localized string OverdriveStr;
var localized string LevelLabel;
var float SizeX;
var float SizeY;
var float ExpTotalWidth;
var float BeginMatchCountdownYPosition;
var float GUIScale;
var float UnscaledScoreLeftX;
var float UnscaledScoreRightX;
var float UnscaledScoreY;
var float MinTeamScoreScale;
var float MaxTeamScoreScale;
var array<HUDExpScrollingMessage> ScrollingExpText;
var array<HUDScrollingMessage> ScrollingCombatText;
var array<HUDScrollingMessage> ChallengeText;
var HUDScrollingMessage LevelText;
var HUDScrollingMessage OverdriveText;
var config float LevelYPct;
var float EXPTotalAlpha;
var bool bDebugPlayerAnims;
var int nPlayerAnimsToDebug;
var bool bDebugBabes;
var bool bDebugFakeHand;
var bool bDebugRotationOnSpot;
var bool bDebugAIAnims;
var float TimeIsUpDelay;
var float TimeIsUpMessageDuration;
var float InvalidTimeUpValue;
var localized string MsgPrompt;
var localized string TeamMsgPrompt;
var float JetPackIconXPct;
var float JetPackIconYPct;
var float JetPackIconSizeXPct;
var float JetPackIconSizeYPct;
var float FuelXPct;
var float FuelYPct;
var float FuelWidthPct;
var float FuelHeightPct;
var localized string JetpackFuelLabel;
var Texture JetpackStanding;
var float FuelRedPct;
var float FuelYellowPct;
var float FuelBottomLayerYOffset;
var float FuelBottomLayerXOffset;
var float FuelBottomLayerXOffsetEnd;
var array<string> aDebugLastActiveBlends;
var array<string> aDebugLastBlockBlends;
var Vector2D PLHudUpperLeft;
var Vector2D PLBackdropOffset;
var Vector2D PLBarHaloOffset;
var Vector2D PLBarBorderOffset;
var Vector2D PLBarFillOffset;
var float PLBarHeight;
var config Color PLBarColor;
var config Color PLGaugeBkgColor;
var Texture PlayerXPBarAtlas;
var bool bDebugXPNeeded;
var int LastRemainingRoundTime;
var float TimerPulseSpeed;
var Texture TimerBox;
var float HudTimerScaleX;
var int LastKnownTeamScore[2];
var float LastTeamGoal[2];
var() Color TeamColor[4];
var float TeamGoalSizeChangeTime;
var float TeamGoalSizeChangeRampTime;
var float ScoreSize;
var float JustScoredScoreSize;
var float ScoreOffset;
var float BabeOffCenterOffset;
var float BabeScale;
var float BabeOffsetY;
var Vector2D PowerupBarPosition;
var Vector2D PowerupBarOffset;
var Vector2D PowerupTextOffset;
var array<DeathEvent> DeathEvents;
var() config float DeathEventIconScale;
var() config float DeathEventNameScale;
var() config float DeathEventXPosFactor;
var() config float DeathEventYPosFactor;
var() config float DeathEventSpacing;
var() config float DeathEventIconPreAdjust;
var() config float DeathEventIconPostAdjust;
var config float DeathEventWaitTime;
var config float DeathEventNoIconGap;
var Vector NamePlateOffset;
var float IdentifyFadeTime;
var Pawn IdentifyTarget;
var() Color EnemyColor;
var() Color FriendColor;
var localized string WarmupPrefixString;
var float ProgressFadeTime;
var float EdgeBuffer;
var Color BorderColor;
var Texture FillTexture;
var SquareRegion FillRegion;
var localized string targetScoreString;
var FinalBlend LevelUpHUDEffect;
var Actor TraceIdentifyActor;

simulated function PreBeginPlay()
{
    super(Actor).PreBeginPlay();
    LevelText.bNotDrawn = true;
    OverdriveText.bNotDrawn = true;
    TimeIsUpDelay = InvalidTimeUpValue;
    bDebugXPNeeded = false;
    // End:0x42
    if(IsMP())
    {
        PreloadLevelUpEffect();
    }
    return;
}

// Export UMetagameHUD::execPostRender(FFrame&, void* const)
native simulated function PostRender(Canvas C);

simulated event PostPostRender(Canvas C)
{
    return;
}

// Export UMetagameHUD::execPreloadLevelUpEffect(FFrame&, void* const)
native simulated function PreloadLevelUpEffect();

event string GetKeyName()
{
    return PlayerPawn(Owner).ConsoleCommand("KEYNAME " $ string(WindowConsole(PlayerOwner.Player.Console).InGameWindowKey));
    return;
}

event float GetJetpackFuel()
{
    local DukeMultiPlayer P;

    // End:0x3E
    if(DukeMultiPlayer(Level.TickHint()).IsFlyingJetpack())
    {
        return DukeMultiPlayer(Level.TickHint()).GetJetpackFuel();
    }
    return -1;
    return;
}

function DisplayDebug(Canvas C)
{
    local DukeMultiPlayer P;

    P = DukeMultiPlayer(Level.TickHint());
    C.DrawColor.R = 255;
    C.DrawColor.G = 255;
    C.DrawColor.B = 55;
    C.Style = 1;
    C.bCenter = true;
    C.Font = C.BlockFont;
    C.SetPause(0, 0);
    C.DrawCylinder("PHYSICS " $ string(DynamicLoadObject(class'EPhysics', int(P.Physics))), false, true);
    return;
}

function DisplayTime(Canvas C)
{
    local DukeMultiPlayer P;

    P = DukeMultiPlayer(Level.TickHint());
    C.DrawColor.R = 25;
    C.DrawColor.G = 255;
    C.DrawColor.B = 25;
    C.Style = 1;
    C.bCenter = false;
    C.Font = C.TallFont;
    C.SetPause(100, 25);
    return;
}

function DisplaySaving(Canvas C)
{
    local DukeMultiPlayer P;

    P = DukeMultiPlayer(Level.TickHint());
    // End:0x124
    if((P.SavingTime + 1) > Level.TimeSeconds)
    {
        C.DrawColor.R = 255;
        C.DrawColor.G = 255;
        C.DrawColor.B = 55;
        C.Style = 1;
        C.bCenter = true;
        C.Font = C.SmallFont;
        C.SetPause(float(C.SizeX - 100), float(C.SizeY - 20));
        C.DrawCylinder("SAVING STATISTICS...", false, true);
    }
    return;
}

event DisplayStatistic(Canvas C)
{
    local int i, ii;
    local PlayerProgression stats;
    local int YStart, Y, ySpacing;

    YStart = 50;
    Y = YStart;
    ySpacing = 10;
    // End:0x28
    if(! bDebugStats)
    {
        return;
    }
    C.DrawColor.R = 255;
    C.DrawColor.G = 255;
    C.DrawColor.B = 255;
    C.Style = 1;
    C.bCenter = false;
    C.Font = C.SmallFont;
    return;
}

function DisplayExperience(Canvas C)
{
    local DukeMultiPlayer P;
    local int total;

    // End:0x0D
    if(! bDebugStats)
    {
        return;
    }
    P = DukeMultiPlayer(Level.TickHint());
    C.DrawColor.R = 255;
    C.DrawColor.G = 255;
    C.DrawColor.B = 255;
    C.Style = 1;
    C.bCenter = false;
    C.Font = C.SmallFont;
    return;
}

function AddOverdriveText(int Level, DukeMultiPlayer P)
{
    P.bShowOverdriveMessage = false;
    Localize("OVERDRIVE INITIATED AT " $ string(Level));
    OverdriveText.Message = OverdriveStr;
    OverdriveText.DrawColor = NewColorBytes(255, 255, 0);
    OverdriveText.ScreenX = SizeX;
    OverdriveText.ScreenY = SizeY / float(3);
    OverdriveText.VelX = -300;
    OverdriveText.VelY = 0;
    OverdriveText.Lifetime = 10;
    OverdriveText.FadeTime = 20;
    OverdriveText.bNotDrawn = false;
    OverdriveText.Time = 0;
    return;
}

function AddLevelText()
{
    LevelText.Message = LevelGainedStr;
    LevelText.DrawColor = WhiteColor;
    LevelText.ScreenX = SizeX * 0.5;
    LevelText.ScreenY = SizeY * LevelYPct;
    LevelText.VelX = 0;
    LevelText.VelY = 0;
    LevelText.Lifetime = 4;
    LevelText.FadeTime = 3;
    LevelText.bNotDrawn = false;
    LevelText.Time = 0;
    LevelText.bShownEffect = false;
    return;
}

simulated function DrawPlayerName(Canvas C)
{
    local int i;
    local float XL, YL, EXL, EYL, X, Y;

    local PlayerReplicationInfo PRI;

    // End:0x0E
    if(PlayerOwner != none)
    {
        return;
    }
    PRI = PlayerOwner.PlayerReplicationInfo;
    // End:0x31
    if(PRI != none)
    {
        return;
    }
    C.DrawColor = WhiteColor;
    C.SetClip(EgoMeterText, EXL, EXL, TTFontScale, TTFontScale);
    C.Font = C.TallFont;
    C.SetClip(PRI.PlayerName, XL, YL, TTFontScale, TTFontScale);
    C.SetPause((TTFontScale * EgoHudUpperLeft.X) + (TTFontScale * float(80)), (TTFontScale * EgoHudUpperLeft.Y) + (TTFontScale * float(70)));
    C.GetRenderBoundingBox(PRI.PlayerName,,,, TTFontScale, TTFontScale, HUDAlpha, 2);
    return;
}

simulated function string GetBlendOpString(Engine.Object.EAnimationBlendMode BlendOp)
{
    local string strBlend;

    // End:0x9F
    if((int(BlendOp) >= int(0)) && int(BlendOp) <= int(4))
    {
        switch(BlendOp)
        {
            // End:0x3D
            case 0:
                strBlend = "Replace";
                // End:0x9C
                break;
            // End:0x59
            case 1:
                strBlend = "ReplaceBlend";
                // End:0x9C
                break;
            // End:0x6E
            case 2:
                strBlend = "Blend";
                // End:0x9C
                break;
            // End:0x81
            case 3:
                strBlend = "Add";
                // End:0x9C
                break;
            // End:0x99
            case 4:
                strBlend = "Subtract";
                // End:0x9C
                break;
            // End:0xFFFF
            default:
                break;
        }        
    }
    else
    {
        strBlend = "InvalidBlend";
    }
    return strBlend;
    return;
}

event DisplayRotationOnSpot(Canvas C)
{
    local DukeMultiPlayer Player;
    local PlayerPawn P;
    local int ySpacing, nTemp, nView;
    local string Locality;
    local int nChannelTemp, nAnimTemp, nAnim;
    local Rotator diffRot;

    C.DrawColor.R = 25;
    C.DrawColor.G = 255;
    C.DrawColor.B = 25;
    C.Style = 1;
    C.bCenter = false;
    C.Font = C.MedFont;
    C.SetPause(1, 25);
    ySpacing = 40;
    nTemp = 0;
    // End:0x834
    foreach RotateVectorAroundAxis(class'PlayerPawn', P)
    {
        Player = DukeMultiPlayer(P);
        // End:0x135
        if(P.IsLocallyControlled())
        {
            Locality = "Local";
            // End:0x11B
            if(Player.IsServer())
            {
                Locality = Locality @ " SERVER";                
            }
            else
            {
                Locality = Locality @ " CLIENT";
            }            
        }
        else
        {
            Locality = "NonLocal";
        }
        C.SetPause(1, 25 + float(ySpacing * nTemp));
        C.DrawCylinder("bRotatingOnSpot " @ string(Player.bRotatingOnSpot), false, true);
        ++ nTemp;
        C.SetPause(1, 25 + float(ySpacing * nTemp));
        // End:0x206
        if(Player.bROSLeftCCW)
        {
            C.DrawCylinder("Rotating Left CCW ", false, true);            
        }
        else
        {
            C.DrawCylinder("Rotating Right CW", false, true);
        }
        ++ nTemp;
        C.SetPause(1, 25 + float(ySpacing * nTemp));
        C.DrawCylinder(((("Rotation p,y,r    (" @ string(Player.Rotation.Pitch)) @ string(Player.Rotation.Yaw)) @ string(Player.Rotation.Roll)) @ ")", false, true);
        ++ nTemp;
        C.SetPause(1, 25 + float(ySpacing * nTemp));
        C.DrawCylinder(((("Previous Rotation (" @ string(Player.CopyPreviousRotation.Pitch)) @ string(Player.CopyPreviousRotation.Yaw)) @ string(Player.CopyPreviousRotation.Roll)) @ ")", false, true);
        ++ nTemp;
        ++ nTemp;
        C.SetPause(1, 25 + float(ySpacing * nTemp));
        C.DrawCylinder(((("Ref Rotation p,y,r(" @ string(Player.refRotation.Pitch)) @ string(Player.refRotation.Yaw)) @ string(Player.refRotation.Roll)) @ ")", false, true);
        ++ nTemp;
        diffRot = Player.Rotation - Player.PreviousRotation;
        C.SetPause(1, 25 + float(ySpacing * nTemp));
        C.DrawCylinder(((("Diff Rotation R-P (" @ string(Player.ROSDiffRotation.Pitch)) @ string(Player.ROSDiffRotation.Yaw)) @ string(Player.ROSDiffRotation.Roll)) @ ")", false, true);
        ++ nTemp;
        C.SetPause(1, 25 + float(ySpacing * nTemp));
        // End:0x55A
        if(Player.bROSAdjusting)
        {
            C.DrawColor.R = 255;
            C.DrawColor.G = 25;
            C.DrawColor.B = 25;            
        }
        else
        {
            C.DrawColor.R = 25;
            C.DrawColor.G = 255;
            C.DrawColor.B = 25;
        }
        C.DrawCylinder("bROSAdjusting " @ string(Player.bROSAdjusting), false, true);
        ++ nTemp;
        C.DrawColor.R = 25;
        C.DrawColor.G = 255;
        C.DrawColor.B = 25;
        C.SetPause(1, 25 + float(ySpacing * nTemp));
        C.DrawCylinder("fROSAdjustmentAngle " @ string(Player.fROSAdjustmentAngle), false, true);
        ++ nTemp;
        C.SetPause(1, 25 + float(ySpacing * nTemp));
        C.DrawCylinder("fROSOriginalDistance " @ string(Player.fROSOriginalDistance), false, true);
        ++ nTemp;
        C.SetPause(1, 25 + float(ySpacing * nTemp));
        C.DrawCylinder((((("fROSStepSize " @ string(Player.fROSStepSize)) @ ".") @ string(Player.fROSCurrentStep)) $ "/") $ string(Player.fROSNumSteps), false, true);
        ++ nTemp;
        C.SetPause(1, 25 + float(ySpacing * nTemp));
        C.DrawCylinder("fROSYawDiff " @ string(Player.fROSYawDiff), false, true);
        ++ nTemp;
        C.SetPause(1, 25 + float(ySpacing * nTemp));
        C.DrawCylinder("nROSLeftCCW " @ string(Player.nROSLeftCCW), false, true);
        ++ nTemp;        
    }    
    return;
}

function DisplayExpGain(int Exp, optional string reasonTag, optional bool bIsOverdrive)
{
    local array<string> XPGained;

    // End:0x0D
    if(Exp == 0)
    {
        return;
    }
    XPGained[XPGained.Add(1)] = string(Exp);
    // End:0x6B
    if(Exp > 0)
    {
        AddScrollingExpText(FormatTimeString(ExpGainStr, XPGained), ClassIsChildOf("PlayerProgression", reasonTag, "dnGame"), bIsOverdrive);        
    }
    else
    {
        AddScrollingExpText(FormatTimeString(ExpLossStr, XPGained), ClassIsChildOf("PlayerProgression", reasonTag, "dnGame"));
    }
    EXPTotalAlpha = 0;
    return;
}

function AddScrollingExpText(string Text, string Reason, optional bool IsOverdrive)
{
    local HUDExpScrollingMessage msg;

    // End:0x24
    if(IsOverdrive)
    {
        Text = (Text @ " - ") @ OverdriveStr;
    }
    msg.Message = Text;
    msg.Reason = Reason;
    // End:0x60
    if(IsOverdrive)
    {
        msg.DrawColor = OrangeColor;        
    }
    else
    {
        msg.DrawColor = WhiteColor;
    }
    msg.ScreenX = SizeX * 0.5;
    msg.ScreenY = SizeY * 0.55;
    msg.VelX = 0;
    msg.VelY = 0;
    msg.Lifetime = 4;
    msg.FadeTime = 1.5;
    ScrollingExpText.Insert(0, 1);
    ScrollingExpText[0] = msg;
    return;
}

function AddScrollingEXPTotalCombatText(string Text)
{
    local HUDScrollingMessage msg;

    msg.Message = Text;
    msg.DrawColor = WhiteColor;
    msg.ScreenX = SizeX * 0.5;
    msg.ScreenY = SizeY * 0.7;
    msg.VelX = 0;
    msg.VelY = 0;
    msg.Lifetime = 2;
    msg.FadeTime = 1;
    ScrollingCombatText[ScrollingCombatText.Add(1)] = msg;
    return;
}

function AddScrollingCombatText(string Text, Color C)
{
    local HUDScrollingMessage msg;
    local int i;

    msg.Message = Text;
    msg.DrawColor = C;
    msg.ScreenX = SizeX * 0.5;
    msg.ScreenY = SizeY * 0.75;
    msg.VelX = 0;
    msg.VelY = -10;
    msg.Lifetime = 3;
    msg.FadeTime = 2;
    ScrollingCombatText[ScrollingCombatText.Add(1)] = msg;
    return;
}

event AddTeamScrollingScoringText(string Text, int Team)
{
    local HUDScrollingMessage msg;

    msg.Message = Text;
    msg.ScreenX = SizeX * 0.5;
    msg.ScreenY = SizeY * 0.18;
    msg.VelX = 0;
    msg.VelY = 0;
    msg.Lifetime = 3;
    msg.FadeTime = 3;
    // End:0x9C
    if(Team == 1)
    {
        msg.DrawColor = RedColor;        
    }
    else
    {
        msg.DrawColor = BlueColor;
    }
    ScrollingCombatText[ScrollingCombatText.Add(1)] = msg;
    return;
}

event AddScrollingScoringText(string Text, Color C)
{
    local HUDScrollingMessage msg;

    msg.Message = Text;
    msg.DrawColor = C;
    msg.ScreenX = SizeX * 0.5;
    msg.ScreenY = SizeY * 0.18;
    msg.VelX = 0;
    msg.VelY = -10;
    msg.Lifetime = 2;
    msg.FadeTime = 1;
    ScrollingCombatText[ScrollingCombatText.Add(1)] = msg;
    return;
}

function AddChallengeText(string challengeawarded, bool bChallengeUnlocked)
{
    local HUDScrollingMessage msg;

    msg.Message = challengeawarded;
    msg.DrawColor = WhiteColor;
    msg.ScreenX = SizeX * 0.5;
    msg.ScreenY = SizeY * 0.25;
    msg.VelX = 0;
    msg.VelY = 0;
    msg.Lifetime = 4;
    msg.FadeTime = 2;
    msg.bChallengeUnlocked = bChallengeUnlocked;
    ChallengeText[ChallengeText.Add(1)] = msg;
    return;
}

// Export UMetagameHUD::execTickDisplayMessages(FFrame&, void* const)
native function TickDisplayMessages(float DeltaTime, string ItemName, MaterialEx PickupEventIcon);

simulated function Tick(float Delta)
{
    local int i;

    super.Tick(Delta);
    // End:0x19
    if(PlayerOwner != none)
    {
        return;
    }
    GUIScale = WindowConsole(PlayerOwner.Player.Console).Root.GUIScale;
    // End:0x8D
    if(EXPTotalAlpha < 1)
    {
        EXPTotalAlpha += (Delta * 0.5);
        // End:0x8D
        if(EXPTotalAlpha > 1)
        {
            EXPTotalAlpha = 1;
        }
    }
    i = string(ScrollingExpText) - 1;
    J0x9C:

    // End:0x11B [Loop If]
    if(i >= 0)
    {
        ScrollingExpText[i].Time += Delta;
        ScrollingExpText[i].Lifetime -= Delta;
        // End:0x111
        if((ScrollingExpText[i].Lifetime <= 0) || ScrollingExpText[i].bNotDrawn)
        {
            ScrollingExpText.Remove(i, 1);
        }
        -- i;
        // [Loop Continue]
        goto J0x9C;
    }
    i = string(ScrollingCombatText) - 1;
    J0x12A:

    // End:0x1FB [Loop If]
    if(i >= 0)
    {
        ScrollingCombatText[i].Time += Delta;
        ScrollingCombatText[i].ScreenX += (ScrollingCombatText[i].VelX * Delta);
        ScrollingCombatText[i].ScreenY += (ScrollingCombatText[i].VelY * Delta);
        ScrollingCombatText[i].Lifetime -= Delta;
        // End:0x1F1
        if((ScrollingCombatText[i].Lifetime <= 0) || ScrollingCombatText[i].bNotDrawn)
        {
            ScrollingCombatText.Remove(i, 1);
        }
        -- i;
        // [Loop Continue]
        goto J0x12A;
    }
    // End:0x24B
    if(string(ChallengeText) > 0)
    {
        ChallengeText[0].Time += Delta;
        ChallengeText[0].Lifetime -= Delta;
        // End:0x24B
        if(ChallengeText[0].Lifetime <= 0)
        {
            ChallengeText.Remove(0, 1);
        }
    }
    // End:0x29E
    if(! LevelText.bNotDrawn)
    {
        LevelText.Time += Delta;
        LevelText.Lifetime -= Delta;
        // End:0x29E
        if(LevelText.Lifetime <= 0)
        {
            LevelText.bNotDrawn = true;
        }
    }
    // End:0x32B
    if(! OverdriveText.bNotDrawn)
    {
        OverdriveText.Time += Delta;
        OverdriveText.Lifetime -= Delta;
        // End:0x2F1
        if(OverdriveText.Lifetime <= 0)
        {
            OverdriveText.bNotDrawn = true;
        }
        OverdriveText.ScreenX += (OverdriveText.VelX * Delta);
        OverdriveText.ScreenY += (OverdriveText.VelY * Delta);
    }
    return;
}

function AddCFScrollingCombatText(string Text)
{
    local HUDScrollingMessage msg;

    msg.Message = Text;
    msg.DrawColor = WhiteColor;
    msg.ScreenX = SizeX * 0.5;
    msg.ScreenY = SizeY * 0.75;
    msg.VelX = 0;
    msg.VelY = -0.1;
    msg.Lifetime = 1.5;
    msg.FadeTime = 1.5;
    ScrollingCombatText[ScrollingCombatText.Add(1)] = msg;
    return;
}

final function int WrapClipText(Canvas C, float X, float Y, coerce string S, optional bool bCheckHotKey, optional int Length, optional bool bNoDraw, optional bool bCenter, optional float ScaleX, optional float ScaleY, optional float Alpha, optional float ShadowDrift)
{
    local float W, h, StartX;
    local int SpacePos, CRPos, WordPos;
    local string Out, temp, Line;
    local bool bCR, bSpc, bSentry;
    local int i, numLines;
    local float pW, pH;

    // End:0x1A
    if(ScaleX == 0)
    {
        ScaleX = 1;
    }
    // End:0x34
    if(ScaleY == 0)
    {
        ScaleY = 1;
    }
    // End:0x4E
    if(Alpha == 0)
    {
        Alpha = 1;
    }
    // End:0x6E
    if(Length == 0)
    {
        Length = C.SizeX;
    }
    StartX = X;
    X = 0;
    i = InStr(S, "\\n");
    J0x96:

    // End:0xE9 [Loop If]
    if(i != -1)
    {
        S = (Left(S, i) $ Chr(13)) $ Mid(S, i + 2);
        i = InStr(S, "\\n");
        // [Loop Continue]
        goto J0x96;
    }
    i = 0;
    bSentry = true;
    Out = "";
    numLines = 1;
    J0x107:

    // End:0x46A [Loop If]
    if(bSentry && Y < float(C.SizeY))
    {
        // End:0x14B
        if(Out == "")
        {
            ++ i;
            Out = S;
        }
        WordPos = -1;
        SpacePos = InStr(Out, " ");
        CRPos = InStr(Out, Chr(13));
        bCR = false;
        bSpc = false;
        // End:0x1D1
        if((CRPos != -1) && (CRPos < SpacePos) || SpacePos == -1)
        {
            WordPos = CRPos;
            bCR = true;            
        }
        else
        {
            // End:0x1F3
            if(SpacePos != -1)
            {
                WordPos = SpacePos;
                bSpc = true;
            }
        }
        // End:0x210
        if(WordPos == -1)
        {
            temp = Out;            
        }
        else
        {
            temp = Left(Out, WordPos) $ " ";
        }
        TextSize(C, temp, W, h, ScaleX, ScaleY);
        // End:0x380
        if(bCR || bSpc && (X + W) > float(Length))
        {
            // End:0x29D
            if(X == float(0))
            {
                Line = temp;
                X += W;
            }
            // End:0x332
            if(! bNoDraw)
            {
                // End:0x2FE
                if(bCenter)
                {
                    ClipText(C, StartX + ((float(Length) - X) / 2), Y, Line, bCheckHotKey, ScaleX, ScaleY, Alpha, ShadowDrift);                    
                }
                else
                {
                    ClipText(C, StartX, Y, Line, bCheckHotKey, ScaleX, ScaleY, Alpha, ShadowDrift);
                }
            }
            // End:0x34C
            if(X != float(0))
            {
                Line = temp;                
            }
            else
            {
                Line = "";
                W = 0;
            }
            X = 0;
            Y += h;
            ++ numLines;            
        }
        else
        {            
            Line $= temp;
        }
        X += W;
        Out = Mid(Out, Len(temp));
        // End:0x467
        if((Out == "") && i > 0)
        {
            // End:0x45F
            if(! bNoDraw)
            {
                // End:0x42B
                if(bCenter)
                {
                    ClipText(C, StartX + ((float(Length) - X) / 2), Y, Line, bCheckHotKey, ScaleX, ScaleY, Alpha, ShadowDrift);                    
                }
                else
                {
                    ClipText(C, StartX, Y, Line, bCheckHotKey, ScaleX, ScaleY, Alpha, ShadowDrift);
                }
            }
            bSentry = false;
        }
        // [Loop Continue]
        goto J0x107;
    }
    return numLines;
    return;
}

// Export UMetagameHUD::execTextSize(FFrame&, void* const)
native final function TextSize(Canvas C, coerce string Text, out float W, out float h, optional float XScale, optional float YScale);

function ClipText(Canvas C, float X, float Y, coerce string S, optional bool bCheckHotKey, optional float ScaleX, optional float ScaleY, optional float Alpha, optional float ShadowDrift)
{
    ClipTextN(WindowConsole(PlayerOwner.Player.Console).Root.GUIScale, C, X, Y, S, bCheckHotKey, ScaleX, ScaleY, Alpha, ShadowDrift);
    return;
}

// Export UMetagameHUD::execClipTextN(FFrame&, void* const)
native final function ClipTextN(float GUIScale, Canvas C, float X, float Y, coerce string S, optional bool bCheckHotKey, optional float ScaleX, optional float ScaleY, optional float Alpha, optional float ShadowDrift);

simulated event int DrawGameTypeInfoHelper(Canvas C, int superResult)
{
    return superResult;
    return;
}

exec function ShowDebugXP()
{
    bDebugXPNeeded = true;
    return;
}

exec function HideDebugXP()
{
    bDebugXPNeeded = false;
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

defaultproperties
{
    MessageStayTime=2
    OverTimeStr="<?int?dnGame.MetagameHUD.OverTimeStr?>"
    FireRespawnStr="<?int?dnGame.MetagameHUD.FireRespawnStr?>"
    JumpRespawnStr="<?int?dnGame.MetagameHUD.JumpRespawnStr?>"
    RespawnTimeStr="<?int?dnGame.MetagameHUD.RespawnTimeStr?>"
    AutoRespawnStr="<?int?dnGame.MetagameHUD.AutoRespawnStr?>"
    WaitingForPlayers="<?int?dnGame.MetagameHUD.WaitingForPlayers?>"
    BalanceTeams="<?int?dnGame.MetagameHUD.BalanceTeams?>"
    WaitingForPlayersYPct=0.25
    WaitingForPlayersScale=1.2
    ExpGainStr="<?int?dnGame.MetagameHUD.ExpGainStr?>"
    ExpLossStr="<?int?dnGame.MetagameHUD.ExpLossStr?>"
    ExpTotalStr="<?int?dnGame.MetagameHUD.ExpTotalStr?>"
    LevelGainedStr="<?int?dnGame.MetagameHUD.LevelGainedStr?>"
    ChallengeTitleStr="<?int?dnGame.MetagameHUD.ChallengeTitleStr?>"
    ItemTitleStr="<?int?dnGame.MetagameHUD.ItemTitleStr?>"
    TeamScoreStr="<?int?dnGame.MetagameHUD.TeamScoreStr?>"
    IndividualScoreStr="<?int?dnGame.MetagameHUD.IndividualScoreStr?>"
    CountdownMessage="<?int?dnGame.MetagameHUD.CountdownMessage?>"
    EndgameWinMessage="<?int?dnGame.MetagameHUD.EndgameWinMessage?>"
    EndgameTieMessage="<?int?dnGame.MetagameHUD.EndgameTieMessage?>"
    EndgameYouWonMessage="<?int?dnGame.MetagameHUD.EndgameYouWonMessage?>"
    TimeIsUpMessage="<?int?dnGame.MetagameHUD.TimeIsUpMessage?>"
    TimeWarningMessage="<?int?dnGame.MetagameHUD.TimeWarningMessage?>"
    OverdriveStr="<?int?dnGame.MetagameHUD.OverdriveStr?>"
    BeginMatchCountdownYPosition=0.25
    GUIScale=1
    UnscaledScoreLeftX=430
    UnscaledScoreRightX=530
    UnscaledScoreY=80
    MinTeamScoreScale=1.3
    MaxTeamScoreScale=1.8
    LevelYPct=0.38
    nPlayerAnimsToDebug=-1
    TimeIsUpMessageDuration=2
    InvalidTimeUpValue=999
    MsgPrompt="<?int?dnGame.MetagameHUD.MsgPrompt?>"
    TeamMsgPrompt="<?int?dnGame.MetagameHUD.TeamMsgPrompt?>"
    JetPackIconXPct=0.25
    JetPackIconYPct=0.8
    JetPackIconSizeXPct=0.1
    JetPackIconSizeYPct=0.1
    FuelXPct=-100
    FuelYPct=100
    JetpackFuelLabel="<?int?dnGame.MetagameHUD.JetpackFuelLabel?>"
    JetpackStanding='dt_hud.ingame_hud.am_jetpack'
    FuelRedPct=0.33
    FuelYellowPct=0.66
    FuelBottomLayerYOffset=7
    FuelBottomLayerXOffset=9
    FuelBottomLayerXOffsetEnd=13
    PLHudUpperLeft=(X=87,Y=72)
    PLBarHaloOffset=(X=46,Y=40)
    PLBarBorderOffset=(X=50,Y=44)
    PLBarFillOffset=(X=53,Y=48)
    PLBarHeight=6
    PLBarColor=(R=88,G=182,B=100,A=0)
    PLGaugeBkgColor=(R=10,G=10,B=10,A=128)
    LevelUpHUDEffect='dt_hud.ingame_hud.lvelUp_fb'
    bIsMetagame=true
    BroadcastLogLineMax=3
}