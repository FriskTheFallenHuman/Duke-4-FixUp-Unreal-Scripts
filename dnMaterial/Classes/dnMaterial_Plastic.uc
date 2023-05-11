/*******************************************************************************
 * dnMaterial_Plastic generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
interface dnMaterial_Plastic extends dnMaterial
    abstract
    parseconfig
    notlistable;

defaultproperties
{
    FootstepCategoryEffect[0]=(InfoIndex=0,bEffectCrouched=false,Footprints=none,Footprints[1]='dnParticles.FootPrint_Blood',Footprints[2]='dnParticles.FOOTPRINT_Wet',Footprints[3]='dnParticles.FootPrint_Mud',Footprints[4]='dnParticles.FOOTPRINT_Flaming',Footprints[5]='dnParticles.FOOTPRINT_Radioactive',SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('dnsMaterials.Cement_Gritty.BootGrtCem037','dnsMaterials.Cement_Gritty.BootGrtCem036','dnsMaterials.Cement_Gritty.BootGrtCem031'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0.8,VolumeVariance=0,InnerRadius=128,InnerRadiusVariance=0,Radius=640,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    FootstepCategoryEffect[4]=(InfoIndex=4,bEffectCrouched=false,Footprints=none,Footprints[1]=none,Footprints[2]=none,Footprints[3]=none,Footprints[4]=none,Footprints[5]=none,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('dnsMaterials.Generic.MediumHeavyStep01','dnsMaterials.Generic.MediumHeavyStep02','dnsMaterials.Generic.MediumHeavyStep03'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0.8,VolumeVariance=0,InnerRadius=128,InnerRadiusVariance=0,Radius=640,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    FootstepCategoryEffect[5]=(InfoIndex=5,bEffectCrouched=false,Footprints=none,Footprints[1]=none,Footprints[2]=none,Footprints[3]=none,Footprints[4]=none,Footprints[5]=none,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('dnsMaterials.Plastic.PigcopStepPlastic01','dnsMaterials.Plastic.PigcopStepPlastic02','dnsMaterials.Plastic.PigcopStepPlastic03'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0.8,VolumeVariance=0,InnerRadius=128,InnerRadiusVariance=0,Radius=640,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    LandedCategoryEffect=(InfoIndex=0,SoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('dnsMaterials.Cement_Gritty.BootGrtCem098'),SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0.8,VolumeVariance=0,InnerRadius=128,InnerRadiusVariance=0,Radius=640,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),Effect=none)
    PhysicsMaterial='dnPhysicsMaterial_Plastic'
}