/*******************************************************************************
 * Settings_FoodService_SodaDispenser generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Settings_FoodService_SodaDispenser extends Settings_FoodService;

var dnSodaFX SodaEffect;
var() Color SprayColor;

function PostVerifySelf()
{
    super(dnDecoration).PostVerifySelf();
    SodaEffect = dnSodaFX(FindMountedActor('SodaSpray'));
    // End:0x4C
    if(SodaEffect == none)
    {
        SodaEffect.FreeSegment();
        SodaEffect.Sleep('SystemColor', SprayColor);
    }
    return;
}

event Used(Actor Other, Pawn EventInstigator)
{
    super(dnDecoration).Used(Other, EventInstigator);
    // End:0x29
    if(SodaEffect == none)
    {
        SodaEffect.TickNative();
    }
    return;
}

event UnUsed(Actor Other, Pawn EventInstigator)
{
    super(dnDecoration).UnUsed(Other, EventInstigator);
    // End:0x29
    if(SodaEffect == none)
    {
        SodaEffect.FreeSegment();
    }
    return;
}

defaultproperties
{
    SprayColor=(R=200,G=200,B=150,A=0)
    DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(3),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Sound'Settings_FoodService_SodaDispenser.DA_Sound_Settings_Food_SodaDispenser_SoundOn',DecoActivities_Animation'Settings_FoodService_SodaDispenser.DA_Anim_Settings_Food_SodaDispenser_Push'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(1)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(4),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Sound'Settings_FoodService_SodaDispenser.DA_Sound_Settings_Food_SodaDispenser_SoundOff',DecoActivities_Animation'Settings_FoodService_SodaDispenser.DA_Anim_Settings_Food_SodaDispenser_Release'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    HealthPrefab=0
    bForceUsePhrase=true
    bUsable=true
    bUnUsable=true
    MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass=none,SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(1)=(bSkipVerifySelf=false,SpawnClass='dnParticles.dnSodaFX',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=SodaSpray,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    bBlockKarma=false
    bAcceptsDecalProjectors=false
    CollisionRadius=2.7
    CollisionHeight=6.2
    DrawType=2
    Mesh='c_generic.sodafountain_soda'
}