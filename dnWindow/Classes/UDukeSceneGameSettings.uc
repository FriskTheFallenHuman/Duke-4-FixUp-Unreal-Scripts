/*******************************************************************************
 * UDukeSceneGameSettings generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneGameSettings extends UWindowScene;

var UDukeCheckbox AimAssist;
var localized string AimAssistText;
var localized string AimAssistHelp;
var UDukeCheckbox WeaponSelect;
var localized string WeaponSelectText;
var localized string WeaponSelectHelp;
var UDukeCheckbox GameHints;
var localized string GameHintsText;
var localized string GameHintsHelp;
var UDukeCheckbox Subtitles;
var localized string SubtitlesText;
var localized string SubtitlesHelp;
var UDukeCheckbox BossMeter;
var localized string BossMeterText;
var localized string BossMeterHelp;
var UDukeMessageBox ConfirmDefaults;
var localized string ConfirmDefaultsText;
var localized string ConfirmDefaultsTitle;
var UDukeListSlider crosshairColors;
var localized string CrossHairColorsText;
var localized string CrossHairColorsHelp;
var array<string> colorTags;
var Texture ColorSelect;
var Region ColorBox;
var Region overlay;
var Region Border;
var float ImageSizeX;
var float ImageSizeY;

function Created()
{
    local int i;
    local string colorStr;

    super.Created();
    AimAssist = UDukeCheckbox(CreateWindow(class'UDukeCheckbox'));
    AimAssist.SetText(AimAssistText);
    AimAssist.SetHelpText(AimAssistHelp);
    AimAssist.Register(self);
    WeaponSelect = UDukeCheckbox(CreateWindow(class'UDukeCheckbox'));
    WeaponSelect.SetText(WeaponSelectText);
    WeaponSelect.SetHelpText(WeaponSelectHelp);
    WeaponSelect.Register(self);
    GameHints = UDukeCheckbox(CreateWindow(class'UDukeCheckbox'));
    GameHints.SetText(GameHintsText);
    GameHints.SetHelpText(GameHintsHelp);
    GameHints.Register(self);
    Subtitles = UDukeCheckbox(CreateWindow(class'UDukeCheckbox'));
    Subtitles.SetText(SubtitlesText);
    Subtitles.SetHelpText(SubtitlesHelp);
    Subtitles.Register(self);
    BossMeter = UDukeCheckbox(CreateWindow(class'UDukeCheckbox'));
    BossMeter.SetText(BossMeterText);
    BossMeter.SetHelpText(BossMeterHelp);
    BossMeter.Register(self);
    crosshairColors = UDukeListSlider(CreateWindow(class'UDukeListSlider'));
    i = 0;
    J0x1B8:

    // End:0x21E [Loop If]
    if(i <= (string(colorTags) - 1))
    {
        colorStr = ClassIsChildOf("ChallengeNames", colorTags[i], "dnwindow");
        crosshairColors.AddItem(colorStr, string(i));
        ++ i;
        // [Loop Continue]
        goto J0x1B8;
    }
    crosshairColors.SetText(CrossHairColorsText);
    crosshairColors.SetHelpText(CrossHairColorsHelp);
    crosshairColors.Register(self);
    FirstControlToFocus = AimAssist;
    AimAssist.NavDown = WeaponSelect;
    WeaponSelect.NavDown = GameHints;
    GameHints.NavDown = Subtitles;
    Subtitles.NavDown = BossMeter;
    BossMeter.NavDown = crosshairColors;
    crosshairColors.NavDown = AimAssist;
    AimAssist.NavUp = crosshairColors;
    WeaponSelect.NavUp = AimAssist;
    GameHints.NavUp = WeaponSelect;
    Subtitles.NavUp = GameHints;
    BossMeter.NavUp = Subtitles;
    crosshairColors.NavUp = BossMeter;
    SetDefaults();
    ConfirmDefaults = UDukeMessageBox(CreateWindow(class'UDukeMessageBox',,,,, self));
    ConfirmDefaults.SetupMessageBox(ConfirmDefaultsTitle, ConfirmDefaultsText, class'DukeDialogBoxManager'.default.YesStr, class'DukeDialogBoxManager'.default.NoStr);
    ConfirmDefaults.HideWindow();
    KeyButtons[2].ShowWindow();
    return;
}

function SetDefaults()
{
    local int crossHairIdx;

    AimAssist.bChecked = GetPlayerOwner().bDoAimAssist;
    GameHints.bChecked = GetPlayerOwner().bShowGameHints;
    Subtitles.bChecked = GetPlayerOwner().bShowSubtitles;
    BossMeter.bChecked = GetPlayerOwner().bShowBossMeter;
    WeaponSelect.bChecked = GetPlayerOwner().bUse4Weapons;
    GetConfigFloat("dnGame.DukePlayer", "crosshairColorIdx", crossHairIdx, "User.ini");
    // End:0x128
    if(crossHairIdx == 0)
    {
        GetConfigFloat("dnGame.DukePlayer", "crosshairColorIdx", crossHairIdx, "defuser.ini");
    }
    crosshairColors.SetSelectedIndex(crossHairIdx);
    return;
}

function Paint(Canvas C, float X, float Y)
{
    super.Paint(C, X, Y);
    AimAssist.WinWidth = float(ButtonWidth);
    AimAssist.WinHeight = float(ButtonHeight);
    AimAssist.WinLeft = float(ButtonLeft);
    AimAssist.WinTop = float(ControlStart);
    WeaponSelect.WinWidth = float(ButtonWidth);
    WeaponSelect.WinHeight = float(ButtonHeight);
    WeaponSelect.WinLeft = float(ButtonLeft);
    WeaponSelect.WinTop = (AimAssist.WinTop + AimAssist.WinHeight) + float(ControlBuffer);
    GameHints.WinWidth = float(ButtonWidth);
    GameHints.WinHeight = float(ButtonHeight);
    GameHints.WinLeft = float(ButtonLeft);
    GameHints.WinTop = (WeaponSelect.WinTop + WeaponSelect.WinHeight) + float(ControlBuffer);
    Subtitles.WinWidth = float(ButtonWidth);
    Subtitles.WinHeight = float(ButtonHeight);
    Subtitles.WinLeft = float(ButtonLeft);
    Subtitles.WinTop = (GameHints.WinTop + GameHints.WinHeight) + float(ControlBuffer);
    BossMeter.WinWidth = float(ButtonWidth);
    BossMeter.WinHeight = float(ButtonHeight);
    BossMeter.WinLeft = float(ButtonLeft);
    BossMeter.WinTop = (Subtitles.WinTop + Subtitles.WinHeight) + float(ControlBuffer);
    crosshairColors.WinWidth = float(ButtonWidth);
    crosshairColors.WinHeight = float(ButtonHeight);
    crosshairColors.WinLeft = float(ButtonLeft);
    crosshairColors.WinTop = (BossMeter.WinTop + BossMeter.WinHeight) + float(ControlBuffer);
    crosshairColors.ArrowLeft = float(ButtonWidth) - (float(250) * WinScaleX);
    ImageSizeX = 40 * class'UWindowScene'.default.WinScaleX;
    ImageSizeY = 40 * class'UWindowScene'.default.WinScaleY;
    C.DrawColor = DukePlayer(GetPlayerOwner()).crosshairColors[crosshairColors.GetSelectedIndex()];
    DrawStretchedTextureSegment(C, (crosshairColors.WinLeft + crosshairColors.WinWidth) - (ImageSizeX * float(2)), (crosshairColors.WinTop + crosshairColors.WinHeight) + float(ControlBuffer), ImageSizeX, ImageSizeY, float(ColorBox.X), float(ColorBox.Y), float(ColorBox.W), float(ColorBox.h), ColorSelect, 1);
    return;
}

function SaveConfigs()
{
    GetPlayerOwner().ConsoleCommand("setnosave PlayerPawn bDoAimAssist " $ string(AimAssist.bChecked));    
    GetPlayerOwner().ConsoleCommand("setnosave PlayerPawn bShowGameHints " $ string(GameHints.bChecked));    
    GetPlayerOwner().ConsoleCommand("setnosave PlayerPawn bShowSubtitles " $ string(Subtitles.bChecked));    
    GetPlayerOwner().ConsoleCommand("setnosave PlayerPawn bShowBossMeter " $ string(BossMeter.bChecked));
    SetConfigColor("Engine.Pawn", "bUse4Weapons", WeaponSelect.bChecked, "User.ini");
    GetPlayerOwner().bUse4Weapons = WeaponSelect.bChecked;
    SetConfigFloat("dnGame.DukePlayer", "crosshairColorIdx", crosshairColors.GetSelectedIndex(), "User.ini");
    DukePlayer(GetPlayerOwner()).crosshairColorIdx = crosshairColors.GetSelectedIndex();
    GetPlayerOwner().StaticSaveConfig();
    super(UWindowWindow).SaveConfigs();
    return;
}

function NavigateBack()
{
    SaveConfigs();
    super.NavigateBack();
    return;
}

function OnNavForward()
{
    SetDefaults();
    super.OnNavForward();
    return;
}

function ResetToDefaults()
{
    // End:0x20
    if(! ConfirmDefaults.WindowIsVisible())
    {
        ShowModal(ConfirmDefaults);
    }
    return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
    super.NotifyFromControl(C, E);
    // End:0x36
    if(int(E) == 2)
    {
        // End:0x36
        if(C != KeyButtons[2])
        {
            ResetToDefaults();
        }
    }
    return;
}

function WindowEvent(UWindow.UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
    // End:0x4E
    if(int(msg) == int(7))
    {
        // End:0x4E
        if((Key == KeyButtons[2].XBoxInputKey) || Key == KeyButtons[2].PCInputKey)
        {
            ResetToDefaults();
        }
    }
    super.WindowEvent(msg, C, X, Y, Key);
    return;
}

function DukeMessageBoxDone(UWindowWindow W, int iResult)
{
    local int Value, crossHairIdx;

    // End:0x1C2
    if(W != ConfirmDefaults)
    {
        // End:0x1C2
        if(iResult > 0)
        {
            GetConfigColor("Engine.PlayerPawn", "bDoAimAssist", Value, "defuser.ini");
            GetPlayerOwner().bDoAimAssist = bool(Value);
            GetConfigColor("Engine.PlayerPawn", "bShowGameHints", Value, "defuser.ini");
            GetPlayerOwner().bShowGameHints = bool(Value);
            GetConfigColor("Engine.PlayerPawn", "bShowSubtitles", Value, "defuser.ini");
            GetPlayerOwner().bShowSubtitles = bool(Value);
            GetConfigColor("Engine.PlayerPawn", "bShowBossMeter", Value, "defuser.ini");
            GetPlayerOwner().bShowBossMeter = bool(Value);
            GetPlayerOwner().bUse4Weapons = false;
            SetDefaults();
            GetConfigFloat("dnGame.DukePlayer", "crosshairColorIdx", crossHairIdx, "defuser.ini");
            crosshairColors.SetSelectedIndex(crossHairIdx);
        }
    }
    super(UWindowWindow).DukeMessageBoxDone(W, iResult);
    return;
}

defaultproperties
{
    AimAssistText="<?int?dnWindow.UDukeSceneGameSettings.AimAssistText?>"
    AimAssistHelp="<?int?dnWindow.UDukeSceneGameSettings.AimAssistHelp?>"
    WeaponSelectText="<?int?dnWindow.UDukeSceneGameSettings.WeaponSelectText?>"
    WeaponSelectHelp="<?int?dnWindow.UDukeSceneGameSettings.WeaponSelectHelp?>"
    GameHintsText="<?int?dnWindow.UDukeSceneGameSettings.GameHintsText?>"
    GameHintsHelp="<?int?dnWindow.UDukeSceneGameSettings.GameHintsHelp?>"
    SubtitlesText="<?int?dnWindow.UDukeSceneGameSettings.SubtitlesText?>"
    SubtitlesHelp="<?int?dnWindow.UDukeSceneGameSettings.SubtitlesHelp?>"
    BossMeterText="<?int?dnWindow.UDukeSceneGameSettings.BossMeterText?>"
    BossMeterHelp="<?int?dnWindow.UDukeSceneGameSettings.BossMeterHelp?>"
    ConfirmDefaultsText="<?int?dnWindow.UDukeSceneGameSettings.ConfirmDefaultsText?>"
    ConfirmDefaultsTitle="<?int?dnWindow.UDukeSceneGameSettings.ConfirmDefaultsTitle?>"
    colorTags(0)="White"
    colorTags(1)="Pink"
    colorTags(2)="Purple"
    colorTags(3)="Blue"
    colorTags(4)="Turqoise"
    colorTags(5)="Orange"
    colorTags(6)="Olive"
    ColorSelect='Menu.MP.color_select'
    ColorBox=(X=12,Y=14,W=64,h=65)
    overlay=(X=91,Y=14,W=64,h=65)
    Border=(X=168,Y=7,W=75,h=77)
    TitleText="<?int?dnWindow.UDukeSceneGameSettings.TitleText?>"
}