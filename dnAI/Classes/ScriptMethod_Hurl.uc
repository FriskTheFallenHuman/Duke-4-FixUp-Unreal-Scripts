/*******************************************************************************
 * ScriptMethod_Hurl generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_Hurl extends ScriptMethod
    native
    exportstructs
    hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport deprecated name TargetActorTag "Tag of actor to hurl.";

event string GetMethodString()
{
    return ("Hurl (" $ string(TargetActorTag)) $ ")";
    return;
}

defaultproperties
{
    Latent=true
}