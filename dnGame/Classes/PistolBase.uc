/*******************************************************************************
 * PistolBase generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PistolBase extends Weapon
    abstract;

const PISTOLBASE_WS_IdleLarge = 16;

struct SPistolInfo
{
    var travel RenderActor PistolActor;
    var() travel int BulletsFired;
    var() travel int MaxBulletsInClip;
    var() travel int MaxBulletsInChamber;
};

var() float LargeIdleChance;
var() float MinimumLargeIdleDelay;
var float LastLargeIdleTime;
var bool bCanSpin;
var() float BaseDamagePerShot;
var int ReservedAmmo;
var bool bKilledSuccess;
var float KilledSuccessTime;

simulated function KillSuccessAnim()
{
    bKilledSuccess = true;
    KilledSuccessTime = Level.GameTimeSeconds;
    return;
}

simulated function int CalculateReservedAmmo()
{
    return;
}

simulated function NoteIntigatorTookDamage()
{
    bCanSpin = false;
    Destroy(30, false, 'AllowSpin');
    return;
}

simulated function WpnIdle()
{
    // End:0x8C
    if(bKilledSuccess)
    {
        bKilledSuccess = false;
        // End:0x8C
        if((((((Level.GameTimeSeconds - KilledSuccessTime) < 2) && FRand() < LargeIdleChance) && ! Instigator.IsZoomedIn()) && CanSpin()) && ! Instigator.PhysicsVolume.bWaterVolume)
        {
            SetWeaponState(16);
            return;
        }
    }
    // End:0x11A
    if(((((Level.GameTimeSeconds - LastLargeIdleTime) > MinimumLargeIdleDelay) && ! Instigator.IsZoomedIn()) && CanSpin()) && ! Instigator.PhysicsVolume.bWaterVolume)
    {
        LastLargeIdleTime = Level.GameTimeSeconds;
        // End:0x11A
        if(FRand() < LargeIdleChance)
        {
            SetWeaponState(16);
            return;
        }
    }
    super.WpnIdle();
    return;
}

simulated function name GetWeaponAnimReq(byte WeaponStateReq, optional out byte byForceReset)
{
    // End:0x13
    if(int(WeaponStateReq) == 16)
    {
        return 'IdleLarge';
    }
    return super.GetWeaponAnimReq(WeaponStateReq, byForceReset);
    return;
}

simulated function UpdateBullets(out SPistolInfo PistolInfo)
{
    local int BulletsLeft;

    ++ PistolInfo.BulletsFired;
    BulletsLeft = Min(PistolInfo.MaxBulletsInChamber, AmmoLoaded);
    return;
}

simulated function float GetBaseFiringDamage()
{
    return Instigator.TraceFireDamageMultiplier * BaseDamagePerShot;
    return;
}

simulated function AllowSpin()
{
    bCanSpin = true;
    return;
}

simulated function bool CanSpin()
{
    local PlayerPawn P;

    // End:0x3C
    if(bCanSpin)
    {
        P = PlayerPawn(Owner);
        // End:0x3C
        if((P == none) && P.bIsSprinting)
        {
            return false;
        }
    }
    return bCanSpin;
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
    // End:0x5E
    if(bCanSpin)
    {
        PrecacheIndex.SetChannelGridState('IdleLarge', AnimationControllerClass, Mesh);
        PrecacheIndex.SetAnimPairState(CompositeNames(string(WeaponConfig.default.WeaponAnimName) $ "IdleLarge"));
    }
    return;
}

state idle
{
    simulated event EndState()
    {
        // End:0x19
        if(StopSound(14))
        {
            ClearAnimAll(14, 0.2, 0, 2);
        }
        super(Object).EndState();
        return;
    }
    stop;
}

defaultproperties
{
    LargeIdleChance=0.5
    MinimumLargeIdleDelay=20
    bCanSpin=true
}