/*******************************************************************************
 * ScriptMethod_SetScriptTag generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_SetScriptTag extends ScriptMethod
    native
    exportstructs
    hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport name NewScriptTag "New ScriptTag to tigger.";

event string GetMethodString()
{
    return ("SetScriptTag (" $ string(NewScriptTag)) $ ")";
    return;
}
