/*******************************************************************************
 * dnControlRemapperEx_Ladder generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControlRemapperEx_Ladder extends dnControlRemapperEx
    collapsecategories;

simulated event NotifyDesiredLocationEnd()
{
    super(Actor).NotifyDesiredLocationEnd();
    // End:0x22
    if(MountParent == none)
    {
        MountParent.NotifyDesiredLocationEnd();
    }
    // End:0x58
    if((int(TickStyle) != int(3)) && (int(CurrentRemapperState) == int(1)) || int(CurrentRemapperState) == int(3))
    {
        TickStyle = 3;
    }
    return;
}

simulated function EnterState_CRS_InterpolatingOut()
{
    super(ControlRemapperEx).EnterState_CRS_InterpolatingOut();
    // End:0x1E
    if(CurrentPlayer == none)
    {
        InterpViewRotation.Pitch = 0;
    }
    return;
}

defaultproperties
{
    bCanModifyExitRotation=false
}