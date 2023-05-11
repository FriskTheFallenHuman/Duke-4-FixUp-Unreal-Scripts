/*******************************************************************************
 * RCCar_Headlight generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class RCCar_Headlight extends VehicleHeadlightBase
    collapsecategories
    hidecategories(Collision,Filter,HeatVision,Interactivity,Karma,KarmaObject,KarmaOverride,Networking,SpawnOnDestroyed);

defaultproperties
{
    bInitiallyOn=false
    eToggleOnStyle=1
    eToggleOffStyle=1
    fStateChangeTime=0.35
    LightRadius=400
    bSpotLight=true
    bLightShaft=true
    SpotLightTexture='dt_cubemaps.lights_faces.CarLights'
    LightShaftBrightness=0.5
    ShaftEdgeFadeDist=32
    AttenuationMode=1
    AttenuationMap='dt_effects.AttenuationMaps.AttenGradient_4SC'
    bSkipVisibilityUpdate=true
    RespectLightingTags=2
    bAlwaysVisible=true
    bDirectional=true
}