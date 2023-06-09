/*******************************************************************************
 * dnRailgunSmokeTracer generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnRailgunSmokeTracer extends SoftParticleSystem
    collapsecategories
    hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

var class<SoftParticleSystem> TracerParticleClass;
var SoftParticleSystem TracerParticle;
var int TracerParticleIndex;
var SRequestingParticleInfo SmokeParticleInfo;
var float SpawnDelay;
var float NextSpawnTime;

simulated function PostBeginPlay()
{
    local Particle P;

    super(InteractiveActor).PostBeginPlay();
    // End:0xF1
    if(TracerParticleClass == none)
    {
        TracerParticle = SoftParticleSystem(FindStaticActor(TracerParticleClass));
        // End:0xF1
        if(TracerParticle == none)
        {
            TracerParticle.SetDesiredRotation(Location);
            TracerParticle.DisableDesiredRotation_Roll(Rotation);
            TracerParticle.DieOutsideRadius = DieOutsideRadius;
            TracerParticle.SystemSizeScale = SystemSizeScale;
            TracerParticleIndex = TracerParticle.InitializeFriends(1);
            // End:0xF1
            if(TracerParticle.ParticleHurtRadius(TracerParticleIndex, P))
            {
                ResetParticleSystem(TracerParticle, P, SmokeParticleInfo);
                NextSpawnTime = Level.GameTimeSeconds + SpawnDelay;
                TraceFire(P.RemainingLifetime, false, 'StopSpawning');
            }
        }
    }
    return;
}

final simulated function StopSpawning()
{
    TracerParticle = none;
    TracerParticleIndex = -1;
    DestroyWhenEmpty = true;
    return;
}

simulated event Tick(float DeltaSeconds)
{
    local Particle P;

    super(Actor).Tick(DeltaSeconds);
    // End:0x8B
    if((TracerParticle == none) && TracerParticleIndex != -1)
    {
        // End:0x8B
        if((Level.GameTimeSeconds >= NextSpawnTime) && TracerParticle.ParticleHurtRadius(TracerParticleIndex, P))
        {
            ResetParticleSystem(TracerParticle, P, SmokeParticleInfo);
            NextSpawnTime = Level.GameTimeSeconds + SpawnDelay;
        }
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(InteractiveActor).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.RegisterMaterialClass(TracerParticleClass);
    return;
}

defaultproperties
{
    TracerParticleClass='p_Weapons.Sniper_Tracer.Sniper_Tracer_Flash01'
    SmokeParticleInfo=(bMatchLocation=true,bMatchRotation=false,bMatchScale=false,bRelativeVelocity=false,bRelativeAcceleration=false,bInheritVelocity=false,bInheritAcceleration=false)
    SpawnDelay=0.01
    Enabled=false
    RelativeSpawn=true
    RelativeSpawnVelocity=true
    UseZoneGravity=false
    DieOutsideWorld=true
    DieZoneNotRendered=true
    UseLines=true
    Connected=true
    bRandomFlipTextureX=true
    bRandomFlipTextureY=true
    SpawnNumber=0
    Lifetime=2
    InitialVelocity=(X=0,Y=0,Z=0)
    MaxVelocityVariance=(X=50,Y=5,Z=5)
    MaxAccelerationVariance=(X=15,Y=15,Z=15)
    RealtimeVelocityVariance=(X=15,Y=15,Z=15)
    AlphaMid=1
    AlphaEnd=0
    LineStartWidth=2
    LineEndWidth=2
    Textures(0)='dt_Effects2.Smoke.SkokeLine_01'
    StartDrawScale=375
    EndDrawScale=375
    DrawScaleEndVariance=0
    DrawScaleMidVariance=0
    NonFinalBlendBloomTint=(R=27,G=108,B=139,A=0)
    KLinearDamping=1
    KAngularDamping=1
    bNoNativeTick=false
    bTickOnlyRecent=false
    bTickOnlyZoneRecent=false
    CollisionRadius=0
    CollisionHeight=0
    TickStyle=3
    Style=3
    AlphaSortGroup=10
}