/*******************************************************************************
 * TriggerCheckpoint generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerCheckpoint extends Triggers
    collapsecategories
    notplaceable
    hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

var() noexport string SaveName "The title of the save game.";
var() noexport int CheckpointIndex "The index of this checkpoint.  Required so we know the order of the checkpoints.";
var bool bSaved;

function Trigger(Actor Other, Pawn EventInstigator)
{
    local Texture Shot;

    // End:0x0B
    if(bSaved)
    {
        return;
    }
    bSaved = true;
    Level.TickHint().NotifyCheckpoint(self);
    Shot = none;
    // End:0x61
    if(SaveName ~= "")
    {
        KSetAngularAcceleration(2, CheckpointIndex, Level.LocationName, Shot);        
    }
    else
    {
        KSetAngularAcceleration(2, CheckpointIndex, (Level.LocationName @ ":") @ SaveName, Shot);
    }
    return;
}

defaultproperties
{
    Texture=Texture'S_Checkpoint'
}