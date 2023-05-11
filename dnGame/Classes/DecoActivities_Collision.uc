/*******************************************************************************
 * DecoActivities_Collision generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DecoActivities_Collision extends DecoActivities
    native
    exportstructs
    hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport Engine.Object.EBitModifier bCollideActorsModifier "How to modify the bCollideActors flag during this activity.";
var() noexport Engine.Object.EBitModifier bCollideWorldModifier "How to modify the bCollideWorld flag during this activity.";
var() noexport Engine.Object.EBitModifier bBlockActorsModifier "How to modify the bBlockActors flag during this activity.";
var() noexport Engine.Object.EBitModifier bBlockPlayersModifier "How to modify the bBlockPlayers flag during this activity.";
var() noexport Engine.Object.EBitModifier bBlockKarmaModifier "How to modify the bBlockKarma flag during this activity.";
var() noexport Engine.Object.EBitModifier bBlockAIModifier "How to modify the bBlockAI flag during this activity.";
var() noexport Engine.Object.EBitModifier bTraceUsableModifier "How to modify the bTraceUsable flag during this activity.";
var() noexport Engine.Object.EBitModifier bTraceShootableModifier "How to modify the bTraceShootable flag during this activity.";
var() noexport Engine.Object.EBitModifier bCollisionAssumeValidModifier "How to modify the bCollisionAssumeValid flag during this activity.";
var() noexport Engine.Object.EFloatModifier CollisionRadiusModifier "How to apply the CollisionRadiusChange value to the current CollisionRadius.";
var() noexport float CollisionRadiusChange "Modifier value applied in the CollisonRadiusModifier method.";
var() noexport Engine.Object.EFloatModifier CollisionHeightModifier "How to apply the CollisionHeightChange value tot he current CollisionHeight.";
var() noexport float CollisionHeightChange "Modifier value applied in the CollisonHeightModifier method.";
