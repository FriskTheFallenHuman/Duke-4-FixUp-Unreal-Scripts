/*******************************************************************************
 * Cannister_Generic_Green generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Cannister_Generic_Green extends Cannister_Generic
    collapsecategories;

var(Thrust) noexport float IgnitionTime "Time delay before the Thrust kicks in.";
var(Thrust) noexport float ThrustMagnitude "Maximum magnitude of the thrust.";
var(Thrust) noexport float ThrustAttack "Time over which to ramp up the thrust.";
var(Thrust) noexport float ThrustSustain "Time over which to sustain the maximum thrust.";
var(Thrust) noexport float ThrustDecay "Time over which to ramp down the thrust.";
var(Thrust) noexport float RandomThrustK "Random thrust constant.  Factor of the main thrust to apply in a random direction (use 0.0 if not desired).";
var() noexport float ImpactThreshold "Speed threshold, at which we will explode on impact.  NOTE: This var may override KImpactThreshold if necessary.";
var() noexport float ImpactAngleThresh "Dot product threshold of velocity and surface normal.";
var SoftParticleSystem SteamJet;
var Cannister_Generic_Green_Tip Tip;
var float ThrustTime;
var bool bHasIgnited;

function PostBeginPlay()
{
    super(dnDecoration).PostBeginPlay();
    SteamJet = none;
    KImpactThreshold = FMax(KImpactThreshold, ImpactThreshold);
    Tip = Cannister_Generic_Green_Tip(FindMountedActor(, class'Cannister_Generic_Green_Tip'));
    return;
}

simulated function SpawnOnDestroyedActivity()
{
    super(RenderActor).SpawnOnDestroyedActivity();
    class'DecalBomb'.static.StaticDeploy(class'dnExplosionDecalBomb', Location, Rotation, self, self);
    return;
}

function Tick(float Delta)
{
    super(Actor).Tick(Delta);
    // End:0x35
    if(bHasIgnited)
    {
        ThrustTime += Delta;
        // End:0x35
        if(ThrustTime >= 0)
        {
            ApplyThrust();
        }
    }
    return;
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    super(dnDecoration).Trigger(Other, EventInstigator);
    // End:0x21
    if(! bHasIgnited)
    {
        StartIgnition();
    }
    return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
    // End:0x47
    if(((! bHasIgnited && Damage > float(1)) && ! IsA(DamageType, class'CrushingDamage')) && ! IsA(DamageType, class'FallingDamage'))
    {
        StartIgnition();
    }
    super(dnDecoration).TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
    return;
}

event KImpact(name SelfBoneName, KarmaActor Other, name OtherBoneName, Vector Position, Vector ImpactVelocity, Vector ImpactNormal)
{
    local Vector X, Y, Dir;
    local float Speed;
    local int i;

    super(dnDecoration).KImpact(SelfBoneName, Other, OtherBoneName, Position, ImpactVelocity, ImpactNormal);
    // End:0x35
    if(ThrustTime < ThrustAttack)
    {
        return;
    }
    GetAxes(Rotation, X, Y, Dir);
    Dir = - Dir;
    Speed = VSize(ImpactVelocity);
    // End:0x117
    if(((Other == none) && Other.ClassForName('AICreature') && Speed > float(50)) || ((Dir Dot ImpactNormal) >= ImpactAngleThresh) && Speed > ImpactThreshold)
    {
        i = string(MountedActorList) - 1;
        J0xD0:

        // End:0x114 [Loop If]
        if(i >= 0)
        {
            // End:0x10A
            if(MountedActorList[i].MountedActor == none)
            {
                MountedActorList[i].MountedActor.RemoveTouchClass();
            }
            -- i;
            // [Loop Continue]
            goto J0xD0;
        }
        RemoveTouchClass();
    }
    return;
}

function StartIgnition()
{
    bNoNativeTick = false;
    ThrustTime = - IgnitionTime;
    SpawnSteamJet();
    bHasIgnited = true;
    TickStyle = 3;
    Tip.GetGravity();
    Tip.ForceMountUpdate(,,, true);
    Tip.SetRotation(18);
    Tip.LifeSpan = 5;
    Tip.SetHealth(Vect(0, 0, 100), Vect(0, 0, 0));
    return;
}

function ApplyThrust()
{
    local Vector X, Y, Z, Force, Offset, ForcePosition,
	    RandForce;

    local float MagThrust;

    // End:0x2B
    if(ThrustTime < ThrustAttack)
    {
        MagThrust = (ThrustTime / ThrustAttack) * ThrustMagnitude;        
    }
    else
    {
        // End:0x4F
        if(ThrustTime < (ThrustAttack + ThrustSustain))
        {
            MagThrust = ThrustMagnitude;            
        }
        else
        {
            // End:0x9D
            if(ThrustTime < ((ThrustAttack + ThrustSustain) + ThrustDecay))
            {
                MagThrust = ThrustMagnitude - ((((ThrustTime - ThrustAttack) - ThrustSustain) / ThrustDecay) * ThrustMagnitude);                
            }
            else
            {
                // End:0xD0
                if(bHasIgnited)
                {
                    SteamJet.DestroyWhenEmpty = true;
                    SteamJet.Enabled = false;
                    CriticalDamage();
                }
                return;
            }
        }
    }
    // End:0x14F
    if(bHasIgnited)
    {
        GetAxes(Rotation, X, Y, Z);
        ForcePosition = Location - (Z * 35);
        Force = Normal((0.9 * - Z) + (0 * Vect(0.1, 0, 1))) * MagThrust;
        KGetSensors(Force, ForcePosition);
    }
    return;
}

function SpawnSteamJet()
{
    local Vector X, Y, Z, SteamJetLocation;
    local Rotator SteamJetRotation;
    local SMountPrefab MountPrefab;

    // End:0x5D
    if(SteamJet != none)
    {
        MountPrefab.MountOrigin = Vect(0, 0, 35);
        MountPrefab.MountAngles.Pitch = 16384;
        SteamJet = EmptyTouchClasses(class'Cannister_Generic_SmokeTrail', self);
        SteamJet.SetPhysics(MountPrefab, self);
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.RegisterMaterialClass(class'dnExplosionDecalBomb');
    PrecacheIndex.RegisterMaterialClass(class'Cannister_Generic_SmokeTrail');
    return;
}

defaultproperties
{
    IgnitionTime=0.3
    ThrustMagnitude=40000
    ThrustAttack=0.2
    ThrustSustain=2
    ThrustDecay=1
    ImpactThreshold=1000
    ImpactAngleThresh=0.2
    DestroyedActivities(0)=none
    begin object name=DA_Sound_Cannister_Green_Explode class=DecoActivities_Sound
        SoundNames(0)=Barrel_Explode
    object end
    // Reference: DecoActivities_Sound'Cannister_Generic_Green.DA_Sound_Cannister_Green_Explode'
    DestroyedActivities(1)=DA_Sound_Cannister_Green_Explode
    DamageThreshold=1
    MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='Cannister_Generic_Green_Tip',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=true,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=34.5),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    SpawnOnDestroyedSimple(0)='dnGame.dnExplosionLight_Barrel'
    DestroyedParticleFriendEffects(0)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=0,BoneName=None,Location=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),Effect='p_Decorations.BarrelExplosion.Barrel_Explosion_Spawner')
    KImpactThreshold=100
    CollisionHeight=34
    StaticMesh='sm_class_decorations.Gas_Cannisters.Gas_Cannister_Green'
}