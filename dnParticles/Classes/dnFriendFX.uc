/*******************************************************************************
 * dnFriendFX generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnFriendFX extends SoftParticleSystem
    collapsecategories
    hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

var() noexport bool bThrottleEffect "Just a shortcut designed variable that lets me tell an effect to be throttled and then the needed values are set internally, instead of being copied and pasted over and over.";
var() noexport float ThrottleLimit "Really just 'MaximumParticles', but specified here so individual effects can have their own limit without forcing MaximumParticles to be set.";

event PreBeginPlay()
{
    super(RenderActor).PreBeginPlay();
    // End:0x23
    if(bThrottleEffect)
    {
        MaximumParticles = int(ThrottleLimit);
        MaxSpawnLimitTest = 1;
    }
    return;
}

defaultproperties
{
    Enabled=false
    DisableTickWhenEmpty=true
    bAdditionalSpawnOnSpawn=false
    PrimeOnSpawn=false
    RelativeSpawn=true
    RelativeSpawnAcceleration=true
    RelativeSpawnVelocity=true
    SpawnNumber=0
    TriggerType=0
    bIgnoreBList=true
    TickStyle=3
}