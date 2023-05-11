/*******************************************************************************
 * Workman generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Workman extends Male
    config
    collapsecategories;

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    // End:0xDF
    if(PrecacheIndex.MapName ~= "Map22")
    {
        PrecacheIndex.InitAnimationControllerEx(class'VoicePack_EDF1', 'CPR_Breath');
        PrecacheIndex.InitAnimationControllerEx(class'VoicePack_EDF1', 'CPR_Inhale');
        PrecacheIndex.InitAnimationControllerEx(class'VoicePack_EDF1', 'CPR_Push');
        PrecacheIndex.InitAnimationControllerEx(class'VoicePack_EDF1', 'ST_Getup_FootScrape');
        PrecacheIndex.InitAnimationControllerEx(class'VoicePack_EDF1', 'ST_Getup_Hand');
        PrecacheIndex.InitAnimationControllerEx(class'VoicePack_EDF1', 'ST_Getup_StandShift');
        PrecacheIndex.InitAnimationControllerEx(class'VoicePack_President', 'Sound_Screams');
        PrecacheIndex.InitAnimationControllerEx(class'VoicePack_President', 'Sound_Death');
    }
    return;
}

defaultproperties
{
    HasLookTargetEvaluator=true
    LookTargetEvalInfo=(MyOwner=none,EvalInterval=0.5,Suspended=false,bSuspendedWithNoTarget=false,Evaluator=2,ForceUpdate=false,MustBePawn=false,MustBeSighted=false,MustBeReachable=false,CanTargetProjectiles=false,CanAvoidTargetableProjectiles=false,LastTarget=none,LastTargetEndTime=0)
    DisableAimGrids=true
    AutoRegisterIKClasses(0)='Engine.IKSystemInfo_Walker'
    VoicePack='SoundConfig.NPCs.VoicePack_Workman'
}