/*******************************************************************************
 * UWindowProgressBar generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowProgressBar extends UWindowWindow;

const BlockWidth = 7;

var float Percent;

function SetPercent(float NewPercent)
{
    Percent = NewPercent;
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local float bLockX, BlockW;
    local Texture Tex;

    Tex = LookAndFeel.Misc;
    // End:0x2D
    if(Tex != none)
    {
        Tex = GetLookAndFeelTexture();
    }
    DrawMiscBevel(C, 0, 0, WinWidth, WinHeight, Tex, 2);
    C.DrawColor.R = 192;
    C.DrawColor.G = 192;
    C.DrawColor.B = 192;
    DrawStretchedTextureSegment(C, float(LookAndFeel.MiscBevelL[2].W), float(LookAndFeel.MiscBevelT[2].h), (WinWidth - float(LookAndFeel.MiscBevelL[2].W)) - float(LookAndFeel.MiscBevelR[2].W), (WinHeight - float(LookAndFeel.MiscBevelT[2].h)) - float(LookAndFeel.MiscBevelB[2].h), 0, 0, 1, 1, class'WhiteTexture');
    C.DrawColor.R = 0;
    C.DrawColor.G = 0;
    C.DrawColor.B = 255;
    bLockX = float(LookAndFeel.MiscBevelL[2].W + 1);
    J0x1C4:

    // End:0x301 [Loop If]
    if(bLockX < (float(1 + LookAndFeel.MiscBevelL[2].W) + ((Percent * (((WinWidth - float(LookAndFeel.MiscBevelL[2].W)) - float(LookAndFeel.MiscBevelR[2].W)) - float(2))) / float(100))))
    {
        BlockW = float(Min(7, int(((WinWidth - float(LookAndFeel.MiscBevelR[2].W)) - bLockX) - float(1))));
        DrawStretchedTextureSegment(C, bLockX, float(LookAndFeel.MiscBevelT[2].h + 1), BlockW, ((WinHeight - float(LookAndFeel.MiscBevelT[2].h)) - float(LookAndFeel.MiscBevelB[2].h)) - float(1), 0, 0, 1, 1, class'WhiteTexture');
        bLockX += float(7 + 1);
        // [Loop Continue]
        goto J0x1C4;
    }
    C.DrawColor.R = 255;
    C.DrawColor.G = 255;
    C.DrawColor.B = 255;
    return;
}