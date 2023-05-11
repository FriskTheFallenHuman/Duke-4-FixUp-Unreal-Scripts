/*******************************************************************************
 * RenderActor generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class RenderActor extends KarmaActor
    abstract
    native
    nativereplication
    collapsecategories
    notplaceable
    dependson(AnimationControllerEx)
    dependson(ZoneInfo)
    dependson(MeshInstance)
    dependson(dnFriendFX_Spawners);

struct SDamageInfo
{
    var float DamageTime;
    var float Damage;
    var Vector DamageOrigin;
    var Vector DamageDirection;
    var class<DamageType> DamageType;
    var name DamageBone;
};

struct SParticleFriendEffect
{
    var() noexport bool bAbsoluteLocation "Is the location variable an absolute location in the world?";
    var() noexport bool bAbsoluteRotation "Is the rotation variable an absolute rotation in the world?";
    var() noexport float Scale "How much to scale the effect by, 0.0 will be set to 1.0.";
    var() noexport name BoneName "Bone to make effect relative to.";
    var() noexport Vector Location "Location of the effect.";
    var() noexport Rotator Rotation "Rotation of the effect.";
    var() noexport class<dnFriendFX_Spawners> Effect "FriendFX Spawner class to execute.";
};

struct SDestructionLevel
{
    var() noexport float HealthReq "Required health to use this destruction level.";
    var() noexport Object NewRenderObject "New render object to use. Ignored if set to None.";
    var() noexport array<SUpdateMaterialEx> NewSkins "List of skin updates.";
    var() noexport name Event "Event to trigger when we reach this level.";
    var() noexport array< class<Actor> > SpawnAtLevelSimple "For when you don't need all the complexity of SpawnAtLevel to spawn.";
    var() noexport array<SSpawnActorPrefab> SpawnAtLevel "Spawn an actor when we reach this level with lots of specific stuff optional.";
    var() name DestructSound;
};

var(Animation) noexport deprecated name ForceAnimTickTag "Trigger this event to force an animation state tick.  This should only be used when instructed by a programmer.";
var(Display) noexport float VisibilityRadius "Actor is drawn if viewer is within its visibility radius.  Zero = infinite visibility";
var(Display) noexport deprecated Actor ShadowGroupOwner "If this value is not NULL, this will be the actor used to calculate the shadow direction when using bRelativeShadowSource ont he light.";
var(Display) noexport float DukeVisionInterference "If greater than 0, will be the distance at which this object will no longer interfere with duke vision.";
var(Mounting) noexport array<SMountedActorPrefab> MountOnSpawn "Mounting information at actor startup. This list is removed after the actors are mounted.";
var(IK) noexport array< class<IKSystemInfo> > AutoRegisterIKClasses "IK systems to auto register with this actor after a level load, or actor spawn.";
var(Health) const noexport travel float Health "Amount of health the actor currently has. A health of 0.0 or lower is always considered 'Dead', unless in the case of a pawn using the death recovery period. Constrained by HealthCap/HealthMin.";
var(Health) noexport travel float HealthCap "Maximum amount of health the actor can have. If left as -1.0,  it will be set to whatever Health currently is set to.";
var(Health) noexport travel float HealthMin "Minimum amount of health the actor can have. Can't ever be lower than 0.0, or higher than HealthCap.";
var SDamageInfo ThisFrameDamage;
var(Health) noexport bool bNoDamage "Object doesn't take any damage.";
var(Network) noexport bool bAnimateOffscreen "Fixes character animations based on objects that start off screen. Usually false.";
var(Destruction) noexport bool bSpawnOnDestroyed "When this is true, go ahead and execute the SpawnOnDestroyed activities.";
var(Destruction) noexport array< class<Actor> > SpawnOnDestroyedSimple "For when you don't need all the complexity of SpawnOnDestroyed to spawn something on death.";
var(Destruction) noexport array<SSpawnActorPrefab> SpawnOnDestroyed "Spawn an actor when this actor is destroyed with lots of specific stuff optional.";
var(Destruction) noexport array<SParticleFriendEffect> DestroyedParticleFriendEffects "Particle friend effect spawners to execute when we are destroyed.";
var(Destruction) noexport array<SDestructionLevel> DestructionLevels "Updates to the object that happen at specified health levels";
var MotionPrefab DefaultMotionPrefab;
var MotionPrefab NoMotionPrefab;
var array<Actor> ActorPoolOnDestroyed;
var() array<name> BonesToDrawInTheEditor;
var AnimationControllerEx AnimationController;
var class<AnimationControllerEx> AnimationControllerClass;
var const editconst transient nontrans pointer MovementBoneTracker;
var const transient int LoadedIKSystemInfos;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        Health;

    // Pos:0x00B
    reliable if((int(Role) == int(ROLE_Authority)) && bIsPawn)
        HealthCap;
}

// Export URenderActor::execSetHealth(FFrame&, void* const)
native(832) final function float SetHealth(float NewHealth);

// Export URenderActor::execSkinMeshOptimization(FFrame&, void* const)
native(833) final function bool SkinMeshOptimization(bool bSet, bool bSetTo);

// Export URenderActor::execSpawnMotionPrefab(FFrame&, void* const)
native(834) final function Actor SpawnMotionPrefab(class<Actor> SpawnClass, optional Actor SpawnOwner, optional name SpawnTag, optional Vector SpawnLocation, optional Rotator SpawnRotation, optional MotionPrefab MotionInfo, optional int HitStrength, optional Vector HitOrigin, optional Vector HitDirection, optional class<DamageType> HitType);

// Export URenderActor::execApplyMotionPrefab(FFrame&, void* const)
native(835) final function ApplyMotionPrefab(optional Actor Other, optional MotionPrefab MotionInfo, optional int HitStrength, optional Vector HitOrigin, optional Vector HitDirection, optional class<DamageType> HitType);

// Export URenderActor::execProcessSpawnActorPrefab(FFrame&, void* const)
native(836) final simulated function Actor ProcessSpawnActorPrefab(SSpawnActorPrefab SpawnActorPrefab, SDamageInfo DamageInfo);

// Export URenderActor::execSpawnMountPrefabActor(FFrame&, void* const)
native(837) final simulated function Actor SpawnMountPrefabActor(SMountedActorPrefab ThisMountedSpawn);

// Export URenderActor::execGetRenderBoundingBox(FFrame&, void* const)
native(838) final function GetRenderBoundingBox(out Vector mins, out Vector maxs);

// Export URenderActor::execMeshEvent(FFrame&, void* const)
native(839) final event MeshEvent(string EventName);

// Export URenderActor::execAllAnims(FFrame&, void* const)
native(840) final iterator function AllAnims(out SAllAnimInfo AnimName, optional name GroupName);

// Export URenderActor::execGetAnimationMotion(FFrame&, void* const)
native(841) final function bool GetAnimationMotion(out Vector AnimPosDelta, out Rotator AnimRotDelta, out Vector AnimPos, out Rotator AnimRot);

// Export URenderActor::execForceAnimTick(FFrame&, void* const)
native(842) final function ForceAnimTick();

// Export URenderActor::execProcessSpawnActorPoolOnDestroyed(FFrame&, void* const)
native(843) final simulated function ProcessSpawnActorPoolOnDestroyed(SSpawnActorPrefab SpawnActorPrefab, SDamageInfo DamageInfo, Actor ActorPool);

event PreBeginPlay()
{
    super.PreBeginPlay();
    SetHealthCap(HealthCap);
    // End:0x6B
    if((IsMP()) && string(SpawnOnDestroyed) > 0)
    {
        // End:0x6B
        if(SpawnOnDestroyed[0].SpawnClass.default.bIsDestroyedActorPool && int(SpawnOnDestroyed[0].SpawnClass.default.Physics) == int(18))
        {
            bAlwaysRelevant = true;
        }
    }
    // End:0x9C
    if(DukeVisionInterference > 0)
    {
        Level.DukeVisionInterferenceActors[string(Level.DukeVisionInterferenceActors)] = self;
    }
    return;
}

simulated function BeginEffect()
{
    return;
}

simulated function InitializeAnimation()
{
    // End:0x64
    if(AnimationControllerClass == none)
    {
        // End:0x36
        if((AnimationController == none) && AnimationController.Class != AnimationControllerClass)
        {
            return;
        }
        AnimationController = new (Level.XLevel) AnimationControllerClass;
        AnimationController.InitAnimationControllerEx(self);
    }
    return;
}

simulated function AnimationControllerEx GetAnimationController()
{
    return AnimationController;
    return;
}

simulated event bool CreateActorPoolsOnDestroyed()
{
    local Actor A;
    local int i;

    // End:0x0E
    if(string(ActorPoolOnDestroyed) > 0)
    {
        return false;
    }
    i = string(SpawnOnDestroyed) - 1;
    J0x1D:

    // End:0xBE [Loop If]
    if(i >= 0)
    {
        // End:0xB4
        if(SpawnOnDestroyed[i].SpawnClass.default.bIsDestroyedActorPool && int(SpawnOnDestroyed[i].SpawnClass.default.Physics) == int(18))
        {
            ActorPoolOnDestroyed[i] = SetVolumeAngularVelocity(SpawnOnDestroyed[i], ThisFrameDamage);
            // End:0xB4
            if(ActorPoolOnDestroyed[i] != none)
            {
                ActorPoolOnDestroyed.Remove(i, 1);
                SpawnOnDestroyed.Remove(i, 1);
            }
        }
        -- i;
        // [Loop Continue]
        goto J0x1D;
    }
    // End:0xCC
    if(string(ActorPoolOnDestroyed) > 0)
    {
        return true;
    }
    return false;
    return;
}

simulated event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    InitializeAnimation();
    return;
}

simulated event PostNetInitial()
{
    local int i;

    super(Actor).PostNetInitial();
    InitializeAnimation();
    // End:0x79
    if(int(Level.NetMode) == int(NM_Client))
    {
        i = string(default.MountOnSpawn) - 1;
        J0x33:

        // End:0x79 [Loop If]
        if(i >= 0)
        {
            // End:0x6F
            if(int(default.MountOnSpawn[i].SpawnClass.default.RemoteRole) == int(ROLE_None))
            {
                AttachProjector(default.MountOnSpawn[i]);
            }
            -- i;
            // [Loop Continue]
            goto J0x33;
        }
    }
    return;
}

simulated function PostVerifySelf()
{
    local int i;

    super(Actor).PostVerifySelf();
    GetPointRegion('ForceAnimTick', ForceAnimTickTag);
    // End:0x5D
    if(int(Level.NetMode) != int(NM_Client))
    {
        i = string(MountOnSpawn) - 1;
        J0x3A:

        // End:0x5D [Loop If]
        if(i >= 0)
        {
            AttachProjector(MountOnSpawn[i]);
            -- i;
            // [Loop Continue]
            goto J0x3A;
        }
    }
    MountOnSpawn.Empty();
    return;
}

function NotifyPickup(Actor Other, Pawn EventInstigator)
{
    return;
}

simulated function SetDamageInfo(float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
    // End:0xD1
    if(ThisFrameDamage.DamageTime ~= Level.GameTimeSeconds)
    {
        ThisFrameDamage.Damage += Damage;
        ThisFrameDamage.DamageOrigin = (DamageOrigin + ThisFrameDamage.DamageOrigin) / 2;
        ThisFrameDamage.DamageDirection += DamageDirection;
        // End:0xAE
        if((ThisFrameDamage.DamageType == none) && DamageType.default.MomentumTransfer > ThisFrameDamage.DamageType.default.MomentumTransfer)
        {
            ThisFrameDamage.DamageType = DamageType;
        }
        // End:0xCE
        if(NameForString(HitBoneName, 'None'))
        {
            ThisFrameDamage.DamageBone = HitBoneName;
        }        
    }
    else
    {
        ThisFrameDamage.Damage = Damage;
        ThisFrameDamage.DamageOrigin = DamageOrigin;
        ThisFrameDamage.DamageDirection = DamageDirection;
        ThisFrameDamage.DamageType = DamageType;
        ThisFrameDamage.DamageBone = HitBoneName;
    }
    ThisFrameDamage.DamageTime = Level.GameTimeSeconds;
    return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
    super.TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
    SetDamageInfo(Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
    return;
}

simulated event float GetHealthMeterPercent()
{
    return Health / HealthCap;
    return;
}

simulated function Destroyed()
{
    super(Actor).Destroyed();
    // End:0x2B
    if(! bSilentDestroy && bSpawnOnDestroyed)
    {
        TraceFire(GetSpawnOnDestroyedDelay(), false, 'SpawnOnDestroyedActivity');
    }
    // End:0x46
    if(AnimationController == none)
    {
        GetCountryCode(AnimationController);
        AnimationController = none;
    }
    return;
}

function float GetSpawnOnDestroyedDelay()
{
    return 0;
    return;
}

simulated function SpawnOnDestroyedActivity()
{
    local int i;

    i = string(SpawnOnDestroyedSimple) - 1;
    J0x0F:

    // End:0x33 [Loop If]
    if(i >= 0)
    {
        EmptyTouchClasses(SpawnOnDestroyedSimple[i], self);
        -- i;
        // [Loop Continue]
        goto J0x0F;
    }
    // End:0xBE
    if(string(ActorPoolOnDestroyed) > 0)
    {
        i = string(SpawnOnDestroyed) - 1;
        J0x4E:

        // End:0xBB [Loop If]
        if(i >= 0)
        {
            // End:0x9E
            if((i < string(ActorPoolOnDestroyed)) && ActorPoolOnDestroyed[i] == none)
            {
                TurnOff(SpawnOnDestroyed[i], ThisFrameDamage, ActorPoolOnDestroyed[i]);
                // [Explicit Continue]
                goto J0xB1;
            }
            SetVolumeAngularVelocity(SpawnOnDestroyed[i], ThisFrameDamage);
            J0xB1:

            -- i;
            // [Loop Continue]
            goto J0x4E;
        }        
    }
    else
    {
        i = string(SpawnOnDestroyed) - 1;
        J0xCD:

        // End:0xF5 [Loop If]
        if(i >= 0)
        {
            SetVolumeAngularVelocity(SpawnOnDestroyed[i], ThisFrameDamage);
            -- i;
            // [Loop Continue]
            goto J0xCD;
        }
    }
    i = string(DestroyedParticleFriendEffects) - 1;
    J0x104:

    // End:0x12A [Loop If]
    if(i >= 0)
    {
        ExecuteParticleFriendEffect(DestroyedParticleFriendEffects[i]);
        -- i;
        // [Loop Continue]
        goto J0x104;
    }
    return;
}

simulated event ResumeCallbackTimerDestroyedActorPool()
{
    return;
}

simulated function ExecuteParticleFriendEffect(out SParticleFriendEffect FriendEffect)
{
    local dnFriendFX_Spawners Spawner;
    local Vector BaseLoc;
    local Rotator BaseRot;

    // End:0x13
    if(FriendEffect.Effect != none)
    {
        return;
    }
    // End:0x37
    if(FriendEffect.Scale == 0)
    {
        FriendEffect.Scale = 1;
    }
    Spawner = FindFriendSpawner(FriendEffect.Effect);
    // End:0x5B
    if(Spawner != none)
    {
        return;
    }
    BaseLoc = Location;
    BaseRot = Rotation;
    // End:0xCE
    if((SetScaleModifier() == none) && NameForString(FriendEffect.BoneName, 'None'))
    {
        BaseLoc = MeshInstance.CreateAnimGroup(FriendEffect.BoneName, true);
        BaseRot = MeshInstance.SwapChannel(FriendEffect.BoneName, true);
    }
    // End:0x107
    if(! FriendEffect.bAbsoluteLocation)
    {
        Spawner.SetDesiredRotation(BaseLoc + TransformVectorByRot(FriendEffect.Location, BaseRot));        
    }
    else
    {
        Spawner.SetDesiredRotation(FriendEffect.Location);
    }
    // End:0x150
    if(! FriendEffect.bAbsoluteRotation)
    {
        Spawner.DisableDesiredRotation_Roll(FriendEffect.Rotation >> BaseRot);        
    }
    else
    {
        Spawner.DisableDesiredRotation_Roll(FriendEffect.Rotation);
    }
    Spawner.SystemSizeScale = Spawner.default.SystemSizeScale * ((FriendEffect.Scale * DrawScale) / default.DrawScale);
    Spawner.ExecuteEffect(true);
    return;
}

final event ModifyHealth(float DeltaHealth, Vector ModifiedFrom)
{
    // End:0x22
    if(DeltaHealth > 0)
    {
        ModifyHealthActivity(DeltaHealth, ModifiedFrom);        
    }
    else
    {
        // End:0x60
        if(DeltaHealth < 0)
        {
            TakeDamage(none, - DeltaHealth, Location, Vect(1, 0, 0), class'CrushingDamage',, ModifiedFrom);
        }
    }
    return;
}

function ModifyHealthActivity(float DeltaHealth, Vector ModifiedFrom)
{
    local int i, j;

    // End:0x1DC
    if(DeltaHealth < float(0))
    {
        i = 0;
        J0x13:

        // End:0x1DC [Loop If]
        if(i < string(DestructionLevels))
        {
            // End:0x1D2
            if((Health > DestructionLevels[i].HealthReq) && (Health + DeltaHealth) <= DestructionLevels[i].HealthReq)
            {
                // End:0x8A
                if(DestructionLevels[i].NewRenderObject == none)
                {
                    GetOverlayEffectAlpha(DestructionLevels[i].NewRenderObject);
                }
                j = string(DestructionLevels[i].NewSkins) - 1;
                J0xA4:

                // End:0xF2 [Loop If]
                if(j >= 0)
                {
                    VisibleActors(DestructionLevels[i].NewSkins[j].Index, DestructionLevels[i].NewSkins[j].NewMaterialEx);
                    -- j;
                    // [Loop Continue]
                    goto J0xA4;
                }
                GlobalTrigger(DestructionLevels[i].Event,, self);
                j = string(DestructionLevels[i].SpawnAtLevelSimple) - 1;
                J0x124:

                // End:0x152 [Loop If]
                if(j >= 0)
                {
                    EmptyTouchClasses(DestructionLevels[i].SpawnAtLevelSimple[j]);
                    -- j;
                    // [Loop Continue]
                    goto J0x124;
                }
                j = string(DestructionLevels[i].SpawnAtLevel) - 1;
                J0x16C:

                // End:0x19F [Loop If]
                if(j >= 0)
                {
                    SetVolumeAngularVelocity(DestructionLevels[i].SpawnAtLevel[j], ThisFrameDamage);
                    -- j;
                    // [Loop Continue]
                    goto J0x16C;
                }
                // End:0x1D2
                if(NameForString(DestructionLevels[i].DestructSound, 'None'))
                {
                    FindAndPlaySound(DestructionLevels[i].DestructSound, 1);
                }
            }
            ++ i;
            // [Loop Continue]
            goto J0x13;
        }
    }
    EnableIKSystem(Health + DeltaHealth);
    return;
}

event ModifyHealthCap(float DeltaHealthCap)
{
    SetHealthCap(HealthCap + DeltaHealthCap);
    return;
}

event RaiseHealthToCap(Vector ModifiedFrom)
{
    ModifyHealth(GetHealthCap() - Health, ModifiedFrom);
    return;
}

final function SetHealthCap(float NewHealthCap)
{
    // End:0x17
    if(NewHealthCap < float(0))
    {
        NewHealthCap = Health;
    }
    HealthCap = NewHealthCap;
    SetHealthMin(HealthMin);
    return;
}

final function float GetHealthCap()
{
    return HealthCap;
    return;
}

final function SetHealthMin(float NewHealthMin)
{
    HealthMin = float(Clamp(int(NewHealthMin), 0, int(HealthCap)));
    EnableIKSystem(Health);
    return;
}

final function float GetHealthMin()
{
    return HealthMin;
    return;
}

simulated event AnimationControllerAnimStateEnd(name AnimState)
{
    return;
}

final simulated function RenderActorAnimEnd(int Channel, name AnimationName, optional name GroupName)
{
    // End:0x28
    if(AnimationController == none)
    {
        AnimationController.CalculatePhysics_OnGround(AnimationName, Channel, GroupName);
    }
    return;
}

simulated event AnimEndEx(SAnimEndInfo AnimEndInfo)
{
    super(Actor).AnimEndEx(AnimEndInfo);
    RenderActorAnimEnd(AnimEndInfo.Channel, AnimEndInfo.AnimName, AnimEndInfo.GroupName);
    return;
}

event ZoneChange(ZoneInfo NewZone)
{
    super(Actor).ZoneChange(NewZone);
    // End:0x24
    if(NewZone.bKillZone)
    {
        EnteredKillZone();
    }
    return;
}

function EnteredKillZone()
{
    bSilentDestroy = true;
    RemoveTouchClass();
    return;
}

event AttachAnimationControllerEx(AnimationControllerEx NewController)
{
    AnimationController = NewController;
    return;
}

simulated event bool SetAnimControllerState(name NewStateName, optional bool bForceReset)
{
    // End:0x28
    if(AnimationController == none)
    {
        return AnimationController.SetAnimState(NewStateName, bForceReset);
    }
    return false;
    return;
}

// Export URenderActor::execEnableIKSystem(FFrame&, void* const)
native(844) final event bool EnableIKSystem(class<IKSystemInfo> IKClass, bool bEnabled);

// Export URenderActor::execRegisterIKClass(FFrame&, void* const)
native(845) final event RegisterIKClass(class<IKSystemInfo> IKClass);

final simulated function TriggerFunc_ForceAnimTick()
{
    GetLastRenderTime();
    return;
}

simulated event bool ShouldShowHoloDukeEffect()
{
    return false;
    return;
}

event EnumerateRawAnimationSequences(out array<SAnimationEnumeration> References)
{
    super(Actor).EnumerateRawAnimationSequences(References);
    // End:0x36
    if(AnimationControllerClass == none)
    {
        class'AnimationControllerEx'.static.EnumerateRawAnimationSequences(References, AnimationControllerClass, Mesh);
    }
    return;
}

defaultproperties
{
    Health=1
    HealthCap=-1
    bSpawnOnDestroyed=true
    DefaultMotionPrefab=MotionPrefab'RenderActor.RenderActor_DefaultMotionPrefab'
    begin object name=MP_NoMotion class=MotionPrefab
        bNoMotion=true
    object end
    // Reference: MotionPrefab'RenderActor.MP_NoMotion'
    NoMotionPrefab=MP_NoMotion
    bTraceUsable=true
    bIsRenderActor=true
    bAcceptsProjectors=true
    bAcceptsDecalProjectors=true
    bCastStencilShadows=true
}