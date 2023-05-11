/*******************************************************************************
 * UWindowWrappedTextArea generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowWrappedTextArea extends UWindowTextAreaControl;

function Paint(Canvas C, float X, float Y)
{
    local int i, j, Line, TempHead, TempTail;

    local float XL, YL;

    C.Font = Root.GetFont(Font, C);
    C.DrawColor.R = 255;
    C.DrawColor.G = 255;
    C.DrawColor.B = 255;
    TextSize(C, "TEST", XL, YL);
    VisibleRows = int(WinHeight / YL);
    // End:0xC7
    if(bScrollable)
    {
        VertSB.SetRange(0, float(Lines), float(VisibleRows));
    }
    TempHead = Head;
    TempTail = Tail;
    Line = TempHead;
    TextArea[Line] = Prompt;
    // End:0x179
    if(bScrollable)
    {
        // End:0x179
        if((VertSB.MaxPos - VertSB.pos) > float(0))
        {
            Line -= int(VertSB.MaxPos - VertSB.pos);
            TempTail -= int(VertSB.MaxPos - VertSB.pos);
        }
    }
    i = 0;
    J0x180:

    // End:0x200 [Loop If]
    if(i < VisibleRows)
    {
        WrapClipText(C, 2, YL * float((VisibleRows - i) - 1), TextArea[Line - 1]);
        -- Line;
        // End:0x1DD
        if(TempTail == Line)
        {
            // [Explicit Break]
            goto J0x200;
        }
        // End:0x1F6
        if(Line < 0)
        {
            Line = BufSize - 1;
        }
        ++ i;
        // [Loop Continue]
        goto J0x180;
    }
    J0x200:

    return;
}