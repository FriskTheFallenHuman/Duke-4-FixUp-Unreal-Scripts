/*******************************************************************************
 * KConstraint generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KConstraint extends RenderActor
    abstract
    native
    collapsecategories
    notplaceable
    hidecategories(Collision,HeatVision,Interactivity,Karma,KarmaCollision);

var(KarmaConstraint) deprecated KarmaActor KConstraintActor1;
var(KarmaConstraint) deprecated KarmaActor KConstraintActor2;
var(KarmaConstraint) noexport deprecated name KConstraintActor1Tag "If KConstraintActor1 is None, will find the first actor with this tag.";
var(KarmaConstraint) noexport deprecated name KConstraintActor2Tag "If KConstraintActor2 is None, will find the first actor with this tag.";
var(KarmaConstraint) name KConstraintActor1Bone;
var(KarmaConstraint) name KConstraintActor2Bone;
var(KarmaConstraint) const noexport bool bKDisableCollision "Should this constraint turn off collision between the two constrained actors." "" "(Note: setting this to true and then constraining against the world will result in objects that fall through the floor/walls.)";
var(KarmaConstraint) noexport bool bDebugConstraintStress "If set to true, this constraint will broadcast/log it's per-frame stress values.";
var(KarmaConstraint) noexport bool bBreakOnExplosionDamage "If this is true, we will only test for possible breakage via [BreakOnDamageChance] when the damage came from some sort of explosion.";
var(KarmaConstraint) noexport bool bOnlyBreakOne "Only break one constraint when the constrained actor gets hit if there were multiple constraints attached to it. (Actually stops the constraint breaking once it gets here.)";
var(KarmaConstraint) noexport float BreakOnDamageChance "There is this percentage chance that this constraint will break when one of the objects that it's constraining takes damage.";
var(KarmaConstraint) const noexport float KForceDisableThreshold "Disable constraint (act like it was snapped) if it needs to exert more than this amount of force on the constrained objects to satisfy the constraint.";
var(KarmaConstraint) noexport name BreakEvent "Fire off this event when the constraint gets disabled by any means, including forcing it not to be PHYS_Meqon, triggering it, or having it exceed its stress threshold.";
var(KarmaConstraint) noexport SSoundInfo BreakSoundInfo "Play this SoundInfo when the constraint breaks.";

event PreBeginPlay()
{
    super.PreBeginPlay();
    GetPropertyText('Tick');
    return;
}

// Export UKConstraint::execSetKDisableCollision(FFrame&, void* const)
native(1091) final function SetKDisableCollision(bool bNewKDisableCollision);

// Export UKConstraint::execBreakConstraint(FFrame&, void* const)
native(1092) final function BreakConstraint();

// Export UKConstraint::execConstraintSupportsBreaking(FFrame&, void* const)
native(1093) final function bool ConstraintSupportsBreaking();

// Export UKConstraint::execSetBreakThreshold(FFrame&, void* const)
native(1094) final function SetBreakThreshold(float NewBreakThreshold);

function Trigger(Actor Other, Pawn EventInstigator)
{
    super(Actor).Trigger(Other, EventInstigator);
    SetConstraintActor2UseConstraintPoint();
    return;
}

event ConstraintDisabled(bool bConstraintWasBroken)
{
    GlobalTrigger(BreakEvent);
    // End:0x21
    if(bConstraintWasBroken)
    {
        PlaySoundInfo(3, BreakSoundInfo);
    }
    return;
}

function ConstrainedTakeDamage(Actor DamagedActor, Pawn InstigatedBy, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType)
{
    // End:0x10
    if(int(Physics) != int(18))
    {
        return;
    }
    // End:0x82
    if((FRand() < BreakOnDamageChance) && ! bBreakOnExplosionDamage || IsA(DamageType, class'ExplosionDamage'))
    {
        SetConstraintActor2UseConstraintPoint();
        // End:0x57
        if(KConstraintActor1 == none)
        {
            KConstraintActor1.KGetCollidingActors();
        }
        // End:0x82
        if((KConstraintActor2 == none) && KConstraintActor2 == KConstraintActor1)
        {
            KConstraintActor2.KGetCollidingActors();
        }
    }
    return;
}

defaultproperties
{
    bKDisableCollision=true
    KForceDisableThreshold=-1
    BreakSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
    Physics=18
    bTraceUsable=false
    bBlockKarma=true
    bHidden=true
    bIsKarmaConstraint=true
    bCanExistOutOfWorld=true
    bTickOnlyZoneRecent=true
    bTickOnlyNearby=true
    bAcceptsProjectors=false
    bAcceptsDecalProjectors=false
    CollisionRadius=0
    CollisionHeight=0
    Style=2
    Texture=Texture'S_KConstraint'
    RemoteRole=0
}