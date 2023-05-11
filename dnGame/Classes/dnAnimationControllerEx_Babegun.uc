/*******************************************************************************
 * dnAnimationControllerEx_Babegun generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnAnimationControllerEx_Babegun extends dnAnimationControllerEx_Weapon;

defaultproperties
{
    Animations(0)=(AnimationName=Activate,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=pistol_babegun_activate,AnimStartingFrame=0,AnimRate=1.2,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=WeaponCallback_Activated,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
    Animations(1)=(AnimationName=Deactivate,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=pistol_babegun_deactivate,AnimStartingFrame=0,AnimRate=1.2,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=WeaponCallback_Deactivated,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
    Animations(2)=(AnimationName=Fire,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=pistol_babegun_fire,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=WeaponCallback_MaybeDoneFiring,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
    Animations(3)=(AnimationName=idle,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=pistol_babegun_idle,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=WpnIdle,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
    Animations(4)=(AnimationName=IdleLarge,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=pistol_babegun_idle_twirl,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=WpnIdle,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
    Animations(5)=(AnimationName=Melee0,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=pistol_babegun_melee,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=WeaponCallback_MeleeComplete,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
    Animations(6)=(AnimationName=Melee1,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=pistol_babegun_melee,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=WeaponCallback_MeleeComplete,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
    Animations(7)=(AnimationName=Reload,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=pistol_babegun_reload,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=WeaponCallback_DefinitelyDoneReloading,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
    Animations(8)=(AnimationName=CPRTransition,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=scr_a_edf_cpr_transition_b,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=None,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
}