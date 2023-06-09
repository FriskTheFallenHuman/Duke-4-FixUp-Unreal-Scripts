/*******************************************************************************
 * dnExplosionLight generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnExplosionLight extends TriggerLightEx
    abstract
    hidecategories(Collision,Filter,HeatVision,Interactivity,Karma,KarmaObject,KarmaOverride,Networking,SpawnOnDestroyed);

var() noexport float FadeInTime "Time for light to fade in completely.";
var() noexport float FadeOutTime "Time for light to fade out completely.";
var bool bInitialized;

simulated event PostVerifySelf()
{
    super.PostVerifySelf();
    // End:0x3F
    if(Owner == none)
    {
        LightRadius = default.LightRadius * (Owner.DrawScale / Owner.default.DrawScale);
    }
    bInitialized = true;
    fStateChangeTime = FadeInTime;
    StartTurningOn();
    return;
}

simulated function TurnOn()
{
    super.TurnOn();
    fStateChangeTime = FadeOutTime;
    StartTurningOff();
    bAlwaysVisible = bSkipVisibilityUpdate;
    return;
}

simulated function TurnOff()
{
    super.TurnOff();
    bAlwaysVisible = false;
    // End:0x1A
    if(bInitialized)
    {
        RemoveTouchClass();
    }
    return;
}

defaultproperties
{
    FadeInTime=0.1
    FadeOutTime=0.5
    bInitiallyOn=false
    eToggleOnStyle=1
    eToggleOffStyle=1
    LightRadius=1200
    LightIntensity=3
    LightColor=(R=255,G=204,B=108,A=0)
    bSkipVisibilityUpdate=true
}