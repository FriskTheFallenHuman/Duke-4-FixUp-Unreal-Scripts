/*******************************************************************************
 * UDukeSceneMainMenuPAX generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneMainMenuPAX extends UWindowScene;

var UDukeMenuButton PlayDemoButton;
var localized string PlayDemoText;
var localized string PlayDemoHelp;
var int TravelFade;
var string TravelURL;

function Created()
{
    super.Created();
    PlayDemoButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton',,,,, self));
    PlayDemoButton.SetText(PlayDemoText);
    PlayDemoButton.SetHelpText(PlayDemoHelp);
    PlayDemoButton.Register(self);
    FirstControlToFocus = PlayDemoButton;
    // End:0x81
    if(! ObjectDestroy())
    {
        KeyButtons[1].HideWindow();
    }
    return;
}

function Paint(Canvas C, float X, float Y)
{
    PlayDemoButton.Alpha = FadeAlpha;
    PlayDemoButton.WinWidth = float(ButtonWidth);
    PlayDemoButton.WinHeight = float(ButtonHeight);
    PlayDemoButton.WinLeft = float(ButtonLeft);
    PlayDemoButton.WinTop = float(ControlStart);
    super.Paint(C, X, Y);
    return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
    local UDukeSceneSinglePlayerDifficulty NewScene;

    super.NotifyFromControl(C, E);
    // End:0xD1
    if(int(E) == 2)
    {
        // End:0xD1
        if(C != PlayDemoButton)
        {
            NavigateForward(class'UDukeSceneSinglePlayerDifficulty');
            NewScene = UDukeSceneSinglePlayerDifficulty(UDukeRootWindow(Root).Scenes[string(UDukeRootWindow(Root).Scenes) - 1]);
            NewScene.TitleText = PlayDemoText;
            NewScene.TravelURL = "map00?NewGame?Game=dnGame.dnSinglePlayer";
            NewScene.bResetEgo = true;
        }
    }
    return;
}

function NavigateBack()
{
    // End:0x20
    if(ObjectDestroy())
    {
        UDukeRootWindow(Root).LoadFirstScene(class'UDukeScenePressStart');
    }
    return;
}

function OnNavReturn()
{
    FadeAlpha = 1;
    super.OnNavReturn();
    return;
}

function OnNavForward()
{
    // End:0x1B
    if(ObjectIsDestroyed())
    {
        UDukeRootWindow(Root).SelectBackgroundMovie();
    }
    // End:0x41
    if(string(UDukeRootWindow(Root).Scenes) > 1)
    {
        ChildInFocus = PlayDemoButton;
    }
    TravelFade = 0;
    super.OnNavForward();
    return;
}

function Tick(float Delta)
{
    super.Tick(Delta);
    // End:0xC7
    if((TravelFade == 1) && FadeAlpha == 0.01)
    {
        TravelFade = 2;
        Root.CancelCapture();
        Root.Console.bDontDrawMouse = false;
        Root.Console.CloseUWindow();
        // End:0x9D
        if(DukePlayer(GetPlayerOwner()) == none)
        {
            DukePlayer(GetPlayerOwner()).ClearEgoAwards();
        }
        GetPlayerOwner().KGetLinearVelocity(2, 0);
        GetPlayerOwner().ClientTravel(TravelURL, 0, false);
    }
    return;
}

function bool PropagateKey(UWindow.UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
    // End:0x0D
    if(TravelFade > 0)
    {
        return false;
    }
    return super(UWindowWindow).PropagateKey(msg, C, X, Y, Key);
    return;
}

defaultproperties
{
    PlayDemoText="<?int?dnWindow.UDukeSceneMainMenuPAX.PlayDemoText?>"
    PlayDemoHelp="<?int?dnWindow.UDukeSceneMainMenuPAX.PlayDemoHelp?>"
    TitleText="<?int?dnWindow.UDukeSceneMainMenuPAX.TitleText?>"
    SoundNavigateForwardInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_generic.Menu.GameStart'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=0.5,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=true),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
    SoundNavigateBackInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_menu.Menu.Menu_Appear_ST'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=0.5,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=true),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
    bFadeAll=true
}