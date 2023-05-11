/*******************************************************************************
 * UWindowButton generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowButton extends UWindowDialogControl;

var bool bDisabled;
var bool bStretched;
var bool bSolid;
var Texture UpTexture;
var Texture DownTexture;
var Texture DisabledTexture;
var Texture OverTexture;
var Texture GlowTexture;
var Region UpRegion;
var Region DownRegion;
var Region DisabledRegion;
var Region OverRegion;
var bool bUseRegion;
var float RegionScale;
var string ToolTipString;
var float ImageX;
var float ImageY;
var Sound OverSound;
var Sound DownSound;
var bool bNoClickSound;
var float Alpha;

function Created()
{
    super.Created();
    ImageX = 0;
    ImageY = 0;
    TextX = 0;
    TextY = 0;
    RegionScale = 1;
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local float fAlpha;
    local bool bOldSmooth;
    local float W, h;

    // End:0x4F
    if(bSolid)
    {
        C.Style = 1;
        bOldSmooth = C.bNoSmooth;
        C.bNoSmooth = false;
        fAlpha = 1;
    }
    // End:0xAF
    if(GlowTexture == none)
    {
        // End:0x90
        if(bStretched)
        {
            DrawStretchedTexture(C, ImageX, ImageY, WinWidth, WinHeight, GlowTexture, fAlpha);            
        }
        else
        {
            DrawClippedTexture(C, ImageX, ImageY, GlowTexture, fAlpha);
        }
    }
    // End:0x1F2
    if(bDisabled)
    {
        // End:0x1EF
        if(DisabledTexture == none)
        {
            // End:0x183
            if(bUseRegion)
            {
                // End:0xEF
                if(bStretched)
                {
                    W = WinWidth;
                    h = WinHeight;                    
                }
                else
                {
                    W = float(DisabledRegion.W);
                    h = float(DisabledRegion.h);
                }
                DrawStretchedTextureSegment(C, ImageX, ImageY, W, h, float(DisabledRegion.X), float(DisabledRegion.Y), float(DisabledRegion.W) * RegionScale, float(DisabledRegion.h) * RegionScale, DisabledTexture, fAlpha, bSolid, bSolid);                
            }
            else
            {
                // End:0x1C4
                if(bStretched)
                {
                    DrawStretchedTexture(C, ImageX, ImageY, WinWidth, WinHeight, DisabledTexture, fAlpha, bSolid, bSolid);                    
                }
                else
                {
                    DrawClippedTexture(C, ImageX, ImageY, DisabledTexture, fAlpha, bSolid, bSolid);
                }
            }
        }        
    }
    else
    {
        // End:0x335
        if(bMouseDown)
        {
            // End:0x332
            if(DownTexture == none)
            {
                // End:0x2C6
                if(bUseRegion)
                {
                    // End:0x232
                    if(bStretched)
                    {
                        W = WinWidth;
                        h = WinHeight;                        
                    }
                    else
                    {
                        W = float(DownRegion.W);
                        h = float(DownRegion.h);
                    }
                    DrawStretchedTextureSegment(C, ImageX, ImageY, W, h, float(DownRegion.X), float(DownRegion.Y), float(DownRegion.W) * RegionScale, float(DownRegion.h) * RegionScale, DownTexture, fAlpha, bSolid, bSolid);                    
                }
                else
                {
                    // End:0x307
                    if(bStretched)
                    {
                        DrawStretchedTexture(C, ImageX, ImageY, WinWidth, WinHeight, DownTexture, fAlpha, bSolid, bSolid);                        
                    }
                    else
                    {
                        DrawClippedTexture(C, ImageX, ImageY, DownTexture, fAlpha, bSolid, bSolid);
                    }
                }
            }            
        }
        else
        {
            // End:0x358
            if(UseOverTexture())
            {
                DrawHighlightedButton(C, fAlpha * Alpha);                
            }
            else
            {
                // End:0x48F
                if(UpTexture == none)
                {
                    // End:0x423
                    if(bUseRegion)
                    {
                        // End:0x38F
                        if(bStretched)
                        {
                            W = WinWidth;
                            h = WinHeight;                            
                        }
                        else
                        {
                            W = float(UpRegion.W);
                            h = float(UpRegion.h);
                        }
                        DrawStretchedTextureSegment(C, ImageX, ImageY, W, h, float(UpRegion.X), float(UpRegion.Y), float(UpRegion.W) * RegionScale, float(UpRegion.h) * RegionScale, UpTexture, fAlpha, bSolid, bSolid);                        
                    }
                    else
                    {
                        // End:0x464
                        if(bStretched)
                        {
                            DrawStretchedTexture(C, ImageX, ImageY, WinWidth, WinHeight, UpTexture, fAlpha, bSolid, bSolid);                            
                        }
                        else
                        {
                            DrawClippedTexture(C, ImageX, ImageY, UpTexture, fAlpha, bSolid, bSolid);
                        }
                    }
                }
            }
        }
    }
    // End:0x4AF
    if(bSolid)
    {
        C.bNoSmooth = bOldSmooth;
    }
    DrawButtonText(C);
    return;
}

function DrawHighlightedButton(Canvas C, optional float fAlpha)
{
    local float W, h;

    // End:0x196
    if(OverTexture == none)
    {
        // End:0xCB
        if(bUseRegion)
        {
            // End:0x37
            if(bStretched)
            {
                W = WinWidth;
                h = WinHeight;                
            }
            else
            {
                W = float(OverRegion.W);
                h = float(OverRegion.h);
            }
            DrawStretchedTextureSegment(C, ImageX, ImageY, W, h, float(OverRegion.X), float(OverRegion.Y), float(OverRegion.W) * RegionScale, float(OverRegion.h) * RegionScale, OverTexture, fAlpha, bSolid, bSolid);            
        }
        else
        {
            // End:0x16B
            if(bStretched)
            {
                // End:0x13F
                if(bSolid)
                {
                    DrawStretchedTextureSegment(C, ImageX, ImageY, WinWidth, WinHeight, 0, 0, float(OverTexture.USize), float(OverTexture.VSize), OverTexture, fAlpha, bSolid, bSolid);                    
                }
                else
                {
                    DrawStretchedTexture(C, ImageX, ImageY, WinWidth, WinHeight, OverTexture, fAlpha);
                }                
            }
            else
            {
                DrawClippedTexture(C, ImageX, ImageY, OverTexture, fAlpha, bSolid, bSolid);
            }
        }
    }
    return;
}

function DrawButtonText(Canvas C)
{
    C.DrawColor = LookAndFeel.GetTextColor(self);
    LookAndFeel.ClipText(self, C, TextX, TextY, Text, true);
    return;
}

function bool UseOverTexture()
{
    return MouseIsOver();
    return;
}

function MouseLeave()
{
    super.MouseLeave();
    // End:0x1B
    if(ToolTipString != "")
    {
        ToolTip("");
    }
    return;
}

simulated function MouseEnter()
{
    super.MouseEnter();
    // End:0x1E
    if(ToolTipString != "")
    {
        ToolTip(ToolTipString);
    }
    // End:0x4E
    if(! bDisabled && OverSound == none)
    {
        GetPlayerOwner().HasAnim(1, OverSound, 6);
    }
    return;
}

simulated function Click(float X, float Y)
{
    Notify(2);
    // End:0x33
    if(! bDisabled && ! bNoClickSound)
    {
        LookAndFeel.PlayMenuSound(self, 2);
    }
    return;
}

function DoubleClick(float X, float Y)
{
    Notify(11);
    return;
}

function RClick(float X, float Y)
{
    Notify(6);
    return;
}

function MClick(float X, float Y)
{
    Notify(5);
    return;
}

function KeyDown(int Key, float X, float Y)
{
    local PlayerPawn P;

    P = Root.GetPlayerOwner();
    switch(Key)
    {
        // End:0x2E
        case int(P.13):
        // End:0x3E
        case int(P.210):
        // End:0x61
        case int(P.204):
            Click(X, Y);
            // End:0xB2
            break;
        // End:0x7C
        case int(P.212):
            Notify(20);
            // End:0xB2
            break;
        // End:0x97
        case int(P.213):
            Notify(21);
            // End:0xB2
            break;
        // End:0xFFFF
        default:
            super.KeyDown(Key, X, Y);
            // End:0xB2
            break;
            break;
    }
    return;
}

defaultproperties
{
    Alpha=1
    bIgnoreLDoubleClick=true
    bIgnoreMDoubleClick=true
    bIgnoreRDoubleClick=true
}