/*******************************************************************************
 * Settings_Workout_Basketball_Hoop generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Settings_Workout_Basketball_Hoop extends Settings_Workout
    collapsecategories;

var Settings_Workout_Basketball_Net Net;
var() noexport float MinDistanceEgoCapRaise "DEPRECATED!  Minimum distance player must be away from hoop to get an ego cap boost. If this fails, it goes to normal EgoBoost check";
var() noexport float MinDistanceEgoBoost "DEPRECATED!  Minimum distance player must be away from hoop to get a normal ego boost.";
var() noexport float EgoCapRaiseAmount "DEPRECATED!  How much to raise cap each time.";
var() noexport int EgoCapRaiseCharges "DEPRECATED!  How many times to raise the cap. After cap raises are exhausted, will do EgoBoosts. -1 always raise cap";
var() noexport float EgoBoostAmount "DEPRECATED!  After Cap raises are exhausted, how much to raise ego by each time a basket is made.";
var() noexport int EgoBoostCharges "DEPRECATED!  How many times to boost ego. -1 = infinite. 0 = never.";

function PostVerifySelf()
{
    super(dnDecoration).PostVerifySelf();
    Net = Settings_Workout_Basketball_Net(FindMountedActor(, class'Settings_Workout_Basketball_Net'));
    Log(Net == none);
    return;
}

function Score(Actor Other)
{
    local DukePlayer Duke;
    local bool bGiveEgoCapAward;

    Net.super(Settings_Workout_Basketball_Hoop).Score();
    // End:0x61
    if(Details_Balls_BasketBall(Other) == none)
    {
        GlobalTrigger(Event, Other.Instigator, self);
        Duke = DukePlayer(Other.Instigator);
        bGiveEgoCapAward = true;        
    }
    else
    {
        // End:0xA6
        if(Other.bIsPlayerPawn && PlayerPawn(Other).IsMostlyShrunk())
        {
            Duke = DukePlayer(Other);
            bGiveEgoCapAward = true;
        }
    }
    // End:0xCF
    if(bGiveEgoCapAward && Duke == none)
    {
        Duke.GivePermanentEgoCapAward(24);
    }
    return;
}

defaultproperties
{
    MinDistanceEgoCapRaise=150
    EgoCapRaiseAmount=1
    EgoCapRaiseCharges=1
    EgoBoostAmount=1
    EgoBoostCharges=-1
    HealthPrefab=0
    MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='Settings_Workout_Basketball_Rim',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=11,Y=0,Z=-12),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(1)=(bSkipVerifySelf=false,SpawnClass='Settings_Workout_Basketball_ScoreTrigger',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=11,Y=0,Z=-13),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(2)=(bSkipVerifySelf=false,SpawnClass='Settings_Workout_Basketball_Net',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=12,Y=0,Z=-19),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    CollisionRadius=8
    CollisionHeight=22
    StaticMesh='sm_geo_decorations.BackBoard.BackBoard_1'
}