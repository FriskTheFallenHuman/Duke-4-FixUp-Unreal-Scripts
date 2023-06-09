/*******************************************************************************
 * PhysicsAction_Forklift generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PhysicsAction_Forklift extends PhysicsAction
    native
    exportstructs
    hidecategories(Object);

cpptext
{
// Stripped
}

var bool bMoving;
var bool bFlipping;
var KarmaActor Fork;
var KarmaActor RearWeight;
var KFixed ForkFixedConstraint;
var KLinear ForkLinearConstraint;
var KLinearJointLimit ForkLimit;
var KLinearMotorAffector ForkMotor;
