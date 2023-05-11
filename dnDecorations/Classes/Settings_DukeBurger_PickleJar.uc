/*******************************************************************************
 * Settings_DukeBurger_PickleJar generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Settings_DukeBurger_PickleJar extends Settings_DukeBurger
    collapsecategories;

simulated event Destroyed()
{
    local dnScreenSplatter_PickleJuice ScreenSplatter;

    ScreenSplatter = dnScreenSplatter_PickleJuice(FindStaticActor(class'dnScreenSplatter_PickleJuice'));
    // End:0x44
    if(ScreenSplatter == none)
    {
        ScreenSplatter.SetDesiredRotation(Location);
        ScreenSplatter.ExecuteEffect();
    }
    super(dnDecoration).Destroyed();
    return;
}

simulated function SpawnOnDestroyedActivity()
{
    super(RenderActor).SpawnOnDestroyedActivity();
    class'DecalBomb'.static.StaticDeploy(class'PickleJuice_SplatterBomb', Location, Rotation, self, self);
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.RegisterMaterialClass(class'dnScreenSplatter_PickleJuice');
    PrecacheIndex.RegisterMaterialClass(class'PickleJuice_SplatterBomb');
    return;
}

defaultproperties
{
    DestroyedActivities(0)=none
    begin object name=DA_Sound_PickleJar_Destroyed class=DecoActivities_Sound
        SoundNames(0)=DukeSauceJar_Break
    object end
    // Reference: DecoActivities_Sound'Settings_DukeBurger_PickleJar.DA_Sound_PickleJar_Destroyed'
    DestroyedActivities(1)=DA_Sound_PickleJar_Destroyed
    HealthPrefab=5
    DamageThreshold=1
    Health=1
    SpawnOnDestroyedSimple(0)='p_Impacts.dukesauce.Splatter_Pickles'
    SpawnOnDestroyed(0)=(SpawnClass='Settings_DukeBurger_PickleJar_Gib_B',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-1.291,Y=3.962,Z=8.803),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    SpawnOnDestroyed(1)=(SpawnClass='Settings_DukeBurger_PickleJar_Gib_C',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=0.001,Y=-5.273,Z=-1.733),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    SpawnOnDestroyed(2)=(SpawnClass='Settings_DukeBurger_PickleJar_Gib_D',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-5.39,Y=4.051,Z=-1.615),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    SpawnOnDestroyed(3)=(SpawnClass='Settings_DukeBurger_PickleJar_Gib_E',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=2.368,Y=-0.469,Z=-14.985),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    SpawnOnDestroyed(4)=(SpawnClass='Settings_DukeBurger_Pickle',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=0,Y=0,Z=15),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    SpawnOnDestroyed(5)=(SpawnClass='Settings_DukeBurger_Pickle_Gib',RenderObject=none,DrawScale=0,DrawScaleVariance=0,DrawScale3D=(X=0,Y=0,Z=0),SpawnChance=0,SpawnCopies=0,SpawnCopiesVariance=0,bIgnorePawnAirCushion=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bNoCollision=false,bFindSpot=false,bIgnoreParentRotation=false,bTakeParentCollisionSize=false,bTakeParentMounting=false,bTakeParentActorColors=false,bTakeParentSkins=false,Offset=(X=-3,Y=-3,Z=19),OffsetVariance=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),RotationVariance=(Pitch=0,Yaw=0,Roll=0),BoneName=None,MotionInfo=none)
    bTickOnlyWhenPhysicsAwake=true
    DynamicInteractionClassification=7
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Glass'
    PhysicsMassType=1
    MinDamageVelocity=80
    MaxImpactDamage=10
    FixedPhysicsDamageToNotPlayer=1
    bAITransparent=true
    CollisionRadius=10
    CollisionHeight=15
    Mass=10
    PrePivot=(X=0,Y=0,Z=15)
    StaticMesh='sm_class_decorations.Kitchen.jar_pickle'
}