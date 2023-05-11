/*******************************************************************************
 * CylinderBuilder generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class CylinderBuilder extends BrushBuilder;

var() float Height;
var() float OuterRadius;
var() float InnerRadius;
var() int Sides;
var() name GroupName;
var() bool AlignToSide;
var() bool Hollow;

function BuildCylinder(int Direction, bool AlignToSide, int Sides, float Height, float Radius)
{
    local int n, i, j, q, Ofs;

    n = GetVertexCount();
    // End:0x32
    if(AlignToSide)
    {
        Radius /= Cos(3.141593 / float(Sides));
        Ofs = 1;
    }
    i = 0;
    J0x39:

    // End:0xE7 [Loop If]
    if(i < Sides)
    {
        j = -1;
        J0x53:

        // End:0xDD [Loop If]
        if(j < 2)
        {
            Vertex3f(Radius * Sin((((2 * float(i)) + float(Ofs)) * 3.141593) / float(Sides)), Radius * Cos((((2 * float(i)) + float(Ofs)) * 3.141593) / float(Sides)), (float(j) * Height) / float(2));
            j += 2;
            // [Loop Continue]
            goto J0x53;
        }
        ++ i;
        // [Loop Continue]
        goto J0x39;
    }
    i = 0;
    J0xEE:

    // End:0x178 [Loop If]
    if(i < Sides)
    {
        Poly4i(Direction, n + (i * 2), (n + (i * 2)) + 1, n + (((i * 2) + 3) % (2 * Sides)), n + (((i * 2) + 2) % (2 * Sides)), 'Wall');
        ++ i;
        // [Loop Continue]
        goto J0xEE;
    }
    return;
}

function bool Build()
{
    local int i, j, K;

    // End:0x13
    if(Sides < 3)
    {
        return BadParameters();
    }
    // End:0x34
    if((Height <= float(0)) || OuterRadius <= float(0))
    {
        return BadParameters();
    }
    // End:0x63
    if(Hollow && (InnerRadius <= float(0)) || InnerRadius >= OuterRadius)
    {
        return BadParameters();
    }
    BeginBrush(false, GroupName);
    BuildCylinder(1, AlignToSide, Sides, Height, OuterRadius);
    // End:0x190
    if(Hollow)
    {
        BuildCylinder(-1, AlignToSide, Sides, Height, InnerRadius);
        j = -1;
        J0xBF:

        // End:0x18D [Loop If]
        if(j < 2)
        {
            i = 0;
            J0xD2:

            // End:0x181 [Loop If]
            if(i < Sides)
            {
                Poly4i(j, (i * 2) + ((1 - j) / 2), (((i + 1) % Sides) * 2) + ((1 - j) / 2), ((((i + 1) % Sides) * 2) + ((1 - j) / 2)) + (Sides * 2), ((i * 2) + ((1 - j) / 2)) + (Sides * 2), 'Cap');
                ++ i;
                // [Loop Continue]
                goto J0xD2;
            }
            j += 2;
            // [Loop Continue]
            goto J0xBF;
        }        
    }
    else
    {
        j = -1;
        J0x19B:

        // End:0x206 [Loop If]
        if(j < 2)
        {
            PolyBegin(j, 'Cap');
            i = 0;
            J0x1BE:

            // End:0x1F4 [Loop If]
            if(i < Sides)
            {
                Polyi((i * 2) + ((1 - j) / 2));
                ++ i;
                // [Loop Continue]
                goto J0x1BE;
            }
            PolyEnd();
            j += 2;
            // [Loop Continue]
            goto J0x19B;
        }
    }
    return EndBrush();
    return;
}

defaultproperties
{
    Height=256
    OuterRadius=512
    InnerRadius=384
    Sides=8
    GroupName=Cylinder
    AlignToSide=true
    BitmapFilename="BBCylinder"
    ToolTip="Cylinder"
}