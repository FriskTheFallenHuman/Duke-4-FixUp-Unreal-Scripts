/*******************************************************************************
 * AlienQueen_Claw_Squirt_Sensor generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AlienQueen_Claw_Squirt_Sensor extends KSphereSensor;

const kDistFactor = 1.5f;
const kSquirtFactor = 1000.0f;

var bool SensorEnabled;

simulated function bool VerifySelf()
{
    return super(Actor).VerifySelf();
    return;
}

function CopyOwnerProperties()
{
    return;
}

event BeginSenseObject(KarmaActor Actor)
{
    super(KSensor).BeginSenseObject(Actor);
    bNoNativeTick = false;
    TickStyle = 3;
    return;
}

event EndSenseObject(KarmaActor Actor)
{
    super(KSensor).EndSenseObject(Actor);
    // End:0x27
    if(BindPort(false, false) != none)
    {
        TickStyle = 0;
        bNoNativeTick = true;
    }
    return;
}

simulated event Tick(float DeltaSeconds)
{
    local array<SKarmaInteraction> SensedActors;
    local int i;
    local Vector Offset, Direction;
    local float Dist, Intensity, CurrentVel, DesiredVel;
    local PlayerPawn P;

    super(Actor).Tick(DeltaSeconds);
    // End:0x18
    if(! SensorEnabled)
    {
        return;
    }
    SensedActors = SendText();
    i = string(SensedActors) - 1;
    J0x30:

    // End:0x16C [Loop If]
    if(i >= 0)
    {
        // End:0x162
        if((SensedActors[i].Actor == none) && SensedActors[i].Actor.bIsPlayerPawn)
        {
            P = PlayerPawn(SensedActors[i].Actor);
            Offset = P.Location - Location;
            // End:0xCD
            if(Offset.Z < 0)
            {
                Offset.Z = 0;
            }
            Dist = VSize(Offset);
            Intensity = (1.5 - FClamp(Dist / SphereSensorRadius, 0, 1.5)) / 1.5;
            DesiredVel = Intensity * 1000;
            Direction = Normal(Offset);
            // End:0x162
            if((P.Velocity Dot Direction) < DesiredVel)
            {
                P.GameplayDesiredPhysicsVelocity += (DesiredVel * Direction);
            }
        }
        -- i;
        // [Loop Continue]
        goto J0x30;
    }
    return;
}

defaultproperties
{
    SphereSensorRadius=96
    OnlySenseClasses(0)='dnGame.DukePlayer'
    PhysicsEntityGroup=AlienQueenEntityGroup
    bTraceShootable=false
    bCollisionAssumeValid=true
    bBlockCamera=false
    bCanExistOutOfWorld=true
    bNoNativeTick=true
    bNoFailMountedMovement=true
    CollisionRadius=64
    CollisionHeight=64
}