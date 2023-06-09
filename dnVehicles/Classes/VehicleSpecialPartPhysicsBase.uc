/*******************************************************************************
 * VehicleSpecialPartPhysicsBase generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class VehicleSpecialPartPhysicsBase extends VehicleSpecialPartBase
    abstract;

simulated function bool AttachToVehicle(VehicleBase Vehicle)
{
    // End:0x12
    if(! super.AttachToVehicle(Vehicle))
    {
        return false;
    }
    GetGravity();
    SetRotation(18);
    return int(Physics) == int(18);
    return;
}

function KarmaSetConstraintProperties(KConstraint ConstraintActor)
{
    super(KarmaActor).KarmaSetConstraintProperties(ConstraintActor);
    ConstraintActor.KConstraintActor2 = ParentVehicle;
    return;
}

defaultproperties
{
    OverridePhysicsImpactDamageType='Engine.VehiclePhysicsImpactDamage'
    Physics=18
    bBlockKarma=true
}