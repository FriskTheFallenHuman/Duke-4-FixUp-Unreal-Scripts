/*******************************************************************************
 * Furniture_Generic_Bench_WoodSlats_A generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Furniture_Generic_Bench_WoodSlats_A extends Furniture_Generic_Benches
    collapsecategories;

defaultproperties
{
    AutoConstraints(0)=(bConstraintDisabledOnDeath=false,bConstraintOnDeath=true,BoneName=Root,ConstraintMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),OtherConstraintActor=none,OtherConstraintBone=None,ConstraintClass=none,ConstraintActor=none)
    bSurviveDeath=true
    DestroyedActivities(0)=none
    begin object name=DA_Sound_Furniture_Generic_Bench_WoodSlats_A_Brkn class=DecoActivities_Sound
        SoundNames(0)=BenchDestruct
    object end
    // Reference: DecoActivities_Sound'Furniture_Generic_Bench_WoodSlats_A.DA_Sound_Furniture_Generic_Bench_WoodSlats_A_Brkn'
    DestroyedActivities(1)=DA_Sound_Furniture_Generic_Bench_WoodSlats_A_Brkn
    begin object name=DA_Display_Furniture_Generic_Bench_WoodSlats_A_Brkn class=DecoActivities_Display
        RenderObject='sm_class_decorations.Chairs.StratParkBench_brkn'
    object end
    // Reference: DecoActivities_Display'Furniture_Generic_Bench_WoodSlats_A.DA_Display_Furniture_Generic_Bench_WoodSlats_A_Brkn'
    DestroyedActivities(2)=DA_Display_Furniture_Generic_Bench_WoodSlats_A_Brkn
    HealthPrefab=5
    Health=25
    DestroyedParticleFriendEffects(0)=(bAbsoluteLocation=false,bAbsoluteRotation=false,Scale=0,BoneName=None,Location=(X=0,Y=0,Z=0),Rotation=(Pitch=0,Yaw=0,Roll=0),Effect='p_Decorations.Debris_WoodBarricade.Debris_WoodBarricade_Spawner')
    CollisionHeight=21
    StaticMesh='sm_class_decorations.Chairs.StratParkBench'
}