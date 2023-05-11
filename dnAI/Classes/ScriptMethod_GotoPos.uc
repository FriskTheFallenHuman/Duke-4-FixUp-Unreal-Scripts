/*******************************************************************************
 * ScriptMethod_GotoPos generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_GotoPos extends ScriptMethod_GotoBase
    native
    exportstructs
    hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport Vector TargetPos "Position to goto.";
var() noexport Vector TargetPosVar "Variance applied to the target pos.";
var() noexport float Range "Desired range from target pos.";
var() noexport float RangeVar "Variance added to the Range.";
var() noexport Engine.BaseAI.EAIFocus Focus "What should we focus on whilst moving to the destination?";
var() noexport deprecated name FocusActorTag "Tag of actor to focus on, if using focus actor.";
var() noexport bool FocusTarget "If true, we focus our target while moving - ignoring FocusActorTag *unless* we have no target, then we fall back on FocusActorTag";
var() noexport bool Run "Run or walk?";

event string GetMethodString()
{
    return ((((((((((((("GotoPos ((" $ string(TargetPos)) $ "), (") $ string(TargetPosVar)) $ "), ") $ string(Range)) $ ", ") $ string(RangeVar)) $ ", ") $ string(DynamicLoadObject(class'EAIFocus', int(Focus)))) $ ", ") $ string(FocusActorTag)) $ ", ") $ string(Run)) $ ")";
    return;
}

defaultproperties
{
    Range=0.1
    Focus=1
    Latent=true
}