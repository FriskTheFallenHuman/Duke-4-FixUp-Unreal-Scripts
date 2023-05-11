/*******************************************************************************
 * DoorMoverEx_Sliding generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DoorMoverEx_Sliding extends DoorMoverEx_Sliding_NativeBase
    collapsecategories
    hidecategories(Brush,Networking,LightColor,HeatVision,Hackflags,Filter);

var() noexport float SlideRate "Units per second.";
var() noexport float SlideTime "Optional time parameter.  Overrides SlideRate when > 0.0.";
var Vector SlideOffset;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        SlideOffset, SlideRate;
}

simulated function Used(Actor Other, Pawn EventInstigator)
{
    // End:0x42
    if((EventInstigator.bIsPlayerPawn && ! PassUseToOwner()) && ! bLocked)
    {
        EventInstigator.HandQuickAction('HandQuickAction_Door_Push');
    }
    super(DoorMoverEx).Used(Other, EventInstigator);
    return;
}

simulated function InitDoor()
{
    SlideOffset = GetSlideDir();
    // End:0x29
    if(int(SlideDir) != int(2))
    {
        SlideOffset *= SlideDistance;        
    }
    else
    {
        SlideDistance = VSize(SlideOffset);
    }
    // End:0x57
    if(SlideTime > 0)
    {
        SlideRate = SlideDistance / SlideTime;
    }
    super(DoorMoverEx).InitDoor();
    return;
}

simulated function OpenDoor(optional Actor Other, optional bool bKicked)
{
    DetonateAttachedMines();
    SlideTo(SlideOffset, SlideRate, 'DoorOpenCallback');
    super(DoorMoverEx).OpenDoor(Other, bKicked);
    return;
}

simulated function CloseDoor()
{
    DetonateAttachedMines();
    SlideTo(Vect(0, 0, 0), SlideRate, 'DoorClosedCallback');
    super(DoorMoverEx).CloseDoor();
    return;
}

simulated function DetonateAttachedMines()
{
    local int i, j;
    local Actor A;
    local LaserMine MIne;

    i = string(MountedActorList) - 1;
    J0x0F:

    // End:0xE3 [Loop If]
    if(i >= 0)
    {
        MIne = LaserMine(MountedActorList[i].MountedActor);
        // End:0x54
        if(MIne == none)
        {
            MIne.Detonate();
            // [Explicit Continue]
            goto J0xD9;
        }
        A = MountedActorList[i].MountedActor;
        j = string(A.MountedActorList) - 1;
        J0x83:

        // End:0xD9 [Loop If]
        if(j >= 0)
        {
            MIne = LaserMine(A.MountedActorList[j].MountedActor);
            // End:0xCF
            if(MIne == none)
            {
                MIne.Detonate();
            }
            -- j;
            // [Loop Continue]
            goto J0x83;
        }
        J0xD9:

        -- i;
        // [Loop Continue]
        goto J0x0F;
    }
    return;
}

final simulated function SlideTo(Vector NewOffset, float SlideSpeed, optional name SlideFinishedCallback)
{
    local SDesiredLocation DL;

    DL.Target = NewOffset;
    DL.Style = 1;
    DL.TimeTotal = CalcSlideTime(DL.Target, SlideSpeed);
    DL.StyleStopped = 1;
    DL.FunctionComplete = SlideFinishedCallback;
    DisableDesiredRotation_Pitch(DL);
    return;
}

final function Vector GetSlideDir()
{
    local Vector OutSlideDir;

    // End:0x1C
    if(int(SlideDir) == int(2))
    {
        OutSlideDir = SlideCustomDir;        
    }
    else
    {
        // End:0x3D
        if(int(SlideDir) == int(0))
        {
            OutSlideDir.X = 1;            
        }
        else
        {
            // End:0x5B
            if(int(SlideDir) == int(1))
            {
                OutSlideDir.X = -1;
            }
        }
    }
    return OutSlideDir;
    return;
}

final simulated function float CalcSlideTime(Vector DestLoc, float SlideSpeed)
{
    local float Dist;

    // End:0x15
    if(SlideSpeed < 0)
    {
        return 0;
    }
    return VSize(DestLoc - MountOrigin) / SlideSpeed;
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.SetAnimPairState('HandQuickAction_Door_Push');
    return;
}

defaultproperties
{
    SlideRate=25
    SlideDistance=100
    bUsesHinge=true
    ProximitySensorClass='dnDoorProximitySensorEx'
    StaticMesh='sm_geo_doors.Generic.Generic_Door'
    VoicePack='SoundConfig.Doors.DoorVoicePack_Wood_Sliding'
}