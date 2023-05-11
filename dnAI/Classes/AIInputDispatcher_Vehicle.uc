/*******************************************************************************
 * AIInputDispatcher_Vehicle generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AIInputDispatcher_Vehicle extends AIInputDispatcher_Auto
    native
    collapsecategories
    hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

var() noexport bool bUsePathing "If true, AI will try to use AI navigation to drive.";
var() noexport bool bDebugVehicleAI "Debug this vehicle AI?";
var() noexport bool bPowerSlider "Can powerslide.";
var() noexport float DestTolerance "Minimum distance from destination required before deciding we're there.";
var() noexport float PowerSlideStopDelay "Time before releasing handbrake after the AI decides to stop applying it.";
var() noexport float PowerSlideMinVelocity "Minimum forward velocity required to power slide.";
var() noexport float StraightMinDot "The minimum dot product of my direction and the direction to my target to consider 'straight enough'.";
var VehicleSpaceBase DriverSeat;
var VehicleBase Vehicle;
var float PowerSlideStopTime;
var float DestToleranceSquared;
var bool bFinalDest;
var bool bNavCached;
var Vector TargetPos;
var Vector LastTargetPos;
var Vector LastGoalPos;

event Tick(float DeltaSeconds)
{
    // End:0x22
    if((MyActor != none) || Vehicle != none)
    {
        EndDispatching();
        return;
    }
    super.Tick(DeltaSeconds);
    // End:0x81
    if(MyActor.SetGoal(21, true, false))
    {
        LastTargetPos = TargetPos;
        LastGoalPos = MyActor.GoalPos;
        TickDriving(MyActor.GoalPos, DeltaSeconds);        
    }
    else
    {
        LastGoalPos = Vehicle.Location;
    }
    return;
}

simulated function TickDriving(Vector Dest, float DeltaSeconds)
{
    local Vector Helper, vFwd, vRight, vDest;
    local float FwdDotDest, RightDotDest, DistSq;

    DestToleranceSquared = DestTolerance * DestTolerance;
    // End:0xD5
    if(Vehicle.obIsFlipped && Vehicle.bAIHandleFlipped)
    {
        DriverSeat.Throttle = 0;
        DriverSeat.LeftRightHeading = 0;
        Handbrake(false);
        MyActor.Input(4, 1);
        MyActor.Input(5, 1);
        // End:0xD3
        if(! Vehicle.IsCurrentlyFlipping())
        {
            Vehicle.StartFlip(Vector(Rot(0, 16384, 0) >> Vehicle.Rotation));
        }
        return;
    }
    Helper = Vehicle.Location;
    Dest.Z = Helper.Z;
    vFwd = Vect(1, 0, 0) >> Vehicle.Rotation;
    vRight = Vect(0, 1, 0) >> Vehicle.Rotation;
    vDest = Normal(Dest - Helper);
    FwdDotDest = vFwd Dot vDest;
    RightDotDest = vRight Dot vDest;
    // End:0x255
    if(bDebugVehicleAI)
    {
        GetVisibilityPoint(Dest, NewColorBytes(0, 255, 0, 255), 0);
        // End:0x209
        if(RightDotDest > 0)
        {
            IsSoundPlayingOnSlot(Vehicle.Location, Vect(0, 1, 0) >> Vehicle.Rotation, NewColorBytes(255, 0, 0, 255), 20, 0);            
        }
        else
        {
            IsSoundPlayingOnSlot(Vehicle.Location, Vect(0, -1, 0) >> Vehicle.Rotation, NewColorBytes(255, 0, 0, 255), 20, 0);
        }
    }
    DistSq = VSizeSquared(Dest - Helper);
    AdjustThrottle(DistSq, FwdDotDest, RightDotDest, DeltaSeconds);
    AdjustHeading(DistSq, vFwd, vRight, FwdDotDest, RightDotDest, DeltaSeconds);
    return;
}

simulated function AdjustHeading(float DistSq, Vector vFwd, Vector vRight, float FwdDotDest, float RightDotDest, float DeltaSeconds)
{
    local bool bShouldHandbrake;
    local float Alpha;

    // End:0x174
    if((DistSq > DestToleranceSquared) && FwdDotDest < StraightMinDot)
    {
        // End:0x8C
        if(FwdDotDest > 0)
        {
            Alpha = FClamp(1 - FwdDotDest, 0, 1);
            // End:0x74
            if(RightDotDest > 0)
            {
                DriverSeat.LeftRightHeading = -1;                
            }
            else
            {
                DriverSeat.LeftRightHeading = 1;
            }            
        }
        else
        {
            // End:0x117
            if(((int(Vehicle.oVehicleDirection) == int(0)) && FwdDotDest < 0.717) && Vehicle.oForwardVelocity >= PowerSlideMinVelocity)
            {
                bShouldHandbrake = true;
                // End:0xFF
                if(RightDotDest > 0)
                {
                    DriverSeat.LeftRightHeading = -1;                    
                }
                else
                {
                    DriverSeat.LeftRightHeading = 1;
                }                
            }
            else
            {
                Alpha = FClamp(1 + FwdDotDest, 0, 1);
                // End:0x15C
                if(RightDotDest > 0)
                {
                    DriverSeat.LeftRightHeading = 1;                    
                }
                else
                {
                    DriverSeat.LeftRightHeading = -1;
                }
            }
        }        
    }
    else
    {
        DriverSeat.LeftRightHeading = 0;
    }
    Handbrake(bShouldHandbrake);
    return;
}

simulated function AdjustThrottle(float DistSq, float FwdDotDest, float RightDotDest, float DeltaSeconds)
{
    // End:0x87
    if(DistSq < DestToleranceSquared)
    {
        // End:0x3F
        if(int(Vehicle.oVehicleDirection) == int(0))
        {
            DriverSeat.Throttle = -1;            
        }
        else
        {
            // End:0x6F
            if(int(Vehicle.oVehicleDirection) == int(2))
            {
                DriverSeat.Throttle = 1;                
            }
            else
            {
                DriverSeat.Throttle = 0;
            }
        }        
    }
    else
    {
        // End:0x12E
        if((FwdDotDest > 0) || (int(Vehicle.oVehicleDirection) == int(0)) && FwdDotDest > -0.717)
        {
            // End:0x116
            if(bDebugVehicleAI)
            {
                IsSoundPlayingOnSlot(Vehicle.Location, Vect(1, 0, 0) >> Vehicle.Rotation, NewColorBytes(0, 255, 0, 255), 20, 0);
            }
            DriverSeat.Throttle = 1;            
        }
        else
        {
            // End:0x183
            if(bDebugVehicleAI)
            {
                IsSoundPlayingOnSlot(Vehicle.Location, Vect(-1, 0, 0) >> Vehicle.Rotation, NewColorBytes(0, 255, 0, 255), 20, 0);
            }
            DriverSeat.Throttle = -1;
        }
    }
    return;
}

final function Handbrake(bool bStart)
{
    local bool bHandbrake;

    // End:0x21
    if(! bPowerSlider)
    {
        MyActor.Input(6, 1);
        return;
    }
    // End:0x46
    if(bStart)
    {
        PowerSlideStopTime = Level.GameTimeSeconds + PowerSlideStopDelay;
    }
    bHandbrake = PowerSlideStopTime >= Level.GameTimeSeconds;
    // End:0xB2
    if(DriverSeat.bHandbrake != bHandbrake)
    {
        // End:0x9E
        if(bStart)
        {
            MyActor.Input(6, 2);            
        }
        else
        {
            MyActor.Input(6, 1);
        }
    }
    return;
}

function StartDispatching()
{
    local Vector pivot, Center;

    super.StartDispatching();
    DriverSeat = VehicleSpaceBase(MyActor.InteractiveDecoration);
    // End:0x42
    if(DriverSeat == none)
    {
        Vehicle = DriverSeat.GetVehicle();
    }
    return;
}

function EndDispatching()
{
    super.EndDispatching();
    // End:0x22
    if(DriverSeat == none)
    {
        DriverSeat.ClearAllInput();
    }
    DriverSeat = none;
    Vehicle = none;
    return;
}

defaultproperties
{
    bUsePathing=true
    bPowerSlider=true
    DestTolerance=5
    PowerSlideStopDelay=1
    PowerSlideMinVelocity=150
    StraightMinDot=0.95
}