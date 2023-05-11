/*******************************************************************************
 * Details_Generic_DirtPile_MaterialOverride generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Generic_DirtPile_MaterialOverride extends TriggerMaterialOverride
    collapsecategories
    hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x33
    if(Owner == none)
    {
        IsMountedTo(Owner.CollisionRadius, Owner.CollisionHeight);
    }
    return;
}

defaultproperties
{
    OverrideMaterial='dnMaterial.Dust'
    CollisionRadius=40
    CollisionHeight=6
}