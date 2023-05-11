/*******************************************************************************
 * dnObjectiveMarker generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnObjectiveMarker extends InteractiveActor
    collapsecategories;

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    GetZoneLastRenderTime(true);
    return;
}

defaultproperties
{
    bCastStencilShadows=false
    bDontHardwareOcclude=true
    bDoOverlayEffect=true
    bAlwaysRelevant=true
    RotationRate=(Pitch=0,Yaw=24000,Roll=0)
    TickStyle=1
    DrawType=8
    DrawScale=0.1
    OverlayMaterial='dt_Effects_mp.IconsGiveGet.IconGet_FB'
    StaticMesh='SM_Multiplayer.MP_Icons.Icon_Get'
    RemoteRole=0
}