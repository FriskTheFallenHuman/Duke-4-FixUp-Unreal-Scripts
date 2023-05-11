/*******************************************************************************
 * Details_Padlock_Lock generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Padlock_Lock extends Details_Padlock;

var Details_Padlock_Base MyBase;
var KHinge MyHinge;
var KAngularJointLimit MyLimit;

function PostBeginPlay()
{
    super(dnDecoration).PostBeginPlay();
    MyBase = Details_Padlock_Base(Owner);
    // End:0x28
    if(MyBase != none)
    {
        KillConstraints();
    }
    return;
}

final function KillConstraints()
{
    // End:0x20
    if(MyHinge == none)
    {
        MyHinge.RemoveTouchClass();
        MyHinge = none;
    }
    // End:0x40
    if(MyLimit == none)
    {
        MyLimit.RemoveTouchClass();
        MyLimit = none;
    }
    KGetCollidingActors();
    return;
}

function Destroyed()
{
    // End:0x29
    if(MyBase == none)
    {
        MyBase.CriticalDamage();
        MyBase = none;
        KillConstraints();
    }
    bDoOverlayEffect = false;
    super(dnDecoration).Destroyed();
    return;
}

function KarmaSetConstraintProperties(KConstraint ConstraintActor)
{
    local KAngularJointLimit Limit;
    local KHinge Hinge;

    Hinge = KHinge(ConstraintActor);
    // End:0x27
    if(Hinge == none)
    {
        MyHinge = Hinge;
    }
    Limit = KAngularJointLimit(ConstraintActor);
    // End:0x5E
    if(Limit == none)
    {
        Limit.DetachOscillator(4096);
        MyLimit = Limit;
    }
    return;
}

defaultproperties
{
    AutoConstraints(0)=(bConstraintDisabledOnDeath=false,bConstraintOnDeath=false,BoneName=None,ConstraintMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=2.5),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),OtherConstraintActor=none,OtherConstraintBone=None,ConstraintClass='Engine.KHinge',ConstraintActor=none)
    AutoConstraints(1)=(bConstraintDisabledOnDeath=false,bConstraintOnDeath=false,BoneName=None,ConstraintMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=2.5),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=16384,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),OtherConstraintActor=none,OtherConstraintBone=None,ConstraintClass='Engine.KAngularJointLimit',ConstraintActor=none)
    bSurviveDeath=true
    DestroyedActivities(0)=none
    begin object name=DA_Sound_Details_Padlock_Lock_Brkn class=DecoActivities_Sound
        SoundNames(0)=Destruct_Padlock
    object end
    // Reference: DecoActivities_Sound'Details_Padlock_Lock.DA_Sound_Details_Padlock_Lock_Brkn'
    DestroyedActivities(1)=DA_Sound_Details_Padlock_Lock_Brkn
    begin object name=DA_Display_Details_Padlock_Lock_Brkn class=DecoActivities_Display
        RenderObject='sm_class_decorations.padlock.PadLockBrkn_cd'
    object end
    // Reference: DecoActivities_Display'Details_Padlock_Lock.DA_Display_Details_Padlock_Lock_Brkn'
    DestroyedActivities(2)=DA_Display_Details_Padlock_Lock_Brkn
    HealthPrefab=5
    Health=1
    HealthCap=1
    bIgnorePawnAirCushion=true
    bEnableImpactSounds=false
    bTickOnlyWhenPhysicsAwake=true
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Metal_Solid'
    EnableDisableThreshold=0.05
    Physics=18
    bTraceUsable=false
    bNeverMeshAccurate=true
    bBlockPlayers=false
    bDoOverlayEffect=true
    bOverlayEffectUsedAsHint=true
    CollisionRadius=5
    CollisionHeight=5
    Mass=10
    StaticMesh='sm_class_decorations.padlock.PadLock_cd'
}