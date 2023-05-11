/*******************************************************************************
 * ColorTable generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ColorTable extends Object
    native;

cpptext
{
// Stripped
}

struct SColorTablePoint
{
    var float X;
    var float Y;
    var Color Color;
};

struct SColorTableTriangle
{
    var int Verts[3];
    var Range XRange;
    var Range YRange;
};

var array<SColorTablePoint> ColorPoints;
var array<SColorTableTriangle> ColorTriangles;
var Range XRange;
var Range YRange;

// Export UColorTable::execGetColorForPosition(FFrame&, void* const)
native(1290) final function Color GetColorForPosition(float X, float Y);