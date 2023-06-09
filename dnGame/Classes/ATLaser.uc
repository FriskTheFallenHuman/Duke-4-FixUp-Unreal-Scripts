/*******************************************************************************
 * ATLaser generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ATLaser extends Weapon;

function AdjustProjectileSpawn(out Vector SpawnLocation, out Rotator SpawnRotation)
{
    SpawnRotation = RVar(SpawnRotation + Rot(200, -200, 0), Rot(200, 200, 0));
    super.AdjustProjectileSpawn(SpawnLocation, SpawnRotation);
    return;
}

function WpnFireStop()
{
    return;
}

animevent simulated function Fire_Effects(optional EventInfo AnimEventInfo)
{
    super.Fire_Effects(AnimEventInfo);
    // End:0x95
    if(((Ammo.Charge <= float(0)) && Owner.bIsPlayerPawn) && ! PlayerPawn(Owner).bInfiniteAmmo)
    {
        // End:0x8F
        if(Owner.bIsPlayerPawn && PlayerPawn(Owner).IsLocallyControlled())
        {
            StopWeaponViewKick(PlayerPawn(Owner));
        }
        WeaponCallback_DefinitelyDoneFiring();
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
    // End:0x8A
    if(PrecacheIndex.EmptyAnimChannel(self))
    {
        PrecacheIndex.RegisterAnimationControllerEntry(class'crosshair_at_fb');
        PrecacheIndex.InitAnimationControllerEx(VoicePack, 'Activate');
        PrecacheIndex.InitAnimationControllerEx(VoicePack, 'Deactivate');
        PrecacheIndex.InitAnimationControllerEx(VoicePack, 'Fire');
        PrecacheIndex.InitAnimationControllerEx(class'VoicePack_Duke', 'shrinkray_melee');
    }
    return;
}

defaultproperties
{
    WeaponConfig='ATLaserWeaponConfig'
    HUDAmmoClipIcon=12
    DOFWeapDist=7
    CrosshairIndex=1
    CommandAlias="UseWeapon dnGame.ATLaser"
    InventoryReferenceClass='ATLaser'
    PickupClass='ATLaserPickup'
    bIsPrimaryWeapon=true
    HUDPickupEventIcon=16
    AutoRegisterIKClasses(0)='IKSystemInfo_Shotgun'
    AnimationControllerClass='dnAnimationControllerEx_ATLaser'
    Mesh='c_dnWeapon.at_gun'
    SoundVolume=200
    SoundRadius=1600
    SoundInnerRadius=800
    VoicePack='SoundConfig.Inventory.VoicePack_ATlaser'
}