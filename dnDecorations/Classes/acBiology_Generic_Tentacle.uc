/*******************************************************************************
 * acBiology_Generic_Tentacle generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class acBiology_Generic_Tentacle extends dnAnimationControllerEx;

defaultproperties
{
    AnimChannels(0)=(ChannelName=Base,ChannelGroupName=None,ChannelBlendOp=0,LastBlendAlpha=0,LastAnimLink=0,LastAnimControllerLink=none,ParentBlockChannelLink=0,bActAsGroup=true,GroupCrossfadeTime=0.3,PrimaryChannelIndex=0,FadeRates=0,FadeRates[1]=0,FadeRates[2]=0,FadeRates[3]=0,FadeRates[4]=0,FadeRates[5]=0,FadeRates[6]=0,FadeRates[7]=0,FadeRates[8]=0,FadeRates[9]=0,FadeRates[10]=0,FadeRates[11]=0,FadeRates[12]=0,FadeRates[13]=0,FadeRates[14]=0,FadeRates[15]=0,FadeRates[16]=0,FadeRates[17]=0,FadeRates[18]=0,FadeRates[19]=0,FadeRates[20]=0,FadeRates[21]=0,FadeRates[22]=0,FadeRates[23]=0,NumFadingOut=0,LastCrossfadeRate=0,bMovementActive=false)
    Animations(0)=(AnimationName=IdlePassive,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=a_pas_idle_01_grid3d,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=true,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=None,AnimEnd_Event=None,GroupCrossfadeOverride=0.5,bForceCrossfade=false,bIs3DGrid=true,AnimGridLink=0)
    Animations(1)=(AnimationName=IdleInspectA,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=a_pas_out_lookaround_01,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=IdlePassive,AnimEnd_FunctionCallName=AnimEnd_Inspect,AnimEnd_Event=None,GroupCrossfadeOverride=0.5,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
    Animations(2)=(AnimationName=IdleInspectB,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=a_pas_out_lookaround_02,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=IdlePassive,AnimEnd_FunctionCallName=AnimEnd_Inspect,AnimEnd_Event=None,GroupCrossfadeOverride=0.5,bForceCrossfade=false,bIs3DGrid=false,AnimGridLink=0)
    Animations(3)=(AnimationName=IdleActive,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=a_act_idle_01_grid3d,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=true,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=None,AnimEnd_FunctionCallName=None,AnimEnd_Event=None,GroupCrossfadeOverride=0.5,bForceCrossfade=false,bIs3DGrid=true,AnimGridLink=0)
    Animations(4)=(AnimationName=SwipeA,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=a_act_attack_straight_01_grid3d,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=IdleActive,AnimEnd_FunctionCallName=AnimEnd_Swipe,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=true,AnimGridLink=0)
    Animations(5)=(AnimationName=SwipeB,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=a_act_attack_straight_02_grid3d,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=IdleActive,AnimEnd_FunctionCallName=AnimEnd_Swipe,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=true,AnimGridLink=0)
    Animations(6)=(AnimationName=SwipeC,AnimationChannel=(ChannelName=Base,ChannelLink=0,bLinkedToBlock=false),AnimSequence=a_act_attack_straight_03_grid3d,AnimStartingFrame=0,AnimRate=0,AnimRateVariance=0,AnimTween=0,AnimDefaultBlendAlpha=0,AnimEarlyEndTime=0,bLoopAnim=false,bInterrupt=false,bNoRemoveAnim=false,bBatchAnim=false,bAdjustStart=false,AnimBlendInInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimBlendOutInfo=(BlendTotalTime=0,StartingBlendAlpha=0,EndingBlendAlpha=0),AnimStart_FunctionCallName=None,AnimEnd_NextAnimStateName=IdleActive,AnimEnd_FunctionCallName=AnimEnd_Swipe,AnimEnd_Event=None,GroupCrossfadeOverride=0,bForceCrossfade=false,bIs3DGrid=true,AnimGridLink=0)
}