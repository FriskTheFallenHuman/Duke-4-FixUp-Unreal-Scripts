/*******************************************************************************
 * dnBreakableGlass generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnBreakableGlass extends BreakableGlass
    collapsecategories
    dependson(dnGlassFragments);

var() noexport deprecated name UsedEvent "Event triggered when glass is used.";
var() noexport int UsedEventCount "Number of times the UsedEvent trigger can be used (0 = infinite).";
var() noexport deprecated name CrackedEvent "Event triggered when glass is cracked.";
var() noexport int CrackedEventCount "Number of times the CrackedEvent trigger can be used (0 = infinite).";
var() noexport deprecated name ShatteredEvent "Event triggered when glass is shattered.";
var() noexport int ShatteredEventCount "Number of times the ShatteredEvent trigger can be used (0 = infinite).";
var() noexport deprecated name RespawnedEvent "Event triggered when glass is respawned.";
var() noexport int RespawnedEventCount "Number of times the RespawnedEvent trigger can be used (0 = infinite).";
var() noexport bool bBreakOnTrigger "Whether or not you want the glass to break when triggered.";
var() noexport int BreakOnTriggerCount "How many times the glass can be broken via trigger (0 = infinite)";
var() bool bDirForce;
var() float ForceScale;
var() noexport deprecated name TriggerEvent "Event triggered when glass is triggered.";
var() noexport int TriggerEventCount "Number of times the TriggerEvent trigger can be used (0 = infinite).";
var() noexport bool bDebug "If set to true, debug info will be printed to the console for special events.";
var dnGlassFragments Fragments;
var Vector OldMin;
var Vector OldMax;

simulated function PostBeginPlay()
{
    super(InteractiveActor).PostBeginPlay();
    // End:0x1E
    if(NameForString(UsedEvent, 'None'))
    {
        bUsable = true;
    }
    return;
}

simulated function DoEvent(out name EventName, out int EventCount)
{
    // End:0x80
    if(NameForString(EventName, 'None'))
    {
        GlobalTrigger(EventName);
        // End:0x58
        if(bDebug)
        {
            BroadcastMessage((((string(self) @ ": Doing event: ") @ string(EventName)) @ ",") @ string(EventCount));
        }
        // End:0x80
        if(EventCount > 0)
        {
            -- EventCount;
            // End:0x80
            if(EventCount == 0)
            {
                EventName = 'None';
            }
        }
    }
    return;
}

simulated function Used(Actor Other, Pawn EventInstigator)
{
    super(InteractiveActor).Used(Other, EventInstigator);
    // End:0x2C
    if(bDebug)
    {
        BroadcastMessage(string(self) @ ": Used");
    }
    DoEvent(UsedEvent, UsedEventCount);
    return;
}

simulated function GlassCracked()
{
    local Actor MountedActor;

    super.GlassCracked();
    // End:0x25
    if(bDebug)
    {
        BroadcastMessage(string(self) @ ": Cracked");
    }
    DoEvent(CrackedEvent, CrackedEventCount);
    J0x35:

    // End:0x60 [Loop If]
    if(string(MountedActorList) > 0)
    {
        MountedActorList[0].MountedActor.GetGravity();
        MountedActorList.Remove(0, 1);
        // [Loop Continue]
        goto J0x35;
    }
    bAcceptMines = false;
    bAcceptMinesInMultiplayer = false;
    return;
}

simulated function GlassShattered()
{
    super.GlassShattered();
    // End:0x27
    if(bDebug)
    {
        BroadcastMessage(string(self) @ ": Shattered");
    }
    DoEvent(ShatteredEvent, ShatteredEventCount);
    // End:0x52
    if(Fragments != none)
    {
        Fragments = EmptyTouchClasses(class'dnGlassFragments', self);
    }
    return;
}

simulated function bool LooseVectorCmp(Vector v1, Vector V2, float Epsilon)
{
    // End:0x24
    if(Abs(v1.X - V2.X) > Epsilon)
    {
        return false;
    }
    // End:0x48
    if(Abs(v1.Y - V2.Y) > Epsilon)
    {
        return false;
    }
    // End:0x6C
    if(Abs(v1.Z - V2.Z) > Epsilon)
    {
        return false;
    }
    return true;
    return;
}

simulated function Tick(float DeltaTime)
{
    local Vector Min, Max, Center;
    local float Radius, Height;

    // End:0x190
    if(Fragments == none)
    {
        // End:0x2E
        if(NumGlassParticles == 0)
        {
            Fragments.RemoveTouchClass();
            Fragments = none;            
        }
        else
        {
            SetPulleyRatio(Min, Max);
            // End:0x190
            if(! LooseVectorCmp(Min, OldMin, 3) || ! LooseVectorCmp(Max, OldMax, 3))
            {
                OldMin = Min;
                OldMax = Max;
                Center = (Min + Max) * 0.5;
                Height = Abs(Max.Z - Center.Z);
                // End:0xD6
                if(Height < float(5))
                {
                    Height = 5;
                }
                Max.Z = 0;
                Min.Z = 0;
                Radius = VSize(Max - Min) * 0.5;
                // End:0x144
                if(Radius < 2)
                {
                    // End:0x141
                    if(Fragments.bCollideActors)
                    {
                        Fragments.ForceMountUpdate(false);
                    }                    
                }
                else
                {
                    Fragments.IsMountedTo(Radius, Height);
                    Fragments.SetDesiredRotation(Center);
                    // End:0x190
                    if(! Fragments.bCollideActors)
                    {
                        Fragments.ForceMountUpdate(true);
                    }
                }
            }
        }
    }
    super(Actor).Tick(DeltaTime);
    // End:0x1A9
    if(SetSecondaryAxisState())
    {
        TickStyle = 0;
    }
    return;
}

simulated function GlassRespawned()
{
    super.GlassRespawned();
    // End:0x27
    if(bDebug)
    {
        BroadcastMessage(string(self) @ ": Respawned");
    }
    DoEvent(RespawnedEvent, RespawnedEventCount);
    return;
}

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    super(Actor).Trigger(Other, EventInstigator);
    // End:0x87
    if(bBreakOnTrigger)
    {
        bUnBreakable = false;
        // End:0x42
        if(bDebug)
        {
            BroadcastMessage(string(self) @ ": Triggered");
        }
        ReplicateBreakGlass(Other.Location, bDirForce, ForceScale);
        // End:0x87
        if(BreakOnTriggerCount > 0)
        {
            -- BreakOnTriggerCount;
            // End:0x87
            if(BreakOnTriggerCount == 0)
            {
                bBreakOnTrigger = false;
            }
        }
    }
    DoEvent(TriggerEvent, TriggerEventCount);
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
    // End:0x28
    if(! bUnBreakable)
    {
        PrecacheIndex.RegisterMaterialClass(class'dnGlassFragments');
    }
    return;
}

defaultproperties
{
    bCanCrushOthers=false
    bBlockActors=true
    Skins(0)='dt_masking.Glass_Materials.glassdirty1bc_finalblend'
    Skins(1)='dt_masking.Glass_Materials.brokenglass1bc_envcomb'
    Skins(2)='dt_masking.Glass_Materials.brokenglass1bc_envcomb'
    Skins(3)='dt_masking.Glass_Materials.glassdirty1bc_finalblend'
}