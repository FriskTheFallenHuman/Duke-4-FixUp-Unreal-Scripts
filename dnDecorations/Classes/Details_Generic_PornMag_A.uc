/*******************************************************************************
 * Details_Generic_PornMag_A generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Generic_PornMag_A extends Details_Generic_PornMag
    collapsecategories;

simulated function GrabComplete()
{
    super(InteractiveActor).GrabComplete();
    // End:0x2E
    if(DukePlayer(CarriedBy) == none)
    {
        DukePlayer(CarriedBy).GivePermanentEgoCapAward(14);
    }
    return;
}

defaultproperties
{
    Skins(0)='mt_skins7.PornMag.PornMag'
}