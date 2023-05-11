/*******************************************************************************
 * dnCorpsePinata generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnCorpsePinata extends dnDecorativeCorpse
    collapsecategories;

struct SWebbedBone
{
    var() noexport name BoneName "This is the name of the bone that you want to attach webbing to.";
    var() noexport deprecated Actor WorldAttachPoint "Point this to an Actor placed in the world as an attach point for the webbing.";
    var KBSJoint WorldBSJoint;
    var KarmaActor HelperNode1;
    var KLinear LinearJoint;
    var KLinearSpringDamper SpringDamper;
    var KarmaActor HelperNode2;
    var KBSJoint BoneBSJoint;
    var Details_Generic_CorpseWebbing_Pinata Webbing;
};

var() noexport SWebbedBone WebbedBones[3] "Array of bones you want to attach to the world with webbing.";
var() noexport class<Pickup> PickupTypes[3] "List of pickups to drop in sequence.  Leave a slot empty if you don't want something for each break.";
var() noexport float DamageThrottle "Amount of time to wait between accepting damage.";
var MotionPrefab PickupMotionPrefab;
var bool bTimeout;
var bool bAttached;
var int PickupIndex;

simulated event PreBeginPlay()
{
    local int i;
    local Vector AttachLoc, BoneLoc, Dir;

    super(RenderActor).PreBeginPlay();
    // End:0x5B4
    if(SetScaleModifier() == none)
    {
        i = 0;
        J0x17:

        // End:0x5B4 [Loop If]
        if(i < 3)
        {
            // End:0x5B
            if(! MeshInstance.BoneGetRotate(WebbedBones[i].BoneName))
            {
                WebbedBones[i].BoneName = 'Root';
            }
            BoneLoc = MeshInstance.CreateAnimGroup(WebbedBones[i].BoneName, true);
            // End:0xB9
            if(WebbedBones[i].WorldAttachPoint == none)
            {
                AttachLoc = WebbedBones[i].WorldAttachPoint.Location;                
            }
            else
            {
                AttachLoc = BoneLoc;
            }
            Dir = Normal(BoneLoc - AttachLoc);
            WebbedBones[i].HelperNode1 = EmptyTouchClasses(class'Details_Generic_PhysicsHelperNode', self,, AttachLoc + (64 * Dir), Rot(0, 0, 0), false, true);
            WebbedBones[i].WorldBSJoint = KBSJoint(KarmaSetupConstraint(class'KBSJoint', WebbedBones[i].HelperNode1));
            // End:0x189
            if(WebbedBones[i].WorldBSJoint == none)
            {
                WebbedBones[i].WorldBSJoint.SetDesiredRotation(AttachLoc);
                KarmaEnableConstraint(WebbedBones[i].WorldBSJoint);
            }
            WebbedBones[i].HelperNode2 = EmptyTouchClasses(class'Details_Generic_PhysicsHelperNode', self,, BoneLoc, Rot(0, 0, 0), false, true);
            WebbedBones[i].LinearJoint = KLinear(KarmaSetupConstraint(class'KLinear', WebbedBones[i].HelperNode1,, WebbedBones[i].HelperNode2));
            // End:0x2A3
            if(WebbedBones[i].LinearJoint == none)
            {
                WebbedBones[i].LinearJoint.SetDesiredRotation(WebbedBones[i].HelperNode1.Location);
                WebbedBones[i].LinearJoint.DisableDesiredRotation_Roll(Rotator(Normal(WebbedBones[i].HelperNode2.Location - WebbedBones[i].HelperNode1.Location)));
                KarmaEnableConstraint(WebbedBones[i].LinearJoint);
            }
            WebbedBones[i].SpringDamper = KLinearSpringDamper(KarmaSetupConstraint(class'KLinearSpringDamper', WebbedBones[i].HelperNode1,, WebbedBones[i].HelperNode2));
            // End:0x41D
            if(WebbedBones[i].SpringDamper == none)
            {
                WebbedBones[i].SpringDamper.SetDesiredRotation(WebbedBones[i].LinearJoint.Location);
                WebbedBones[i].SpringDamper.DisableDesiredRotation_Roll(WebbedBones[i].LinearJoint.Rotation);
                WebbedBones[i].SpringDamper.SplashWater(VSize(BoneLoc - WebbedBones[i].LinearJoint.Location));
                WebbedBones[i].SpringDamper.InternalTick(false);
                WebbedBones[i].SpringDamper.AttachOscillator(false);
                WebbedBones[i].SpringDamper.SetMaximumTorque(6000);
                WebbedBones[i].SpringDamper.SetMotorAxisMode(1000);
                KarmaEnableConstraint(WebbedBones[i].SpringDamper);
            }
            WebbedBones[i].BoneBSJoint = KBSJoint(KarmaSetupConstraint(class'KBSJoint', self, WebbedBones[i].BoneName, WebbedBones[i].HelperNode2));
            // End:0x4A9
            if(WebbedBones[i].BoneBSJoint == none)
            {
                WebbedBones[i].BoneBSJoint.SetDesiredRotation(BoneLoc);
                KarmaEnableConstraint(WebbedBones[i].BoneBSJoint);
            }
            WebbedBones[i].Webbing = EmptyTouchClasses(class'Details_Generic_CorpseWebbing_Pinata', self,,,, false, true);
            // End:0x5AA
            if(WebbedBones[i].Webbing == none)
            {
                WebbedBones[i].Webbing.bGoryActor = true;
                WebbedBones[i].Webbing.OwnerPinata = self;
                WebbedBones[i].Webbing.OwnerSlot = i;
                WebbedBones[i].Webbing.Actor1 = self;
                WebbedBones[i].Webbing.Actor1Bone = WebbedBones[i].BoneName;
                WebbedBones[i].Webbing.Actor2 = WebbedBones[i].WorldAttachPoint;
            }
            ++ i;
            // [Loop Continue]
            goto J0x17;
        }
    }
    return;
}

simulated event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
    local int i;
    local array<int> Options;

    i = 0;
    J0x07:

    // End:0x47 [Loop If]
    if(i < 3)
    {
        // End:0x3D
        if(WebbedBones[i].Webbing == none)
        {
            Options[Options.Add(1)] = i;
        }
        ++ i;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x67
    if(string(Options) > 0)
    {
        DestroyBoneWebbing(Options[Rand(string(Options))]);
    }
    return;
}

final simulated function DestroyBoneWebbing(int WebbingSlot)
{
    local class<Pickup> PickupType;
    local Pickup Pickup;

    // End:0x19
    if(WebbedBones[WebbingSlot].Webbing != none)
    {
        return;
    }
    // End:0x24
    if(bTimeout)
    {
        return;
    }
    bTimeout = true;
    Destroy(DamageThrottle, false, 'ClearTimeout');
    FindAndPlaySound('PinataWeb_Break');
    WebbedBones[WebbingSlot].WorldBSJoint.SetRotation(0);
    WebbedBones[WebbingSlot].LinearJoint.SetRotation(0);
    WebbedBones[WebbingSlot].SpringDamper.SetRotation(0);
    WebbedBones[WebbingSlot].BoneBSJoint.SetRotation(0);
    WebbedBones[WebbingSlot].WorldBSJoint.bSilentDestroy = true;
    WebbedBones[WebbingSlot].WorldBSJoint.RemoveTouchClass();
    WebbedBones[WebbingSlot].WorldBSJoint = none;
    WebbedBones[WebbingSlot].HelperNode1.bSilentDestroy = true;
    WebbedBones[WebbingSlot].HelperNode1.RemoveTouchClass();
    WebbedBones[WebbingSlot].HelperNode1 = none;
    WebbedBones[WebbingSlot].LinearJoint.bSilentDestroy = true;
    WebbedBones[WebbingSlot].LinearJoint.RemoveTouchClass();
    WebbedBones[WebbingSlot].LinearJoint = none;
    WebbedBones[WebbingSlot].SpringDamper.bSilentDestroy = true;
    WebbedBones[WebbingSlot].SpringDamper.RemoveTouchClass();
    WebbedBones[WebbingSlot].SpringDamper = none;
    WebbedBones[WebbingSlot].HelperNode2.bSilentDestroy = true;
    WebbedBones[WebbingSlot].HelperNode2.RemoveTouchClass();
    WebbedBones[WebbingSlot].HelperNode2 = none;
    WebbedBones[WebbingSlot].BoneBSJoint.bSilentDestroy = true;
    WebbedBones[WebbingSlot].BoneBSJoint.RemoveTouchClass();
    WebbedBones[WebbingSlot].BoneBSJoint = none;
    WebbedBones[WebbingSlot].Webbing.bSilentDestroy = true;
    WebbedBones[WebbingSlot].Webbing.RemoveTouchClass();
    WebbedBones[WebbingSlot].Webbing = none;
    // End:0x322
    if(PickupTypes[PickupIndex] == none)
    {
        Pickup = EmptyTouchClasses(PickupTypes[PickupIndex], self,, Location + Vect(0, 0, PickupTypes[PickupIndex].default.CollisionHeight),, false, true);
        // End:0x322
        if(Pickup == none)
        {
            Pickup.KSetJointsFrozenPercent(PhysicsEntityGroup);
            Pickup.SetVolumeVelocity(self, PickupMotionPrefab);
        }
    }
    ++ PickupIndex;
    // End:0x34D
    if(PickupIndex >= 3)
    {
        KFindPhysicsAction(7);
        FindAndStopSound('PinataWeb_Stretch');
        bAttached = false;
    }
    return;
}

event Tick(float DeltaSeconds)
{
    local float Scale;

    super(CorpseBase).Tick(DeltaSeconds);
    // End:0x34
    if(bAttached && Abs(VSize(Velocity)) > 10)
    {
        FindAndPlaySound('PinataWeb_Stretch');
    }
    Scale = DeltaSeconds / 0.02;
    // End:0x6A
    if(Scale > 1)
    {
        GravityScale = default.GravityScale / Scale;        
    }
    else
    {
        GravityScale = default.GravityScale;
    }
    return;
}

final simulated function ClearTimeout()
{
    bTimeout = false;
    return;
}

simulated event bool OnEvalBonesHelper()
{
    local float DesiredHeadScale;

    DesiredHeadScale = Level.HeadScaleModifier;
    // End:0x53
    if((DesiredHeadScale != 1) && SetScaleModifier() == none)
    {
        MeshInstance.AnimUpdateGrid('neck', Vect(DesiredHeadScale, DesiredHeadScale, DesiredHeadScale));
    }
    return true;
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(CorpseBase).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.RegisterMaterialClass(class'Details_Generic_PhysicsHelperNode');
    PrecacheIndex.RegisterMaterialClass(class'Details_Generic_CorpseWebbing_Pinata');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'PinataWeb_Break');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'PinataWeb_Stretch');
    return;
}

defaultproperties
{
    WebbedBones[0]=(BoneName=LeftArm,WorldAttachPoint=none,WorldBSJoint=none,HelperNode1=none,LinearJoint=none,SpringDamper=none,HelperNode2=none,BoneBSJoint=none,Webbing=none)
    WebbedBones[1]=(BoneName=RightForeArmRoll,WorldAttachPoint=none,WorldBSJoint=none,HelperNode1=none,LinearJoint=none,SpringDamper=none,HelperNode2=none,BoneBSJoint=none,Webbing=none)
    WebbedBones[2]=(BoneName=LeftLeg,WorldAttachPoint=none,WorldBSJoint=none,HelperNode1=none,LinearJoint=none,SpringDamper=none,HelperNode2=none,BoneBSJoint=none,Webbing=none)
    DamageThrottle=0.5
    begin object name=dnCorpsePinata_PickupMotionPrefab class=MotionPrefab
        bUseDamageInfo=false
        bUseParentVelocity=false
        bUseParentRotationRate=false
        Velocity=(X=0,Y=0,Z=150)
        VelocityVariance=(X=300,Y=300,Z=0)
    object end
    // Reference: MotionPrefab'dnCorpsePinata.dnCorpsePinata_PickupMotionPrefab'
    PickupMotionPrefab=dnCorpsePinata_PickupMotionPrefab
    bAttached=true
    bStartEnabled=true
    bIgnoresPhysicsDamage=false
    DynamicInteractionClassification=0
    bHasEvalBonesHelper=true
    bGoryActor=true
    CollisionRadius=45
    CollisionHeight=45
    Mesh='c_characters.corpse_pinyata'
    VoicePack='SoundConfig.Interactive.VoicePack_Biology'
}