/*******************************************************************************
 * PhysicsMaterial generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PhysicsMaterial extends Object
    abstract
    native;

var() const int InternalMaterialID;
var() const float Hardness;
var() const class<DamageType> ImpactDamageType;

defaultproperties
{
    InternalMaterialID=-1
    Hardness=1
    ImpactDamageType='PhysicsImpactDamage'
}