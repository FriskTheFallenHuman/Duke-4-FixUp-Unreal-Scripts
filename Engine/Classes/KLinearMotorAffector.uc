/*******************************************************************************
 * KLinearMotorAffector generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KLinearMotorAffector extends KAffector
    native
    collapsecategories
    notplaceable
    hidecategories(Collision,HeatVision,Interactivity,Karma,KarmaCollision);

cpptext
{
// Stripped
}

enum ELinearMotorAxisMode
{
    LINMOTOR_Relative,
    LINMOTOR_Implicit,
    LINMOTOR_Absolute
};

var(KAffector) const noexport KLinearMotorAffector.ELinearMotorAxisMode MotorAxisMode "Should the motor axis be considered relative to the first constrained actor, the second constrained actor, or should it always be pointing directly between the two objects?";
var(KAffector) const noexport float DesiredVelocity "How fast we want this object to travel along the axis represented by this affector.";
var(KAffector) const noexport float MaximumForce "The maximum force we can apply in pursuit of our DesiredVelocity.";

// Export UKLinearMotorAffector::execSetMotorAxisMode(FFrame&, void* const)
native(1112) final function SetMotorAxisMode(KLinearMotorAffector.ELinearMotorAxisMode NewMotorAxisMode);

// Export UKLinearMotorAffector::execSetDesiredVelocity(FFrame&, void* const)
native(1113) final function SetDesiredVelocity(float NewDesiredVelocity);

// Export UKLinearMotorAffector::execSetMaximumForce(FFrame&, void* const)
native(1114) final function SetMaximumForce(float NewMaximumForce);

defaultproperties
{
    MaximumForce=100000
}