/*******************************************************************************
 * ScriptMethod_PlaceTripMine generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_PlaceTripMine extends ScriptMethod
    native
    exportstructs
    hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport deprecated name TargetActorTag "Tag of the actor to place mine on.";

event string GetMethodString()
{
    return ("PlaceTripMine (" $ string(TargetActorTag)) $ ")";
    return;
}

defaultproperties
{
    Latent=true
}