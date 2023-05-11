/*******************************************************************************
 * UDukeDigsMoreInfoWindow generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeDigsMoreInfoWindow extends UDukeDigsDisplayWindow
    config;

var UDukeKeyButton CloseButton;

function initWindow()
{
    local DukeMultiPlayer dmp;
    local PlayerProgression PlayerStats;

    dmp = DukeMultiPlayer(GetPlayerOwner());
    PlayerStats = dmp.PlayerProgress;
    CurrLvlPrefix = ClassIsChildOf("UDukeDigsDisplayWindow", "CurrLvlPrefix", "dnwindow") @ string(PlayerStats.GetLevel());
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local float TitleXL, TitleYL, TTFontScale, ClampedImageSize;
    local string DescHelpText;
    local float Lines, XL, YL, ImageYPos, FontScale, FontScaleX,
	    DescAndHelpTextHeight, UpperBarY, LowerBarY, BarHeight, TargetHelpWidth;

    DrawBackground(C);
    TTFontScale = class'UWindowScene'.default.TTFontScale;
    C.Font = C.TallFont;
    C.DrawColor = class'UWindowScene'.default.OrangeColor;
    TextSize(C, Title, TitleXL, TitleYL, TTFontScale * TitleScale, TTFontScale * TitleScale);
    ClipText(C, (WinWidth - TitleXL) / 2, WinHeight * TitleYPct, Title,, TTFontScale * TitleScale, TTFontScale * TitleScale, 1, 2);
    C.DrawColor = class'UWindowScene'.default.GreyColor;
    FontScale = TTFontScale * DescScale;
    C.RegisterSound(FontScale);
    TextSize(C, Description, XL, YL, FontScale, FontScale);
    Lines = float(WrapClipText(C, DescXPadding, 0, Description,, int(WinWidth - (DescXPadding * float(2))), true, false, FontScale, FontScale, 1, 2));
    // End:0x1A6
    if(bDrawLevelTxt)
    {
        Lines += float(2);
    }
    DescAndHelpTextHeight = (Lines * YL) + (WinHeight * TitleYPct);
    DescAndHelpTextHeight += (30 * class'UWindowScene'.default.WinScaleY);
    Lines = float(WrapClipText(C, DescXPadding, WinHeight - DescAndHelpTextHeight, Description,, int(WinWidth - (DescXPadding * float(2))),, false, FontScale, FontScale, 1, 2));
    // End:0x3F9
    if(bDrawLevelTxt)
    {
        C.DrawColor = class'UWindowScene'.default.OrangeColor;
        TextSize(C, CurrLvlPrefix, XL, YL, FontScale, FontScale);
        TargetHelpWidth = (WinWidth - (DescXPadding * 2.5)) * 0.5;
        FontScaleX = FontScale;
        // End:0x2CD
        if(XL > TargetHelpWidth)
        {
            FontScaleX *= (TargetHelpWidth / XL);
        }
        WrapClipText(C, DescXPadding, (WinHeight - DescAndHelpTextHeight) + ((Lines + float(1)) * YL), CurrLvlPrefix,, int(WinWidth - (DescXPadding * float(2))),, false, FontScaleX, FontScale, 1, 2);
        TextSize(C, HelpText, XL, YL, FontScale, FontScale);
        FontScaleX = FontScale;
        // End:0x385
        if(XL > TargetHelpWidth)
        {
            FontScaleX *= (TargetHelpWidth / XL);
            XL = TargetHelpWidth;
        }
        WrapClipText(C, (WinWidth - DescXPadding) - XL, (WinHeight - DescAndHelpTextHeight) + ((Lines + float(1)) * YL), HelpText,, int(WinWidth - (DescXPadding * float(2))),, false, FontScaleX, FontScale, 1, 2);
        Lines += float(2);
    }
    BarHeight = float(LineRegion.h) * class'UWindowScene'.default.WinScaleY;
    UpperBarY = UpperHorizYPct * WinHeight;
    LowerBarY = (WinHeight - DescAndHelpTextHeight) - BarHeight;
    C.DrawColor = WhiteColor;
    DrawStretchedTextureSegment(C, LineXEdgeOffset * WinWidth, UpperBarY, WinWidth - ((LineXEdgeOffset * WinWidth) * float(2)), BarHeight, float(LineRegion.X), float(LineRegion.Y), float(LineRegion.W), float(LineRegion.h), BackdropTexture, 1);
    DrawStretchedTextureSegment(C, LineXEdgeOffset * WinWidth, LowerBarY, WinWidth - ((LineXEdgeOffset * WinWidth) * float(2)), BarHeight, float(LineRegion.X), float(LineRegion.Y), float(LineRegion.W), float(LineRegion.h), BackdropTexture, 1);
    ClampedImageSize = FMin(LowerBarY - (UpperBarY + BarHeight), ImageSize);
    // End:0x5E0
    if(image == none)
    {
        ImageYPos = (UpperBarY + BarHeight) + ((LowerBarY - (UpperBarY + BarHeight)) * 0.5);
        ImageYPos -= (ClampedImageSize * 0.5);
        DrawStretchedTexture(C, (WinWidth - ClampedImageSize) / 2, ImageYPos, ClampedImageSize, ClampedImageSize, image, 1,,, true);
    }
    CloseButton.WinWidth = CloseButton.GetWidth(C);
    CloseButton.WinHeight = 30 * class'UWindowScene'.default.WinScaleY;
    CloseButton.WinLeft = (WinWidth / float(2)) - (CloseButton.WinWidth / float(2));
    CloseButton.WinTop = (WinHeight - CloseButton.WinHeight) - 5;
    return;
}

function Created()
{
    super(UWindowWindow).Created();
    CloseButton = UDukeKeyButton(CreateWindow(class'UDukeKeyButton'));
    CloseButton.XBoxButtonRegion = CloseButton.AButton;
    CloseButton.PCButton = class'UWindowScene'.default.SPCText;
    CloseButton.SetText(PressToClose);
    CloseButton.Register(self);
    CloseButton.ShowWindow();
    return;
}

defaultproperties
{
    ImageSize=160
}