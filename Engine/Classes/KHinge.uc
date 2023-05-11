/*******************************************************************************
 * KHinge generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KHinge extends KConstraint
    native
    collapsecategories
    notplaceable
    hidecategories(Collision,HeatVision,Interactivity,Karma,KarmaCollision);

cpptext
{
// Stripped
}

struct SCreakInfo
{
    var() noexport bool bEnableCreakSounds "Should this hinge do the work required to check for playing creak sounds?";
    var() noexport bool bDebugCreakVelocity "Enabled to log out per-frame velocity of the hinge.";
    var() noexport float CreakTimeMinimumDelay "We must allow this much no-sound-playing time between hinge creak noises.";
    var float NextCreakTime;
    var() noexport float SwingMinimumVolumeVelocity "The minimum velocity we must have over the course of a swing to generate a creak sound. The speed maps to [SwingMinimumVolume].";
    var() noexport float SwingMaximumVolumeVelocity "If we achieve this velocity over the course of a swing, we will play a creak sound at [SwingMaximumVolume].";
    var() noexport float SwingMinimumVolume "The minimum volume we will play a creak sound at if we meet our creak criteria.";
    var() noexport float SwingMaximumVolume "The upper limit of the sound range we will play a creak sound at.";
    var float LastSwingVelocity;
    var float DirectionSpinAmount;
};

var(KarmaConstraint) SSoundInfo CreakSoundInfo;
var(KarmaConstraint) SCreakInfo CreakInfo;

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(Actor).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.GetColorForPosition(CreakSoundInfo);
    return;
}

defaultproperties
{
    CreakInfo=(bEnableCreakSounds=false,bDebugCreakVelocity=false,CreakTimeMinimumDelay=0.5,NextCreakTime=0,SwingMinimumVolumeVelocity=0,SwingMaximumVolumeVelocity=25,SwingMinimumVolume=0,SwingMaximumVolume=0.85,LastSwingVelocity=0,DirectionSpinAmount=0)
    bDirectional=true
    Texture=Texture'S_KHinge'
}