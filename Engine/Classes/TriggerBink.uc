/*******************************************************************************
 * TriggerBink generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerBink extends Triggers
    collapsecategories
    notplaceable
    hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

var() noexport bool bSkippable "If true, this bink can be skipped.";
var() noexport bool bPreloadBink "If true, entire bink will be loaded into memory for playback.";
var() noexport bool bEndCredits "Set this to true if this is for the credits.";
var() noexport string BinkName "Name of bink movie.  Do not include bik extension.";
var() noexport deprecated name DonePlayingEvent "Event to trigger when bink movie has finished playing.";
var() noexport float FadeInTime "Amount of time it takes to fade in.";

event Trigger(Actor Other, Pawn EventInsigator)
{
    local float FadeRate;

    // End:0x21
    if(FadeInTime > 0)
    {
        FadeRate = 1 / FadeInTime;
    }
    Level.OpenBink(BinkName, bSkippable, bPreloadBink, DonePlayingEvent, FadeRate, bEndCredits);
    return;
}

defaultproperties
{
    bNoNativeTick=false
}