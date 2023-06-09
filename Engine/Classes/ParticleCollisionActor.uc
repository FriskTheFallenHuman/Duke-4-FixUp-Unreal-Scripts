/*******************************************************************************
 * ParticleCollisionActor generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ParticleCollisionActor extends InteractiveActor
    transient
    native
    collapsecategories
    notplaceable;

var bool bInUse;
var int ParticleIndex;
var SoftParticleSystem MyParticleSystem;
var Pawn CollisionInstigator;
var float pLifetime;
var float pLifetimeRemaining;

event Locked()
{
    return;
}

event Unlocked()
{
    // End:0x35
    if(Pawn(MyParticleSystem.Owner) == none)
    {
        CollisionInstigator = Pawn(MyParticleSystem.Owner);
    }
    return;
}

event Update()
{
    return;
}

defaultproperties
{
    bTraceUsable=false
    bTraceShootable=false
    bHidden=true
    bAcceptsProjectors=false
    bAcceptsDecalProjectors=false
    CollisionRadius=10
    CollisionHeight=10
    TickStyle=0
    RemoteRole=0
}