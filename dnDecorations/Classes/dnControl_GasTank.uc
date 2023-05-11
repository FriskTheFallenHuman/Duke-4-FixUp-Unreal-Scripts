/*******************************************************************************
 * dnControl_GasTank generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_GasTank extends dnControl_QuestItemBase
    collapsecategories;

var localized string FindGasText;

function PostVerifySelf()
{
    super.PostVerifySelf();
    HelpMessage = FindGasText;
    return;
}

function Used(Actor Other, Pawn EventInstigator)
{
    HelpMessage = FindGasText;
    super.Used(Other, EventInstigator);
    return;
}

simulated function AnimCallback_UserReleased()
{
    super.AnimCallback_UserReleased();
    VehicleBase(Owner).GasFilled();
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'GasCap_Off');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'GasCap_On');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'GasNozzle_In');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'GasNozzle_Out');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'GasPour');
    return;
}

defaultproperties
{
    FindGasText="<?int?dnDecorations.dnControl_GasTank.FindGasText?>"
    QuestItemClass='gascan'
    QuestItemSpawnClass='GasCanPlaced'
    bQuestItemSpawnDestroyOnDetach=true
    QuestItemClassName=gascan
    QuestItemPlayerMountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_handleft,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0)
    States(0)=(StateName=Useable,OutEvents=none,Transitions=((ControlEvent=3,CustomName=None,NewState=AttachUserLERP)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(1)=(StateName=AttachUserLERP,OutEvents=none,Transitions=((ControlEvent=5,CustomName=None,NewState=idle)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(2)=(StateName=idle,OutEvents=none,Transitions=((ControlEvent=8,CustomName=None,NewState=DetachUserLERP)),UserAnimName=GasCan_Activate,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=a_monstertruck_fillup,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(3)=(StateName=DetachUserLERP,OutEvents=none,Transitions=((ControlEvent=6,CustomName=None,NewState=Unuseable)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(4)=(StateName=Unuseable,OutEvents=none,Transitions=none,UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    bUseHomePose=false
    InterpolationInTime=0.3
    InterpolationOutTime=0.3
    UsableExits(0)=(bEnabled=true,EnterInfo=(LocationOffset=(X=0,Y=0,Z=0),RotationOffset=(Pitch=0,Yaw=0,Roll=0),Animation=None,SoundName=None),ExitInfo=(LocationOffset=(X=0,Y=0,Z=0),RotationOffset=(Pitch=0,Yaw=0,Roll=0),Animation=None,SoundName=None),ExitEndInfo=(LocationOffset=(X=0,Y=0,Z=0),RotationOffset=(Pitch=0,Yaw=0,Roll=0),Animation=None,SoundName=None))
    UserMountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=33.43,Y=0,Z=-66.75),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=32768,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0)
    ViewingAngleThreshold=-2
    HeadAimMinOffset=(Pitch=0,Yaw=0,Roll=0)
    HeadAimMaxOffset=(Pitch=0,Yaw=0,Roll=0)
    bForceUsePhrase=true
    bUsable=false
    UsePhrase="<?int?dnDecorations.dnControl_GasTank.UsePhrase?>"
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Metal_Solid'
    bTraceUsable=false
    bTraceShootable=false
    bNeverMeshAccurate=true
    bUseCylinderCollision=true
    bCanExistOutOfWorld=true
    bDoOverlayEffect=false
    PlacementZOffset=66.75
    CollisionRadius=60
    CollisionHeight=40
    Mesh='c_hands.gas_cap'
    VoicePack='SoundConfig.Vehicles.VoicePack_MonsterTruck'
}