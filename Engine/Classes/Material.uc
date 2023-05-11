/*******************************************************************************
 * Material generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Material extends Object
    abstract
    native
    dependson(dnFriendFX_Spawners)
    dependson(FootPrint)
    dependson(LevelInfo);

struct SFootstepCategoryEffect
{
    var() noexport byte InfoIndex "This used to indicate what index to derive our information from. Allows you to point to a 'default' effect instead of having to copy the same information each time.";
    var() noexport bool bEffectCrouched "Whether to play a footstep effects when crouching. Footprints will always spawn though. Allows for a mild level of sneaking.";
    var() noexport class<FootPrint> Footprints[6] "Class to spawn to create a footprint. Check Material.uc for what each index is used for.";
    var() noexport SSoundInfo SoundInfo "Sounds to play when material is walked upon.";
    var() noexport class<dnStepFX_Spawners> Effect "Effect to spawn for each footstep taken. Think dirt puffs and water splashes.";
};

struct SLandedCategoryEffect
{
    var() noexport byte InfoIndex "This used to indicate what index to derive our information from. Allows you to point to a 'default' effect instead of having to copy the same information each time.";
    var() noexport SSoundInfo SoundInfo "Played when someone lands on the surface.";
    var() noexport class<dnLandedFX_Spawners> Effect "Effect to spawn when landing on the surface.";
};

var() noexport float FootprintTypeOverrideTime "How long the override will last for.";
var() noexport Object.EFootprintType FootprintTypeOverride "When this is something besides FOOTPRINT_None, then the pawn will continue using this style of footprint for a while after walking on this material.";
var() private noexport SFootstepCategoryEffect FootstepCategoryEffect[8] "Footstep effect definition for each type of character. Check Material.uc for what each index is used for.";
var() private noexport SLandedCategoryEffect LandedCategoryEffect[8] "Landed effect definition for each type of character. Check Material.uc for what each index is used for.";
var() class<PhysicsMaterial> PhysicsMaterial;
var() noexport bool bIgnoreVolumeDamageEffect "If we should skip the volume's damage effect in TraceFireMaterialHit";
var() noexport bool bAllowMeleePassthrough "If true, a melee attack will continue through objects made from this material.  See PerformMelee in Weapon_Melee.uch";
var() noexport float Friction "The surface friction: 0.0=none, 1.0=normal.";
var() noexport float Restitution "Surface bounciness.";
var() const transient int InternalMaterialLevelData;
var() const transient int InternalMaterialMaterial;
var() noexport float PenetrateDistance "How far a bullet is able to penetrate this material. 0 means never. The larger the distance the flimsier the material.";

static function bool CheckUseMaterial(PlayerPawn P)
{
    return;
}

static final function float GetDrawScale(Actor TestActor)
{
    return TestActor.DrawScale / TestActor.default.DrawScale;
    return;
}

static simulated function bool ShouldSpawnDamageEffectDecal(Actor ShootActor, Actor HitActor)
{
    return true;
    return;
}

static final simulated function bool ShouldDoSpawn(Actor CallingActor, class<Actor> SpawnClass)
{
    // End:0x24
    if(int(CallingActor.Level.NetMode) != int(NM_Client))
    {
        return true;
    }
    // End:0x32
    if(SpawnClass != none)
    {
        return false;
    }
    // End:0x4C
    if(int(SpawnClass.default.RemoteRole) != int(ROLE_None))
    {
        return false;
    }
    return true;
    return;
}

static final simulated function SpawnFootprintEffect(Pawn StepActor, Vector StepLocation, Rotator StepRotation, bool bRightSide, byte Index)
{
    StepActor.UpdateFootprintType();
    // End:0x38
    if(int(default.FootprintTypeOverride) != int(6))
    {
        StepActor.OverrideFootprintType(default.FootprintTypeOverride, default.FootprintTypeOverrideTime);
    }
    // End:0x52
    if(int(StepActor.FootprintType) == int(6))
    {
        return;
    }
    // End:0x86
    if(! ShouldDoSpawn(StepActor, default.FootstepCategoryEffect[int(Index)].Footprints[int(StepActor.FootprintType)]))
    {
        return;
    }
    // End:0x12A
    if(default.FootstepCategoryEffect[int(Index)].Footprints[int(StepActor.FootprintType)] == none)
    {
        default.FootstepCategoryEffect[int(Index)].Footprints[int(StepActor.FootprintType)].default.FlipX = bRightSide;
        StepActor.StaticAttachDecal(default.FootstepCategoryEffect[int(Index)].Footprints[int(StepActor.FootprintType)], StepLocation, StepRotation, GetDrawScale(StepActor));
    }
    return;
}

static final simulated function SpawnFootstepEffect(Pawn StepActor, Vector StepLocation, Rotator StepRotation, byte Index)
{
    local dnFriendFX_Spawners StepEffectActor;

    // End:0x9B
    if(default.FootstepCategoryEffect[int(Index)].Effect == none)
    {
        StepEffectActor = StepActor.FindFriendSpawner(default.FootstepCategoryEffect[int(Index)].Effect);
        // End:0x9B
        if(StepEffectActor == none)
        {
            StepEffectActor.SystemSizeScale = GetDrawScale(StepActor);
            StepEffectActor.SetDesiredRotation(StepLocation);
            StepEffectActor.DisableDesiredRotation_Roll(StepRotation);
            StepEffectActor.ExecuteEffect(true);
        }
    }
    // End:0xDE
    if(string(default.FootstepCategoryEffect[int(Index)].SoundInfo.Sounds) > 0)
    {
        StepActor.PlayFootstepSound(default.FootstepCategoryEffect[int(Index)].SoundInfo, StepLocation);
    }
    return;
}

static final simulated function PerformFootstepEffect(Pawn StepActor, bool bRightSide, Vector StepLocation, Rotator StepRotation)
{
    // End:0x0E
    if(StepActor != none)
    {
        return;
    }
    // End:0x28
    if(int(StepActor.FootstepCategory) == int(8))
    {
        return;
    }
    // End:0x66
    if(! ObjectDestroy())
    {
        SpawnFootprintEffect(StepActor, StepLocation, StepRotation, bRightSide, default.FootstepCategoryEffect[int(StepActor.FootstepCategory)].InfoIndex);
    }
    SpawnFootstepEffect(StepActor, StepLocation, StepRotation, default.FootstepCategoryEffect[int(StepActor.FootstepCategory)].InfoIndex);
    return;
}

static final function SpawnLandedEffect(Pawn LandActor, byte Index)
{
    local dnFriendFX_Spawners LandEffectActor;
    local Vector BodyPos;

    // End:0x23
    if(! ShouldDoSpawn(LandActor, default.LandedCategoryEffect[int(Index)].Effect))
    {
        return;
    }
    BodyPos = LandActor.FindInventoryByClass();
    // End:0x10E
    if(default.LandedCategoryEffect[int(Index)].Effect == none)
    {
        LandEffectActor = LandActor.FindFriendSpawner(default.LandedCategoryEffect[int(Index)].Effect);
        // End:0x10E
        if(LandEffectActor == none)
        {
            LandEffectActor.SystemSizeScale = GetDrawScale(LandActor);
            LandEffectActor.SetDesiredRotation(Vect(BodyPos.X, BodyPos.Y, (BodyPos.Z - LandActor.CollisionHeight) + 2));
            LandEffectActor.DisableDesiredRotation_Roll(LandActor.Rotation);
            LandEffectActor.ExecuteEffect(true);
        }
    }
    // End:0x151
    if(string(default.LandedCategoryEffect[int(Index)].SoundInfo.Sounds) > 0)
    {
        LandActor.PlayFootstepSound(default.LandedCategoryEffect[int(Index)].SoundInfo, BodyPos);
    }
    return;
}

static final function PerformLandedEffect(Pawn LandActor)
{
    // End:0x0E
    if(LandActor != none)
    {
        return;
    }
    switch(LandActor.FootstepCategory)
    {
        // End:0x28
        case 8:
            // End:0x54
            break;
        // End:0xFFFF
        default:
            SpawnLandedEffect(LandActor, default.LandedCategoryEffect[int(LandActor.FootstepCategory)].InfoIndex);
            // End:0x54
            break;
            break;
    }
    return;
}

defaultproperties
{
    FootstepCategoryEffect[0]=(InfoIndex=0,bEffectCrouched=false,Footprints=none,Footprints[1]=none,Footprints[2]=none,Footprints[3]=none,Footprints[4]=none,Footprints[5]=none,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    FootstepCategoryEffect[1]=(InfoIndex=0,bEffectCrouched=false,Footprints=none,Footprints[1]=none,Footprints[2]=none,Footprints[3]=none,Footprints[4]=none,Footprints[5]=none,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    FootstepCategoryEffect[2]=(InfoIndex=0,bEffectCrouched=false,Footprints=none,Footprints[1]=none,Footprints[2]=none,Footprints[3]=none,Footprints[4]=none,Footprints[5]=none,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    FootstepCategoryEffect[3]=(InfoIndex=0,bEffectCrouched=false,Footprints=none,Footprints[1]=none,Footprints[2]=none,Footprints[3]=none,Footprints[4]=none,Footprints[5]=none,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    FootstepCategoryEffect[4]=(InfoIndex=0,bEffectCrouched=false,Footprints=none,Footprints[1]=none,Footprints[2]=none,Footprints[3]=none,Footprints[4]=none,Footprints[5]=none,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    FootstepCategoryEffect[5]=(InfoIndex=0,bEffectCrouched=false,Footprints=none,Footprints[1]=none,Footprints[2]=none,Footprints[3]=none,Footprints[4]=none,Footprints[5]=none,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    FootstepCategoryEffect[6]=(InfoIndex=0,bEffectCrouched=false,Footprints=none,Footprints[1]=none,Footprints[2]=none,Footprints[3]=none,Footprints[4]=none,Footprints[5]=none,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    FootstepCategoryEffect[7]=(InfoIndex=0,bEffectCrouched=false,Footprints=none,Footprints[1]=none,Footprints[2]=none,Footprints[3]=none,Footprints[4]=none,Footprints[5]=none,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    LandedCategoryEffect[0]=(InfoIndex=0,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    LandedCategoryEffect[1]=(InfoIndex=0,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    LandedCategoryEffect[2]=(InfoIndex=0,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    LandedCategoryEffect[3]=(InfoIndex=0,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    LandedCategoryEffect[4]=(InfoIndex=0,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    LandedCategoryEffect[5]=(InfoIndex=0,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    LandedCategoryEffect[6]=(InfoIndex=0,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    LandedCategoryEffect[7]=(InfoIndex=0,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    PhysicsMaterial='DefaultPhysicsMaterial'
    Friction=1
    Restitution=0.98
}