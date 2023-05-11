/*******************************************************************************
 * Enforcer_Shield generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Enforcer_Shield extends Enforcer
    config
    collapsecategories;

var Enforcer_Armor_Shield Shield;

event bool HasShield()
{
    return (Shield == none) && Shield.MountParent != self;
    return;
}

function Anim_Idle()
{
    super(AIActor).Anim_Idle();
    // End:0x1A
    if(HasShield())
    {
        PlayAnim('Anim_ShieldIdle');
    }
    return;
}

function Anim_MoveTo(Engine.BaseAI.EAIMoveSpeed eMoveSpeed)
{
    // End:0x12
    if(HasShield())
    {
        Anim_Walk();        
    }
    else
    {
        super.Anim_MoveTo(eMoveSpeed);
    }
    return;
}

function Anim_MoveTo_BackUp(Engine.BaseAI.EAIMoveSpeed eMoveSpeed)
{
    // End:0x12
    if(HasShield())
    {
        Anim_WalkBackward();        
    }
    else
    {
        super(AIActor).Anim_MoveTo_BackUp(eMoveSpeed);
    }
    return;
}

function Anim_MoveTo_StrafeLeft(Engine.BaseAI.EAIMoveSpeed eMoveSpeed)
{
    // End:0x17
    if(HasShield())
    {
        PlayAnim('Anim_SidestepLeft');        
    }
    else
    {
        super(AIActor).Anim_MoveTo_StrafeLeft(eMoveSpeed);
    }
    return;
}

function Anim_MoveTo_StrafeRight(Engine.BaseAI.EAIMoveSpeed eMoveSpeed)
{
    // End:0x17
    if(HasShield())
    {
        PlayAnim('Anim_SidestepRight');        
    }
    else
    {
        super(AIActor).Anim_MoveTo_StrafeRight(eMoveSpeed);
    }
    return;
}

event PostBeginPlay()
{
    // End:0x14
    foreach GetNextIntDesc(class'Enforcer_Armor_Shield', Shield)
    {
        // End:0x14
        break;        
    }    
    super.PostBeginPlay();
    return;
}

event NotifyArmorLoss(Destructible_Armor Armor)
{
    super(AIActor).NotifyArmorLoss(Armor);
    // End:0x3C
    if(Armor != Shield)
    {
        Shield = none;
        AnimCtrl.m_oController.EmptyAnimChannel('Weapon_Idle');
    }
    return;
}

event name GetMeleeAttackAnimName()
{
    // End:0x0F
    if(HasShield())
    {
        return 'Anim_AttackShield';
    }
    return super(AIActor).GetMeleeAttackAnimName();
    return;
}

event NotifyOpStarted(Engine.BaseAI.EAIOp NewOp, Engine.BaseAI.EAIOp OldOp)
{
    super(AIActor).NotifyOpStarted(NewOp, OldOp);
    // End:0x43
    if((int(NewOp) == int(92)) && HasShield())
    {
        AnimCtrl.m_oController.EmptyAnimChannel('Weapon_Idle');
    }
    return;
}

event NotifyOpEnded(Engine.BaseAI.EAIOp Op, Engine.BaseAI.EAIOpStatus Status)
{
    super(AIActor).NotifyOpEnded(Op, Status);
    // End:0x34
    if((int(Op) == int(92)) && HasShield())
    {
        PlayAnim('Anim_ShieldIdle');
    }
    return;
}

simulated function bool AcceptsShrinkDamage(Vector DamageLocation)
{
    // End:0x30
    if((Shield == none) && (Normal(DamageLocation - Location) Dot Vector(Rotation)) >= 0.2)
    {
        return false;
    }
    return super(Pawn).AcceptsShrinkDamage(DamageLocation);
    return;
}

function OnStartShrink(optional bool bShrunkByPod)
{
    super(AIActor).OnStartShrink(bShrunkByPod);
    // End:0x28
    if(Shield == none)
    {
        Shield.CriticalDamage();
    }
    return;
}

function DiedActivity(optional Pawn Killer, optional int Damage, optional Vector DamageOrigin, optional Vector DamageDirection, optional class<DamageType> DamageType, optional name HitBoneName)
{
    super(AIActor).DiedActivity(Killer, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName);
    // End:0x40
    if(Shield == none)
    {
        Shield.CriticalDamage();
    }
    return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
    super(Pawn).TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
    // End:0x5B
    if((Health <= (HealthCap / float(2))) && Shield == none)
    {
        Shield.CriticalDamage();
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    RegisterAIAnimationControllerEntry(PrecacheIndex, 'Anim_ShieldIdle');
    RegisterAIAnimationControllerEntry(PrecacheIndex, 'Anim_SidestepLeft');
    RegisterAIAnimationControllerEntry(PrecacheIndex, 'Anim_SidestepRight');
    RegisterAIAnimationControllerEntry(PrecacheIndex, 'Anim_AttackShield');
    RegisterAIAnimationControllerEntry(PrecacheIndex, 'Anim_ShieldFire');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'Sound_ShieldBash');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'Sound_ShieldLunge');
    return;
}

defaultproperties
{
    MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='Enforcer_Armor_LeftElbow',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=true,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=armor11,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=3859,Yaw=-13529,Roll=26927),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(1)=(bSkipVerifySelf=false,SpawnClass='Enforcer_Armor_LeftKnee',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=true,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=armor7,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=-1324,Yaw=-93,Roll=31363),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(2)=(bSkipVerifySelf=false,SpawnClass='Enforcer_Armor_LeftLowerSPad',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=true,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=armor5,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=4,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(3)=(bSkipVerifySelf=false,SpawnClass='Enforcer_Armor_LeftMiddleSPad',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=true,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=armor4,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=4,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(4)=(bSkipVerifySelf=false,SpawnClass='Enforcer_Armor_LeftThigh',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=true,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=armor9,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(5)=(bSkipVerifySelf=false,SpawnClass='Enforcer_Armor_LeftUpperSPad',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=true,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=armor3,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=4,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(6)=(bSkipVerifySelf=false,SpawnClass='Enforcer_Armor_RightElbow',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=true,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=armor12,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=-3862,Yaw=19241,Roll=5843),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(7)=(bSkipVerifySelf=false,SpawnClass='Enforcer_Armor_RightKnee',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=true,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=armor6,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=1324,Yaw=32768,Roll=1405),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(8)=(bSkipVerifySelf=false,SpawnClass='Enforcer_Armor_RightLowerSPad',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=true,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=armor2,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=4,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(9)=(bSkipVerifySelf=false,SpawnClass='Enforcer_Armor_RightThigh',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=true,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=armor8,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(10)=(bSkipVerifySelf=false,SpawnClass='Enforcer_Armor_RightUpperSPad',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=true,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=armor1,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=4,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(11)=(bSkipVerifySelf=false,SpawnClass='Enforcer_Armor_RightShinGuard',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=true,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=RightLeg,MountOrigin=(X=3.005336,Y=0.549336,Z=-9.595222),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=1324,Yaw=32678,Roll=1405),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(12)=(bSkipVerifySelf=false,SpawnClass='Enforcer_Armor_LeftShinGuard',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=true,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=LeftLeg,MountOrigin=(X=-2.341118,Y=-1.89544,Z=9.728533),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=-1324,Yaw=8454,Roll=31363),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(13)=(bSkipVerifySelf=false,SpawnClass='Enforcer_Armor_WristGuard',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=true,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=LeftForeArm,MountOrigin=(X=0.574963,Y=0.802558,Z=5.217832),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=3857,Yaw=-10928,Roll=26927),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(14)=(bSkipVerifySelf=false,SpawnClass='Enforcer_Weapon',SpawnChance=1,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=Gun,ForceEvent=None,MountMeshItem=mount_gun,MountOrigin=(X=-2.423,Y=1.144,Z=6.431),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=97,Yaw=-612,Roll=201),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(15)=(bSkipVerifySelf=false,SpawnClass='Enforcer_Armor_Shield',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=true,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_shield,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
}