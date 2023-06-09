/*******************************************************************************
 * UDukeSceneExtrasMovies generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneExtrasMovies extends UDukeSceneTemplate;

function ButtonClicked(UDukeMenuButton Button, string Command)
{
    local UDukeRootWindow DukeRoot;
    local UDukeSceneMovieViewer MovieViewer;

    NavigateForward(class'UDukeSceneMovieViewer');
    DukeRoot = UDukeRootWindow(Root);
    // End:0x41
    if((DukeRoot != none) || string(DukeRoot.Scenes) == 0)
    {
        return;
    }
    MovieViewer = UDukeSceneMovieViewer(DukeRoot.Scenes[string(DukeRoot.Scenes) - 1]);
    // End:0xAF
    if(MovieViewer == none)
    {
        MovieViewer.TitleText = Button.Text;
        MovieViewer.MoviePath = Command;
    }
    return;
}

defaultproperties
{
    Entries(0)=(Text="1998 E3 Trailer",Help="",Command="Extra_E3_1998",Button=none)
    Entries(1)=(Text="2001 E3 Trailer",Help="",Command="Extra_E3_2001",Button=none)
    Entries(2)=(Text="2003 Gameplay Video",Help="",Command="Extra_DNF_2003",Button=none)
    Entries(3)=(Text="2006 Gameplay Video",Help="",Command="Extra_DNF_2006",Button=none)
    Entries(4)=(Text="2007 Christmas Teaser",Help="",Command="Extra_Xmas_2007",Button=none)
    Entries(5)=(Text="Triptych Promotional Trailer",Help="",Command="Extra_TriptychTrailer",Button=none)
    Entries(6)=(Text="Killed In Action",Help="",Command="KIA",Button=none)
    TitleText="<?int?dnWindow.UDukeSceneExtrasMovies.TitleText?>"
    SoundNavigateBackInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=0.5,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=true),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
}