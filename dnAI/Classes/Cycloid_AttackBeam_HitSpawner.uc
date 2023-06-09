/*******************************************************************************
 * Cycloid_AttackBeam_HitSpawner generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Cycloid_AttackBeam_HitSpawner extends Actor
    collapsecategories
    notplaceable;

var() class<dnFriendFX_Spawners> HitClass;
var() class<dnFriendFX_Spawners> ExplosionClass;
var() class<dnDecal> DecalClass;
var() float Delay;
var() float Damage;
var() float DamageRadius;

event PostBeginPlay()
{
    local dnFriendFX_Spawners HitSpawner;

    super.PostBeginPlay();
    ExecuteSpawnEffects();
    return;
}

event Tick(float Delta)
{
    Delay -= Delta;
    // End:0x24
    if(Delay <= 0)
    {
        ExecuteEffects();
        RemoveTouchClass();
    }
    return;
}

final function ExecuteSpawnEffects()
{
    local dnFriendFX_Spawners ExplosionSpawner;
    local Decal SpawnedDecal;
    local Rotator DecalRot;

    DecalRot = Rotator(- Vector(Rotation));
    StaticAttachDecal(DecalClass, Location, DecalRot);
    ExplosionSpawner = FindFriendSpawner(HitClass);
    ExplosionSpawner.SetDesiredRotation(Location);
    ExplosionSpawner.DisableDesiredRotation_Roll(Rotation);
    ExplosionSpawner.ExecuteEffect(true);
    HurtRadius(Damage, Location, DamageRadius, DamageRadius, class'ExplosionDamage');
    return;
}

final function ExecuteEffects()
{
    local dnFriendFX_Spawners ExplosionSpawner;
    local Decal SpawnedDecal;
    local Rotator DecalRot;

    DecalRot = Rotator(- Vector(Rotation));
    StaticAttachDecal(DecalClass, Location, DecalRot);
    ExplosionSpawner = FindFriendSpawner(ExplosionClass);
    ExplosionSpawner.SetDesiredRotation(Location);
    ExplosionSpawner.DisableDesiredRotation_Roll(Rotation);
    ExplosionSpawner.ExecuteEffect(true);
    HurtRadius(Damage, Location, DamageRadius, DamageRadius, class'ExplosionDamage');
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.RegisterMaterialClass(HitClass);
    PrecacheIndex.RegisterMaterialClass(ExplosionClass);
    PrecacheIndex.RegisterMaterialClass(DecalClass);
    return;
}

defaultproperties
{
    HitClass='p_Creatures.cycloid.Cycloid_BeamHit_Spawner'
    ExplosionClass='p_Creatures.cycloid.Cycloid_BeamExplosions_Spawner'
    DecalClass='dnParticles.dnDecal_BlastMarkBlack'
    Delay=0.65
    Damage=10
    DamageRadius=50
    bHidden=true
}