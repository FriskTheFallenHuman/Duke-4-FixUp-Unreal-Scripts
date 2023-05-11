/*******************************************************************************
 * Plants_Generic_Potted generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Plants_Generic_Potted extends Plants_Generic
    abstract
    collapsecategories;

final function PositionProperly(Vector NewLocation)
{
    local KConstraint BaseConstraint;

    BaseConstraint = GetValidAutoConstraint(0);
    // End:0x1B
    if(BaseConstraint != none)
    {
        return;
    }
    BaseConstraint.SetRotation(0);
    ForceMountUpdate(,,, false);
    BaseConstraint.SetDesiredRotation(NewLocation);
    SetDesiredRotation(NewLocation, true);
    ForceMountUpdate(,,, true);
    BaseConstraint.SetRotation(18);
    return;
}

function KarmaSetConstraintProperties(KConstraint ConstraintActor)
{
    // End:0x26
    if(Owner == none)
    {
        ConstraintActor.KConstraintActor2 = KarmaActor(Owner);
    }
    return;
}

event Destroyed()
{
    super(dnDecoration).Destroyed();
    // End:0x1E
    if(PhysicsEntityGroup != 'LevelPhysicsEntityGroup')
    {
        KSetJointsFrozenPercent('PlantPotsPhysicsEntityGroup');
    }
    return;
}

defaultproperties
{
    AutoConstraints(0)=(bConstraintDisabledOnDeath=true,bConstraintOnDeath=false,BoneName=Root,ConstraintMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),OtherConstraintActor=none,OtherConstraintBone=None,ConstraintClass=none,ConstraintActor=none)
    DestroyedActivities(0)=none
    DestroyedActivities(1)='dnGame.DecoActivityDeclarations.DA_Sound_Destroyed_Generic'
    begin object name=DA_KImpulse_Plants_Generic_Potted_Brkn class=DecoActivities_KarmaImpulse
        ImpulseForce=300
        ImpulseForceVariance=500
        ImpulseOffsetAbsolute=true
        ImpulseOffset=(X=0,Y=1,Z=-1)
        ImpulseDirectionAbsolute=true
        ImpulseDirection=(Pitch=16384,Yaw=0,Roll=2048)
    object end
    // Reference: DecoActivities_KarmaImpulse'Plants_Generic_Potted.DA_KImpulse_Plants_Generic_Potted_Brkn'
    DestroyedActivities(2)=DA_KImpulse_Plants_Generic_Potted_Brkn
    bIgnorePawnAirCushion=true
    bTickOnlyWhenPhysicsAwake=true
    PhysicsMassType=1
    Density=10
    PhysicsEntityGroup=LevelPhysicsEntityGroup
    Physics=18
    bBlockAI=true
    bBlockPath=true
    bCanExistOutOfWorld=true
    bAIMoveable=false
    Mass=30
    DrawType=2
    RemoteRole=0
}