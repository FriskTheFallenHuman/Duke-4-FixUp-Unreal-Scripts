/*******************************************************************************
 * VWheel generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class VWheel extends VAxle
    native
    exportstructs;

var const transient int InternalWheelMaterial;
var() const Vector LocationOffset;
var() const Rotator RotationOffset;
var bool bFlipWheel;
var bool bHasTireActor;
var() SVehiclePhysicsWheelProperties WheelProps;
var float CurrentSteeringAngle;
var float BrakeTorque;
var float AutoBrakeTorque;
var const float CurrentSpringLength;
var const bool bOnGround;
var const bool bWasOnGround;
var const class<PhysicsMaterial> GroundMaterialType;

event ContactedGround()
{
    return;
}

event UncontactedGround()
{
    return;
}

// Export UVWheel::execSetWheelOffsets(FFrame&, void* const)
native final function SetWheelOffsets(Vehicle_MeqonWheeled Vehicle, optional Vector NewLocationOffset, optional Rotator NewRotationOffset);

// Export UVWheel::execGetHandbrakeBrakeTorque(FFrame&, void* const)
native simulated function float GetHandbrakeBrakeTorque(Vehicle_MeqonWheeled Vehicle);

defaultproperties
{
    bCaresAboutAcceleration=true
}