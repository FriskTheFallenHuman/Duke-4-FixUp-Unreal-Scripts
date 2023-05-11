/*******************************************************************************
 * Veh_RCCar_Light generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Veh_RCCar_Light extends LightEx
    collapsecategories
    hidecategories(Collision,Filter,HeatVision,Interactivity,Karma,KarmaObject,KarmaOverride,Networking,SpawnOnDestroyed);

defaultproperties
{
    LightStyle=0
    LightRadius=6
    LightIntensity=0.75
    LightRadius3D=(X=1.25,Y=1,Z=2)
    LightColor=(R=126,G=154,B=165,A=0)
    AttenuationMap='dt_effects.AttenuationMaps.AttenGradient_2SC'
    bCastStencilShadows=false
    bSkipVisibilityUpdate=true
    bAlwaysVisible=true
    DrawScale=0.25
    RemoteRole=0
}