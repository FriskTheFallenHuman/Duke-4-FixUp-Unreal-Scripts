/*******************************************************************************
 * MP_MachineGun generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_MachineGun extends MP_dnContinuousFireWeapon;

var float BaseDamagePerShot;
var float StartingHorizShotError;
var float StartingVertShotError;
var float LastShotTime;
var float ErrorDeltaPerc;
var float MaxShotErrorTime;
var float ErrorGainPerShotPerc;
var int LastWeaponSeed;

simulated function float GetBaseFiringDamage()
{
    return Instigator.TraceFireDamageMultiplier * BaseDamagePerShot;
    return;
}

simulated event GetShotError(out float HorizShotError, out float VertShotError)
{
    local float ErrorPercLoss, TimeSeconds;
    local PlayerPawn l_Pawn;

    l_Pawn = PlayerPawn(Instigator);
    // End:0xBC
    if((l_Pawn == none) && LastWeaponSeed != l_Pawn.WeaponSeed)
    {
        LastWeaponSeed = l_Pawn.WeaponSeed;
        TimeSeconds = float(l_Pawn.WeaponSeed) * 0.001;
        ErrorPercLoss = (TimeSeconds - LastShotTime) / MaxShotErrorTime;
        ErrorDeltaPerc += ErrorPercLoss;
        ErrorDeltaPerc -= ErrorGainPerShotPerc;
        ErrorDeltaPerc = FClamp(ErrorDeltaPerc, 0, 1);
        LastShotTime = TimeSeconds;
    }
    HorizShotError = Lerp(ErrorDeltaPerc, WeaponConfig.default.HorizShotError, StartingHorizShotError);
    VertShotError = Lerp(ErrorDeltaPerc, WeaponConfig.default.VertShotError, StartingVertShotError);
    // End:0x13D
    if(Instigator.IsZoomedIn())
    {
        HorizShotError *= WeaponConfig.default.ZoomErrorPct;
        VertShotError *= WeaponConfig.default.ZoomErrorPct;
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.RegisterAnimationControllerEntry(class'crosshair_ripper_fb');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'Activate');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'Deactivate');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'ClipIn');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'ClipOut');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'Slide_Bck');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'Slide_Fwd');
    PrecacheIndex.InitAnimationControllerEx(class'VoicePack_Duke', 'machinegun_melee');
    return;
}

defaultproperties
{
    BaseDamagePerShot=18
    MaxShotErrorTime=2
    ErrorGainPerShotPerc=0.1
    bFiringSoundForFireStart=true
    WeaponConfig='MP_MachineGunWeaponConfig'
    AmmoLoaded=50
    HUDAmmoClipIcon=2
    DOFWeapDist=9
    DOFWeapDistDelta=2
    CrosshairIndex=6
    FullClipRenderObject='sm_class_dukeitems.Ripper_Ammo.ripper_clip_full'
    EmptyClipRenderObject='sm_class_dukeitems.Ripper_Ammo.ripper_clip_empty'
    UserInsertClipMount=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_handleft,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0)
    WeaponClipMount=(bDontActuallyMount=false,bHideable=true,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_magazine,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0)
    EmptyClipPhysMaterial='dnMaterial.dnPhysicsMaterial_EmptyClip'
    dnInventoryCategory=2
    dnCategoryPriority=2
    CommandAlias="UseWeapon dnGame.MP_MachineGun"
    InventoryReferenceClass='MP_MachineGun'
    PickupClass='MP_MachineGunPickup'
    bIsPrimaryWeapon=true
    HUDPickupEventIcon=2
    AutoRegisterIKClasses(0)='IKSystemInfo_Shotgun'
    AnimationControllerClass='dnAnimationControllerEx_MachineGun'
    Mesh='c_dnWeapon.MachineGun'
    SoundVolume=200
    SoundRadius=2048
    SoundInnerRadius=512
    VoicePack='SoundConfig.Inventory.VoicePack_MachineGun'
}