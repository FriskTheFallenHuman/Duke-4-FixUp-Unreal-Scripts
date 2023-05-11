/*******************************************************************************
 * Veh_RCCar_NativeBase generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Veh_RCCar_NativeBase extends Veh_CarTemplate
    native
    collapsecategories;

var VehicleSpecialPartBase Suspension;
var transient bool bInitialized;
var const editconst transient nontrans pointer pBone_Front_L_Wheel;
var const editconst transient nontrans pointer pBone_Front_L_Spring;
var const editconst transient nontrans pointer pBone_Front_R_Wheel;
var const editconst transient nontrans pointer pBone_Front_R_Spring;
var const editconst transient nontrans pointer pBone_Rear_L_Wheel;
var const editconst transient nontrans pointer pBone_Rear_L_Spring;
var const editconst transient nontrans pointer pBone_Rear_R_Wheel;
var const editconst transient nontrans pointer pBone_Rear_R_Spring;

// Export UVeh_RCCar_NativeBase::execUpdateSuspension(FFrame&, void* const)
native final function UpdateSuspension();
