/*******************************************************************************
 * ScriptMethod_OverrideTarget generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
interface ScriptMethod_OverrideTarget extends ScriptMethod
    native
    parseconfig
    exportstructs
    hidecategories(Object)
    notlistable;

cpptext
{
// Stripped
}

var() noexport deprecated name TargetActorTag "Tag of the new target actor.";
var() noexport bool ForceUpdate "If true, forces the target module to update the target info regardless of contact status.";
var() noexport bool AllowClear "If true, allows the target to clear when there has been no contacts for this actors ClearTargetTime.";

event string GetMethodString()
{
    return ((((("OverrideTarget (" $ string(TargetActorTag)) $ ", ") $ string(ForceUpdate)) $ ", ") $ string(AllowClear)) $ ") *** WARNING *** Deprecated - Use SetTarget.";
    return;
}

defaultproperties
{
    AllowClear=true
}