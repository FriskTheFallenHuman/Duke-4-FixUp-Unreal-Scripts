/*******************************************************************************
 * Plants_Generic_Cactus_Stem_B generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Plants_Generic_Cactus_Stem_B extends Plants_Generic_Cactus
    collapsecategories;

defaultproperties
{
    SpawnOnDestroyed(0)=(SpawnClass='Plants_Generic_Cactus_Gib_A',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=1,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=0,Y=0,Z=0),OffsetVariance=(X=12.12,Y=20,Z=14),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Plants_Generic_Cactus.MP_Cactus_Gibs')
    SpawnOnDestroyed(1)=(SpawnClass='Plants_Generic_Cactus_Gib_B',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=1,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=0,Y=0,Z=0),OffsetVariance=(X=12.12,Y=20,Z=14),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Plants_Generic_Cactus.MP_Cactus_Gibs')
    SpawnOnDestroyed(2)=(SpawnClass='Plants_Generic_Cactus_Gib_C',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=1,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=0,Y=0,Z=0),OffsetVariance=(X=12.12,Y=20,Z=14),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Plants_Generic_Cactus.MP_Cactus_Gibs')
    SpawnOnDestroyed(3)=(SpawnClass='Plants_Generic_Cactus_Gib_E',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=1,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=0,Y=0,Z=0),OffsetVariance=(X=12.12,Y=20,Z=14),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Plants_Generic_Cactus.MP_Cactus_Gibs')
    SpawnOnDestroyed(4)=(SpawnClass='Plants_Generic_Cactus_Gib_B',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0.5,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=0,Y=0,Z=0),OffsetVariance=(X=12.12,Y=20,Z=14),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=MotionPrefab'Plants_Generic_Cactus.MP_Cactus_Gibs')
    DestroyedParticleFriendEffects(0)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=0,BoneName=None,Location=(X=-0.184,Y=2.907,Z=-56.961),Rotation=(Pitch=0,Yaw=0,Roll=0),Effect='p_Decorations.Cactus.Cactus_Carhit_Spawner')
    DestroyedParticleFriendEffects(1)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=0,BoneName=None,Location=(X=-9.37,Y=-0.462,Z=24.004),Rotation=(Pitch=0,Yaw=0,Roll=0),Effect='p_Decorations.Cactus.Cactus_Carhit_Spawner')
    DestroyedParticleFriendEffects(2)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=0,BoneName=None,Location=(X=9.135,Y=2.335,Z=-15.051),Rotation=(Pitch=0,Yaw=0,Roll=0),Effect='p_Decorations.Cactus.Cactus_Carhit_Spawner')
    CollisionRadius=36
    CollisionHeight=138
    StaticMesh='sm_class_decorations.plants.Cactus_1'
}