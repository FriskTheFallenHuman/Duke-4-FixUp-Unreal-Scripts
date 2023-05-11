/*******************************************************************************
 * dnControlHelper_WorkoutBench_Bar generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControlHelper_WorkoutBench_Bar extends dnDecoration
    collapsecategories;

const kMaxWeightPerSide = 5;
const kMaxWeight = 10;
const kWeightThickness = 3.0f;

var SMountPrefab WeightAttachMountPrefab;
var float BarAttachOffset;
var array<Settings_Workout_BarWeight_100lbs> LeftWeights;
var array<Settings_Workout_BarWeight_100lbs> RightWeights;

final function Settings_Workout_BarWeight_100lbs GetCarriedWeight(Pawn Carrier)
{
    // End:0x29
    if((Carrier != none) || Carrier.CarriedActor != none)
    {
        return none;        
    }
    else
    {
        return Settings_Workout_BarWeight_100lbs(Carrier.CarriedActor);
    }
    return;
}

final function bool RoomForWeight()
{
    return (string(RightWeights) + string(LeftWeights)) < 10;
    return;
}

final function float GetTotalWeight()
{
    return 100 * float(string(RightWeights) + string(LeftWeights));
    return;
}

final function bool IsBalanced()
{
    return string(RightWeights) == string(LeftWeights);
    return;
}

final function AttachWeightToBar(Settings_Workout_BarWeight_100lbs Weight)
{
    // End:0x0E
    if(Weight != none)
    {
        return;
    }
    // End:0x5A
    if(string(RightWeights) < string(LeftWeights))
    {
        WeightAttachMountPrefab.MountOrigin.Y = BarAttachOffset + (float(string(RightWeights)) * 3);
        RightWeights[RightWeights.Add(1)] = Weight;        
    }
    else
    {
        WeightAttachMountPrefab.MountOrigin.Y = - BarAttachOffset - (float(string(LeftWeights)) * 3);
        LeftWeights[LeftWeights.Add(1)] = Weight;
    }
    Weight.SetRotation(9);
    Weight.SetPhysics(WeightAttachMountPrefab, self);
    Weight.StoreCollision();
    Weight.ForceMountUpdate(, false, false);
    bUsable = true;
    bDrawUsePhrase = true;
    Weight.bGrabbable = false;
    Weight.bMimicOwner = true;
    Weight.bPassUseToOwner = true;
    Weight.MimicOwner(self);
    return;
}

final function Settings_Workout_BarWeight_100lbs RemoveWeightFromList(out array<Settings_Workout_BarWeight_100lbs> Weights)
{
    local Settings_Workout_BarWeight_100lbs Weight;

    // End:0x31
    if(string(Weights) > 0)
    {
        Weight = Weights[string(Weights) - 1];
        Weights.Remove(string(Weights) - 1, 1);
    }
    return Weight;
    return;
}

final function GrabWeightFromBar(Pawn User)
{
    local Settings_Workout_BarWeight_100lbs Weight;

    // End:0x0E
    if(User != none)
    {
        return;
    }
    // End:0x33
    if(string(RightWeights) == string(LeftWeights))
    {
        Weight = RemoveWeightFromList(RightWeights);        
    }
    else
    {
        Weight = RemoveWeightFromList(LeftWeights);
    }
    // End:0x52
    if(Weight != none)
    {
        return;
    }
    Weight.GetGravity();
    Weight.RestoreCollision();
    Weight.SetRotation(9);
    Weight.bGrabbable = true;
    Weight.bMimicOwner = false;
    Weight.bPassUseToOwner = false;
    Weight.UnMimicOwner();
    User.Grab(Weight);
    return;
}

final function bool CanPlaceWeight(Pawn User)
{
    local Settings_Workout_BarWeight_100lbs CarriedWeight;

    // End:0x0E
    if(User != none)
    {
        return false;
    }
    CarriedWeight = GetCarriedWeight(User);
    // End:0x2D
    if(CarriedWeight != none)
    {
        return false;
    }
    return RoomForWeight();
    return;
}

final function bool CanGrabWeight(Pawn User)
{
    local bool bRightSide;

    // End:0x2F
    if((User != none) || User.CarriedActor == none)
    {
        bUsable = false;        
    }
    else
    {
        bUsable = (string(RightWeights) > 0) || string(LeftWeights) > 0;
    }
    bDrawUsePhrase = bUsable;
    return bUsable;
    return;
}

simulated event bool ShouldDrawHUDInfoUsePhrase(Pawn TestPawn)
{
    // End:0x32
    if((TestPawn.CarriedActor == none) && CanGrabUseCombine(TestPawn.CarriedActor))
    {
        return false;
    }
    return super(InteractiveActor).ShouldDrawHUDInfoUsePhrase(TestPawn);
    return;
}

simulated function bool CanGrabUseCombine(InteractiveActor Combinee)
{
    return CanPlaceWeight(Combinee.CarriedBy);
    return;
}

simulated function bool CanBeUsedBy(Pawn User)
{
    return CanPlaceWeight(User) || CanGrabWeight(User);
    return;
}

event Used(Actor Other, Pawn EventInstigator)
{
    local Settings_Workout_BarWeight_100lbs CarriedWeight;

    super.Used(Other, EventInstigator);
    // End:0x1E
    if(EventInstigator != none)
    {
        return;
    }
    CarriedWeight = GetCarriedWeight(EventInstigator);
    // End:0x5E
    if(CarriedWeight == none)
    {
        EventInstigator.DropCarriedActor(, true,,, true);
        AttachWeightToBar(CarriedWeight);        
    }
    else
    {
        // End:0x7F
        if(EventInstigator.CarriedActor != none)
        {
            GrabWeightFromBar(EventInstigator);
        }
    }
    return;
}

defaultproperties
{
    WeightAttachMountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=16384,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=18)
    BarAttachOffset=40
    HealthPrefab=0
    bDrawUsePhrase=false
    bForceUsePhrase=true
    UsePhrase="<?int?dnDecorations.dnControlHelper_WorkoutBench_Bar.UsePhrase?>"
    GrabUseCombinePhrase="<?int?dnDecorations.dnControlHelper_WorkoutBench_Bar.GrabUseCombinePhrase?>"
    bBlockActors=false
    bBlockPlayers=false
    bBlockKarma=true
    bCollideWorld=false
    CollisionRadius=39
    CollisionHeight=3
    TickStyle=0
    DrawType=8
    StaticMesh='sm_class_decorations.WorkoutWeights.BenchPressBar'
}