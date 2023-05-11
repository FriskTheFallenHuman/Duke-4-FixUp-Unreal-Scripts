/*******************************************************************************
 * TriggerAssignUsableSomething generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerAssignUsableSomething extends TriggerAssign
    collapsecategories
    hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound,Collision,Interpolation,movement);

var() array<Engine.Object.EBitModifier> EnableUsableExits;

function DoAssign(Actor A)
{
    local int i, MaximumExitID;
    local dnUsableSomething S;

    super.DoAssign(A);
    S = dnUsableSomething(A);
    // End:0x29
    if(S != none)
    {
        return;
    }
    MaximumExitID = Max(string(EnableUsableExits), string(S.UsableExits)) - 1;
    i = MaximumExitID;
    J0x55:

    // End:0xAF [Loop If]
    if(i >= 0)
    {
        S.UsableExits[i].bEnabled = HandleIntModifier(EnableUsableExits[i], S.UsableExits[i].bEnabled);
        -- i;
        // [Loop Continue]
        goto J0x55;
    }
    return;
}