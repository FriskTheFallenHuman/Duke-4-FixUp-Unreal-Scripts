/*******************************************************************************
 * PhysicsAction_ConstLinearVel generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PhysicsAction_ConstLinearVel extends PhysicsAction
    native
    exportstructs
    hidecategories(Object);

cpptext
{
// Stripped
}

var const transient nontrans int MyConstraints[3];
var Vector ConstraintAxis[3];
var float DesiredSpeed;
var float Strength;

function Setup(Vector DesiredVel, float MaxStrength)
{
    DesiredSpeed = VSize(DesiredVel);
    Strength = MaxStrength;
    ConstraintAxis[0] = Normal(- DesiredVel);
    ConstraintAxis[1].Y = - ConstraintAxis[0].X;
    ConstraintAxis[1].Z = ConstraintAxis[0].Y;
    ConstraintAxis[1].X = ConstraintAxis[0].Z;
    ConstraintAxis[1] = Normal(ConstraintAxis[1] - (ConstraintAxis[0] * (ConstraintAxis[1] Dot ConstraintAxis[0])));
    ConstraintAxis[2] = ConstraintAxis[1] Cross ConstraintAxis[0];
    return;
}