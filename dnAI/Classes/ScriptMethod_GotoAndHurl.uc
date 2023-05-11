/*******************************************************************************
 * ScriptMethod_GotoAndHurl generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_GotoAndHurl extends ScriptMethod_GotoBase
    native
    exportstructs
    hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport deprecated name TargetTag "Tag of the object to hurl.";
var() noexport bool Run "Run or walk to the target object?";

event string GetMethodString()
{
    return ((("GotoAndHurl (" $ string(TargetTag)) $ ", ") $ string(Run)) $ ")";
    return;
}

defaultproperties
{
    Latent=true
}