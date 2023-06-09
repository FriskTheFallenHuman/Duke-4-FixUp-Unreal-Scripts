/*******************************************************************************
 * DoorMoverEx generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DoorMoverEx extends InteractiveActor
    abstract
    native
    collapsecategories
    notplaceable
    dependson(DoorHingeEx)
    dependson(DoorVoicePack)
    dependson(DoorExtras)
    dependson(DoorProximitySensorEx)
    dependson(DoorProximitySensorAI)
    hidecategories(Brush,Networking,LightColor,HeatVision,Hackflags,Filter);

cpptext
{
// Stripped
}

enum EDoorMoverStateEx
{
    DSEX_Closed,
    DSEX_PreOpening,
    DSEX_Opening,
    DSEX_Open,
    DSEX_Closing
};

enum EDoorTypeEx
{
    DTEX_Custom,
    DTEX_Wood,
    DTEX_Metal,
    DTEX_Tech,
    DTEX_Duke,
    DTEX_BigCurtain,
    DTEX_Bathroom,
    DTEX_Office,
    DTEX_PushDoor
};

struct SDoorExtraInfo
{
    var() noexport bool bFront "True if on front of door.";
    var() noexport bool bScaleByDrawScale "If true, door extra will be scaled up by the door's drawscale.";
    var() noexport class<DoorExtras> ExtraClass "Class to spawn.";
    var() noexport Vector AdditionalOffset "Additional offset added to Extra's internal offset";
    var name MatchTag;
};

var() noexport bool bDebugDoor "Set to true to display debugging information.";
var() noexport bool bLocked "Is this door locked?";
var() noexport bool bNeverClose "When true, this door will never close.";
var() noexport bool bUseProximitySensor "When true, a proximity sensor will be spawned to notify this door when things are near.";
var() noexport bool bProximityControlled "When true, door will open automatically when proximity sensor is touched.  Ignored if bUseProximitySensor is FALSE.";
var() noexport bool bProximitySenseCorpses "When true, proximity sensor will be able detect corpses.";
var() noexport bool bProximitySenseVehicles "When true, proximity sensor will be able to detect vehicles and if they have drivers.";
var() noexport bool bAIProximitySensor "Use a secondary sensor for AI only that will auto open the door for them.";
var() noexport float PreOpenDelay "Time in seconds to wait before opening door.  Ignored if kicked open.";
var() noexport float AutoCloseDelay "Minimum amount of time the door will stay open before trying to close.  Closing can be prevented if blocked. Negative values will cause it to never close on its own.";
var() noexport float ProximityRadius "CollisionRadius of the DoorProximitySensorEx that is attached to us.";
var() noexport float ProximityHeight "CollisionHeight of the DoorProximitySensorEx that is attached to us.";
var() noexport Vector ProximityOffset "Offset (relative to door) where ProximitySensorEx will be placed.";
var() noexport localized string LockedDoorMsg "Message to display on HUD when this door is locked.";
var() noexport deprecated name FriendDoorTag "Tag of another DoorMoverEx that will work together with this DoorMoverEx.";
var() noexport name ToggleLockTag "Trigger this event to toggle the status of the lock.  If this door has a friend door, set ToggleLockTag on only one of the doors.";
var() noexport name OpenDoorTag "Trigger this event to open the door.";
var() noexport name CloseDoorTag "Trigger this event to close the door.";
var() noexport name PortalSurfaceTag "Tag of the AreaPortal to turn on/off when door opens/closes.";
var() noexport name GoPhysicsTag "Tag to call to make the DoorMover go Physics so it can fall off the hinges.";
var(Sound) noexport DoorVoicePack VoicePackCustom "Custom created VoicePack containing sounds for this door.";
var() noexport Color DoorLockedActorColor "Color to use for ActorColor when door is locked.";
var() noexport Color DoorUnlockedActorColor "Color to use for ActorColor when door is unlocked.";
var() noexport array< class<BaseAI> > AIProximityIgnoreClasses "Do *not* open early for these classes. Note that only AI with bAutoOpenDoors can auto open doors to begin with.";
var() float AIProximityHeight;
var() float AIProximityRadius;
var(DoorMoverExEvents) noexport deprecated name OpeningEvent "Event to trigger when door begins opening.";
var(DoorMoverExEvents) bool bOpeningEventOnlyOnce;
var(DoorMoverExEvents) noexport deprecated name FullyOpenedEvent "Event to trigger when door has finished opening.";
var(DoorMoverExEvents) bool bFullyOpenedEventOnlyOnce;
var(DoorMoverExEvents) noexport deprecated name ClosingEvent "Event to trigger when door begins closing.";
var(DoorMoverExEvents) bool bClosingEventOnlyOnce;
var(DoorMoverExEvents) noexport deprecated name FullyClosedEvent "Event to trigger when door has finished opening.";
var(DoorMoverExEvents) bool bFullyClosedEventOnlyOnce;
var(DoorMoverExExtras) noexport array<SDoorExtraInfo> DoorExtras "Array of DoorExtras to attach to this door.";
var bool bUsesHinge;
var float AutoCloseTime;
var DoorMoverEx.EDoorMoverStateEx DoorState;
var DoorHingeEx Hinge;
var class<DoorProximitySensorEx> ProximitySensorClass;
var DoorProximitySensorEx ProximitySensor;
var array<DoorProximitySensorAI> AIProximitySensors;
var Vector DoorMidpoint;
var DoorMoverEx MasterDoor;
var array<DoorMoverEx> FriendDoors;
var Actor OpenInstigator;
var array<DoorExtras> Extras;
var PlayerPawn BlockingPlayerPawn;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        rClientCloseDoor, rClientOpenDoor;

    // Pos:0x00B
    reliable if(int(Role) == int(ROLE_Authority))
        PortalSurfaceTag, VoicePackCustom;
}

// Export UDoorMoverEx::execCalcSensorLocation(FFrame&, void* const)
native(1076) final function Vector CalcSensorLocation();

// Export UDoorMoverEx::execCalcMidpoint(FFrame&, void* const)
native(1077) final function Vector CalcMidpoint();

// Export UDoorMoverEx::execGetMountingSide(FFrame&, void* const)
native(1078) final function int GetMountingSide(bool bFront);

// Export UDoorMoverEx::execCalculateExtraOffset(FFrame&, void* const)
native(1079) function CalculateExtraOffset(SDoorExtraInfo ExtraInfo, out Vector EOffset, out Rotator ERotation);

simulated function PostVerifySelf()
{
    local int i, j;

    i = string(DoorExtras) - 1;
    J0x0F:

    // End:0x118 [Loop If]
    if(i >= 0)
    {
        // End:0x34
        if(DoorExtras[i].ExtraClass != none)
        {
            // [Explicit Continue]
            goto J0x10E;
        }
        j = MountOnSpawn.Add(1);
        MountOnSpawn[j].SpawnClass = DoorExtras[i].ExtraClass;
        CalculateExtraOffset(DoorExtras[i], MountOnSpawn[j].MountPrefab.MountOrigin, MountOnSpawn[j].MountPrefab.MountAngles);
        DoorExtras[i].MatchTag = CompositeNames((string(Name) $ "_DoorExtra_") $ string(i));
        MountOnSpawn[j].MountPrefab.ForceTag = DoorExtras[i].MatchTag;
        MountOnSpawn[j].MountPrefab.bHideable = true;
        J0x10E:

        -- i;
        // [Loop Continue]
        goto J0x0F;
    }
    super(RenderActor).PostVerifySelf();
    return;
}

simulated event PostBeginPlay()
{
    local int i;
    local DoorExtras DE;

    super.PostBeginPlay();
    i = string(DoorExtras) - 1;
    J0x15:

    // End:0xDC [Loop If]
    if(i >= 0)
    {
        DE = DoorExtras(FindMountedActor(DoorExtras[i].MatchTag, class'DoorExtras'));
        // End:0x55
        if(DE != none)
        {
            // [Explicit Continue]
            goto J0xD2;
        }
        // End:0x9B
        if(! DoorExtras[i].bScaleByDrawScale)
        {
            DE.RemoveActorColor(1);
            DE.SetActorColor(Vect(1, 1, 1));
        }
        DE.SetSide(SetKDisableCollision(DoorExtras[i].bFront));
        Extras[Extras.Add(1)] = DE;
        J0xD2:

        -- i;
        // [Loop Continue]
        goto J0x15;
    }
    DoorExtras.Empty();
    return;
}

simulated event PostNetInitial()
{
    super(RenderActor).PostNetInitial();
    InitDoor();
    SetLocked(bLocked);
    return;
}

simulated function InitDoor()
{
    local DoorMoverEx FriendDoor;

    GetPointRegion('ToggleLock', ToggleLockTag);
    GetPointRegion('OpenDoor', OpenDoorTag);
    GetPointRegion('CloseDoor', CloseDoorTag);
    GetPointRegion('GoPhysics', GoPhysicsTag);
    // End:0xB5
    if(bUseProximitySensor)
    {
        // End:0x4E
        if(bProximityControlled)
        {
            bUsable = false;
        }
        // End:0x65
        if(ProximitySensorClass != none)
        {
            ProximitySensorClass = class'DoorProximitySensorEx';
        }
        ProximitySensor = EmptyTouchClasses(ProximitySensorClass,,, Location, Rotation);
        // End:0xB5
        if(ProximitySensor == none)
        {
            ProximitySensor.Initialize(self, MarkDirty(), ProximityRadius, ProximityHeight, bProximitySenseCorpses, bProximitySenseVehicles);
        }
    }
    // End:0x151
    if(bUsesHinge)
    {
        Hinge = EmptyTouchClasses(class'DoorHingeEx', self,, Location, Rotation);
        Hinge.MountType = MountType;
        Hinge.MountMeshItem = MountMeshItem;
        // End:0x126
        if(MountParent == none)
        {
            Hinge.MoveActor(MountParent, false, false, true);            
        }
        else
        {
            // End:0x14B
            if(NameForString(MountParentTag, 'None'))
            {
                Hinge.DropToFloor(MountParentTag, false, false, true);
            }
        }
        AttachToHinge();
    }
    // End:0x16F
    if(NameForString(PortalSurfaceTag, 'None'))
    {
        TraceFire(0.01, false, 'SetupSurfacePortal');
    }
    FindAndSetupFriends();
    GetCurrentColor();
    // End:0x195
    if(bAIProximitySensor && MasterDoor != none)
    {
        InitAISensors();
    }
    return;
}

function InitAISensors()
{
    local Vector Offset;
    local DoorProximitySensorAI Sensor;

    Offset = (Vect(0, 0, 1) Cross Normal(Vector(Rotation))) * 100;
    Sensor = EmptyTouchClasses(class'DoorProximitySensorAI',,, Location, Rotation);
    // End:0x77
    if(Sensor == none)
    {
        Sensor.Initialize(self, DoorMidpoint + Offset, AIProximityRadius, AIProximityHeight, false, false);
    }
    AIProximitySensors[AIProximitySensors.Add(1)] = Sensor;
    Offset = (Vect(0, 0, 1) Cross Normal(Vector(Rotation))) * -100;
    Sensor = EmptyTouchClasses(class'DoorProximitySensorAI',,, Location, Rotation);
    // End:0x101
    if(Sensor == none)
    {
        Sensor.Initialize(self, DoorMidpoint + Offset, AIProximityRadius, AIProximityHeight, false, false);
    }
    AIProximitySensors[AIProximitySensors.Add(1)] = Sensor;
    return;
}

final function AttachToHinge()
{
    Log(Hinge == none);
    MountType = 0;
    MountParentTag = 'None';
    MoveActor(Hinge, true, true, true);
    return;
}

function SetupSurfacePortal()
{
    TraceActors(PortalSurfaceTag, false);
    return;
}

final function FindAndSetupFriends()
{
    local DoorMoverEx FriendDoor;

    // End:0x20
    if((MasterDoor == none) || FriendDoorTag != 'None')
    {
        return;
    }
    // End:0x55
    foreach RotateVectorAroundAxis(class'DoorMoverEx', FriendDoor, FriendDoorTag)
    {
        // End:0x54
        if(FriendDoor == self)
        {
            FriendDoors[FriendDoors.Add(1)] = FriendDoor;
        }        
    }    
    // End:0x68
    if(string(FriendDoors) > 0)
    {
        SetupFriends();
    }
    return;
}

final function SetupFriends()
{
    local int i;

    i = string(FriendDoors) - 1;
    J0x0F:

    // End:0x35 [Loop If]
    if(i >= 0)
    {
        SetupFriend(FriendDoors[i]);
        -- i;
        // [Loop Continue]
        goto J0x0F;
    }
    return;
}

function SetupFriend(DoorMoverEx FriendDoor)
{
    Log(FriendDoor == none);
    FriendDoor.MasterDoor = self;
    FriendDoor.bNeverClose = bNeverClose;
    FriendDoor.bLocked = bLocked;
    FriendDoor.bUsable = bUsable;
    FriendDoor.bUseProximitySensor = bUseProximitySensor;
    FriendDoor.bProximityControlled = bProximityControlled;
    return;
}

final function RemoveFriends()
{
    local DoorMoverEx NewMaster;
    local int i;

    // End:0x20
    if(MasterDoor == none)
    {
        MasterDoor.RemoveFriend(self);        
    }
    else
    {
        // End:0xBC
        if(string(FriendDoors) > 0)
        {
            NewMaster = FriendDoors[0];
            NewMaster.MasterDoor = none;
            i = string(FriendDoors) - 1;
            J0x59:

            // End:0xB6 [Loop If]
            if(i >= 1)
            {
                NewMaster.FriendDoors[NewMaster.FriendDoors.Add(1)] = FriendDoors[i];
                FriendDoors[i].MasterDoor = NewMaster;
                -- i;
                // [Loop Continue]
                goto J0x59;
            }
            FriendDoors.Empty();
        }
    }
    return;
}

final function RemoveFriend(DoorMoverEx FriendDoor)
{
    local int i;

    i = string(FriendDoors) - 1;
    J0x0F:

    // End:0x60 [Loop If]
    if(i >= 0)
    {
        // End:0x56
        if(FriendDoors[i] != FriendDoor)
        {
            FriendDoors[i].MasterDoor = none;
            FriendDoors.Remove(i, 1);
            // [Explicit Break]
            goto J0x60;
        }
        -- i;
        // [Loop Continue]
        goto J0x0F;
    }
    J0x60:

    return;
}

simulated function Vector GetDoorCenter()
{
    local Box doorBox;
    local int i;
    local Vector Center;

    doorBox = AttachToActor();
    Center = doorBox.Min + ((doorBox.Max - doorBox.Min) / 2);
    // End:0x96
    if(string(FriendDoors) == 1)
    {
        doorBox = FriendDoors[0].AttachToActor();
        Center = (Center + (doorBox.Min + ((doorBox.Max - doorBox.Min) / 2))) / 2;
    }
    return Center;
    return;
}

event Destroyed()
{
    RemoveFriends();
    // End:0x1F
    if(Hinge == none)
    {
        Hinge.RemoveTouchClass();
    }
    // End:0x38
    if(ProximitySensor == none)
    {
        ProximitySensor.RemoveTouchClass();
    }
    super.Destroyed();
    return;
}

simulated function bool CanBeUsedBy(Pawn User)
{
    // End:0x15
    if(ShouldMimicOwner())
    {
        return super.CanBeUsedBy(User);
    }
    // End:0x2B
    if((IsOpening()) || IsOpen())
    {
        return false;
    }
    return super.CanBeUsedBy(User);
    return;
}

event bool ShouldDrawHUDInfoUsePhrase(Pawn TestPawn)
{
    // End:0x15
    if(ShouldMimicOwner())
    {
        return super.ShouldDrawHUDInfoUsePhrase(TestPawn);
    }
    // End:0x20
    if(bLocked)
    {
        return false;
    }
    return super.ShouldDrawHUDInfoUsePhrase(TestPawn);
    return;
}

simulated function string GetUsePhrase()
{
    // End:0x10
    if(ShouldMimicOwner())
    {
        return super.GetUsePhrase();
    }
    // End:0x21
    if(int(Physics) == int(18))
    {
        return "";
    }
    // End:0x33
    if(bLocked)
    {
        return LockedDoorMsg;        
    }
    else
    {
        return super.GetUsePhrase();
    }
    return;
}

simulated function bool PassUseToOwner()
{
    return (bPassUseToOwner && Owner == none) && Owner.bIsInteractiveActor;
    return;
}

simulated function Used(Actor Other, Pawn EventInstigator)
{
    super.Used(Other, EventInstigator);
    // End:0x1B
    if(PassUseToOwner())
    {
        return;
    }
    // End:0x5A
    if((MasterDoor == none) && ! MasterDoor.bLocked)
    {
        MasterDoor.Used(Other, EventInstigator);
        return;
    }
    // End:0x86
    if((int(DoorState) == int(0)) || int(DoorState) == int(4))
    {
        TryOpenDoor(Other);        
    }
    else
    {
        // End:0xAA
        if((int(DoorState) == int(3)) || int(DoorState) == int(2))
        {
            TryCloseDoor();
        }
    }
    return;
}

function Kicked(Pawn Kicker)
{
    return;
}

final function TriggerFunc_OpenDoor()
{
    // End:0x1F
    if(MasterDoor == none)
    {
        MasterDoor.super(DoorMoverEx).TriggerFunc_OpenDoor();        
    }
    else
    {
        // End:0x44
        if((int(DoorState) == int(0)) || int(DoorState) == int(4))
        {
            TryOpenDoor(none);
        }
    }
    return;
}

final function TriggerFunc_CloseDoor()
{
    // End:0x1E
    if(MasterDoor == none)
    {
        MasterDoor.super(DoorMoverEx).TriggerFunc_CloseDoor();
        return;
    }
    // End:0x29
    if(bNeverClose)
    {
        return;
    }
    // End:0x51
    if(int(DoorState) == int(1))
    {
        OpenInstigator = none;
        PerformDamageCategoryEffectEx('PreOpenCallback');
        DoorState = 0;        
    }
    else
    {
        // End:0x75
        if((int(DoorState) == int(3)) || int(DoorState) == int(2))
        {
            TryCloseDoor();
        }
    }
    return;
}

final function TriggerFunc_ToggleLock()
{
    SetLocked(! bLocked);
    return;
}

simulated function SetLocked(bool bNewLocked)
{
    local int i;

    // End:0x25
    if(MasterDoor == none)
    {
        MasterDoor.SetLocked(bNewLocked);        
    }
    else
    {
        bLocked = bNewLocked;
        // End:0x4B
        if(bLocked)
        {
            Sleep('Generic0', DoorLockedActorColor);            
        }
        else
        {
            Sleep('Generic0', DoorUnlockedActorColor);
        }
        i = string(FriendDoors) - 1;
        J0x67:

        // End:0xFF [Loop If]
        if(i >= 0)
        {
            FriendDoors[i].bLocked = bNewLocked;
            // End:0xC8
            if(bNewLocked)
            {
                FriendDoors[i].Sleep('Generic0', FriendDoors[i].DoorLockedActorColor);
                // [Explicit Continue]
                goto J0xF5;
            }
            FriendDoors[i].Sleep('Generic0', FriendDoors[i].DoorUnlockedActorColor);
            J0xF5:

            -- i;
            // [Loop Continue]
            goto J0x67;
        }
    }
    return;
}

final function NotifyBlocked(Actor Other)
{
    local int i;

    // End:0x21
    if(PlayerPawn(Other) == none)
    {
        BlockingPlayerPawn = PlayerPawn(Other);
    }
    // End:0x44
    if(MasterDoor == none)
    {
        MasterDoor.super(DoorMoverEx).NotifyBlocked(Other);
        return;
    }
    NotifyBlockedInternal(Other);
    i = string(FriendDoors) - 1;
    J0x5E:

    // End:0x8E [Loop If]
    if(i >= 0)
    {
        FriendDoors[i].NotifyBlockedInternal(Other);
        -- i;
        // [Loop Continue]
        goto J0x5E;
    }
    return;
}

final function NotifyBlockedInternal(Actor Other)
{
    PerformDamageCategoryEffectEx('TryCloseDoor');
    // End:0x3C
    if(bProximityControlled && (int(DoorState) == int(0)) || int(DoorState) == int(4))
    {
        TryOpenDoor(Other);
    }
    return;
}

final function NotifyUnblocked()
{
    local int i;

    // End:0x1E
    if(MasterDoor == none)
    {
        MasterDoor.super(DoorMoverEx).NotifyUnblocked();
        return;
    }
    NotifyUnblockedInternal();
    i = string(FriendDoors) - 1;
    J0x33:

    // End:0x5E [Loop If]
    if(i >= 0)
    {
        FriendDoors[i].NotifyUnblockedInternal();
        -- i;
        // [Loop Continue]
        goto J0x33;
    }
    return;
}

final function NotifyUnblockedInternal()
{
    // End:0x6B
    if(int(DoorState) == int(3))
    {
        // End:0x2A
        if(bNeverClose || AutoCloseDelay < 0)
        {
            return;
        }
        // End:0x65
        if(AutoCloseTime > Level.GameTimeSeconds)
        {
            TraceFire(AutoCloseTime - Level.GameTimeSeconds, false, 'TryCloseDoor');            
        }
        else
        {
            TryCloseDoor();
        }
    }
    return;
}

function PlayDoorLocked()
{
    local int i;

    DoorSound('Locked');
    i = string(Extras) - 1;
    J0x1A:

    // End:0x45 [Loop If]
    if(i >= 0)
    {
        Extras[i].PlayLockedDoor();
        -- i;
        // [Loop Continue]
        goto J0x1A;
    }
    return;
}

function TryOpenDoor(optional Actor Other, optional bool bKicked)
{
    // End:0x12
    if(bLocked)
    {
        PlayDoorLocked();        
    }
    else
    {
        BeginOpenDoor(Other, bKicked);
    }
    return;
}

function BeginOpenDoor(optional Actor Other, optional bool bKicked)
{
    local int i;

    // End:0x20
    if((int(DoorState) == int(2)) || int(DoorState) == int(1))
    {
        return;
    }
    PerformDamageCategoryEffectEx('TryCloseDoor');
    // End:0x55
    if(int(DoorState) == int(0))
    {
        GlobalTrigger(OpeningEvent);
        // End:0x55
        if(bOpeningEventOnlyOnce)
        {
            OpeningEvent = 'None';
        }
    }
    // End:0xA5
    if((! bKicked && PreOpenDelay > 0) && int(DoorState) == int(0))
    {
        DoorState = 1;
        OpenInstigator = Other;
        TraceFire(PreOpenDelay, false, 'PreOpenCallback');        
    }
    else
    {
        OpenDoor(Other, bKicked);
    }
    i = string(FriendDoors) - 1;
    J0xC5:

    // End:0xFB [Loop If]
    if(i >= 0)
    {
        FriendDoors[i].BeginOpenDoor(Other, bKicked);
        -- i;
        // [Loop Continue]
        goto J0xC5;
    }
    return;
}

final function PreOpenCallback()
{
    // End:0x20
    if(int(DoorState) == int(1))
    {
        OpenDoor(OpenInstigator);
        OpenInstigator = none;
    }
    return;
}

simulated function OpenDoor(optional Actor Other, optional bool bKicked)
{
    local int i;

    TickStyle = 3;
    // End:0x21
    if(NameForString(PortalSurfaceTag, 'None'))
    {
        TraceActors(PortalSurfaceTag, true);
    }
    DoorState = 2;
    DoorSound('Opening');
    // End:0x7A
    if(bKicked)
    {
        i = string(Extras) - 1;
        J0x4C:

        // End:0x77 [Loop If]
        if(i >= 0)
        {
            Extras[i].PlayKickedOpenDoor();
            -- i;
            // [Loop Continue]
            goto J0x4C;
        }        
    }
    else
    {
        i = string(Extras) - 1;
        J0x89:

        // End:0xB4 [Loop If]
        if(i >= 0)
        {
            Extras[i].PlayOpenDoor();
            -- i;
            // [Loop Continue]
            goto J0x89;
        }
    }
    // End:0xE8
    if((IsMP()) && int(Level.NetMode) != int(NM_Client))
    {
        rClientOpenDoor(Other, bKicked);
    }
    return;
}

simulated delegate rClientOpenDoor(optional Actor Other, optional bool bKicked)
{
    Log(IsMP());
    Log(int(Level.NetMode) == int(NM_Client));
    OpenDoor(Other, bKicked);
    return;
}

function TryCloseDoor()
{
    local int i;

    // End:0x49
    if(CanCloseDoor())
    {
        CloseDoor();
        i = string(FriendDoors) - 1;
        J0x1E:

        // End:0x49 [Loop If]
        if(i >= 0)
        {
            FriendDoors[i].CloseDoor();
            -- i;
            // [Loop Continue]
            goto J0x1E;
        }
    }
    return;
}

function bool CanCloseDoor()
{
    local int i;

    // End:0x1D
    if(MasterDoor == none)
    {
        return MasterDoor.CanCloseDoor();
    }
    // End:0x28
    if(bNeverClose)
    {
        return false;
    }
    // End:0x48
    if((int(DoorState) == int(4)) || int(DoorState) == int(0))
    {
        return false;
    }
    // End:0x6F
    if(int(DoorState) == int(1))
    {
        OpenInstigator = none;
        PerformDamageCategoryEffectEx('PreOpenCallback');
        DoorState = 0;
        return false;
    }
    i = string(FriendDoors) - 1;
    J0x7E:

    // End:0xD6 [Loop If]
    if(i >= 0)
    {
        // End:0xCC
        if((FriendDoors[i].ProximitySensor == none) && FriendDoors[i].ProximitySensor.IsBlocked())
        {
            return false;
        }
        -- i;
        // [Loop Continue]
        goto J0x7E;
    }
    // End:0x108
    if((BlockingPlayerPawn == none) && VSizeSquared(BlockingPlayerPawn.Location - Location) < 9000)
    {
        return false;
    }
    return (ProximitySensor != none) || ! ProximitySensor.IsBlocked();
    return;
}

simulated function CloseDoor()
{
    local int i;

    TickStyle = 3;
    // End:0x35
    if(int(DoorState) == int(3))
    {
        GlobalTrigger(ClosingEvent);
        // End:0x35
        if(bClosingEventOnlyOnce)
        {
            ClosingEvent = 'None';
        }
    }
    DoorState = 4;
    DoorSound('Closing');
    PerformDamageCategoryEffectEx('TryCloseDoor');
    i = string(Extras) - 1;
    J0x5F:

    // End:0x8A [Loop If]
    if(i >= 0)
    {
        Extras[i].PlayCloseDoor();
        -- i;
        // [Loop Continue]
        goto J0x5F;
    }
    // End:0xB3
    if((IsMP()) && int(Level.NetMode) != int(NM_Client))
    {
        rClientCloseDoor();
    }
    return;
}

simulated delegate rClientCloseDoor()
{
    Log(IsMP());
    Log(int(Level.NetMode) == int(NM_Client));
    CloseDoor();
    return;
}

final simulated function DoorOpenCallback()
{
    local int i;

    DoorState = 3;
    DoorSound('Opened');
    TickStyle = 0;
    i = string(Extras) - 1;
    J0x2A:

    // End:0x55 [Loop If]
    if(i >= 0)
    {
        Extras[i].PlayOpenedDoor();
        -- i;
        // [Loop Continue]
        goto J0x2A;
    }
    // End:0xC8
    if(int(Role) == int(ROLE_Authority))
    {
        GlobalTrigger(FullyOpenedEvent);
        // End:0x82
        if(bFullyOpenedEventOnlyOnce)
        {
            FullyOpenedEvent = 'None';
        }
        // End:0x9E
        if((AutoCloseDelay < 0) || bNeverClose)
        {
            return;
        }
        AutoCloseTime = Level.GameTimeSeconds + AutoCloseDelay;
        TraceFire(AutoCloseDelay, false, 'TryCloseDoor');
    }
    return;
}

simulated function DoorClosedCallback()
{
    local int i;

    TickStyle = 0;
    // End:0x21
    if(NameForString(PortalSurfaceTag, 'None'))
    {
        TraceActors(PortalSurfaceTag, false);
    }
    DoorState = 0;
    DoorSound('Closed');
    i = string(Extras) - 1;
    J0x43:

    // End:0x6E [Loop If]
    if(i >= 0)
    {
        Extras[i].PlayClosedDoor();
        -- i;
        // [Loop Continue]
        goto J0x43;
    }
    // End:0x9B
    if(int(Role) == int(ROLE_Authority))
    {
        GlobalTrigger(FullyClosedEvent);
        // End:0x9B
        if(bFullyClosedEventOnlyOnce)
        {
            FullyClosedEvent = 'None';
        }
    }
    return;
}

final function DoorSound(name SoundName)
{
    local SSoundInfo SoundInfo;

    // End:0x36
    if(VoicePackCustom == none)
    {
        VoicePackCustom.FindSoundEx(SoundName, SoundInfo);
        PlaySoundInfo(3, SoundInfo);        
    }
    else
    {
        FindAndPlaySound(SoundName, 3);
    }
    return;
}

final function TriggerFunc_GoPhysics()
{
    local int i;
    local Vector PreviousPrePivot;

    RemoveFriends();
    // End:0x22
    if(Hinge == none)
    {
        GetGravity();
        Hinge.RemoveTouchClass();
    }
    bUsable = false;
    TickStyle = 2;
    Sleep('Generic0', NewColorBytes(0, 0, 0, 0));
    PreviousPrePivot = PrePivot;
    EndCallbackTimer(Vect(0, 0, 0));
    SetDesiredRotation(Location - (PreviousPrePivot >> Rotation), true);
    SetRotation(18);
    return;
}

function bool IsOpen()
{
    local int i;

    // End:0x1D
    if(MasterDoor == none)
    {
        return MasterDoor.IsOpen();
    }
    i = string(FriendDoors) - 1;
    J0x2C:

    // End:0x61 [Loop If]
    if(i >= 0)
    {
        // End:0x57
        if(int(FriendDoors[i].DoorState) != int(3))
        {
            return false;
        }
        -- i;
        // [Loop Continue]
        goto J0x2C;
    }
    return int(DoorState) == int(3);
    return;
}

function bool IsOpening()
{
    return int(DoorState) == int(2);
    return;
}

function bool IsClosed()
{
    local int i;

    // End:0x1D
    if(MasterDoor == none)
    {
        return MasterDoor.IsClosed();
    }
    i = string(FriendDoors) - 1;
    J0x2C:

    // End:0x61 [Loop If]
    if(i >= 0)
    {
        // End:0x57
        if(int(FriendDoors[i].DoorState) != int(0))
        {
            return false;
        }
        -- i;
        // [Loop Continue]
        goto J0x2C;
    }
    return int(DoorState) == int(0);
    return;
}

function bool IsClosing()
{
    return int(DoorState) == int(4);
    return;
}

event bool IsAIMoveable()
{
    return (bAIMoveable && (IsOpen()) == false) && bLocked == false;
    return;
}

defaultproperties
{
    bDebugDoor=true
    bUseProximitySensor=true
    bProximitySenseCorpses=true
    bAIProximitySensor=true
    PreOpenDelay=0.1
    AutoCloseDelay=2
    ProximityRadius=75
    ProximityHeight=96
    LockedDoorMsg="<?int?Engine.DoorMoverEx.LockedDoorMsg?>"
    DoorLockedActorColor=(R=255,G=0,B=0,A=255)
    DoorUnlockedActorColor=(R=0,G=255,B=0,A=255)
    AIProximityHeight=96
    AIProximityRadius=80
    ProximitySensorClass='DoorProximitySensorEx'
    bDrawHUDInfo=true
    bForceUsePhrase=true
    bUsable=true
    UsePhrase="<?int?Engine.DoorMoverEx.UsePhrase?>"
    bCanCrushOthers=false
    Physics=9
    bCollisionAssumeValid=true
    bBlockActors=true
    bBlockPlayers=true
    bBlockKarma=true
    bBlockParticles=true
    bIsMover=true
    bTakeMountParentAsOwner=false
    bAlwaysRelevant=true
    bReplicateTicking=false
    bCollideActors=true
    TickStyle=0
    DrawType=8
    ActorColorList(0)=(ActorColor=(R=0,G=0,B=0,A=0),ActorColor_LightEx=none,ActorColor_LightExScale=(X=0,Y=0,Z=0),id=Generic0)
    SoundVolume=192
    SoundRadius=1024
    SoundInnerRadius=512
    TransientSoundVolume=0.75
    TransientSoundRadius=1024
    TransientSoundInnerRadius=512
}