/*******************************************************************************
 * AirHockeyTable generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AirHockeyTable extends AirHockeyTable_NativeBase
    collapsecategories;

var(AirHockeyEvents) noexport name PlayerWinEvent "Event to trigger when the player wins a game.";
var(AirHockeyEvents) noexport name PlayerLoseEvent "Event to trigger when the player loses a game.";
var(AirHockeyEvents) noexport name PlayerJoinGameEvent "Event to trigger when the player joins the game.";
var(AirHockeyEvents) noexport name PlayerLeftGameEvent "Event to trigger when the player leaves the game.";
var BumpShader ScoreTextures[10];

function PlayerJoinedGame(dnControl_AirHockeyPlayer Ctrl, Pawn NewPlayer)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x66 [Loop If]
    if(i < 2)
    {
        // End:0x5C
        if(PlayerInfo[i].Ctrl != Ctrl)
        {
            PlayerJoined(i + 1, NewPlayer);
            // End:0x5C
            if(! IsMyDigs())
            {
                FadeOverlayEffect(0, 1);
            }
        }
        ++ i;
        // [Loop Continue]
        goto J0x07;
    }
    FindAndPlaySound('AirHockey_TableHum');
    return;
}

function PlayerLeftGame(dnControl_AirHockeyPlayer Ctrl)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x46 [Loop If]
    if(i < 2)
    {
        // End:0x3C
        if(PlayerInfo[i].Ctrl != Ctrl)
        {
            PlayerLeft(i + 1);
        }
        ++ i;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x79
    if((PlayerInfo[0].Player != none) && PlayerInfo[1].Player != none)
    {
        FindAndStopSound('AirHockey_TableHum');
    }
    return;
}

function bool CalcAIShot(dnControl_AirHockeyPlayer Ctrl, float MaxTime, out Vector OutAccel, out float OutTime, bool DebugShot)
{
    // End:0x34
    if(Ctrl != PlayerInfo[0].Ctrl)
    {
        return CalcShot(1, MaxTime, OutAccel, OutTime, DebugShot);
    }
    return CalcShot(2, MaxTime, OutAccel, OutTime, DebugShot);
    return;
}

function ShowComponents()
{
    Puck.GetZoneLastRenderTime(false);
    Puck.RestoreCollision();
    return;
}

function HideComponents()
{
    PlayerInfo[0].Player.bCanExistOutOfWorld = true;
    Puck.StoreCollision();
    Puck.ForceMountUpdate(false, false, false, false, false);
    Puck.GetZoneLastRenderTime(true);
    return;
}

event BumpShader GetScoreTexture(int Index)
{
    return ScoreTextures[Index];
    return;
}

function bool PuckIsResetting()
{
    return dnControl_AirHockeyPlayer(PlayerInfo[0].Ctrl).IsResettingPuck() || dnControl_AirHockeyPlayer(PlayerInfo[1].Ctrl).IsResettingPuck();
    return;
}

event StartPlay()
{
    // End:0x16
    if(PuckInPlay || PuckIsResetting())
    {
        return;
    }
    // End:0x6D
    if((PlayerInfo[0].Player == none) && (PlayerInfo[1].Player != none) || FRand() < 0.5)
    {
        PlayerInfo[0].Ctrl.ControlEvent(0, 'ResetPuck');        
    }
    else
    {
        PlayerInfo[1].Ctrl.ControlEvent(0, 'ResetPuck');
    }
    return;
}

event GoalScored(int PlayerIndex)
{
    local int ServerIndex;

    // End:0xC5
    if(PlayerIndex == 0)
    {
        // End:0xBB
        if(PlayerInfo[1].Player == none)
        {
            ServerIndex = 1;
            // End:0x82
            if(((PlayerInfo[0].Player == none) && ! PlayerInfo[0].Player.bIsPlayerPawn) && FRand() < ChanceScoreAnim)
            {
                PlayerInfo[0].Ctrl.ControlEvent(0, 'Scored');
            }
            // End:0xB8
            if(PlayerInfo[1].Player.bIsPlayerPawn)
            {
                PlayerInfo[1].Player.FindSoundAndSpeak('AirHockey_LosePuck');
            }            
        }
        else
        {
            ServerIndex = 0;
        }        
    }
    else
    {
        // End:0x175
        if(PlayerInfo[0].Player == none)
        {
            ServerIndex = 0;
            // End:0x13C
            if(((PlayerInfo[1].Player == none) && ! PlayerInfo[1].Player.bIsPlayerPawn) && FRand() < ChanceScoreAnim)
            {
                PlayerInfo[1].Ctrl.ControlEvent(0, 'Scored');
            }
            // End:0x172
            if(PlayerInfo[0].Player.bIsPlayerPawn)
            {
                PlayerInfo[0].Player.FindSoundAndSpeak('AirHockey_LosePuck');
            }            
        }
        else
        {
            ServerIndex = 1;
        }
    }
    // End:0x1D0
    if((ServerIndex == PlayerIndex) || PlayerInfo[ServerIndex].Player.bIsPlayerPawn)
    {
        PlayerInfo[ServerIndex].Ctrl.ControlEvent(0, 'ResetPuck');        
    }
    else
    {
        PlayerInfo[ServerIndex].Ctrl.ControlEvent(0, 'ResetPuckAngry');
    }
    return;
}

event GameWon(int PlayerIndex)
{
    // End:0x70
    if(PlayerIndex == 0)
    {
        // End:0x3C
        if(PlayerInfo[0].Player == none)
        {
            PlayerInfo[0].Ctrl.ControlEvent(0, 'WonGame');
        }
        // End:0x6D
        if(PlayerInfo[1].Player == none)
        {
            PlayerInfo[1].Ctrl.ControlEvent(0, 'LostGame');
        }        
    }
    else
    {
        // End:0xA1
        if(PlayerInfo[0].Player == none)
        {
            PlayerInfo[0].Ctrl.ControlEvent(0, 'LostGame');
        }
        // End:0xD2
        if(PlayerInfo[1].Player == none)
        {
            PlayerInfo[1].Ctrl.ControlEvent(0, 'WonGame');
        }
    }
    return;
}

simulated event PostBeginPlay()
{
    super(InteractiveActor).PostBeginPlay();
    PlayerInfo[0].Ctrl = dnControl(FindOwnedActor(class'dnControl_AirHockeyPlayer', 'Ctler1'));
    PlayerInfo[0].Paddle = Decoration(PlayerInfo[0].Ctrl.FindMountedActor('AirHockeyPaddle'));
    PlayerInfo[1].Ctrl = dnControl(FindOwnedActor(class'dnControl_AirHockeyPlayer', 'Ctler2'));
    PlayerInfo[1].Paddle = Decoration(PlayerInfo[1].Ctrl.FindMountedActor('AirHockeyPaddle'));
    Puck = Decoration(FindOwnedActor(class'AirHockeyPuck'));
    // End:0xE1
    if(int(Level.NetMode) == int(NM_Client))
    {
        Puck.RemoveTouchClass();
    }
    InitTable();
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    local int i;

    super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
    i = 0;
    J0x12:

    // End:0x40 [Loop If]
    if(i < 10)
    {
        PrecacheIndex.RegisterAnimationControllerEntry(ScoreTextures[i]);
        ++ i;
        // [Loop Continue]
        goto J0x12;
    }
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'AirHockey_TableHum');
    return;
}

state idle
{    stop;
}

state Playing
{
    event Tick(float Secs)
    {
        global.Tick(Secs);
        // End:0x1F
        if(PuckInPlay)
        {
            TickTable(Secs);
        }
        return;
    }
    stop;
}

defaultproperties
{
    ScoreTextures[0]='dt_masking.Alphanumeric.DigitalFont_0_bs'
    ScoreTextures[1]='dt_masking.Alphanumeric.DigitalFont_1_bs'
    ScoreTextures[2]='dt_masking.Alphanumeric.DigitalFont_2_bs'
    ScoreTextures[3]='dt_masking.Alphanumeric.DigitalFont_3_bs'
    ScoreTextures[4]='dt_masking.Alphanumeric.DigitalFont_4_bs'
    ScoreTextures[5]='dt_masking.Alphanumeric.DigitalFont_5_bs'
    ScoreTextures[6]='dt_masking.Alphanumeric.DigitalFont_6_bs'
    ScoreTextures[7]='dt_masking.Alphanumeric.DigitalFont_7_bs'
    ScoreTextures[8]='dt_masking.Alphanumeric.DigitalFont_8_bs'
    ScoreTextures[9]='dt_masking.Alphanumeric.DigitalFont_9_bs'
    WinningScore=7
    ChanceScoreAnim=0.5
    Table=(Width=62,Length=119,GoalWidth=23,CornerRadius=10.5,StuckZone=22)
    PuckPaddleSoundName=AirHockey_PuckHitPaddle
    PuckTableSoundName=AirHockey_PuckHitTable
    ScoreSoundName=AirHockey_ScoreGoal
    bDrawUsePhrase=false
    MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='dnControl_AirHockeyPlayer',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=Ctler1,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=40.742,Y=0.187,Z=7.024),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=32768,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(1)=(bSkipVerifySelf=false,SpawnClass='dnControl_AirHockeyPlayer',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=Ctler2,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=-40.742,Y=-0.187,Z=7.024),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(2)=(bSkipVerifySelf=false,SpawnClass='AirHockeyPuck',SpawnChance=0,MountPrefab=(bDontActuallyMount=true,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0.001,Y=0,Z=4.524),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    bTraceUsable=false
    bBlockKarma=true
    bBlockAI=true
    bStaticAI=true
    SoundNoOcclude=true
    bDirectional=true
    bAIMoveable=false
    CollisionRadius=20
    CollisionHeight=33
    DrawType=8
    StaticMesh='sm_class_decorations.Arcades.Air_Hockey_Table'
    SoundVolume=150
    TransientSoundVolume=1
    VoicePack='SoundConfig.Interactive.VoicePack_AirHockey'
}