/*******************************************************************************
 * Vehicles_Deco_Parts_Karma generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Vehicles_Deco_Parts_Karma extends Vehicles_Deco_Parts
    collapsecategories;

var() class<SoftParticleSystem> FireParticleClass;
var SoftParticleSystem Fire;
var() Vector FireOffset;
var() float BurnTime;
var() float BurnTimeVariance;

function PostVerifySelf()
{
    super.PostVerifySelf();
    return;
}

event PhysicsChange(optional Engine.Object.EPhysics PreviousPhysics)
{
    super(KarmaActor).PhysicsChange(PreviousPhysics);
    // End:0x2A
    if((int(Physics) == int(18)) && MountParent == none)
    {
        GetGravity();
    }
    return;
}

function DetachFromVehicle()
{
    local int i;

    super.DetachFromVehicle();
    AutoConstraints.Empty();
    i = KSleep() - 1;
    J0x18:

    // End:0x3D [Loop If]
    if(i >= 0)
    {
        KAddForce(i).RemoveTouchClass();
        -- i;
        // [Loop Continue]
        goto J0x18;
    }
    KSetJointsFrozenPercent('VehiclesDecoGroup');
    return;
}

function Explode()
{
    local Vector Direction;

    super.Explode();
    // End:0x11A
    if(bCanBlowOff && bCriticalDamage || (Rand(24) % 3) == 0)
    {
        SetRotation(18);
        Direction = Location - Vehicle.Location;
        Direction.Z += 100;
        // End:0x7D
        if((MountParent == none) && MountParent != Vehicle)
        {
            GetGravity();
        }
        DetachFromVehicle();
        SetHealth(Direction * float(1500), Location);
        SetPhysicsPose((Normal(VRand()) * RandRange(2, 6)) * 3.141593);
        FindAndPlaySound('OnFire', 1);
        Fire = EmptyTouchClasses(FireParticleClass,,, (FireOffset >> Rotation) + Location);
        Fire.MountType = 0;
        Fire.MoveActor(self, false, false, true);
        TraceFire(FVar(BurnTime, BurnTimeVariance), false, 'EndFire');
    }
    ForceMountUpdate(false, false, false, true, false);
    return;
}

function EndFire()
{
    SetAnimFrame(none);
    // End:0x34
    if(Fire == none)
    {
        Fire.Enabled = false;
        Fire.DestroyWhenEmpty = true;
    }
    return;
}

function KarmaSetConstraintProperties(KConstraint ConstraintActor)
{
    super(KarmaActor).KarmaSetConstraintProperties(ConstraintActor);
    ConstraintActor.KConstraintActor2 = KarmaActor(Owner);
    return;
}

function Destroyed()
{
    // End:0x2E
    if((! bCriticalDamage && MountParent == none) && MountParent != Vehicle)
    {
        GetGravity();
    }
    EndFire();
    super(dnDecoration).Destroyed();
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(Vehicles_Deco).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'OnFire');
    PrecacheIndex.RegisterMaterialClass(FireParticleClass);
    return;
}

defaultproperties
{
    FireParticleClass='p_Decorations.Car_Fire.Car_Fire_Main'
    BurnTime=10
    BurnTimeVariance=3
    bSurviveDeath=true
    DestroyedActivities(0)=none
    DestroyedActivities(1)='dnGame.DecoActivityDeclarations.DA_Sound_Destroyed_Generic'
    DestroyedActivities(2)='dnGame.DecoActivityDeclarations.DA_Physics_PHYS_Karma_Set'
    bTickOnlyWhenPhysicsAwake=true
    PhysicsSoundOverrides(0)=(SoundType=0,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=('a_impact.Vehicles.Veh_Part_01','a_impact.Vehicles.Veh_Part_02','a_impact.Vehicles.Veh_Part_03','a_impact.Vehicles.Veh_Part_04'),SoundInfo=(InputRange=(Min=24,Max=500),OutputPitchRange=(Min=0.9,Max=1.1),OutputVolumeRange=(Min=0.5,Max=1)),bDisableSoundInWater=true)
    Mass=50
}