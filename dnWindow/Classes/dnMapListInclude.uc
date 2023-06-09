/*******************************************************************************
 * dnMapListInclude generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnMapListInclude extends dnMapListBox;

function bool ExternalDragOver(UWindowDialogControl ExternalControl, float X, float Y)
{
    // End:0x2F
    if((ExternalControl.OwnerWindow == OwnerWindow) || dnMapListExclude(ExternalControl) != none)
    {
        return false;
    }
    return super(UWindowListBox).ExternalDragOver(ExternalControl, X, Y);
    return;
}

function ReceiveDoubleClickItem(UWindowListBox l, UWindowListBoxItem i)
{
    super(UWindowListBox).ReceiveDoubleClickItem(l, i);
    MakeSelectedVisible();
    return;
}

defaultproperties
{
    bCanDrag=true
    bCanDragExternal=true
    bAcceptExternalDragDrop=true
}