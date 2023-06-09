/*******************************************************************************
 * UDukeItemWindow generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeItemWindow extends UWindowDialogControl;

struct KeyListenInfo
{
    var Engine.Object.EInputKey Key;
    var int ClickEvent;
};

var Texture LockedTexture;
var Texture NewTexture;
var Texture SelectedTexture;
var Texture imageIcon;
var bool isSelected;
var bool isNew;
var Color SelectedColor;
var int ChallArrayIndex;
var UDukeNormalCheckBox ShownCheck;
var int GridIndex;
var array<KeyListenInfo> KeysToListen;
var string ItemName;
var string ItemDesc;
var string ItemHelpText;
var localized string LockedText;

function Created()
{
    super.Created();
    ShownCheck = UDukeNormalCheckBox(CreateWindow(class'UDukeNormalCheckBox', 1, 1, 1, 1));
    ShownCheck.Register(self);
    return;
}

simulated function Click(float X, float Y)
{
    Notify(2);
    return;
}

function KeyDown(int Key, float X, float Y)
{
    local PlayerPawn P;
    local int i;

    P = Root.GetPlayerOwner();
    i = 0;
    J0x1D:

    // End:0x6C [Loop If]
    if(i < string(KeysToListen))
    {
        // End:0x62
        if(Key == int(KeysToListen[i].Key))
        {
            Notify(byte(KeysToListen[i].ClickEvent));
            // [Explicit Break]
            goto J0x6C;
        }
        ++ i;
        // [Loop Continue]
        goto J0x1D;
    }
    J0x6C:

    super.KeyDown(Key, X, Y);
    return;
}

defaultproperties
{
    SelectedColor=(R=0,G=255,B=0,A=0)
    LockedText="<?int?dnWindow.UDukeItemWindow.LockedText?>"
}