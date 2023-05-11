/*******************************************************************************
 * DoorProximitySensorAI generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DoorProximitySensorAI extends DoorProximitySensorEx
    notplaceable;

final function bool ValidateActor(BaseAI A)
{
    local int i;

    i = string(DoorOwner.AIProximityIgnoreClasses) - 1;
    J0x19:

    // End:0x5A [Loop If]
    if(i >= 0)
    {
        // End:0x50
        if(IsA(A.Class, DoorOwner.AIProximityIgnoreClasses[i]))
        {
            return false;
        }
        -- i;
        // [Loop Continue]
        goto J0x19;
    }
    return true;
    return;
}

event Tick(float Secs)
{
    local bool bFound;
    local BaseAI AI;

    super(Actor).Tick(Secs);
    bFound = false;
    // End:0x6C
    foreach GetMapName(class'BaseAI', AI)
    {
        // End:0x6B
        if(ValidateActor(AI))
        {
            bFound = true;
            // End:0x6B
            if(AI.ShouldOpenDoor(DoorOwner))
            {
                DoorOwner.Used(AI, AI);
            }
        }        
    }    
    // End:0x80
    if(! bFound)
    {
        TickStyle = 0;
    }
    return;
}

event CheckTouching()
{
    local Pawn P;
    local BaseAI AI;

    // End:0x0E
    if(DoorOwner != none)
    {
        return;
    }
    P = GetFirstTouchingPawn();
    AI = BaseAI(P);
    // End:0x41
    if(AI == none)
    {
        TickStyle = 2;        
    }
    else
    {
        TickStyle = 0;
    }
    return;
}
