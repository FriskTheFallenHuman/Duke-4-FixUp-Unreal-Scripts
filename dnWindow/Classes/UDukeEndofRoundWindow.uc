/*******************************************************************************
 * UDukeEndofRoundWindow generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeEndofRoundWindow extends UDukeTabWindow;

var SSoundInfo CountdownSoundInfo;

function Created()
{
    local float X;

    bAlwaysBehind = true;
    super.Created();
    AddTab("Rewards", class'UDukeTabPage_EORReward', 0);
    AddTab("Lobby", class'UDukeTabPage_EORLobby', 0);
    CreateAllPages();
    SelectTab(0);
    return;
}

function OnNavForward()
{
    local MPGameReplicationInfo GRI;

    super.OnNavForward();
    GRI = MPGameReplicationInfo(GetPlayerOwner().GameReplicationInfo);
    // End:0x8B
    if(GRI == none)
    {
        GRI.StartEORCountDown(class'MPGameReplicationInfo'.default.EORCountDownTime);
        GRI.__EORComplete__Delegate = LoadNextLevel;
        GRI.__EORBeep__Delegate = EORBeep;
        GRI.__EORKillMsgBoxes__Delegate = EORKillMsgBoxes;
    }
    UDukeRootWindow(Root).AgentOnline.SetTeamGame(false);
    class'Engine'.static.StopServer().BuildServerURL();
    return;
}

function EORBeep()
{
    GetPlayerOwner().PlaySoundInfo(0, CountdownSoundInfo);
    return;
}

function EORKillMsgBoxes()
{
    DukeConsole(Root.Console).DialogMgr.CloseAllDialogs();
    return;
}

function KeyDown(int Key, float X, float Y)
{
    super(UWindowWindow).KeyDown(Key, X, Y);
    return;
}

function LoadNextLevel()
{
    // End:0x1C
    if(class'Engine'.default.NetworkDevice == class'AgentNetDriver')
    {
        return;
    }
    UDukeRootWindow(Root).AgentOnline.LoadNextMap();
    EORKillMsgBoxes();
    return;
}

function Notify(UWindowWindow W, byte E)
{
    super.Notify(W, E);
    return;
}

defaultproperties
{
    CountdownSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_menu.Menu.Menu_Arrow_R_01_ST'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=0.8,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=true),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
}