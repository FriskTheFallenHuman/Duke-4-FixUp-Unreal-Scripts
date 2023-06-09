/*******************************************************************************
 * Biology_Generic_Tentacle_Collision generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Biology_Generic_Tentacle_Collision extends Biology_Generic
    collapsecategories;

function Activate()
{
    ForceMountUpdate(true, true, true, true, true);
    return;
}

function Deactivate()
{
    ForceMountUpdate(false, false, false, false, false);
    return;
}

defaultproperties
{
    bTraceUsable=false
    bTraceShootable=false
    bCollideWorld=false
    CollisionRadius=100
    CollisionHeight=60
    DrawScale3D=(X=2.5,Y=2.5,Z=3.5)
    StaticMesh='sm_class_decorations.Barrels.Barrel_Generic'
    Skins(0)='dt_editor.Surface.Climbable_Masking'
}