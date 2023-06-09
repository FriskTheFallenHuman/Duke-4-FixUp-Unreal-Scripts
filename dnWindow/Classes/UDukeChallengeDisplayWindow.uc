/*******************************************************************************
 * UDukeChallengeDisplayWindow generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeChallengeDisplayWindow extends UWindowWindow
    config;

var int ChallengeIdx;
var string Title;
var string Description;
var string HelpText;
var Texture image;
var Texture HorizBar;
var string LockedImages[3];
var config float ImageSize;
var config float BarWidthPct;
var config float TitleYPct;
var config float UpperHorizYPct;
var config float ImageYPct;
var config float LowerHorizYPct;
var config float DescYPct;
var config float DescXPadding;
var config float TitleScale;
var config float DescScale;
var config float LineXEdgeOffset;
var bool IsLocked;
var int LockImageIdx;
var Region FillRegion;
var Texture FillTexture;
var Texture BorderTexture;
var Texture CapTexture;
var Region LineRegion;
var Texture BackdropTexture;
var bool bUseBabeRendering;

function Created()
{
    super.Created();
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local float TitleXL, TitleYL, TTFontScale, ClampedImageSize;
    local string DescHelpText;
    local float Lines, XL, YL, ImageYPos, Border;

    local PlayerPawn Pawn;

    DrawBackground(C);
    TTFontScale = class'UWindowScene'.default.TTFontScale;
    C.Font = C.TallFont;
    C.DrawColor = class'UWindowScene'.default.OrangeColor;
    // End:0xCE
    if(class'ChallengeInfo'.default.ChallengesArray[ChallengeIdx].ChallObj == none)
    {
        Border = 16;
        Pawn = GetPlayerOwner();
        class'ChallengeInfo'.default.ChallengesArray[ChallengeIdx].ChallObj.DrawChallengeWindow(C, self, TTFontScale, Pawn);        
    }
    else
    {
        TextSize(C, "NO ChallengeObject - Error", TitleXL, TitleYL, TTFontScale * TitleScale, TTFontScale * TitleScale);
        ClipText(C, (WinWidth - TitleXL) / 2, WinHeight * TitleYPct, "NO ChallengeObject - Error",, TTFontScale * TitleScale, TTFontScale * TitleScale, 1, 2);
    }
    return;
}

function SetChallId(int id)
{
    ChallengeIdx = class'ChallengeInfo'.static.GetGamepadButtonImageForShortKeyName(id);
    return;
}

function DrawBorderCorner(Canvas C, float X, float Y, float Rotation)
{
    C.SetPause(X, Y);
    C.SetClampMode(CapTexture, float(CapTexture.DrawStatic()), float(CapTexture.DrawTile()), 0, 0, float(CapTexture.DrawStatic()), float(CapTexture.DrawTile()), Rotation);
    return;
}

function DrawBackground(Canvas C)
{
    local float BorderThickness, DoubleBorderThickness, borderwidth, BorderHeight;

    BorderThickness = 8;
    DoubleBorderThickness = BorderThickness * float(2);
    borderwidth = WinWidth - DoubleBorderThickness;
    BorderHeight = WinHeight - DoubleBorderThickness;
    C.DrawColor = GetPlayerOwner().NewColorBytes(255, 255, 255);
    DrawStretchedTextureSegment(C, BorderThickness, BorderThickness, WinWidth - (float(2) * BorderThickness), WinHeight - (float(2) * BorderThickness), float(FillRegion.X), float(FillRegion.Y), float(FillRegion.W), float(FillRegion.h), FillTexture, 1);
    C.SetPause(BorderThickness, 0);
    C.SetClampMode(BorderTexture, borderwidth, BorderThickness, 0, 0, borderwidth, BorderThickness);
    C.SetPause(BorderThickness, WinHeight - BorderThickness);
    C.SetClampMode(BorderTexture, borderwidth, BorderThickness, 0, 0, borderwidth, BorderThickness, 3.141593);
    C.SetPause(0.5 * (BorderThickness - BorderHeight), 0.5 * (WinHeight - BorderThickness));
    C.SetClampMode(BorderTexture, WinHeight - DoubleBorderThickness, BorderThickness, 0, 0, BorderHeight, BorderThickness, 3.141593 / float(2));
    C.SetPause(WinWidth - (0.5 * (BorderHeight + BorderThickness)), 0.5 * (WinHeight - BorderThickness));
    C.SetClampMode(BorderTexture, WinHeight - DoubleBorderThickness, BorderThickness, 0, 0, BorderHeight, BorderThickness, (3 * 3.141593) / float(2));
    DrawBorderCorner(C, 0, 0, 0);
    DrawBorderCorner(C, WinWidth - BorderThickness, 0, 3.141593 / float(2));
    DrawBorderCorner(C, WinWidth - BorderThickness, WinHeight - BorderThickness, 3.141593);
    DrawBorderCorner(C, 0, WinHeight - BorderThickness, (3 * 3.141593) / float(2));
    return;
}

defaultproperties
{
    LockedImages[0]="Map_mydigs.Menu.Wrap_BoxLarge"
    LockedImages[1]="Map_mydigs.Menu.Wrap_BoxMedium"
    LockedImages[2]="Map_mydigs.Menu.Wrap_Picture"
    ImageSize=256
    TitleYPct=0.025
    UpperHorizYPct=0.0925
    ImageYPct=0.125
    LowerHorizYPct=0.685
    DescYPct=0.725
    DescXPadding=25
    TitleScale=1.1
    DescScale=0.75
    LineXEdgeOffset=0.15
    FillRegion=(X=360,Y=88,W=2,h=2)
    FillTexture='Menu.Menu.Backdrop'
    BorderTexture='Menu.Menu.Border_Straight'
    CapTexture='Menu.Menu.Border_Cap'
    LineRegion=(X=17,Y=0,W=980,h=16)
    BackdropTexture='Menu.Menu.Backdrop'
}