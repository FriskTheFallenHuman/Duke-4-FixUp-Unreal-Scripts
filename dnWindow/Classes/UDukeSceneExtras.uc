/*******************************************************************************
 * UDukeSceneExtras generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneExtras extends UDukeSceneTemplate;

function ButtonClicked(UDukeMenuButton Button, string Command)
{
    local class<UWindowScene> SceneClass;
    local class<UDukeMessageBox> MessageBoxClass;
    local UDukeMessageBox MessageBox;

    SceneClass = class<UWindowScene>(SaveConfigFile(Command, class'Class'));
    // End:0x32
    if(SceneClass == none)
    {
        NavigateForward(SceneClass);        
    }
    else
    {
        MessageBoxClass = class<UDukeMessageBox>(SaveConfigFile(Command, class'Class'));
        // End:0xDA
        if(MessageBoxClass == none)
        {
            MessageBox = UDukeMessageBox(CreateWindow(MessageBoxClass,,,,, self));
            MessageBox.SetupMessageBox(Command @ "Title", Command @ "Message", class'DukeDialogBoxManager'.default.YesStr, class'DukeDialogBoxManager'.default.NoStr);
            MessageBox.HideWindow();
            ShowModal(MessageBox);
        }
    }
    return;
}

function bool ShouldShowMenuItem(int Index)
{
    // End:0x44
    if(Entries[Index].Command == "dnWindow.UDukeEnterBonusCodeMB")
    {
        return class'ChallengeInfo'.static.TickDisplayMessages();
    }
    // End:0xC7
    if(DukePlayer(GetPlayerOwner()) == none)
    {
        // End:0xAB
        if((Entries[Index].Command == "dnWindow.UDukeSceneExtraSettings") && DukePlayer(GetPlayerOwner()).HasEnteredPreorderBonusBigHeadCode())
        {
            return true;
        }
        // End:0xC7
        if(DukePlayer(GetPlayerOwner()).HasFullGameCompletion(0))
        {
            return true;
        }
    }
    return false;
    return;
}

function UpdateLockedItems()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x68 [Loop If]
    if(i < string(Entries))
    {
        // End:0x43
        if(ShouldShowMenuItem(i))
        {
            Entries[i].Button.ShowWindow();
            // [Explicit Continue]
            goto J0x5E;
        }
        Entries[i].Button.HideWindow();
        J0x5E:

        ++ i;
        // [Loop Continue]
        goto J0x07;
    }
    return;
}

function OnNavForward()
{
    local int i;

    UpdateLockedItems();
    super(UWindowScene).OnNavForward();
    i = 0;
    J0x13:

    // End:0x89 [Loop If]
    if(i < string(Entries))
    {
        // End:0x7F
        if(ShouldShowMenuItem(i))
        {
            Entries[i].Button.ParentWindow.ChildInFocus = Entries[i].Button;
            LastFocus = Entries[i].Button;
            // [Explicit Break]
            goto J0x89;
        }
        ++ i;
        // [Loop Continue]
        goto J0x13;
    }
    J0x89:

    return;
}

defaultproperties
{
    Entries(0)=(Text="ENTER BONUS CODE",Help="Enter code to unlock bonuses.",Command="dnWindow.UDukeEnterBonusCodeMB",Button=none)
    Entries(1)=(Text="CONCEPT ART",Help="View concept art.",Command="dnWindow.UDukeSceneConceptArt",Button=none)
    Entries(2)=(Text="SCREENSHOTS",Help="View screenshots.",Command="dnWindow.UDukeSceneScreenShots",Button=none)
    Entries(3)=(Text="MOVIES",Help="View movies.",Command="dnWindow.UDukeSceneExtrasMovies",Button=none)
    Entries(4)=(Text="TRIPTYCH OFFICE PHOTOS",Help="View Triptych office photos.",Command="dnWindow.UDukeSceneOfficePhotos",Button=none)
    Entries(5)=(Text="DEVELOPMENT TIMELINE",Help="View development timeline.",Command="dnWindow.UDukeSceneTimeline",Button=none)
    Entries(6)=(Text="EXTRA GAME SETTINGS",Help="Change extra gameplay settings.",Command="dnWindow.UDukeSceneExtraSettings",Button=none)
    Entries(7)=(Text="DUKE SOUND BOARD",Help="Listen to Duke talk.",Command="dnWindow.UDukeSceneSoundBoard",Button=none)
    TitleText="<?int?dnWindow.UDukeSceneExtras.TitleText?>"
}