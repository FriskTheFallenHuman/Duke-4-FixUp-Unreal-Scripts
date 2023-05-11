/*******************************************************************************
 * ATCaptainLaser generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ATCaptainLaser extends dnContinuousFireWeapon;

function AdjustProjectileSpawn(out Vector SpawnLocation, out Rotator SpawnRotation)
{
    SpawnRotation = RVar(SpawnRotation + Rot(200, -200, 0), Rot(200, 200, 0));
    super(Weapon).AdjustProjectileSpawn(SpawnLocation, SpawnRotation);
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    // End:0xA1
    if(PrecacheIndex.EmptyAnimChannel(self))
    {
        PrecacheIndex.RegisterAnimationControllerEntry(class'crosshair_atc_fb');
        PrecacheIndex.InitAnimationControllerEx(VoicePack, 'Activate');
        PrecacheIndex.InitAnimationControllerEx(VoicePack, 'Deactivate');
        PrecacheIndex.InitAnimationControllerEx(VoicePack, 'SpinUp');
        PrecacheIndex.InitAnimationControllerEx(VoicePack, 'SpinDn');
        PrecacheIndex.InitAnimationControllerEx(class'VoicePack_Duke', 'shrinkray_melee');
    }
    return;
}

defaultproperties
{
    WeaponConfig='ATCaptainLaserWeaponConfig'
    HUDAmmoClipIcon=13
    DOFWeapDist=7
    CrosshairIndex=2
    CommandAlias="UseWeapon dnGame.ATCaptainLaser"
    InventoryReferenceClass='ATCaptainLaser'
    PickupClass='ATCaptainLaserPickup'
    bIsPrimaryWeapon=true
    HUDPickupEventIcon=21
    AutoRegisterIKClasses(0)='IKSystemInfo_Shotgun'
    AnimationControllerClass='dnAnimationControllerEx_ATCaptainLaser'
    Mesh='c_dnWeapon.at_capt_gun'
    SoundVolume=200
    SoundRadius=1600
    SoundInnerRadius=800
    VoicePack='SoundConfig.Inventory.VoicePack_AT_Hyperblaster'
}