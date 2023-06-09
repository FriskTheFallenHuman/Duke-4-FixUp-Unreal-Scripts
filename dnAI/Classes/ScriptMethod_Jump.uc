/*******************************************************************************
 * ScriptMethod_Jump generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_Jump extends ScriptMethod
    native
    exportstructs
    hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport Vector JumpVel "Velocity to apply.";
var() noexport float HeavyLandingThresh "If we fall more then this, do a heavy landing.  (<=0.0f -> never do heavy landing)";
var() noexport bool bUseDefaultGravity "If true we will use the AI's default jump gravity when jumping. For example, ass troopers jump with a gravity of .25, most others jump with a gravity of 1.";
var() noexport float NonDefaultGravityScale "If bUseDefaultGravity we will use this number as the gravity scale. 1.0 = normal gravity. 0.0 = no gravity. 2.0 = double gravity.";
var() noexport bool FacePrimaryTarget "Should I face my primary target actor (usually duke) - NOT the target Im jumping to. The target I want to kill.";

event string GetMethodString()
{
    return ((("Jump ((" $ string(JumpVel)) $ "), ") $ string(HeavyLandingThresh)) $ ")";
    return;
}

defaultproperties
{
    JumpVel=(X=150,Y=0,Z=200)
    HeavyLandingThresh=150
    bUseDefaultGravity=true
    NonDefaultGravityScale=1
    Latent=true
}