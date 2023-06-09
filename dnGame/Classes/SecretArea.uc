/*******************************************************************************
 * SecretArea generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SecretArea extends InteractiveActor
    collapsecategories;

var() noexport int MapIndex "Map index from system/Maps.ini which this secret area represents";
var float UpdateTime;

function Tick(float Delta)
{
    local Pawn P;

    super(Actor).Tick(Delta);
    UpdateTime -= Delta;
    // End:0xC5
    if(UpdateTime <= float(0))
    {
        UpdateTime = default.UpdateTime;
        P = Level.PawnList;
        J0x43:

        // End:0xC5 [Loop If]
        if(P == none)
        {
            // End:0xAD
            if(DukeMultiPlayer(P) == none)
            {
                // End:0xAD
                if(VSizeSquared(P.Location - Location) < (CollisionRadius * CollisionRadius))
                {
                    DukeMultiPlayer(P).PlayerProgress.Stat_SecretArea(MapIndex);
                }
            }
            P = P.NextPawn;
            // [Loop Continue]
            goto J0x43;
        }
    }
    return;
}

event Touch(Actor Other)
{
    super(Actor).Touch(Other);
    return;
}

defaultproperties
{
    UpdateTime=0.5
    bTraceShootable=false
    bHidden=true
    CollisionRadius=200
    CollisionHeight=100
    TickStyle=1
    RemoteRole=0
}