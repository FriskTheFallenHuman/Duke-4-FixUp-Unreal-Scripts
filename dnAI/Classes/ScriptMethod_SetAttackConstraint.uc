/*******************************************************************************
 * ScriptMethod_SetAttackConstraint generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_SetAttackConstraint extends ScriptMethod
    native
    exportstructs
    hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport Engine.BaseAI.EAIAttackConstraint AttackConstraint "How to constrain the attacks that this creature can perform.";

event string GetMethodString()
{
    return ("SetAttackConstraint (" $ string(DynamicLoadObject(class'EAIAttackConstraint', int(AttackConstraint)))) $ ")";
    return;
}