/*******************************************************************************
 * TriggerAssignLimitedRangeMover generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerAssignLimitedRangeMover extends TriggerAssign
    collapsecategories
    hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound,Collision,Interpolation,movement);

var() noexport Engine.Object.EIntModifier NewStateIndexMod "How you want to modify the Index of the LimitedRangeMover.";
var() noexport int NewStateIndex "StateIndex you want to update the LimitedRangeMover (aka Valves) to.";

function DoAssign(Actor A)
{
    local dnControl_LimitedRangeMover LRM;

    super.DoAssign(A);
    LRM = dnControl_LimitedRangeMover(A);
    // End:0x53
    if(LRM == none)
    {
        LRM.ForceInternalState(HandleFloatModifier(NewStateIndexMod, LRM.stateIndex, NewStateIndex));
    }
    return;
}
