/*******************************************************************************
 * Containers_Pile_InfiniteAmmo generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Containers_Pile_InfiniteAmmo extends Containers_Generic
    collapsecategories;

simulated function Used(Actor Other, Pawn EventInstigator)
{
    // End:0x5D
    if(EventInstigator.InfiniteAmmoCrateUsed())
    {
        FindAndPlaySound('AmmoPile_Pickup');
        EventInstigator.HandQuickAction('HandQuickAction_Ammo_Grab');
        // End:0x5D
        if(bDoOverlayEffect && OverlayEffectAlphaTarget != 0)
        {
            FadeOverlayEffect(0, 1);
        }
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'AmmoPile_Pickup');
    PrecacheIndex.SetAnimPairState('HandQuickAction_Ammo_Grab');
    return;
}

defaultproperties
{
    HealthPrefab=0
    bForceUsePhrase=true
    bUsable=true
    UsePhrase="<?int?dnDecorations.Containers_Pile_InfiniteAmmo.UsePhrase?>"
    MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='Containers_Pile_InfiniteAmmo_Light',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=-4,Y=-12,Z=6),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),RenderObject=none,DrawScale=0)
    bNoDamage=true
    DynamicInteractionClassification=0
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Metal_Hollow'
    PhysicsMassType=1
    bAcceptsDecalProjectors=false
    bLowerByCollision=true
    bOverlayEffectUsedAsHint=true
    CollisionRadius=30
    CollisionHeight=6.4
    StaticMesh='sm_class_decorations.AmmoPile.AmmoPile'
}