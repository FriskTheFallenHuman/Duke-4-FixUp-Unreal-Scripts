/*******************************************************************************
 * MP_Steroids generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_Steroids extends MP_Weapon;

var() float SteroidsDuration;

simulated function bool CanDeactivate()
{
    return bDeactivationAllowed && DukeMultiPlayer(Instigator).usingInventoryItem == false;
    return;
}

simulated event bool CanActivateNow()
{
    // End:0x15
    if(Instigator.bOnSteroids)
    {
        return false;
    }
    // End:0x4C
    if((Instigator.HeadVolume == none) && Instigator.HeadVolume.bWaterVolume)
    {
        return false;
    }
    // End:0x69
    if(DukeMultiPlayer(Instigator).usingInventoryItem == true)
    {
        return false;
    }
    // End:0x86
    if(DukeMultiPlayer(Instigator).CarriedActor == none)
    {
        return false;
    }
    return super(Weapon).CanActivateNow();
    return;
}

animevent function Swallow(optional EventInfo AnimEventInfo)
{
    // End:0x2D
    if(Instigator.bIsPlayerPawn)
    {
        PlayerPawn(Instigator).StartSteroids(SteroidsDuration);
    }
    Charge -= 1;
    return;
}

simulated function name GetWeaponAnimReq(byte WeaponStateReq, optional out byte byForceReset)
{
    // End:0x17
    if(int(WeaponStateReq) == int(1))
    {
        return 'SteroidsActivate';        
    }
    else
    {
        // End:0x2B
        if(int(WeaponStateReq) == int(2))
        {
            return 'SteroidsDeactivate';
        }
    }
    return super(Weapon).GetWeaponAnimReq(WeaponStateReq, byForceReset);
    return;
}

simulated function float GetClipPCT()
{
    return 1;
    return;
}

simulated function Tick(float DeltaTime)
{
    local PlayerPawn P;
    local Rotator DesiredView;

    super(Weapon).Tick(DeltaTime);
    // End:0x87
    if(Instigator.bIsPlayerPawn)
    {
        P = PlayerPawn(Instigator);
        DesiredView = Rot(0, P.ViewRotation.Yaw, 0);
        P.ViewRotation = Slerp(FMin(1, DeltaTime * 8), P.ViewRotation, DesiredView);
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.RegisterMaterialClass(class'DukeMultiplayerAssets'.default.SteroidHandsEffectClass);
    PrecacheIndex.RegisterAnimationControllerEntry(class'DukeMultiplayerAssets'.default.SteroidHUDEffectMaterial);
    PrecacheIndex.RegisterAnimationControllerEntry(class'DukeMultiplayerAssets'.default.SteroidHUDEffectMaterial2);
    PrecacheIndex.RegisterAnimationControllerEntry(class'Steroids');
    PrecacheIndex.RegisterAnimationControllerEntry(class'steroids_glow');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'lidpop');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'clatter');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'chew');
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'gulp');
    PrecacheIndex.InitAnimationControllerEx(class'DukePlayer'.default.VoicePack, 'Steroid_Lines');
    PrecacheIndex.GetColorForPosition(class'DukePlayer'.default.SteroidsLoop);
    return;
}

state Activating
{
    simulated function BeginState()
    {
        DukeMultiPlayer(Instigator).usingInventoryItem = true;
        // End:0x61
        if(int(Level.NetMode) != int(NM_Client))
        {
            bDeactivationAllowed = false;
            // End:0x61
            if(Instigator.bIsPlayerPawn)
            {
                PlayerPawn(Instigator).ViewRotationMode = 2;
            }
        }
        super.BeginState();
        return;
    }
    stop;
}

state ActivateComplete
{
    simulated event BeginState()
    {
        local MP_MightyFoot MightyFootInv;

        // End:0x55
        if(int(Role) == int(ROLE_Authority))
        {
            // End:0x40
            if(DukeMultiPlayer(Instigator).IsLocallyControlled())
            {
                DukeMultiPlayer(Instigator).usingInventoryItem = false;                
            }
            else
            {
                DukeMultiPlayer(Instigator).ResetUsingInventory();
            }
        }
        // End:0xF3
        if(int(Level.NetMode) != int(NM_Client))
        {
            bDeactivationAllowed = true;
            // End:0x9F
            if(Instigator.bIsPlayerPawn)
            {
                PlayerPawn(Instigator).ViewRotationMode = 0;
            }
            MightyFootInv = MP_MightyFoot(Instigator.FindActivatableInventory(class'MP_MightyFoot'));
            // End:0xE3
            if(MightyFootInv == none)
            {
                Instigator.ChangeToWeapon(MightyFootInv);                
            }
            else
            {
                Instigator.BringUpLastWeapon();
            }
        }
        return;
    }
    stop;
}

state Deactivating
{
    simulated function DoneDeactivating()
    {
        super.DoneDeactivating();
        // End:0x17
        if(int(Role) == int(ROLE_Authority))
        {
            RemoveTouchClass();
        }
        return;
    }
    stop;
}

defaultproperties
{
    SteroidsDuration=21
    bQuickChangeTo=true
    bDrawLastWeaponHUD=true
    WeaponConfig='MP_SteroidsWeaponConfig'
    CommandAlias="UseWeapon dnGame.MP_UseSteroids"
    InventoryReferenceClass='MP_Steroids'
    bStoredInInventory=true
    Charge=1
    MaxCharge=3
    HUDPickupEventIcon=19
    AutoRegisterIKClasses(0)='IKSystemInfo_Steroids'
    bAnimateOffscreen=true
    AnimationControllerClass='dnAnimationControllerEx_Steroids'
    MountMeshItem=mount_camera
    Mesh='c_dukeitems.Steroids'
    VoicePack='SoundConfig.Inventory.VoicePack_Steroids'
}