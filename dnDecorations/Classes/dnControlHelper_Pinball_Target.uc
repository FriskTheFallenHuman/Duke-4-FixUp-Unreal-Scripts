/*******************************************************************************
 * dnControlHelper_Pinball_Target generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControlHelper_Pinball_Target extends dnControlHelper_Pinball
    collapsecategories;

var array<dnControlHelper_Pinball_Light> Lights;

simulated event PostBeginPlay()
{
    super(dnDecoration).PostBeginPlay();
    return;
}

simulated function KImpactInternal(dnControlHelper_Pinball_Ball Ball)
{
    super.KImpactInternal(Ball);
    FindAndPlaySound('Pinball_RTarget');
    // End:0x3E
    if(bActivated)
    {
        dnControl_Pinball(Owner).TargetHit(self);
        Deactivate();        
    }
    else
    {
        OwnerMachine.AwardPoints(250);
    }
    ForceMountUpdate(,,, false);
    TraceFire(0.1, false, 'EnableCollision');
    return;
}

simulated function EnableCollision()
{
    ForceMountUpdate(,,, true);
    return;
}

function Destroyed()
{
    local int i;

    J0x00:
    // End:0x2D [Loop If]
    if(i < string(Lights))
    {
        Lights[i].RemoveTouchClass();
        ++ i;
        // [Loop Continue]
        goto J0x00;
    }
    super(dnDecoration).Destroyed();
    return;
}

simulated function AddLight(Vector Loc, Rotator Rot, StaticMesh Mesh, optional MaterialEx Skin)
{
    Lights[Lights.Add(1)] = EmptyTouchClasses(class'dnControlHelper_Pinball_Light', self,, Owner.Location + (Loc >> Owner.Rotation), Rot + Owner.Rotation);
    Lights[string(Lights) - 1].GetOverlayEffectAlpha(Mesh);
    // End:0x9B
    if(Skin == none)
    {
        Lights[string(Lights) - 1].VisibleActors(0, Skin);
    }
    return;
}

function Activate()
{
    local int i;

    bActivated = true;
    i = 0;
    J0x0F:

    // End:0x95 [Loop If]
    if(i < string(Lights))
    {
        Lights[i].ActorColorList[0].ActorColor.R = 236;
        Lights[i].ActorColorList[0].ActorColor.G = 255;
        Lights[i].ActorColorList[0].ActorColor.B = 4;
        ++ i;
        // [Loop Continue]
        goto J0x0F;
    }
    return;
}

function Deactivate()
{
    local int i;

    bActivated = false;
    i = 0;
    J0x0F:

    // End:0x95 [Loop If]
    if(i < string(Lights))
    {
        Lights[i].ActorColorList[0].ActorColor.R = 0;
        Lights[i].ActorColorList[0].ActorColor.G = 0;
        Lights[i].ActorColorList[0].ActorColor.B = 0;
        ++ i;
        // [Loop Continue]
        goto J0x0F;
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'Pinball_RTarget');
    PrecacheIndex.RegisterMaterialClass(class'dnControlHelper_Pinball_Light');
    return;
}

defaultproperties
{
    KImpactFlash=(ActorColorId=Generic0,TimeTotal=0.3,ColorStart=(R=0,G=0,B=255,A=0),ColorEnd=(R=255,G=255,B=255,A=0),bUseMid=true,TimeMid=0.1,ColorMid=(R=0,G=0,B=255,A=0),Timer=-1)
    HealthPrefab=0
    KRestitution=0.6
    KImpactThreshold=150
    bBlockKarma=true
    CollisionRadius=0
    CollisionHeight=0
    DrawType=8
    StaticMesh='sm_class_decorations.Arcades.Pinball_Target'
}