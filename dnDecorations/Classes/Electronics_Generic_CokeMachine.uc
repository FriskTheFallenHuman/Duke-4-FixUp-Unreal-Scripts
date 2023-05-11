/*******************************************************************************
 * Electronics_Generic_CokeMachine generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_CokeMachine extends Electronics_Generic
    collapsecategories;

var SMountedActorPrefab DrinkMountPrefab;
var() noexport bool bDontPhysicsSpawnedItem "Do NOT explicity turn physics on for spawned item";
var() noexport MaterialEx ButtonMaterials[4] "Materials to use on spawned buttons";
var bool bCanVend;
var int DestructionSpawnCount;
var int DestructionSpawnCountVar;
var int MaxCans;
var float DestructionSpawnDelay;
var float DestructionSpawnDelayVar;

final function SpawnItem(MaterialEx CanMaterial)
{
    local KarmaActor A;

    // End:0xA2
    if(bCanVend)
    {
        A = KarmaActor(AttachProjector(DrinkMountPrefab));
        // End:0x8A
        if(A == none)
        {
            // End:0x47
            if(CanMaterial == none)
            {
                A.VisibleActors(1, CanMaterial);
            }
            FindAndPlaySound('CokeMachine_Vend', 1);
            // End:0x8A
            if(! bDontPhysicsSpawnedItem)
            {
                A.SetRotation(18);
                A.KFindPhysicsAction(1);
                A.KGetCollidingActors();
            }
        }
        -- MaxCans;
        // End:0xA2
        if(MaxCans <= 0)
        {
            DisableVend();
        }
    }
    return;
}

final function StartDestructionSpawn()
{
    // End:0x21
    if(bCanVend)
    {
        DestructionSpawnCount = IVar(default.DestructionSpawnCount, DestructionSpawnCountVar);
        SpawnDestructionItem();
    }
    return;
}

final function SpawnDestructionItem()
{
    local float Delay;

    Delay = FVar(DestructionSpawnDelay, DestructionSpawnDelayVar);
    SpawnItem(ButtonMaterials[Rand(4)]);
    -- DestructionSpawnCount;
    // End:0x42
    if(DestructionSpawnCount > 0)
    {
        TraceFire(Delay, false, 'SpawnDestructionItem');
    }
    return;
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    super(dnDecoration).Trigger(Other, EventInstigator);
    StartDestructionSpawn();
    return;
}

final function DisableVend()
{
    bCanVend = false;
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    local int i;

    super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.RegisterAnimationController(DrinkMountPrefab);
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'CokeMachine_Vend');
    i = 0;
    J0x3B:

    // End:0x69 [Loop If]
    if(i < 4)
    {
        PrecacheIndex.RegisterAnimationControllerEntry(ButtonMaterials[i]);
        ++ i;
        // [Loop Continue]
        goto J0x3B;
    }
    return;
}

defaultproperties
{
    DrinkMountPrefab=(bSkipVerifySelf=false,SpawnClass='Details_Generic_DrinkCan',SpawnChance=0,MountPrefab=(bDontActuallyMount=true,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=20,Y=0,Z=-37),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=-16384),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    ButtonMaterials[0]='mt_skins7.Beer_40oz.ChubbeCola_bs'
    ButtonMaterials[1]='mt_skins7.Beer_40oz.Frappa_bs'
    ButtonMaterials[2]='mt_skins7.Beer_40oz.KrackKola_bs'
    ButtonMaterials[3]='mt_skins7.Beer_40oz.Tanked_bs'
    bCanVend=true
    DestructionSpawnCount=8
    DestructionSpawnCountVar=3
    MaxCans=10
    DestructionSpawnDelay=0.5
    DestructionSpawnDelayVar=0.25
    begin object name=DA_Sound_CokeMachine_Ambience class=DecoActivities_Sound
        SoundNames(0)=CokeMachine_Amb
    object end
    // Reference: DecoActivities_Sound'Electronics_Generic_CokeMachine.DA_Sound_CokeMachine_Ambience'
    StartupActivities(0)=DA_Sound_CokeMachine_Ambience
    DestroyedActivities(0)=none
    DestroyedActivities(1)='dnGame.DecoActivityDeclarations.DA_Sound_Ambient_Clear'
    HealthPrefab=0
    MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='Electronics_Generic_CokeMachine_Door',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=26,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(1)=(bSkipVerifySelf=false,SpawnClass='Electronics_Generic_CokeMachine_Glass_Side',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=-1,Y=-25.5,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=49152,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    MountOnSpawn(2)=(bSkipVerifySelf=false,SpawnClass='Electronics_Generic_CokeMachine_Glass_Side',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=-1,Y=25.5,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=16384,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    CollisionRadius=5
    CollisionHeight=53.75
    StaticMesh='sm_class_decorations.VendingMachine.VendingMachine'
}