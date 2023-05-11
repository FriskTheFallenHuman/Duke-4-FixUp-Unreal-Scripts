/*******************************************************************************
 * UDukeDifficultyMB generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeDifficultyMB extends UDukeMessageBox;

var UDukeMenuButton Diff1Button;
var localized string Diff1Text;
var localized string Diff1Help;
var UDukeMenuButton Diff2Button;
var localized string Diff2Text;
var localized string Diff2Help;
var UDukeMenuButton Diff3Button;
var localized string Diff3Text;
var localized string Diff3Help;
var UDukeMenuButton Diff4Button;
var localized string Diff4Text;
var localized string Diff4Help;

function Created()
{
    super.Created();
    Diff1Button = UDukeMenuButton(CreateWindow(class'UDukeMenuButton', 1, 1, 1, 1));
    Diff1Button.SetText(Diff1Text);
    Diff1Button.SetHelpText(Diff1Help);
    Diff2Button = UDukeMenuButton(CreateWindow(class'UDukeMenuButton', 1, 1, 1, 1));
    Diff2Button.SetText(Diff2Text);
    Diff2Button.SetHelpText(Diff2Help);
    Diff3Button = UDukeMenuButton(CreateWindow(class'UDukeMenuButton', 1, 1, 1, 1));
    Diff3Button.SetText(Diff3Text);
    Diff3Button.SetHelpText(Diff3Help);
    Diff4Button = UDukeMenuButton(CreateWindow(class'UDukeMenuButton', 1, 1, 1, 1));
    Diff4Button.SetText(Diff4Text);
    Diff4Button.SetHelpText(Diff4Help);
    Diff1Button.NavUp = Diff4Button;
    Diff2Button.NavUp = Diff1Button;
    Diff3Button.NavUp = Diff2Button;
    Diff4Button.NavUp = Diff3Button;
    Diff1Button.NavDown = Diff2Button;
    Diff2Button.NavDown = Diff3Button;
    Diff3Button.NavDown = Diff4Button;
    Diff4Button.NavDown = Diff1Button;
    Diff1Button.Register(self);
    Diff2Button.Register(self);
    Diff3Button.Register(self);
    Diff4Button.Register(self);
    return;
}

function PushedYes()
{
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    local float Buffer;

    super.BeforePaint(C, X, Y);
    KeyButtons[0].HideWindow();
    KeyButtons[1].HideWindow();
    Buffer = 2 * class'UWindowScene'.default.WinScaleY;
    Diff1Button.WinWidth = 400 * class'UWindowScene'.default.WinScaleY;
    Diff2Button.WinWidth = Diff1Button.WinWidth;
    Diff3Button.WinWidth = Diff1Button.WinWidth;
    Diff4Button.WinWidth = Diff1Button.WinWidth;
    Diff1Button.WinHeight = 40 * class'UWindowScene'.default.WinScaleY;
    Diff2Button.WinHeight = Diff1Button.WinHeight;
    Diff3Button.WinHeight = Diff1Button.WinHeight;
    Diff4Button.WinHeight = Diff1Button.WinHeight;
    Diff1Button.WinLeft = (WinWidth - Diff1Button.WinWidth) / 2;
    Diff2Button.WinLeft = Diff1Button.WinLeft;
    Diff3Button.WinLeft = Diff1Button.WinLeft;
    Diff4Button.WinLeft = Diff1Button.WinLeft;
    Diff1Button.WinTop = 70 * class'UWindowScene'.default.WinScaleY;
    Diff2Button.WinTop = (Diff1Button.WinTop + Diff1Button.WinHeight) + Buffer;
    Diff3Button.WinTop = (Diff2Button.WinTop + Diff2Button.WinHeight) + Buffer;
    Diff4Button.WinTop = (Diff3Button.WinTop + Diff3Button.WinHeight) + Buffer;
    return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
    super.NotifyFromControl(C, E);
    // End:0x85
    if(int(E) == 2)
    {
        // End:0x37
        if(C != Diff1Button)
        {
            PushedDifficulty(1);            
        }
        else
        {
            // End:0x52
            if(C != Diff2Button)
            {
                PushedDifficulty(2);                
            }
            else
            {
                // End:0x6D
                if(C != Diff3Button)
                {
                    PushedDifficulty(3);                    
                }
                else
                {
                    // End:0x85
                    if(C != Diff4Button)
                    {
                        PushedDifficulty(4);
                    }
                }
            }
        }
    }
    return;
}

function PushedDifficulty(int diff)
{
    iResult = diff;
    Close();
    GetPlayerOwner().Level.PlaySoundInfo(0, MessageBoxYesSoundInfo);
    return;
}

function ShowWindow()
{
    super.ShowWindow();
    // End:0x1A
    if(bCreated)
    {
        ChildInFocus = Diff1Button;
    }
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local float XL, YL, XPos, YPos, HelpTextScale;

    super.Paint(C, X, Y);
    XPos = 10 * class'UWindowScene'.default.WinScaleY;
    YPos = (Diff4Button.WinTop + Diff4Button.WinHeight) + (float(2) * class'UWindowScene'.default.WinScaleY);
    DrawStretchedTextureSegment(C, XPos, YPos, WinWidth - (XPos * 2), float(class'UWindowScene'.default.LineRegion.h) * class'UWindowScene'.default.WinScaleY, float(class'UWindowScene'.default.LineRegion.X), float(class'UWindowScene'.default.LineRegion.Y), float(class'UWindowScene'.default.LineRegion.W), float(class'UWindowScene'.default.LineRegion.h), FillTexture, 1);
    // End:0x21C
    if(ChildInFocus == none)
    {
        C.Font = C.BlockFontSmall;
        HelpTextScale = class'UWindowScene'.default.TTFontScale * 0.75;
        C.RegisterSound(HelpTextScale);
        TextSize(C, UWindowDialogControl(ChildInFocus).HelpText, XL, YL, HelpTextScale, HelpTextScale);
        XPos = (WinWidth - XL) - (float(21) * class'UWindowScene'.default.WinScaleY);
        YPos += (float(18) * class'UWindowScene'.default.WinScaleY);
        ClipText(C, XPos, YPos, UWindowDialogControl(ChildInFocus).HelpText, false, HelpTextScale, HelpTextScale);
    }
    return;
}

defaultproperties
{
    Diff1Text="<?int?dnWindow.UDukeDifficultyMB.Diff1Text?>"
    Diff1Help="<?int?dnWindow.UDukeDifficultyMB.Diff1Help?>"
    Diff2Text="<?int?dnWindow.UDukeDifficultyMB.Diff2Text?>"
    Diff2Help="<?int?dnWindow.UDukeDifficultyMB.Diff2Help?>"
    Diff3Text="<?int?dnWindow.UDukeDifficultyMB.Diff3Text?>"
    Diff3Help="<?int?dnWindow.UDukeDifficultyMB.Diff3Help?>"
    Diff4Text="<?int?dnWindow.UDukeDifficultyMB.Diff4Text?>"
    Diff4Help="<?int?dnWindow.UDukeDifficultyMB.Diff4Help?>"
    DesiredHeight=300
}