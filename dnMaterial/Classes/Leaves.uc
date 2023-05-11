/*******************************************************************************
 * Leaves generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Leaves extends dnMaterial_Nature
    listable;

defaultproperties
{
    FootstepCategoryEffect[0]=(InfoIndex=0,bEffectCrouched=false,Footprints=none,Footprints[1]='dnParticles.FootPrint_Blood',Footprints[2]='dnParticles.FOOTPRINT_Wet',Footprints[3]='dnParticles.FootPrint_Mud',Footprints[4]='dnParticles.FOOTPRINT_Flaming',Footprints[5]='dnParticles.FOOTPRINT_Radioactive',SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('dnsMaterials.Leaves.LeavesCrunch01','dnsMaterials.Leaves.LeavesCrunch02','dnsMaterials.Leaves.LeavesCrunch03'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0.8,VolumeVariance=0,InnerRadius=128,InnerRadiusVariance=0,Radius=640,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect='dnParticles.dnStepFX_Spawner_Dirt_Normal')
    FootstepCategoryEffect[2]=(InfoIndex=0,bEffectCrouched=false,Footprints=none,Footprints[1]=none,Footprints[2]=none,Footprints[3]=none,Footprints[4]=none,Footprints[5]=none,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('dnsMaterials.Dirt.PregnatorDirtStep01','dnsMaterials.Dirt.PregnatorDirtStep02','dnsMaterials.Dirt.PregnatorDirtStep03'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0.8,VolumeVariance=0,InnerRadius=128,InnerRadiusVariance=0,Radius=640,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect='dnParticles.dnStepFX_Spawner_Dirt_Normal')
    FootstepCategoryEffect[5]=(InfoIndex=0,bEffectCrouched=false,Footprints=none,Footprints[1]=none,Footprints[2]=none,Footprints[3]=none,Footprints[4]=none,Footprints[5]=none,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('dnsMaterials.Dirt.PigcopStepDirt01','dnsMaterials.Dirt.PigcopStepDirt02','dnsMaterials.Dirt.PigcopStepDirt03'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0.8,VolumeVariance=0,InnerRadius=128,InnerRadiusVariance=0,Radius=640,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect='dnParticles.dnStepFX_Spawner_Dirt_Normal')
    LandedCategoryEffect=(InfoIndex=0,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('dnsMaterials.Leaves.LeavesJump01'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0.8,VolumeVariance=0,InnerRadius=128,InnerRadiusVariance=0,Radius=640,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect='dnParticles.dnLandedFX_Spawner_Dirt_Normal')
}