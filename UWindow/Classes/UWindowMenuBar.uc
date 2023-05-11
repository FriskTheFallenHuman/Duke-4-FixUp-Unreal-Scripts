/*******************************************************************************
 * UWindowMenuBar generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowMenuBar extends UWindowListControl
    dependson(WindowConsole);

var UWindowMenuBarItem Selected;
var UWindowMenuBarItem Over;
var bool bAltDown;
var int Spacing;

function Created()
{
    ListClass = class'UWindowMenuBarItem';
    SetAcceptsHotKeys(true);
    super.Created();
    Spacing = 10;
    return;
}

function UWindowMenuBarItem AddHelpItem(string Caption)
{
    local UWindowMenuBarItem i;

    i = AddItem(Caption);
    i.SetHelp(true);
    return i;
    return;
}

function UWindowMenuBarItem AddItem(string Caption)
{
    local UWindowMenuBarItem i;

    i = UWindowMenuBarItem(Items.Append(class'UWindowMenuBarItem'));
    i.Owner = self;
    i.SetCaption(Caption);
    return i;
    return;
}

function ResolutionChanged(float W, float h)
{
    local UWindowMenuBarItem i;

    i = UWindowMenuBarItem(Items.Next);
    J0x1A:

    // End:0x7D [Loop If]
    if(i == none)
    {
        // End:0x60
        if(i.Menu == none)
        {
            i.Menu.ResolutionChanged(W, h);
        }
        i = UWindowMenuBarItem(i.Next);
        // [Loop Continue]
        goto J0x1A;
    }
    super(UWindowWindow).ResolutionChanged(W, h);
    return;
}

function Paint(Canvas C, float MouseX, float MouseY)
{
    local float X, W, h;
    local UWindowMenuBarItem i;

    DrawMenuBar(C);
    i = UWindowMenuBarItem(Items.Next);
    J0x25:

    // End:0x12E [Loop If]
    if(i == none)
    {
        C.Font = C.TallFont;
        TextSize(C, RemoveAmpersand(i.Caption), W, h);
        // End:0xCB
        if(i.bHelp)
        {
            DrawItem(C, i, WinWidth - (W + float(Spacing)), 1, W + float(Spacing), 14);            
        }
        else
        {
            DrawItem(C, i, X, 1, W + float(Spacing), 14);
            X = (X + W) + float(Spacing);
        }
        i = UWindowMenuBarItem(i.Next);
        // [Loop Continue]
        goto J0x25;
    }
    return;
}

function MouseMove(float X, float Y)
{
    local UWindowMenuBarItem i;

    super(UWindowDialogControl).MouseMove(X, Y);
    Over = none;
    i = UWindowMenuBarItem(Items.Next);
    J0x31:

    // End:0xFF [Loop If]
    if(i == none)
    {
        // End:0xE2
        if((X >= i.ItemLeft) && X <= (i.ItemLeft + i.ItemWidth))
        {
            // End:0xD7
            if(Selected == none)
            {
                // End:0xD4
                if(Selected == i)
                {
                    Selected.DeSelect();
                    Selected = i;
                    Selected.Select();
                    Select(Selected);
                }                
            }
            else
            {
                Over = i;
            }
        }
        i = UWindowMenuBarItem(i.Next);
        // [Loop Continue]
        goto J0x31;
    }
    return;
}

function MouseLeave()
{
    super(UWindowDialogControl).MouseLeave();
    Over = none;
    return;
}

function Select(UWindowMenuBarItem i)
{
    return;
}

function LMouseDown(float X, float Y)
{
    local UWindowMenuBarItem i;

    i = UWindowMenuBarItem(Items.Next);
    J0x1A:

    // End:0xF1 [Loop If]
    if(i == none)
    {
        // End:0xD4
        if((X >= i.ItemLeft) && X <= (i.ItemLeft + i.ItemWidth))
        {
            // End:0x87
            if(Selected == none)
            {
                Selected.DeSelect();
            }
            // End:0xAC
            if(Selected != i)
            {
                Selected = none;
                Over = i;                
            }
            else
            {
                Selected = i;
                Selected.Select();
            }
            Select(Selected);
            return;
        }
        i = UWindowMenuBarItem(i.Next);
        // [Loop Continue]
        goto J0x1A;
    }
    // End:0x10D
    if(Selected == none)
    {
        Selected.DeSelect();
    }
    Selected = none;
    Select(Selected);
    return;
}

function DrawItem(Canvas C, UWindowList Item, float X, float Y, float W, float h)
{
    local string Text, Underline;

    C.DrawColor.R = 255;
    C.DrawColor.G = 255;
    C.DrawColor.B = 255;
    UWindowMenuBarItem(Item).ItemLeft = X;
    UWindowMenuBarItem(Item).ItemWidth = W;
    LookAndFeel.Menu_DrawMenuBarItem(self, UWindowMenuBarItem(Item), X, Y, W, h, C);
    return;
}

function DrawMenuBar(Canvas C)
{
    DrawStretchedTexture(C, 0, 0, WinWidth, 16, Texture'MenuBar');
    return;
}

function CloseUp()
{
    // End:0x23
    if(Selected == none)
    {
        Selected.DeSelect();
        Selected = none;
    }
    return;
}

function Close(optional bool bByParent)
{
    Root.Console.CloseUWindow();
    return;
}

function UWindowMenuBar GetMenuBar()
{
    return self;
    return;
}

function bool HotKeyDown(int Key, float X, float Y)
{
    local UWindowMenuBarItem i;

    // End:0x14
    if(Key == 18)
    {
        bAltDown = true;
    }
    // End:0xC6
    if(bAltDown)
    {
        i = UWindowMenuBarItem(Items.Next);
        J0x37:

        // End:0xC6 [Loop If]
        if(i == none)
        {
            // End:0xA9
            if(Key == int(i.HotKey))
            {
                // End:0x79
                if(Selected == none)
                {
                    Selected.DeSelect();
                }
                Selected = i;
                Selected.Select();
                Select(Selected);
                bAltDown = false;
                return true;
            }
            i = UWindowMenuBarItem(i.Next);
            // [Loop Continue]
            goto J0x37;
        }
    }
    return false;
    return;
}

function bool HotKeyUp(int Key, float X, float Y)
{
    // End:0x14
    if(Key == 18)
    {
        bAltDown = false;
    }
    return false;
    return;
}

function KeyDown(int Key, float X, float Y)
{
    local UWindowMenuBarItem i;

    switch(Key)
    {
        // End:0xA4
        case 37:
            i = UWindowMenuBarItem(Selected.Prev);
            // End:0x5F
            if((i != none) || i != Items)
            {
                i = UWindowMenuBarItem(Items.Last);
            }
            // End:0x7B
            if(Selected == none)
            {
                Selected.DeSelect();
            }
            Selected = i;
            Selected.Select();
            Select(Selected);
            // End:0x131
            break;
        // End:0x12E
        case 39:
            i = UWindowMenuBarItem(Selected.Next);
            // End:0xE9
            if(i != none)
            {
                i = UWindowMenuBarItem(Items.Next);
            }
            // End:0x105
            if(Selected == none)
            {
                Selected.DeSelect();
            }
            Selected = i;
            Selected.Select();
            Select(Selected);
            // End:0x131
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

function MenuCmd(int Menu, int Item)
{
    local UWindowMenuBarItem i;
    local int j;

    j = 0;
    i = UWindowMenuBarItem(Items.Next);
    J0x21:

    // End:0xDB [Loop If]
    if(i == none)
    {
        // End:0xB7
        if((j == Menu) && i.Menu == none)
        {
            // End:0x70
            if(Selected == none)
            {
                Selected.DeSelect();
            }
            Selected = i;
            Selected.Select();
            Select(Selected);
            i.Menu.MenuCmd(Item);
            return;
        }
        ++ j;
        i = UWindowMenuBarItem(i.Next);
        // [Loop Continue]
        goto J0x21;
    }
    return;
}