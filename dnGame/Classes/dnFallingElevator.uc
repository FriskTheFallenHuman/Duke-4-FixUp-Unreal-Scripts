/*******************************************************************************
 * dnFallingElevator generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnFallingElevator extends dnDecoration
    collapsecategories;

var() noexport Vector GravityAcceleration "The rate that the elevator accelerates when brakes are not applied.";
var() noexport float GravityMaximumVelocity "The maximum downward velocity of the elevator.";
var() noexport float GravityMaximumVelocityAssign "When past the GravityMaximumVelocity, hard-assign this velocity.";
var() noexport bool bEnableGravityVelocityClamp "Use GravityClampVelocity?";
var() Vector GravityClampVelocityMin;
var() noexport Vector GravityClampVelocityMax "No individual component of the velocity while freefalling will be allowed to go over each individual component of this vector.";
var() noexport Vector BrakingAcceleration "The acceleration applied due to braking.";
var() noexport float BrakingMinimumVelocity "The slowest velocity which the brakes will slow the elevator down to.";
var() noexport float BrakingMinimumVelocityAssign "When past the BrakingMinimumVelocity, hard-assign this velocity.";
var() noexport bool bEnableBrakingVelocityClamp "Use BrakingClampVelocity?";
var() noexport Vector BrakingClampVelocityMin "No individual component of the velocity while braking will be allowed to go under each individual component of this vector.";
var() Vector BrakingClampVelocityMax;
var() noexport name ElevatorEnableTag "When this tag is triggered, start this elevator simulation.";
var() noexport name ElevatorDisableTag "When this tag is triggered, stop this elevator simulation.";
var() noexport name BrakeReleaseTag "When this tag is triggered by the mapper, the elevator assumes the brakes are not being applied, until the BrakeApplyTag is triggered.";
var() noexport name BrakeApplyTag "When this tag is triggered, the elevator assumes the player is applying the brakes, until the BrakeReleaseTag is triggered.";
var() noexport float LandingMaximumVelocity "The fastest the elevator can be moving when it hits the bottom floor, to be considered a 'safe' landing.";
var() noexport name LandingSafeEvent "Event triggered when the elevator lands safely.";
var() noexport name LandingDeathEvent "Event triggered when the elevator exceeds the LandingMaximumVelocity.";
var() noexport name ElevatorStopsMovingEvent "Event triggered when the elevator has stopped moving. Won't be fired until after the elevator starts moving.";
var bool bBrakesEnabled;
var bool bElevatorDone;
var bool bWasSafeSpeedLastFrame;
var bool bWasStoppedLastFrame;

function PostBeginPlay()
{
    super.PostBeginPlay();
    GetPointRegion('Enable', ElevatorEnableTag);
    GetPointRegion('Disable', ElevatorDisableTag);
    GetPointRegion('ReleaseBrake', BrakeReleaseTag);
    GetPointRegion('ApplyBrake', BrakeApplyTag);
    return;
}

final simulated function TriggerFunc_Enable()
{
    // End:0x0B
    if(bElevatorDone)
    {
        return;
    }
    ElevatorEnable();
    return;
}

final simulated function TriggerFunc_Disable()
{
    // End:0x0B
    if(bElevatorDone)
    {
        return;
    }
    ElevatorDisable();
    return;
}

final simulated function TriggerFunc_ReleaseBrake()
{
    // End:0x0B
    if(bElevatorDone)
    {
        return;
    }
    BrakesRelease();
    return;
}

final simulated function TriggerFunc_ApplyBrake()
{
    // End:0x0B
    if(bElevatorDone)
    {
        return;
    }
    BrakesApply();
    return;
}

final function BrakesRelease()
{
    bBrakesEnabled = false;
    Acceleration = GravityAcceleration;
    return;
}

final function BrakesApply()
{
    bBrakesEnabled = true;
    Acceleration = BrakingAcceleration;
    return;
}

final function ElevatorEnable()
{
    bNoNativeTick = false;
    Disable('Tick');
    Velocity.X = 0;
    Velocity.Y = 0;
    BrakesRelease();
    return;
}

final function ElevatorDisable()
{
    bNoNativeTick = true;
    GetPropertyText('Tick');
    Velocity = Vect(0, 0, 0);
    Acceleration = Vect(0, 0, 0);
    bElevatorDone = true;
    return;
}

final function PassedSafeVelocityThreshold()
{
    GlobalTrigger(LandingSafeEvent, none, self);
    return;
}

final function PassedDeathVelocityThreshold()
{
    GlobalTrigger(LandingDeathEvent, none, self);
    return;
}

function Tick(float DeltaTime)
{
    local float CurrentVelocityScalarSq;

    super(Actor).Tick(DeltaTime);
    CurrentVelocityScalarSq = VSizeSquared(Velocity);
    // End:0x94
    if(bBrakesEnabled)
    {
        // End:0x62
        if(CurrentVelocityScalarSq < (BrakingMinimumVelocity * BrakingMinimumVelocity))
        {
            Velocity = Normal(Velocity) * BrakingMinimumVelocityAssign;
            Acceleration = Vect(0, 0, 0);
        }
        // End:0x91
        if(bEnableBrakingVelocityClamp)
        {
            Velocity = VMax(Velocity, BrakingClampVelocityMin);
            Velocity = VMin(Velocity, BrakingClampVelocityMax);
        }        
    }
    else
    {
        // End:0xD5
        if(CurrentVelocityScalarSq > (GravityMaximumVelocity * GravityMaximumVelocity))
        {
            Velocity = Normal(Velocity) * GravityMaximumVelocityAssign;
            Acceleration = Vect(0, 0, 0);
        }
        // End:0x104
        if(bEnableGravityVelocityClamp)
        {
            Velocity = VMax(Velocity, GravityClampVelocityMin);
            Velocity = VMin(Velocity, GravityClampVelocityMax);
        }
    }
    CurrentVelocityScalarSq = VSizeSquared(Velocity);
    // End:0x141
    if(CurrentVelocityScalarSq > (LandingMaximumVelocity * LandingMaximumVelocity))
    {
        // End:0x13E
        if(bWasSafeSpeedLastFrame)
        {
            bWasSafeSpeedLastFrame = false;
            PassedDeathVelocityThreshold();
        }        
    }
    else
    {
        // End:0x15A
        if(! bWasSafeSpeedLastFrame)
        {
            bWasSafeSpeedLastFrame = true;
            PassedSafeVelocityThreshold();
        }
    }
    // End:0x17E
    if(Velocity.Z > 0)
    {
        Velocity.Z = 0;
    }
    // End:0x1B7
    if(CurrentVelocityScalarSq < (BrakingMinimumVelocity * BrakingMinimumVelocity))
    {
        // End:0x1B4
        if(! bWasStoppedLastFrame)
        {
            bWasStoppedLastFrame = true;
            GlobalTrigger(ElevatorStopsMovingEvent, none, self);
        }        
    }
    else
    {
        bWasStoppedLastFrame = false;
    }
    return;
}

defaultproperties
{
    GravityAcceleration=(X=0,Y=0,Z=-425)
    GravityMaximumVelocity=900
    GravityMaximumVelocityAssign=900
    BrakingAcceleration=(X=0,Y=0,Z=210)
    BrakingMinimumVelocity=2
    bWasSafeSpeedLastFrame=true
    bWasStoppedLastFrame=true
    Physics=6
    bNoNativeTick=true
}