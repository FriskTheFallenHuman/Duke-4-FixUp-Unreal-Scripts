/*******************************************************************************
 * UDukeSceneLocText generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneLocText extends UWindowScene;

struct FontStruct
{
    var Font FontObj;
};

var array<string> LocText;
var array<FontStruct> FontList;
var int FontIdx;

function Created()
{
    local int i;

    super.Created();
    KeyButtons[0].SetText("Change Font");
    KeyButtons[0].PCButton = SPCText;
    i = 0;
    J0x43:

    // End:0x8F [Loop If]
    if(i < string(class'Canvas'.default.TrueTypeFonts))
    {
        FontList[FontList.Add(1)].FontObj = class'Canvas'.default.TrueTypeFonts[i];
        ++ i;
        // [Loop Continue]
        goto J0x43;
    }
    FontIdx = 0;
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local int i, Lines;
    local float XPos, YPos, XL, YL;

    super.Paint(C, X, Y);
    XPos = float(C.SizeX) * 0.1;
    YPos = float(C.SizeY) * 0.1;
    C.Font = C.TallFont;
    TextSize(C, "FontName:", XL, YL, TTFontScale, TTFontScale);
    ClipText(C, XPos, YPos, "FontName:" @ string(FontList[FontIdx].FontObj.Name),, TTFontScale, TTFontScale, 1, 2);
    YPos += YL;
    C.Font = FontList[FontIdx].FontObj;
    i = 0;
    J0x11E:

    // End:0x1C8 [Loop If]
    if(i < string(LocText))
    {
        TextSize(C, LocText[i], XL, YL, TTFontScale, TTFontScale);
        Lines = WrapClipText(C, XPos, YPos, LocText[i],, int(float(C.SizeX) * 0.75),,, TTFontScale, TTFontScale);
        YPos += ((YL * float(Lines)) + YL);
        ++ i;
        // [Loop Continue]
        goto J0x11E;
    }
    return;
}

function KeyDown(int Key, float X, float Y)
{
    // End:0x43
    if((Key == int(210)) || Key == int(32))
    {
        // End:0x39
        if((FontIdx + 1) == string(FontList))
        {
            FontIdx = 0;            
        }
        else
        {
            ++ FontIdx;
        }        
    }
    else
    {
        super(UWindowWindow).KeyDown(Key, X, Y);
    }
    return;
}

function OnNavForward()
{
    super.OnNavForward();
    LocText.Remove(0, string(LocText));
    LocText[LocText.Add(1)] = ClassIsChildOf("UDukeSceneLocText", "Text1", "dnWindow");
    LocText[LocText.Add(1)] = ClassIsChildOf("UDukeSceneLocText", "Text2", "dnWindow");
    LocText[LocText.Add(1)] = ClassIsChildOf("UDukeSceneLocText", "Text3", "dnWindow");
    LocText[LocText.Add(1)] = ClassIsChildOf("UDukeSceneLocText", "Text4", "dnWindow");
    LocText[LocText.Add(1)] = ClassIsChildOf("UDukeSceneLocText", "Text5", "dnWindow");
    LocText[LocText.Add(1)] = ClassIsChildOf("UDukeSceneLocText", "Text6", "dnWindow");
    return;
}

defaultproperties
{
    bNoLogo=true
    bNoBackground=true
    bNoLines=true
    NumKeyButtons=2
}