/*******************************************************************************
 * Cannister_Generic_Green_Tip generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Cannister_Generic_Green_Tip extends aFinalDecoration;

var private bool bDetatched;

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
    local Vector Impulse, ImpulseLocation, ParentsImpulse, ParentsImpulseLocation;

    // End:0x3F
    if(Owner == none)
    {
        Owner.TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
    }
    return;
}

defaultproperties
{
    HealthPrefab=0
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Metal_Solid'
    PhysicsMassType=1
    Physics=9
    bTraceUsable=false
    bBlockKarma=false
    CollisionRadius=4
    CollisionHeight=4
    Mass=15
    StaticMesh='sm_class_decorations.Gas_Cannisters.Gas_Cannister_Green_TIP'
}