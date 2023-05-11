/*******************************************************************************
 * ScriptMethod_SetLookTarget generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_SetLookTarget extends ScriptMethod
    native
    exportstructs
    hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport deprecated name TargetActorTag "The tag of the actor to aim the head at.";
var() noexport name TargetBoneName "Name of the target actors bone to aim the head at.";
var() noexport Engine.BaseAI.EAITargetStackOp TargetStackOp "Set / ClearAllAndSet / Clear / ClearAll";
var() noexport float TargetLifeTime "Pop this target after locking on to it for this long.  (<0.0f means infinite lifetime.)";
var() noexport float BlendTime "Time to blend aim on / off.";
var() noexport float AngularThresh "We move on to the next script method when this angle from target is obtained.  (< 0.0f means move on straight away.)";
var() noexport float EyeTrackRate "Degrees per Second to track the Eye Target.";
var() noexport float HeadTrackRate "Degrees per Second to track the Head Target.";
var() noexport bool RemoveBeyondConsts "Remove the target when it is beyond the constraints?";
var() noexport string TargetIDString "Optional unique string for this target.  Useful if you want to remove a specific target from the stack.";

event string GetMethodString()
{
    return ((((((((((((((((((("SetLookTarget (" $ string(TargetActorTag)) $ ", ") $ string(TargetBoneName)) $ ", ") $ string(DynamicLoadObject(class'EAITargetStackOp', int(TargetStackOp)))) $ ", ") $ string(TargetLifeTime)) $ ", ") $ string(BlendTime)) $ ", ") $ string(AngularThresh)) $ ", ") $ string(EyeTrackRate)) $ ", ") $ string(HeadTrackRate)) $ ", ") $ string(RemoveBeyondConsts)) $ ", ") $ TargetIDString) $ ")";
    return;
}

defaultproperties
{
    TargetBoneName=nose
    TargetStackOp=1
    TargetLifeTime=-1
    BlendTime=0.5
    AngularThresh=-1
    EyeTrackRate=160
    HeadTrackRate=120
    RemoveBeyondConsts=true
    TargetIDString="ScriptDefault"
}