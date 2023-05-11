/*******************************************************************************
 * Biology_Generic_Poop_A generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Biology_Generic_Poop_A extends Biology_Generic
    collapsecategories;

var() noexport class<dnDecal_Delayed> TurdSplatClass "Splat class to spawn when the turd hits stuff.";
var float SplatterGate;
var float TurdLineDelay;
var bool HasBeenGrabbed;

event PostBeginPlay()
{
    super(dnDecoration).PostBeginPlay();
    // End:0x15
    if(CheckForChristmas())
    {
        HowwwwwwdyHo();
    }
    return;
}

final function HowwwwwwdyHo()
{
    return;
}

event KImpact(name SelfBoneName, KarmaActor Other, name OtherBoneName, Vector Position, Vector ImpactVelocity, Vector ImpactNormal)
{
    super(dnDecoration).KImpact(SelfBoneName, Other, OtherBoneName, Position, ImpactVelocity, ImpactNormal);
    // End:0x3F
    if(Level.GameTimeSeconds < SplatterGate)
    {
        return;
    }
    // End:0x57
    if((ImpactVelocity Dot ImpactNormal) < 0.5)
    {
        return;
    }
    SplatterGate = Level.GameTimeSeconds + 0.3;
    bAcceptsDecalProjectors = false;
    StaticAttachDecal(TurdSplatClass, Location, Rotator(- ImpactNormal), DrawScale / default.DrawScale);
    bAcceptsDecalProjectors = default.bAcceptsDecalProjectors;
    return;
}

simulated function GrabComplete()
{
    super(InteractiveActor).GrabComplete();
    PlayTurdLine();
    // End:0x47
    if(! HasBeenGrabbed && DukePlayer(CarriedBy) == none)
    {
        HasBeenGrabbed = true;
        DukePlayer(CarriedBy).NotifyPooGrabbed();
    }
    return;
}

simulated function UnGrabbed(Pawn Grabber, bool Thrown)
{
    super(dnDecoration).UnGrabbed(Grabber, Thrown);
    PerformDamageCategoryEffectEx('PlayTurdLine');
    return;
}

final simulated function PlayTurdLine()
{
    // End:0x36
    if((CarriedBy == none) && CarriedBy.bIsPlayerPawn)
    {
        CarriedBy.FindSoundAndSpeak('TurdPickupLines');
    }
    TraceFire(TurdLineDelay, false, 'PlayTurdLine');
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.RegisterMaterialClass(TurdSplatClass);
    PrecacheIndex.InitAnimationControllerEx(class'DukePlayer'.default.VoicePack, 'TurdPickupLines');
    return;
}

defaultproperties
{
    TurdSplatClass='dnTurdSplat'
    TurdLineDelay=30
    bGrabbable=true
    UsePhrase="<?int?dnDecorations.Biology_Generic_Poop_A.UsePhrase?>"
    GrabInfo=(bCanDuckWhileHeld=true,MountItemOverride=mount_handright,MountOrigin=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),GrabAnimName=None,CarrierAnimName=CarryTurd,CarrierMountPose=CarryPoseTurd,GrabSoundName=None,ThrowSoundName=None,GrabSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),ThrowSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none))
    bIgnorePawnDownwardForce=true
    bCanCrushOthers=false
    bTickOnlyWhenPhysicsAwake=true
    DynamicInteractionClassification=2
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Gibs'
    PhysicsMassType=1
    KLinearDamping=2
    KAngularDamping=0.65
    Density=2
    Physics=18
    CollisionRadius=11
    CollisionHeight=2.4
    Mass=10
    DrawType=2
    DrawScale=0.5
    Mesh='c_generic.Turd_Single'
}