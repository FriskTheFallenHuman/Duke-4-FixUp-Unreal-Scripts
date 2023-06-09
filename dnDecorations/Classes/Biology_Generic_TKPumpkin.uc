/*******************************************************************************
 * Biology_Generic_TKPumpkin generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Biology_Generic_TKPumpkin extends Biology_Generic;

var class<dnScreenSplatters> ScreenSplatterClass;
var bool bIsTKed;

function StartTelekinesis(Pawn TKOwner)
{
    // End:0x17
    if(MountParent == none)
    {
        DestroyOnDismount = false;
        GetGravity();
    }
    bIsTKed = true;
    SetRotation(18);
    super(InteractiveActor).StartTelekinesis(TKOwner);
    return;
}

event KImpact(name SelfBoneName, KarmaActor Other, name OtherBoneName, Vector Position, Vector ImpactVelocity, Vector ImpactNormal)
{
    super(dnDecoration).KImpact(SelfBoneName, Other, OtherBoneName, Position, ImpactVelocity, ImpactNormal);
    // End:0x33
    if(bIsTKed)
    {
        CriticalDamage();
    }
    return;
}

simulated event Destroyed()
{
    local dnScreenSplatters ScreenSplatter;

    ScreenSplatter = dnScreenSplatters(FindStaticActor(ScreenSplatterClass));
    // End:0x44
    if(ScreenSplatter == none)
    {
        ScreenSplatter.SetDesiredRotation(Location);
        ScreenSplatter.ExecuteEffect();
    }
    super(dnDecoration).Destroyed();
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.RegisterMaterialClass(ScreenSplatterClass);
    return;
}

defaultproperties
{
    ScreenSplatterClass='dnScreenSplatter_Pumpkin'
    DestroyedActivities(0)=none
    DestroyedActivities(1)=DecoActivities_Sound'Biology_Generic_DestructiblePumpkin.DA_Sound_DestructiblePumpkin_Destroyed'
    DestroyActionPointRadius=60
    HealthPrefab=5
    DamageTypesInstaKill(0)='Engine.ExplosionDamage'
    DamageTypesInstaKill(1)='dnGame.RocketDamage'
    DamageIgnoreRules(0)=(QualifierInstigatorType='Engine.BaseAI',QualifierNetMode=0,MinDistanceFromLocalPlayer=0,MaxDistanceFromLocalPlayer=250)
    bTelekineticable=true
    TelekinesisThrowVel=2000
    Health=40
    HealthCap=40
    SpawnOnDestroyed(0)=(SpawnClass='Biology_Generic_DestructiblePumpkin_Gibs',RenderObject='sm_geo_decorations.alien.alien_Egg01_Gib',DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-17.01736,Y=-3.933945,Z=28.29331),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    SpawnOnDestroyed(1)=(SpawnClass='Biology_Generic_DestructiblePumpkin_Gibs',RenderObject='sm_geo_decorations.alien.alien_Egg02_Gib',DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-7.745758,Y=-19.01144,Z=18.29897),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    SpawnOnDestroyed(2)=(SpawnClass='Biology_Generic_DestructiblePumpkin_Gibs',RenderObject='sm_geo_decorations.alien.alien_Egg03_Gib',DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=8.199097,Y=1.137817,Z=39.29257),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    SpawnOnDestroyed(3)=(SpawnClass='Biology_Generic_DestructiblePumpkin_Gibs',RenderObject='sm_geo_decorations.alien.alien_Egg04_Gib',DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-10.64261,Y=4.717133,Z=5.298759),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    SpawnOnDestroyed(4)=(SpawnClass='Biology_Generic_DestructiblePumpkin_Gibs',RenderObject='sm_geo_decorations.alien.alien_Egg05_Gib',DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=16.1532,Y=-8.601746,Z=7.285698),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    DestroyedParticleFriendEffects(0)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=0,BoneName=None,Location=(X=0,Y=0,Z=0),Rotation=(Pitch=16384,Yaw=0,Roll=0),Effect='p_Decorations.Alien_Egg_Pop.Alien_Egg_Pop_Spawner')
    DefaultMotionPrefab=MotionPrefab'Biology_Generic_DestructiblePumpkin.MP_DestructiblePumpkin_Gibs'
    bCanBreakGlass=true
    bTickOnlyWhenPhysicsAwake=true
    DynamicInteractionClassification=0
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Flesh'
    KImpactThreshold=100000
    FixedPhysicsDamageToNotPlayer=50
    FixedPhysicsDamageToPlayer=40
    PhysicsEntityGroup=DestructiblePumpkin
    bAITransparent=true
    bStepUpAble=false
    bAutoNavDoor=true
    CollisionRadius=25
    CollisionHeight=25
    VisibleCollidingCenterOffset=(X=0,Y=0,Z=11)
    Mass=50
    StaticMesh='sm_geo_decorations.alien.alien_egg1'
}