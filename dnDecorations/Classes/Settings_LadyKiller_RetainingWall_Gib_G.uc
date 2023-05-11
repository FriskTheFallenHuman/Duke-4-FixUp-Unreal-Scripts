/*******************************************************************************
 * Settings_LadyKiller_RetainingWall_Gib_G generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Settings_LadyKiller_RetainingWall_Gib_G extends Settings_LadyKiller_RetainingWall_Gib;

simulated event PostBeginPlay()
{
    super(dnDecoration).PostBeginPlay();
    // End:0x4C
    if(((OwnerWall == none) && OwnerWall.MyGlass == none) && OwnerWall.MyGlass.SetBreakAngle())
    {
        CriticalDamage();
    }
    return;
}

defaultproperties
{
    StaticMesh='sm_lvl_ladykiller.Casino.LKCasinoRetainingWall_Gib7'
}