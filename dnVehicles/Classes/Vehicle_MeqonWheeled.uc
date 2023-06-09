/*******************************************************************************
 * Vehicle_MeqonWheeled generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Vehicle_MeqonWheeled extends VehicleBase
    native
    collapsecategories
    dependson(PhysicsAction_RightVehicle)
    dependson(VehicleComponent)
    dependson(VGearbox);

var(Vehicle) float NeutralSteeringAdjust;
var(Vehicle) Rotator SteerMaxAngles;
var(Vehicle) float BrakeTorque;
var(Vehicle) float NeutralBrakeTorque;
var(Vehicle) float NoDriverBrakeTorque;
var(Vehicle) float HandbrakeTorque;
var(Vehicle) float VehicleMinNeutralTransitionTime;
var(Vehicle) float MinDirectionalChangeSteerAlpha;
var(Vehicle) const export array<export VehicleComponent> VehicleComponents;
var array<VWheel> VWheels;
var(Vehicle) const float KLinearToleranceScale;
var(Vehicle) const float KAngularToleranceScale;
var(Vehicle) const int KMaximumIterations;
var(Vehicle) name EnableDriveTrainTag;
var(Vehicle) name DisableDriveTrainTag;
var(Vehicle) noexport float LowFriction "Low friction setting used when being driven or when being righted.";
var(Vehicle) noexport float HighFriction "High friction setting used when not being driven or when upside-down.";
var() noexport float LowSpeed "Absolute value of speed that we consider to be our low speed.";
var() noexport float LowSpeedBrakeTorque "Additional brake torque to apply at low vehicle speeds.";
var float LowSpeedPct;
var() noexport float HighSpeed "Absolute value of high speed";
var() float HighSpeedSteerPct;
var float HandbrakeActive;
var float SavedDisableThreshold;
var float AverageSteerAngle;
var float SteerAlpha;
var() class<PhysicsMaterial> WheelMaterialType;
var() Engine.Object.EPhysicsMassType WheelMassType;
var() noexport float WheelSkidMinTime "Car must be skidding for this much time before the sound will start playing";
var transient int WheelSkidDBIndex;
var const editconst transient nontrans pointer WheelSkidOverrideEntry;
var transient float WheelSkidStartTime;
var(Vehicle_SlopeSlip) noexport bool bAdjustWheelFrictionForSlope "If true, wheel friction will be adjusted based on the slope of the surface, so that steeper slope can give less friction";
var(Vehicle_SlopeSlip) noexport float FullTractionAngle "When using bAdjustWheelFrictionForSlope, this is the max angle of incline (in degrees) to provide full traction.  Acceptable values are 0 - 90.  Should be smaller than NoTractionAngle.";
var(Vehicle_SlopeSlip) noexport float NoTractionAngle "When using bAdjustWheelFrictionForSlope, this is the angle of incline (in degrees) when there will be no traction.  Acceptable values are 0 - 90.  Should be larger than FullTractionAngle.";

simulated event PreBeginPlay()
{
    super(dnDecoration).PreBeginPlay();
    FullTractionAngle = FClamp(FullTractionAngle, 0, 90);
    NoTractionAngle = FClamp(NoTractionAngle, FullTractionAngle, 90);
    KAddImpulse(HighFriction);
    return;
}

simulated event PreGameInit()
{
    local int i, WheelIndex;
    local VWheel Wheel;
    local VehicleSpecialPart_TireEx Tire;

    super(dnDecoration).PreGameInit();
    i = string(VehicleComponents) - 1;
    J0x15:

    // End:0x3B [Loop If]
    if(i >= 0)
    {
        MaybeInitializeVehicleComponent(VehicleComponents[i]);
        -- i;
        // [Loop Continue]
        goto J0x15;
    }
    WheelIndex = string(VehicleParts) - 1;
    i = string(VWheels) - 1;
    J0x59:

    // End:0x108 [Loop If]
    if(i >= 0)
    {
        Wheel = VWheels[i];
        // End:0x8D
        if(! Wheel.bHasTireActor)
        {
            // [Explicit Continue]
            goto J0xFE;
        }
        Tire = none;
        J0x94:

        // End:0xCD [Loop If]
        if((WheelIndex >= 0) && Tire != none)
        {
            Tire = VehicleSpecialPart_TireEx(VehicleParts[-- WheelIndex].Actor);
            // [Loop Continue]
            goto J0x94;
        }
        // End:0xDC
        if(Tire != none)
        {
            // [Explicit Break]
            goto J0x108;
        }
        Tire.UpdateFromVWheel(Wheel);
        Tire.SetMass();
        J0xFE:

        -- i;
        // [Loop Continue]
        goto J0x59;
    }
    J0x108:

    return;
}

simulated event PostVerifySelf()
{
    super(dnDecoration).PostVerifySelf();
    GetPointRegion('EnableDriveTrain', EnableDriveTrainTag);
    GetPointRegion('DisableDriveTrain', DisableDriveTrainTag);
    return;
}

function TriggerFunc_EnableDriveTrain()
{
    local int i;
    local VGearbox Gearbox;

    i = string(VehicleComponents) - 1;
    J0x0F:

    // End:0x65 [Loop If]
    if(i >= 0)
    {
        Gearbox = VGearbox(VehicleComponents[i]);
        // End:0x5B
        if(Gearbox == none)
        {
            Gearbox.MaximumClutchTorque = Gearbox.default.MaximumClutchTorque;
        }
        -- i;
        // [Loop Continue]
        goto J0x0F;
    }
    return;
}

function TriggerFunc_DisableDriveTrain()
{
    local int i;
    local VGearbox Gearbox;

    i = string(VehicleComponents) - 1;
    J0x0F:

    // End:0x5B [Loop If]
    if(i >= 0)
    {
        Gearbox = VGearbox(VehicleComponents[i]);
        // End:0x51
        if(Gearbox == none)
        {
            Gearbox.MaximumClutchTorque = 0;
        }
        -- i;
        // [Loop Continue]
        goto J0x0F;
    }
    return;
}

simulated function AddVehicleComponent(VehicleComponent Component)
{
    local VWheel Wheel;
    local int i;

    Log(Component == none);
    i = string(VehicleComponents) - 1;
    J0x1B:

    // End:0x49 [Loop If]
    if(i >= 0)
    {
        // End:0x3F
        if(VehicleComponents[i] != Component)
        {
            // [Explicit Break]
            goto J0x49;
        }
        -- i;
        // [Loop Continue]
        goto J0x1B;
    }
    J0x49:

    // End:0x6B
    if(i == -1)
    {
        VehicleComponents[VehicleComponents.Add(1)] = Component;
    }
    Wheel = VWheel(Component);
    // End:0xE6
    if(Wheel == none)
    {
        i = string(VWheels) - 1;
        J0x96:

        // End:0xC4 [Loop If]
        if(i >= 0)
        {
            // End:0xBA
            if(VWheels[i] != Wheel)
            {
                // [Explicit Break]
                goto J0xC4;
            }
            -- i;
            // [Loop Continue]
            goto J0x96;
        }
        J0xC4:

        // End:0xE6
        if(i == -1)
        {
            VWheels[VWheels.Add(1)] = Wheel;
        }
    }
    return;
}

simulated event DriverEntered(VehicleSpaceBase Space)
{
    super.DriverEntered(Space);
    KAddImpulse(LowFriction);
    KGetCollidingActors();
    return;
}

simulated event DriverLeft(VehicleSpaceBase Space)
{
    super.DriverLeft(Space);
    KAddImpulse(HighFriction);
    return;
}

simulated function Heading_Adjust(float DeltaTime, float TurnPercent)
{
    local VWheel Wheel;
    local int i;
    local float DesiredAngle, diff;

    // End:0x51
    if(((SteerAlpha < - MinDirectionalChangeSteerAlpha) && TurnPercent > 0) || (SteerAlpha > MinDirectionalChangeSteerAlpha) && TurnPercent < 0)
    {
        Heading_Neutral(DeltaTime);
        return;
    }
    i = string(VWheels) - 1;
    J0x60:

    // End:0x191 [Loop If]
    if(i >= 0)
    {
        Wheel = VWheels[i];
        // End:0xCD
        if(((HighSpeed != float(0)) && HighSpeedSteerPct != float(0)) && Abs(oForwardVelocity) > HighSpeed)
        {
            DesiredAngle = Wheel.WheelProps.SteerRatio * HighSpeedSteerPct;            
        }
        else
        {
            DesiredAngle = Wheel.WheelProps.SteerRatio;
        }
        DesiredAngle *= (TurnPercent * float(SteerMaxAngles.Yaw));
        diff = DesiredAngle - Wheel.CurrentSteeringAngle;
        // End:0x154
        if(diff < 0)
        {
            Wheel.CurrentSteeringAngle += FMax(- ControlStiffness * DeltaTime, diff);
            // [Explicit Continue]
            goto J0x187;
        }
        // End:0x187
        if(diff > 0)
        {
            Wheel.CurrentSteeringAngle += FMin(ControlStiffness * DeltaTime, diff);
        }
        J0x187:

        -- i;
        // [Loop Continue]
        goto J0x60;
    }
    UpdateAverageSteeringAngle();
    return;
}

// Export UVehicle_MeqonWheeled::execHeading_NeutralNative(FFrame&, void* const)
native function Heading_NeutralNative(float DeltaTime);

simulated function Heading_Neutral(float DeltaTime)
{
    Heading_NeutralNative(DeltaTime);
    return;
}

// Export UVehicle_MeqonWheeled::execUpdateAverageSteeringAngle(FFrame&, void* const)
native function UpdateAverageSteeringAngle();

simulated function Accelerator_Adjust(float DeltaTime, float RelativeAcceleration, Pawn Driver)
{
    local VehicleComponent Component;
    local int i;

    KGetCollidingActors();
    LowSpeedPct = 0;
    i = string(VehicleComponents) - 1;
    J0x1D:

    // End:0x8F [Loop If]
    if(i >= 0)
    {
        Component = VehicleComponents[i];
        // End:0x85
        if(((Component == none) && Component.bCaresAboutAcceleration) && Component.bComponentInitialized)
        {
            Component.AcceleratorAdjust(self, RelativeAcceleration);
        }
        -- i;
        // [Loop Continue]
        goto J0x1D;
    }
    return;
}

// Export UVehicle_MeqonWheeled::execAccelerator_NeutralNative(FFrame&, void* const)
native function Accelerator_NeutralNative(float DeltaTime, optional bool bNoDriver);

simulated function Accelerator_Neutral(float DeltaTime, optional bool bNoDriver)
{
    Accelerator_NeutralNative(DeltaTime, bNoDriver);
    return;
}

simulated event bool CanAccelerateForwards()
{
    return (int(oVehicleDirection) == int(0)) || (int(oVehicleDirection) == int(1)) && oVehicleNeutralTimer >= VehicleMinNeutralTransitionTime;
    return;
}

simulated event bool CanAccelerateReverse()
{
    return (int(oVehicleDirection) == int(2)) || (int(oVehicleDirection) == int(1)) && oVehicleNeutralTimer >= VehicleMinNeutralTransitionTime;
    return;
}

simulated function HandBrakeEnabled()
{
    super.HandBrakeEnabled();
    KGetCollidingActors();
    HandbrakeActive = 1;
    return;
}

simulated function HandBrakeDisabled()
{
    super.HandBrakeDisabled();
    KGetCollidingActors();
    HandbrakeActive = 0;
    return;
}

simulated function bool IsHandbrakeEnabled()
{
    return HandbrakeActive > 0;
    return;
}

final simulated function MaybeInitializeVehicleComponent(VehicleComponent Component)
{
    // End:0x28
    if(Component == none)
    {
        Component.AttachToMeqonVehicle(self);
        AddVehicleComponent(Component);
    }
    return;
}

function StartFlip(Vector NewFlipAxis)
{
    local PhysicsAction_RightVehicle Action;

    KAddImpulse(LowFriction);
    SavedDisableThreshold = EnableDisableThreshold;
    KRemoveBelowNamed(0);
    Action = PhysicsAction_RightVehicle(ProcessSpawnActorPrefab(class'PhysicsAction_RightVehicle', true));
    Action.FlipRotationAxis = NewFlipAxis << Rot(Rotation.Pitch, Rotation.Yaw, 0);
    Action.FlipTorque = FlipTorque;
    Action.FlipLift = FlipLift;
    Action.FlipTimeLeft = FlipTotalTime;
    KGetCollidingActors();
    TraceFire(FlipTotalTime, false, 'FlipTimerEnded');
    return;
}

final function FlipTimerEnded()
{
    // End:0x26
    if(((VehicleGetDriver()) != none) || oUpness < FlipThreshold)
    {
        KAddImpulse(HighFriction);
    }
    // End:0x3D
    if(EnableDisableThreshold == 0)
    {
        KRemoveBelowNamed(SavedDisableThreshold);
    }
    return;
}

simulated event bool HasGroundContact()
{
    local int i;

    i = string(VWheels) - 1;
    J0x0F:

    // End:0x3F [Loop If]
    if(i >= 0)
    {
        // End:0x35
        if(VWheels[i].bOnGround)
        {
            return true;
        }
        -- i;
        // [Loop Continue]
        goto J0x0F;
    }
    return false;
    return;
}

defaultproperties
{
    NeutralSteeringAdjust=0.001
    SteerMaxAngles=(Pitch=0,Yaw=8192,Roll=0)
    BrakeTorque=5000000
    NeutralBrakeTorque=50000
    NoDriverBrakeTorque=2000000
    VehicleMinNeutralTransitionTime=0.25
    MinDirectionalChangeSteerAlpha=0.175
    KLinearToleranceScale=1
    KAngularToleranceScale=1
    KMaximumIterations=-1
    LowFriction=0.1
    HighFriction=0.65
    LowSpeed=5
    LowSpeedBrakeTorque=1000000
    WheelMaterialType='dnMaterial.dnPhysicsMaterial_Rubber'
    WheelMassType=1
    WheelSkidMinTime=0.07
    FullTractionAngle=30
    NoTractionAngle=50
    ControlType=1
    Physics=18
    bBlockKarma=true
    TransientSoundVolume=1
    TransientSoundRadius=1024
    TransientSoundInnerRadius=512
}