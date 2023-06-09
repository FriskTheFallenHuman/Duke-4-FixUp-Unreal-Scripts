/*******************************************************************************
 * GeoWaterBobPoint generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GeoWaterBobPoint extends InfoActor
    collapsecategories
    hidecategories(Collision,Filter,Interactivity,Karma,Lighting,Networking,Sound);

var float PrevZ;

final function Vector Sample(GeoWater Water)
{
    local float Height, move;
    local Vector Result;

    Height = Water.Resolve(Location);
    move = Height - PrevZ;
    Result = Vect(Location.X, Location.Y, - PrevZ + move);
    PrevZ = PrevZ + move;
    return Result;
    return;
}

defaultproperties
{
    bHidden=true
    Texture='dt_editor.Icons.GeoWaterBobPoint'
}