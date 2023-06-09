/*******************************************************************************
 * dnCaptureTheBabe_DiscoBallLights generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnCaptureTheBabe_DiscoBallLights extends LightEx
    collapsecategories
    hidecategories(Collision,Filter,HeatVision,Interactivity,Karma,KarmaObject,KarmaOverride,Networking,SpawnOnDestroyed);

simulated function PostBeginPlay()
{
    super(RenderActor).PostBeginPlay();
    // End:0x33
    if(int(dnCaptureTheBabe_BabeArea(Owner).Team) == 1)
    {
        LightColor = NewColorBytes(255, 81, 85);
    }
    return;
}

defaultproperties
{
    LightRadius=512
    LightRadius3D=(X=1,Y=0.212556,Z=0.212556)
    LightColor=(R=98,G=98,B=255,A=0)
    bSpotLight=true
    bLightShaft=true
    LightCubeMap='dt_cubemaps.Lights.CubicCarLights'
    LightCubeScale=(X=1,Y=0.212556,Z=0.212556)
    LightFOV=24
    LightShaftStart=256
    LightShaftEndScale=1.5
    MaxLightShaftSlices=8
    ShaftEdgeFadeDist=16
    ShaftPanXSpeed=0.05
    ShaftPanYSpeed=0.05
    bCastStencilShadows=false
    DrawType=0
}