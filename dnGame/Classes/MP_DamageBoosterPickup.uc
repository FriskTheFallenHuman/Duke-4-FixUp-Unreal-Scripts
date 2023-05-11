/*******************************************************************************
 * MP_DamageBoosterPickup generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_DamageBoosterPickup extends MP_WeaponPickup
    collapsecategories;

event FinishPickup(Pawn Other)
{
    DukeMultiPlayer(Other).ActivatePowerup_DamageBooster();
    super(Pickup).FinishPickup(Other);
    return;
}

defaultproperties
{
    ItemName="<?int?dnGame.MP_DamageBoosterPickup.ItemName?>"
    InventoryType='MP_DamageBooster'
    bAllowUsePickup=false
    CollisionHeight=6
    StaticMesh='SM_Multiplayer.TrophyPowerUp.TrophyPowerUp'
}