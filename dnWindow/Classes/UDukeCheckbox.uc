/*******************************************************************************
 * UDukeCheckbox generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeCheckbox extends UWindowDialogControl;

var float CheckX;
var float CheckY;
var float CheckWidth;
var Region OverRegion;
var Region CheckRegion;
var Region OpenCheckRegion;
var Region OverCheckRegion;
var bool bChecked;
var SSoundInfo SoundCheckboxInfo;
var float SelectedTime;
var float TextScaleX;
var float TextScaleY;
var float TextScaleXMod;
var float TextScaleYMod;
var Color DrawColor;
var float Alpha;
var bool bGreyedOut;
var Color DarkGreyColor;

simulated function Created()
{
    super.Created();
    Tick(0.5);
    return;
}

function Tick(float Delta)
{
    local float Alpha;

    super(UWindowWindow).Tick(Delta);
    // End:0x30
    if(ParentWindow.ChildInFocus != self)
    {
        SelectedTime += Delta;        
    }
    else
    {
        SelectedTime -= (2 * Delta);
    }
    SelectedTime = FClamp(SelectedTime, 0, class'UWindowScene'.default.SelectionTransitionTime);
    Alpha = SelectedTime / class'UWindowScene'.default.SelectionTransitionTime;
    TextScaleX = Lerp(Alpha, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.SelectedXScale * class'UWindowScene'.default.TTFontScale);
    TextScaleY = Lerp(Alpha, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.SelectedYScale * class'UWindowScene'.default.TTFontScale);
    DrawColor = Alpha == class'UWindowScene'.default.GreyColor;    
    return;
}

simulated function Click(float X, float Y)
{
    // End:0x0B
    if(bGreyedOut)
    {
        return;
    }
    Notify(2);
    bChecked = ! bChecked;
    GetPlayerOwner().PlaySoundInfo(0, SoundCheckboxInfo);
    Notify(1);
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
            // End:0x64
            break;
        // End:0xFFFF
        default:
            break;
    }
    super.KeyDown(Key, X, Y);
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    local float XL, YL;

    super.BeforePaint(C, X, Y);
    C.Font = C.TallFont;
    TextSize(C, Text, XL, YL, TextScaleX, TextScaleY);
    TextX = 30 * class'UWindowScene'.default.WinScaleY;
    TextY = (WinHeight - YL) / float(2);
    CheckWidth = WinHeight - (float(10) * class'UWindowScene'.default.WinScaleY);
    CheckY = (WinHeight - CheckWidth) / float(2);
    CheckX = (WinWidth - CheckWidth) - (float(40) * class'UWindowScene'.default.WinScaleY);
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local float TextXL, TextYL;

    // End:0x23
    if(! bGreyedOut)
    {
        C.DrawColor = DrawColor;        
    }
    else
    {
        C.DrawColor = DarkGreyColor;
    }
    C.Font = C.TallFont;
    TextSize(C, Text, TextXL, TextYL, TextScaleX * TextScaleXMod, TextScaleY * TextScaleYMod);
    ClipText(C, TextX, TextY, Text,, TextScaleX * TextScaleXMod, TextScaleY * TextScaleYMod, Alpha, 2);
    // End:0x158
    if(bChecked)
    {
        // End:0xF9
        if(! bGreyedOut)
        {
            C.DrawColor = class'UWindowScene'.default.WhiteColor;
        }
        DrawStretchedTextureSegment(C, CheckX, CheckY, CheckWidth, 0.89 * CheckWidth, float(CheckRegion.X), float(CheckRegion.Y), float(CheckRegion.W), float(CheckRegion.h), class'Backdrop', Alpha);        
    }
    else
    {
        DrawStretchedTextureSegment(C, CheckX, CheckY, CheckWidth, 0.89 * CheckWidth, float(OpenCheckRegion.X), float(OpenCheckRegion.Y), float(OpenCheckRegion.W), float(OpenCheckRegion.h), class'Backdrop', Alpha);
    }
    // End:0x21C
    if(ParentWindow.ChildInFocus != self)
    {
        class'UWindowScene'.static.DrawSelectionIcon(C, -8 * C.FixedScale, TextY + (0.5 * TextYL), C.FixedScale, Alpha);
    }
    return;
}

function setTextScaleMod(float X, float Y)
{
    TextScaleXMod = X;
    TextScaleYMod = Y;
    return;
}

function GreyOut()
{
    bGreyedOut = true;
    return;
}

function Ungrey()
{
    bGreyedOut = false;
    return;
}

defaultproperties
{
    OverRegion=(X=0,Y=16,W=486,h=40)
    CheckRegion=(X=72,Y=66,W=53,h=50)
    OpenCheckRegion=(X=13,Y=66,W=53,h=50)
    OverCheckRegion=(X=132,Y=66,W=53,h=50)
    SoundCheckboxInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=('a_menu.Menu.Menu_Arrow_R_01_ST'),SlotPriority=0,VolumePrefab=0,Slots=(0),Volume=0.5,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none)
    TextScaleXMod=1
    TextScaleYMod=1
    Alpha=1
    DarkGreyColor=(R=103,G=103,B=103,A=0)
}