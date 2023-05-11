/*******************************************************************************
 * UDukeKeyBinderControl generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeKeyBinderControl extends UDukeKeyBinderBaseControl;

const SwapWeaponsIndex = 10;
const MoreWeaponsIndex = 25;

var localized string LocalizedKeyName[255];
var string RealKeyName[255];
var string BoundKeys[150];
var UDukeMessageBox ConfirmKey;
var int SavedSelectedIndex;
var int SavedKeyNo;
var int SavedDupeIndex;

function Click(float X, float Y)
{
    // End:0x50
    if(! bPolling)
    {
        // End:0x3D
        if(X < (WinWidth - (float(20) * WinScaleY)))
        {
            SelectItem(GetIndexAtLoc(Y));
            StartPolling();
        }
        super(UWindowWindow).Click(X, Y);        
    }
    else
    {
        // End:0x60
        if(bPolling)
        {
            ProcessMenuKey(1);
        }
    }
    return;
}

function RClick(float X, float Y)
{
    local float XPos, YPos, YL, BaseClickY, TestY;

    // End:0x14
    if(bPolling)
    {
        ProcessMenuKey(2);        
    }
    else
    {
        super(UWindowWindow).RClick(X, Y);
    }
    return;
}

function MClick(float X, float Y)
{
    // End:0x14
    if(bPolling)
    {
        ProcessMenuKey(4);        
    }
    else
    {
        super(UWindowWindow).MClick(X, Y);
    }
    return;
}

function ProcessMenuKey(int KeyNo)
{
    local string KeyName;

    KeyName = RealKeyName[KeyNo];
    // End:0x3B
    if(GetPlayerOwner().FindAnimationControllerForPostureState(KeyNo))
    {
        // End:0x39
        if(KeyNo == 211)
        {
            StopPolling();
        }
        return;
    }
    // End:0x4A
    if(KeyName == "")
    {
        return;
    }
    // End:0x65
    if(KeyName == "Escape")
    {
        StopPolling();
        return;
    }
    // End:0x114
    if(((((KeyNo == int(Root.Console.91)) || KeyNo == int(Root.Console.92)) || KeyNo == int(Root.Console.236)) || KeyNo == int(Root.Console.237)) || KeyNo == int(Root.Console.19))
    {
        return;
    }
    StopPolling();
    SetKey(KeyNo);
    return;
}

function RemoveExistingKey(int Index)
{
    local string Alias, KeyName, NewCmd, Cmd;
    local int pos, i;

    KeyName = GetPlayerOwner().ConsoleCommand("KEYNAME" @ string(int(BoundKeys[Index])));
    // End:0x276
    if(KeyName != "")
    {
        Alias = GetPlayerOwner().ConsoleCommand("KEYBINDING" @ KeyName);
        // End:0x276
        if(Alias != "")
        {
            i = 0;
            J0x7C:

            // End:0xBD [Loop If]
            if(i < 150)
            {
                pos = InStr(Alias, AliasNames[i]);
                // End:0xB3
                if(pos > -1)
                {
                    // [Explicit Break]
                    goto J0xBD;
                }
                ++ i;
                // [Loop Continue]
                goto J0x7C;
            }
            J0xBD:

            // End:0x125
            if(pos > -1)
            {
                pos = InStr(Alias, AliasNames[Index]);
                Alias = Left(Alias, pos) $ Right(Alias, ((Len(Alias) - pos) - Len(AliasNames[Index])) - 1);
            }
            J0x125:

            pos = InStr(Alias, "|");
            // End:0x15E
            if(pos == 1)
            {
                Alias = Right(Alias, Len(Alias) - 3);                
            }
            else
            {
                // End:0x18D
                if(pos == (Len(Alias) - 2))
                {
                    Alias = Left(Alias, pos - 1);                    
                }
                else
                {
                    // End:0x1DB
                    if(pos > -1)
                    {
                        Cmd = FormatString(Left(Alias, pos), true, true);
                        Alias = FormatString(Right(Alias, (Len(Alias) - pos) - 1), true);                        
                    }
                    else
                    {
                        Cmd = FormatString(Alias, true, true);
                    }
                    // End:0x232
                    if(! Cmd ~= AliasNames[Index])
                    {
                        // End:0x21E
                        if(NewCmd == "")
                        {
                            NewCmd = Cmd;                            
                        }
                        else
                        {                            
                            NewCmd @= ("|" @ Cmd);
                        }
                    }
                }
            }
            // End:0x125
            if(!(pos == -1))
                goto J0x125;
            Localize(NewCmd);            
            GetPlayerOwner().ConsoleCommand(("set input" @ KeyName) @ NewCmd);
        }
    }
    BoundKeys[Index] = "";
    return;
}

function KeyCollisionConfirmed()
{
    local string Alias, KeyName;
    local PlayerPawn P;
    local int RemovedKey;

    RemovedKey = int(BoundKeys[SavedDupeIndex]);
    RemoveExistingKey(SavedDupeIndex);
    ForceSetKey(SavedSelectedIndex, SavedKeyNo);
    return;
}

function DukeMessageBoxDone(UWindowWindow W, int iResult)
{
    // End:0x21
    if(W != ConfirmKey)
    {
        // End:0x21
        if(iResult > 0)
        {
            KeyCollisionConfirmed();
        }
    }
    super(UWindowWindow).DukeMessageBoxDone(W, iResult);
    return;
}

function SetKey(int KeyNo)
{
    local int DupeIndex;

    // End:0x18
    if(int(BoundKeys[SelectedIndex]) == KeyNo)
    {
        return;
    }
    // End:0x64
    if(IsKeyAlreadyBoundToCommand(KeyNo, DupeIndex))
    {
        SavedSelectedIndex = SelectedIndex;
        SavedKeyNo = KeyNo;
        SavedDupeIndex = DupeIndex;
        OwnerWindow.ShowModal(ConfirmKey);        
    }
    else
    {
        ForceSetKey(SelectedIndex, KeyNo);
    }
    return;
}

function ForceSetKey(int Index, int KeyNo)
{
    local string Alias, KeyName, AliasScratch, Cmd;
    local bool bAlreadyBound;
    local int pos;

    RemoveExistingKey(Index);
    BoundKeys[Index] = string(KeyNo);
    KeyName = GetPlayerOwner().ConsoleCommand("KEYNAME" @ string(KeyNo));
    // End:0x1B9
    if(KeyName != "")
    {
        Alias = GetPlayerOwner().ConsoleCommand("KEYBINDING" @ KeyName);
        // End:0x186
        if(Alias != "")
        {
            AliasScratch = Alias;
            J0x96:

            pos = InStr(AliasScratch, "|");
            // End:0xEF
            if(pos > -1)
            {
                Cmd = FormatString(Left(AliasScratch, pos));
                AliasScratch = Right(AliasScratch, (pos - Len(AliasScratch)) - 1);                
            }
            else
            {
                Cmd = FormatString(AliasScratch);
            }
            // End:0x11B
            if(Cmd ~= AliasNames[Index])
            {
                bAlreadyBound = true;
            }
            // End:0x96
            if(!(pos == -1))
                goto J0x96;
            // End:0x183
            if(! bAlreadyBound)
            {
                Alias = (AliasNames[Index] $ " | ") $ Alias;                
                GetPlayerOwner().ConsoleCommand(("set input" @ KeyName) @ Alias);
            }            
        }
        else
        {            
            GetPlayerOwner().ConsoleCommand(("set input" @ KeyName) @ AliasNames[Index]);
        }
    }
    return;
}

function bool IsKeyAlreadyBoundToCommand(int KeyNo, out int DupeCommand)
{
    local string Alias, KeyName, Cmd;
    local int pos, i;

    KeyName = GetPlayerOwner().ConsoleCommand("KEYNAME " $ string(KeyNo));
    // End:0x181
    if(KeyName != "")
    {
        Alias = GetPlayerOwner().ConsoleCommand("KEYBINDING " $ KeyName);
        // End:0x181
        if(Alias != "")
        {
            i = 0;
            J0x77:

            // End:0x181 [Loop If]
            if(i < 150)
            {
                // End:0x99
                if(Commands[i] == "")
                {
                    // [Explicit Break]
                    goto J0x181;
                }
                // End:0xAB
                if(i == SelectedIndex)
                {
                    // [Explicit Continue]
                    goto J0x177;
                }
                pos = InStr(Alias, AliasNames[i]);
                // End:0x177
                if(pos > -1)
                {
                    // End:0x16A
                    if(Len(Alias) != Len(AliasNames[i]))
                    {
                        // End:0x136
                        if(pos == 0)
                        {
                            pos = InStr(Right(Alias, Len(Alias) - Len(AliasNames[i])), " ");
                            // End:0x133
                            if(pos != 0)
                            {
                                // [Explicit Continue]
                                goto J0x177;
                            }                            
                        }
                        else
                        {
                            pos = InStr(Right(Alias, (Len(Alias) - pos) + 1), " ");
                            // End:0x16A
                            if(pos != 0)
                            {
                                // [Explicit Continue]
                                goto J0x177;
                            }
                        }
                    }
                    DupeCommand = i;
                    return true;
                }
                J0x177:

                ++ i;
                // [Loop Continue]
                goto J0x77;
            }
        }
    }
    J0x181:

    return false;
    return;
}

function DrawKey(Canvas C, float X, float Y, int i)
{
    local float XL, YL;

    TextSize(C, LocalizedKeyName[int(BoundKeys[i])], XL, YL, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale);
    ClipText(C, X, Y + ((KeyHeight - YL) / 2), LocalizedKeyName[int(BoundKeys[i])], false, class'UWindowScene'.default.TTFontScale, class'UWindowScene'.default.TTFontScale,, 2);
    return;
}

function LoadExistingKeys()
{
    local int i, j, pos;
    local string KeyName, Alias, AliasLeft;

    i = 0;
    J0x07:

    // End:0x2B [Loop If]
    if(i < 150)
    {
        BoundKeys[i] = "";
        ++ i;
        // [Loop Continue]
        goto J0x07;
    }
    i = 0;
    J0x32:

    // End:0x21E [Loop If]
    if(i < 255)
    {
        // End:0x4F
        if(IsXboxButton(i))
        {
            // [Explicit Continue]
            goto J0x214;
        }
        // End:0x6E
        if((i == int(236)) || i == int(237))
        {
            // [Explicit Continue]
            goto J0x214;
        }
        KeyName = GetPlayerOwner().ConsoleCommand("KEYNAME " $ string(i));
        RealKeyName[i] = KeyName;
        // End:0x214
        if(KeyName != "")
        {
            Alias = GetPlayerOwner().ConsoleCommand("KEYBINDING " $ KeyName);
            // End:0x214
            if(Alias != "")
            {
                j = 0;
                J0xF6:

                // End:0x214 [Loop If]
                if(j < 150)
                {
                    // End:0x118
                    if(AliasNames[j] == "")
                    {
                        // [Explicit Continue]
                        goto J0x20A;
                    }
                    pos = InStr(Alias, AliasNames[j]);
                    // End:0x20A
                    if(pos > -1)
                    {
                        // End:0x1F8
                        if(Len(Alias) != Len(AliasNames[j]))
                        {
                            // End:0x1B2
                            if(pos == 0)
                            {
                                pos = InStr(Right(Alias, Len(Alias) - Len(AliasNames[j])), " ");
                                // End:0x1AF
                                if(pos == 0)
                                {
                                    BoundKeys[j] = string(i);
                                }                                
                            }
                            else
                            {
                                pos = InStr(Right(Alias, (Len(Alias) - pos) + 1), " ");
                                // End:0x1F5
                                if(pos == 0)
                                {
                                    BoundKeys[j] = string(i);
                                }
                            }
                            // [Explicit Continue]
                            goto J0x20A;
                        }
                        BoundKeys[j] = string(i);
                    }
                    J0x20A:

                    ++ j;
                    // [Loop Continue]
                    goto J0xF6;
                }
            }
        }
        J0x214:

        ++ i;
        // [Loop Continue]
        goto J0x32;
    }
    // End:0x24A
    if(ObjectDestroy() || ! GetPlayerOwner().bUse4Weapons)
    {
        Commands[25] = "";        
    }
    else
    {
        Commands[25] = default.Commands[25];
    }
    LastKeyBind = 149;
    i = 0;
    J0x26A:

    // End:0x2A1 [Loop If]
    if(i < 150)
    {
        // End:0x297
        if(Commands[i] == "")
        {
            LastKeyBind = i;
            // [Explicit Break]
            goto J0x2A1;
        }
        ++ i;
        // [Loop Continue]
        goto J0x26A;
    }
    J0x2A1:

    return;
}

function bool IsAnyKeyUnBound()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x47 [Loop If]
    if(i < 150)
    {
        // End:0x3D
        if((Commands[i] != "") && BoundKeys[i] == "")
        {
            return true;
        }
        ++ i;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    return;
}

defaultproperties
{
    LocalizedKeyName[0]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[1]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[2]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[3]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[4]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[5]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[6]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[7]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[8]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[9]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[10]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[11]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[12]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[13]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[14]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[15]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[16]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[17]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[18]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[19]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[20]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[21]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[22]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[23]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[24]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[25]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[26]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[27]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[28]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[29]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[30]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[31]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[32]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[33]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[34]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[35]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[36]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[37]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[38]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[39]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[40]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[41]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[42]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[43]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[44]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[45]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[46]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[47]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[48]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[49]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[50]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[51]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[52]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[53]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[54]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[55]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[56]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[57]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[58]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[59]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[60]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[61]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[62]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[63]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[64]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[65]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[66]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[67]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[68]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[69]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[70]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[71]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[72]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[73]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[74]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[75]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[76]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[77]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[78]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[79]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[80]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[81]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[82]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[83]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[84]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[85]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[86]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[87]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[88]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[89]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[90]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[91]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[92]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[93]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[94]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[95]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[96]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[97]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[98]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[99]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[100]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[101]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[102]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[103]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[104]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[105]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[106]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[107]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[108]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[109]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[110]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[111]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[112]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[113]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[114]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[115]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[116]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[117]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[118]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[119]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[120]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[121]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[122]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[123]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[124]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[125]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[126]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[127]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[128]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[129]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[130]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[131]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[132]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[133]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[134]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[135]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[136]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[137]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[138]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[139]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[140]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[141]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[142]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[143]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[144]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[145]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[146]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[147]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[148]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[149]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[150]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[151]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[152]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[153]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[154]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[155]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[156]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[157]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[158]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[159]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[160]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[161]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[162]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[163]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[164]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[165]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[166]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[167]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[168]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[169]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[170]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[171]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[172]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[173]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[174]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[175]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[176]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[177]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[178]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[179]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[180]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[181]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[182]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[183]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[184]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[185]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[186]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[187]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[188]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[189]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[190]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[191]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[192]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[193]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[194]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[195]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[196]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[197]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[198]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[199]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[200]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[201]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[202]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[203]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[204]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[205]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[206]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[207]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[208]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[209]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[210]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[211]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[212]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[213]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[214]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[215]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[216]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[217]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[218]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[219]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[220]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[221]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[222]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[223]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[224]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[225]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[226]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[227]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[228]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[229]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[230]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[231]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[232]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[233]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[234]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[235]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[236]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[237]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[238]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[239]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[240]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[241]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[242]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[243]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[244]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[245]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[246]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[247]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[248]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[249]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[250]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[251]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[252]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[253]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    LocalizedKeyName[254]="<?int?dnWindow.UDukeKeyBinderControl.LocalizedKeyName?>"
    HelpText="<?int?dnWindow.UDukeKeyBinderControl.HelpText?>"
    PollingHelpText="<?int?dnWindow.UDukeKeyBinderControl.PollingHelpText?>"
    Commands[0]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[1]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[2]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[3]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[4]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[5]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[6]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[7]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[8]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[9]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[10]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[11]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[12]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[13]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[14]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[15]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[16]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[17]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[18]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[19]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[20]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[21]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[22]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[23]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[24]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[25]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[26]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[27]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[28]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    Commands[29]="<?int?dnWindow.UDukeKeyBinderControl.Commands?>"
    AliasNames[0]="Fire | VehicleFire | VehicleRadioChange | VehicleUpAction | DnControlFireAction"
    AliasNames[1]="Melee"
    AliasNames[2]="Zoom | VehicleBoost | VehicleDownAction | DnControlMeleeAction"
    AliasNames[3]="MoveForward"
    AliasNames[4]="MoveBackward"
    AliasNames[5]="StrafeLeft"
    AliasNames[6]="StrafeRight"
    AliasNames[7]="Use"
    AliasNames[8]="Jump | VehicleHandBrake"
    AliasNames[9]="Duck"
    AliasNames[10]="SelectNextWeapon"
    AliasNames[11]="UseTripMine"
    AliasNames[12]="UsePipeBomb"
    AliasNames[13]="Reload"
    AliasNames[14]="DoHeatVision"
    AliasNames[15]="UseSteroids"
    AliasNames[16]="DoHoloDuke"
    AliasNames[17]="UseBeer"
    AliasNames[18]="SShot"
    AliasNames[19]="Sprint"
    AliasNames[20]="ScoreboardToggle"
    AliasNames[21]="Talk"
    AliasNames[22]="TeamTalk"
    AliasNames[23]="DoTaunt"
    AliasNames[24]="DoVoIP"
    AliasNames[25]="DoJetpack"
    AliasNames[26]="UsePrimaryWeapon1"
    AliasNames[27]="UsePrimaryWeapon2"
    AliasNames[28]="UsePrimaryWeapon3"
    AliasNames[29]="UsePrimaryWeapon4"
}