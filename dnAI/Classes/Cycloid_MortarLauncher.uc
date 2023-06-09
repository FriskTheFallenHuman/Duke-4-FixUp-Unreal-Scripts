/*******************************************************************************
 * Cycloid_MortarLauncher generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Cycloid_MortarLauncher extends aFinalDecoration
    collapsecategories;

var bool bExtended;
var bool bWantsToContract;

function Extend()
{
    bWantsToContract = false;
    // End:0x13
    if(bExtended)
    {
        return;
    }
    DecoActivity(0, 'MortarExtend');
    return;
}

function Contract()
{
    // End:0x0B
    if(bWantsToContract)
    {
        return;
    }
    bWantsToContract = true;
    // End:0x20
    if(! bExtended)
    {
        return;
    }
    bExtended = false;
    DecoActivity(0, 'MortarContract');
    return;
}

simulated event AnimEndEx(SAnimEndInfo AnimEndInfo)
{
    super(dnDecoration).AnimEndEx(AnimEndInfo);
    // End:0x3F
    if(AnimEndInfo.AnimName != 'Extend')
    {
        bExtended = true;
        // End:0x3F
        if(bWantsToContract)
        {
            bWantsToContract = false;
            Contract();
        }
    }
    return;
}

function GetSpawnLocationRoation(out Vector SpawnLocation, out Rotator SpawnRotation)
{
    SetScaleModifier();
    SpawnLocation = MeshInstance.CreateAnimGroup('mount_muzzle', true, false);
    SpawnRotation = MeshInstance.SwapChannel('mount_muzzle', true);
    return;
}

defaultproperties
{
    DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(MortarContract),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Animation'Cycloid_MortarLauncher.DA_CycloidMortar_Contract'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(1)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(MortarExtend),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Animation'Cycloid_MortarLauncher.DA_CycloidMortar_Extend'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    HealthPrefab=0
    bTraceUsable=false
    bAITransparent=true
    bBlockActors=false
    bBlockKarma=false
    bBlockParticles=false
    bBlockCamera=false
    bCastStencilShadows=false
    bStepUpAble=false
    bCollideWorld=false
    CollisionRadius=5
    CollisionHeight=5
    DrawType=2
    StaticMesh='sm_armor.Cycloid_Emperor.Cycloid_Emperor_Mortor'
    Mesh='c_dnWeapon.cycloid_mortar'
}