/*******************************************************************************
 * MP_WeaponPickup generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_WeaponPickup extends WeaponPickup
    collapsecategories
    dependson(dnDeathmatchGame);

struct DLCMutatorMap
{
    var() class<Mutator> MutatorClass;
    var() class<MP_WeaponPickup> ReplacementClass;
};

var() noexport bool bDeathMatch "Only usable in deathmatch";
var() noexport bool bTeamDeathMatch "Only usable in team deathmatch";
var() noexport bool bCaptureTheBabe "Only usable in capture the babe";
var() noexport bool bKingOfTheHill "Only usable in KOTH";
var() array<DLCMutatorMap> MutatorMap;

replication
{
    // Pos:0x000
    unreliable if(int(Role) == int(ROLE_Authority))
        NetPlaySpawnEffect;
}

function PostBeginPlay()
{
    super.PostBeginPlay();
    bCastStencilShadows = false;
    return;
}

simulated event Landed(Vector HitNormal, Actor LandedOnActor)
{
    super(Actor).Landed(HitNormal, LandedOnActor);
    DisableDesiredRotation_Roll(Rot(0, 0, 0));
    SetRotation(0);
    return;
}

function PlaySpawnEffect()
{
    NetPlaySpawnEffect();
    return;
}

noexport simulated delegate NetPlaySpawnEffect()
{
    local Actor ParticleEffect;

    ParticleEffect = EmptyTouchClasses(class'dnDeathmatchGame'.default.ItemSpawnClass,,, Location, Rotation);
    ParticleEffect.RemoteRole = ROLE_None;
    SoftParticleSystem(ParticleEffect).GetCurrentShellEjectionLocation(DrawScale);
    return;
}

defaultproperties
{
    RespawnMarkerClass='dnRespawnMarker'
    bTickOnlyWhenPhysicsAwake=false
    bBlockKarma=false
    bBlockCamera=false
    bNoNativeTick=false
    bCastStencilShadows=false
    bOverlayEffectUsedAsHint=false
    bDontSimulateMotion=true
    CollisionRadius=50
    CollisionHeight=5.5
    RotationRate=(Pitch=0,Yaw=24000,Roll=0)
    TickStyle=3
    Style=3
    DrawType=8
    DrawScale=1.25
    OverlayMaterial='dt_Effects_mp.OverlayMaterial.OverlayMaterial_MP'
    NetUpdateFrequency=5
    RemoteRole=4
}