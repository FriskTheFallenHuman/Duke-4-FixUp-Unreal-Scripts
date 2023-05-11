/*******************************************************************************
 * ScriptMethod_SetCollision generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_SetCollision extends ScriptMethod
    native
    exportstructs
    hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport Engine.Object.EBitModifier CollideWorld;
var() noexport Engine.Object.EBitModifier CollideActors;
var() noexport Engine.Object.EBitModifier BlockActors;
var() noexport Engine.Object.EBitModifier BlockPlayers;
var() noexport Engine.Object.EBitModifier BlockKarma;
var() noexport Engine.Object.EBitModifier AssumeValid;

event string GetMethodString()
{
    return ((((((((((("SetCollision (" $ string(DynamicLoadObject(class'EBitModifier', int(CollideWorld)))) $ ", ") $ string(DynamicLoadObject(class'EBitModifier', int(CollideActors)))) $ ", ") $ string(DynamicLoadObject(class'EBitModifier', int(BlockActors)))) $ ", ") $ string(DynamicLoadObject(class'EBitModifier', int(BlockPlayers)))) $ ", ") $ string(DynamicLoadObject(class'EBitModifier', int(BlockKarma)))) $ ", ") $ string(DynamicLoadObject(class'EBitModifier', int(AssumeValid)))) $ ")";
    return;
}