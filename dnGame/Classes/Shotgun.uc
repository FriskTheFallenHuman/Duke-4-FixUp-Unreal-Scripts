/*******************************************************************************
 * Shotgun generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Shotgun extends Weapon;

var() float BaseDamagePerShot;
var() float HighBaseDamagePerShot;
var() float DamageFalloffStart;
var() float DamageFalloffEnd;
var() StaticMesh ReloadShellRenderObject;
var SMountPrefab UserReloadShellMount;
var WeaponClip ReloadShell;

simulated event PostBeginPlay()
{
    super(ActivatableInventory).PostBeginPlay();
    ReloadShell = EmptyTouchClasses(class'WeaponClip', self);
    // End:0x41
    if(ReloadShell == none)
    {
        ReloadShell.GetOverlayEffectAlpha(ReloadShellRenderObject);
        ReloadShell.GetZoneLastRenderTime(true);
    }
    return;
}

simulated function Destroyed()
{
    super.Destroyed();
    // End:0x1F
    if(ReloadShell == none)
    {
        ReloadShell.RemoveTouchClass();
    }
    return;
}

animevent simulated function Mount_Shell_User(optional EventInfo AnimEventInfo)
{
    // End:0x38
    if(Instigator.bIsPlayerPawn)
    {
        ReloadShell.GetZoneLastRenderTime(false);
        ReloadShell.SetPhysics(UserReloadShellMount, Instigator);
    }
    return;
}

animevent simulated function Shell_Inserted(optional EventInfo AnimEventInfo)
{
    DisableReloadShell();
    return;
}

final simulated function DisableReloadShell()
{
    ReloadShell.DestroyOnDismount = false;
    ReloadShell.GetGravity();
    ReloadShell.GetZoneLastRenderTime(true);
    return;
}

simulated function float GetBaseFiringDamage()
{
    return Instigator.TraceFireDamageMultiplier * BaseDamagePerShot;
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
    // End:0xF3
    if(PrecacheIndex.EmptyAnimChannel(self))
    {
        PrecacheIndex.RegisterAnimationControllerEntry(class'crosshair_shotgun_fb');
        PrecacheIndex.RegisterPawnAnimation(ReloadShellRenderObject);
        PrecacheIndex.RegisterMaterialClass(class'WeaponClip');
        PrecacheIndex.InitAnimationControllerEx(VoicePack, 'Activate');
        PrecacheIndex.InitAnimationControllerEx(VoicePack, 'Deactivate');
        PrecacheIndex.InitAnimationControllerEx(VoicePack, 'Fire');
        PrecacheIndex.InitAnimationControllerEx(VoicePack, 'ShellEject');
        PrecacheIndex.InitAnimationControllerEx(VoicePack, 'ReloadShell');
        PrecacheIndex.InitAnimationControllerEx(VoicePack, 'ReloadCock');
        PrecacheIndex.InitAnimationControllerEx(class'VoicePack_Duke', 'shotgun_melee');
    }
    return;
}

state Firing
{
    simulated event float GetBaseDamage(Actor Victim, optional Pawn DamageInstigator, optional class<DamageType> DamageType, optional Vector HitDirection, optional Vector HitPosition, optional name BoneName, optional Vector SourceTraceOrigin)
    {
        local float Dist;

        // End:0x26
        if(HighBaseDamagePerShot == BaseDamagePerShot)
        {
            return Instigator.TraceFireDamageMultiplier * BaseDamagePerShot;
        }
        Dist = VSize(SourceTraceOrigin - HitPosition);
        // End:0x63
        if(Dist <= DamageFalloffStart)
        {
            return Instigator.TraceFireDamageMultiplier * HighBaseDamagePerShot;            
        }
        else
        {
            // End:0x8C
            if(Dist >= DamageFalloffEnd)
            {
                return Instigator.TraceFireDamageMultiplier * BaseDamagePerShot;                
            }
            else
            {
                return Instigator.TraceFireDamageMultiplier * Lerp((Dist - DamageFalloffStart) / (DamageFalloffEnd - DamageFalloffStart), HighBaseDamagePerShot, BaseDamagePerShot);
            }
        }
        return;
    }

    animevent simulated function WeaponCallback_MaybeDoneFiring()
    {
        ClearLockout();
        super.WeaponCallback_MaybeDoneFiring();
        return;
    }
    stop;
}

state Reloading
{
    simulated event EndState()
    {
        super.EndState();
        DisableReloadShell();
        return;
    }

    simulated function Fire(optional bool bContinueFire)
    {
        global.Fire();
        return;
    }

    simulated function bool CanFire()
    {
        return global.CanFire();
        return;
    }

    animevent simulated function WeaponCallback_MaybeDoneReloading()
    {
        // End:0x11
        if(! AttemptFire())
        {
            super.WeaponCallback_MaybeDoneReloading();
        }
        return;
    }

    animevent simulated function WeaponCallback_DefinitelyDoneReloading()
    {
        // End:0x11
        if(! AttemptFire())
        {
            super.WeaponCallback_DefinitelyDoneReloading();
        }
        return;
    }
    stop;
}

defaultproperties
{
    BaseDamagePerShot=10
    HighBaseDamagePerShot=15
    DamageFalloffStart=192
    DamageFalloffEnd=384
    ReloadShellRenderObject='sm_class_dukeitems.ShotGun_Shell_Casing.ShotGunShell_reload'
    UserReloadShellMount=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_handleft,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0)
    WeaponConfig='ShotgunWeaponConfig'
    AmmoLoaded=7
    HUDAmmoClipIcon=3
    DOFWeapDist=7.5
    DOFWeapDistDelta=1
    CrosshairIndex=7
    dnInventoryCategory=2
    dnCategoryPriority=1
    CommandAlias="UseWeapon dnGame.Shotgun"
    InventoryReferenceClass='Shotgun'
    PickupClass='ShotgunPickup'
    bIsPrimaryWeapon=true
    HUDPickupEventIcon=1
    AutoRegisterIKClasses(0)='IKSystemInfo_Shotgun'
    AnimationControllerClass='dnAnimationControllerEx_Shotgun'
    CollisionRadius=19
    CollisionHeight=6
    Mesh='c_dnWeapon.Shotgun'
    SoundVolume=255
    SoundRadius=3200
    SoundInnerRadius=1600
    VoicePack='SoundConfig.Inventory.VoicePack_Shotgun'
}