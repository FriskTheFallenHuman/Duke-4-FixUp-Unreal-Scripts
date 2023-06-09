/*******************************************************************************
 * UDukeKickButton generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeKickButton extends UDukeMenuButton;

var Region KickBttnRegion;

function Created()
{
    super.Created();
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local float OffX, OffY;

    // End:0x2D
    if(bMouseDown && MouseIsOver())
    {
        OffX = -2;
        OffY = -2;        
    }
    else
    {
        OffX = 0;
        OffY = 0;
    }
    // End:0xA7
    if(UpTexture == none)
    {
        DrawStretchedTextureSegment(C, OffX, OffY, WinWidth, WinHeight, 0, 0, float(UpTexture.USize), float(UpTexture.VSize), UpTexture, 1, true,,,, true);
    }
    return;
}

defaultproperties
{
    UpTexture='Menu.MP.kick_graphic'
}