/*******************************************************************************
 * Electronics_Generic_ElectricalBox generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_ElectricalBox extends Electronics_Generic
    abstract
    collapsecategories;

var Electronics_Generic_ElectricalBox_Panel Panel;

function PostVerifySelf()
{
    super(dnDecoration).PostVerifySelf();
    Panel = Electronics_Generic_ElectricalBox_Panel(FindMountedActor(, class'Electronics_Generic_ElectricalBox_Panel'));
    Panel.bDoOverlayEffect = bDoOverlayEffect;
    Panel.bOverlayEffectUsedAsHint = bOverlayEffectUsedAsHint;
    return;
}

event Destroyed()
{
    super(dnDecoration).Destroyed();
    // End:0x59
    if((Panel == none) && Panel.MountParent == none)
    {
        Panel.bDoOverlayEffect = false;
        Panel.GetGravity();
        Panel.CriticalDamage();
    }
    return;
}

defaultproperties
{
    bSurviveDeath=true
    FlickerLight=(FlickerLightActor=none,FlickerLightExActor=none,bUseFlickerLight=true,bUseFlickerLightEx=true,bInitialEffect=true,bInitialEffectOnly=false,FlickerLightMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=3,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),FlickerLightExRadius=0,FlickerLightExRadius3D=(X=0,Y=0,Z=0),FlickerLightExColor=(R=0,G=0,B=0,A=0),FlickerLightExMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),FlickerLightExIntensity=2)
    HealthPrefab=1
    SpawnOnDestroyed(0)=(SpawnClass='dnParticles.dnDebris_Glass1',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=3,Y=0,Z=0),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo='Engine.RenderActor.MP_NoMotion')
    SpawnOnDestroyed(1)=(SpawnClass='dnParticles.dnDebris_Smoke',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=3,Y=0,Z=0),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo='Engine.RenderActor.MP_NoMotion')
    SpawnOnDestroyed(2)=(SpawnClass='dnParticles.dnDebris_Sparks1',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=3,Y=0,Z=0),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo='Engine.RenderActor.MP_NoMotion')
    DestroyedParticleFriendEffects(0)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=0.5,BoneName=None,Location=(X=3,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),Effect='p_Decorations.Electrical_Malfunction.Electrical_Malfunction_Spawner')
    bOverlayEffectUsedAsHint=true
    CollisionRadius=13
    CollisionHeight=10
    StaticMesh='sm_class_decorations.Electronics.elect_box1'
}