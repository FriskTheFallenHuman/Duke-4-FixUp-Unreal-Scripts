/*******************************************************************************
 * dnCaptureTheBabe_Hand generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnCaptureTheBabe_Hand extends Pawn
    config
    collapsecategories
    dependson(dnAnimationControllerEx_Hand);

var netupdate(NU_SetClientAnim) name curanimname;

replication
{
    // Pos:0x000
    reliable if(int(Role) < int(ROLE_Authority))
        SetAnimation;

    // Pos:0x00B
    reliable if(int(Role) == int(ROLE_Authority))
        curanimname;
}

function DiedActivity(optional Pawn Killer, optional int Damage, optional Vector DamageOrigin, optional Vector DamageDirection, optional class<DamageType> DamageType, optional name HitBoneName)
{
    return;
}

function InitPlayerReplicationInfo()
{
    super.InitPlayerReplicationInfo();
    // End:0x2F
    if((PlayerReplicationInfo == none) && IsMP())
    {
        PlayerReplicationInfo.bIsABot = true;
    }
    return;
}

simulated function NU_SetClientAnim(name newname)
{
    local bool bIsLocallyControlled, bFirstPerson;
    local name AnimName;

    AnimName = newname;
    // End:0x1D
    if(AnimationController != none)
    {
        InitializeAnimation();
    }
    dnAnimationControllerEx_Hand(AnimationController).SetAnimState(AnimName);
    return;
}

function SetAnimation(name AnimName)
{
    curanimname = AnimName;
    NU_SetClientAnim(AnimName);
    return;
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    InitializeAnimation();
    SetAnimation('Anim_Idle');
    SetHandHidden(true);
    return;
}

simulated function PostNetInitial()
{
    super.PostNetInitial();
    InitBabe();
    return;
}

simulated function InitBabe()
{
    return;
}

simulated function SetHandHidden(bool boHidden)
{
    GetZoneLastRenderTime(boHidden);
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.SetChannelGridState('Anim_Idle', AnimationControllerClass, Mesh);
    return;
}

defaultproperties
{
    bIgnoreAimAssist=true
    bUsable=true
    bGrabUsable=true
    bGrabbable=true
    UsePhrase="<?int?dnGame.dnCaptureTheBabe_Hand.UsePhrase?>"
    GrabUsePhrase="<?int?dnGame.dnCaptureTheBabe_Hand.GrabUsePhrase?>"
    AnimationControllerClass='dnAnimationControllerEx_Hand'
    bBlockActors=false
    bBlockPlayers=false
    bBlockKarma=false
    bAcceptsDecalProjectors=true
    bLowerByCollision=true
    bAlwaysRelevant=true
    bCollideActors=false
    bCollideWorld=false
    CollisionRadius=1
    MountType=2
    Style=0
    DrawType=2
    Mesh='c_characters.npc_girl_hand'
    OwnerSeeStyle=1
    RemoteRole=0
}