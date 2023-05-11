/*******************************************************************************
 * VehicleExtraSpecialPart_Spinner generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class VehicleExtraSpecialPart_Spinner extends dnDecoration
    abstract
    collapsecategories;

var() float SpinnerPositiveSpringStrength;
var() float SpinnerNegativeSpringStrength;
var() float SpinnerPositiveDamping;
var() float SpinnerNegativeDamping;
var float AngularVelocity;
var int AngleOffset;

event Tick(float DeltaTime)
{
    local VehicleSpecialPart_TireEx Tire;
    local float SpringStrength, Damping;
    local int AngleSign;

    super(Actor).Tick(DeltaTime);
    Tire = VehicleSpecialPart_TireEx(MountParent);
    // End:0x181
    if((Tire == none) && Tire.MountParent == none)
    {
        // End:0x75
        if(Abs(Tire.AngularVelocity) > Abs(AngularVelocity))
        {
            SpringStrength = SpinnerPositiveSpringStrength;
            Damping = SpinnerPositiveDamping;            
        }
        else
        {
            SpringStrength = SpinnerNegativeSpringStrength;
            Damping = SpinnerNegativeDamping;
        }
        AngularVelocity += ((SpringStrength * DeltaTime) * (Tire.AngularVelocity - AngularVelocity));
        AngularVelocity *= (1 - Damping);
        AngleOffset += int(AngularVelocity * DeltaTime);
        AngleOffset = AngleOffset & 65535;
        // End:0x119
        if(Tire.MountOrigin.Y < 0)
        {
            AngleSign = -1;            
        }
        else
        {
            AngleSign = 1;
        }
        DisableDesiredRotation_Roll((Rot(AngleOffset * AngleSign, 32768, 0) >> Rot(0, Tire.MountAngles.Yaw, Tire.MountAngles.Roll)) >> Tire.MountParent.Rotation);
    }
    return;
}

defaultproperties
{
    SpinnerPositiveSpringStrength=0.96
    SpinnerNegativeSpringStrength=0.01
    SpinnerNegativeDamping=0.015
    bNoDamage=true
    bCollisionAssumeValid=true
    bTickOnlyRecent=false
    bTickOnlyNearby=true
    IndependentRotation=true
    bCollideActors=false
}