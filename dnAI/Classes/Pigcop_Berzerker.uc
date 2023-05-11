/*******************************************************************************
 * Pigcop_Berzerker generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Pigcop_Berzerker extends PigCop_Grunt
    config
    collapsecategories;

var int PainRefID;

static function class<AIActor> GetSpawnClass(AIActorFactory Factory)
{
    return default.Class;
    return;
}

function AIActor_AnimEnd(int Channel, name AnimName, int RefId)
{
    super(AIActor).AIActor_AnimEnd(Channel, AnimName, RefId);
    // End:0x49
    if(PainRefID == RefId)
    {
        AnimCtrl.m_oController.EmptyAnimChannel('Weapon_Ref');
        GroundSpeedScale = 1;
    }
    return;
}

event EnumerateWeaponClasses(PrecacheIndex PrecacheIndex, out array< class<Weapon> > WeaponClasses)
{
    return;
}

defaultproperties
{
    StartBezerk=true
    WeaponConfig='WeaponCfg_PigCopCaptain'
    Weapons(0)=none
    bIgnoreTripMines=true
    bTryBackupPathingOnFailure=true
    InitialAnimController=6
    AnimControllers[4]=(m_eFallback=1,m_cClass='acPigCop_Bezerk',m_oController=none)
    JumpAttackParms=(TargetActor=none,Mode=0,Type=0,AttackOnTakeoff=false,Attacked=false,AttackSuccess=false,AppliedJumpVel=false,RefId=0,FrameVelocity=(X=0,Y=0,Z=0),bCanJumpAttackShrunkTarget=false,ShrunkTargetHeightScale=1,ShrunkTargetDistanceScale=1,MinInterval=7,GroundFinderGate=0,GroundFinderInterval=0.5,PresetFrameVelocity=(X=0,Y=0,Z=0),DefaultPresetFrameVelocity=(X=700,Y=0,Z=350),JumpAttackType=2,ParabolaJumpHeight=120,ParabolaMinJumpHeight=5,ParabolaMaxJumpHeight=50,GroundFinderLockout=0.25,bInstantJump=false,bUsePresetVelocity=false,bCheckClearShot=false,bCheckHasPath=false,bCheckClearPath=false,bDontApplyDirectDamage=true,bDisabled=false)
    ShowPain=false
    MinPainOpInterval=0.4
    MaxConsecutivePainOp=3
    MaxConsecutivePainInterval=1
    bDontUseAIOPPain=true
    MeleeZone=60
    bNeverFailOnDynamicPath=true
}