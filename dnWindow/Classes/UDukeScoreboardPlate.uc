/*******************************************************************************
 * UDukeScoreboardPlate generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeScoreboardPlate extends UWindowDialogControl
    dependson(UDukeScoreboard)
    dependson(UDukeLookAndFeel)
    dependson(UDukeScoreboardCW)
    dependson(UDukeScoreboardFragPlate)
    dependson(UDukeScoreboardMenu);

var int Number;
var int PRIindex;
var float PlateAlpha;
var UDukeScoreboardCW myParent;
var bool bHidden;
var float ScoreScale;
var UDukeScoreboardMenu Menu;
var UWindowMessageBox TellBox;
var UDukeScoreboardFragPlate FragPlate;
var localized string TellTitle;
var localized string TellMessage;
var Texture MuteTex;
var Texture ScoreboardFrame;
var Texture ScoreboardFrameHL;
var Region ScoreboardL;
var Region ScoreboardM;
var Region ScoreboardR;
var Region IconR;
var float PlateWidth;
var int ScoreboardTabs[5];

function Created()
{
    Menu = UDukeScoreboardMenu(ParentWindow.CreateWindow(class'UDukeScoreboardMenu', 0, 0, 100, 100, self));
    Menu.bLeaveOnscreen = true;
    Menu.bAlwaysOnTop = true;
    Menu.Plate = self;
    Menu.HideWindow();
    return;
}

function Close(optional bool bByParent)
{
    super(UWindowWindow).Close(bByParent);
    // End:0x28
    if(Menu == none)
    {
        Menu.CloseUp();
    }
    return;
}

function MouseLeave()
{
    FragPlate.Close();
    return;
}

function MouseEnter()
{
    super.MouseEnter();
    return;
}

function BeforePaint(Canvas C, float X, float Y)
{
    // End:0x3D
    if(FragPlate == none)
    {
        FragPlate.WinLeft = WinLeft + WinWidth;
        FragPlate.WinTop = WinTop;
    }
    return;
}

function RMouseDown(float X, float Y)
{
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local float XL, YL, xOffset, YOffset, TimeLen, W;

    local Font OldFont;
    local string S, str;
    local int STimeMin, STimeSec;
    local PlayerPawn P;
    local Color FontColor;
    local Region R;
    local Texture t;
    local PlayerReplicationInfo PRI;

    // End:0x1C
    if(bHidden || PRIindex == -1)
    {
        return;
    }
    OldFont = C.Font;
    P = GetPlayerOwner();
    // End:0x63
    if((P != none) || P.GameReplicationInfo != none)
    {
        return;
    }
    PRI = P.GameReplicationInfo.PRIArray[PRIindex];
    // End:0xF6
    if((int(PRI.Team) != 255) && P.GameReplicationInfo.bTeamGame)
    {
        C.DrawColor = UDukeLookAndFeel(LookAndFeel).TeamColor[int(PRI.Team)];        
    }
    else
    {
        C.DrawColor = DukeHUD(P.MyHUD).HUDColor;
    }
    C.Style = P.5;
    t = ScoreboardFrame;
    // End:0x2DB
    if(t == none)
    {
        R = ScoreboardL;
        DrawStretchedTextureSegment(C, 0, 0, float(R.W), WinHeight, float(R.X), float(R.Y), float(R.W), float(R.h), t, PlateAlpha,,,,, true);
        R = ScoreboardM;
        W = WinWidth - float(ScoreboardL.W + ScoreboardR.W);
        // End:0x25D
        if(W > float(0))
        {
            DrawStretchedTextureSegment(C, float(ScoreboardL.W), 0, W, WinHeight, float(R.X), float(R.Y), float(R.W), float(R.h), t, PlateAlpha,,,,, true);
        }
        R = ScoreboardR;
        DrawStretchedTextureSegment(C, WinWidth - float(R.W), 0, float(R.W), float(R.h), float(R.X), float(R.Y), float(R.W), float(R.h), t, PlateAlpha,,,,, true);
    }
    C.Style = P.1;
    // End:0x329
    if(P.PlayerReplicationInfo != PRI)
    {
        FontColor = myParent.GoldColor;        
    }
    else
    {
        FontColor = myParent.WhiteColor;
    }
    // End:0x5BD
    if(PRI == none)
    {
        // End:0x3CA
        if(PRI.Icon == none)
        {
            C.DrawColor = myParent.WhiteColor;
            DrawStretchedTexture(C, float(IconR.X), float(IconR.Y), float(IconR.W), float(IconR.h), PRI.Icon, 1);
        }
        C.DrawColor = FontColor;
        xOffset = float(ScoreboardTabs[0]);
        str = PRI.PlayerName;
        ClipText(C, xOffset, YOffset, str);
        xOffset += float(ScoreboardTabs[1]);
        str = string(PRI.Score);
        ClipText(C, xOffset, YOffset, str);
        xOffset += float(ScoreboardTabs[2]);
        str = string(PRI.Deaths);
        ClipText(C, xOffset, YOffset, str);
        xOffset += float(ScoreboardTabs[3]);
        str = string(PRI.Ping);
        ClipText(C, xOffset, YOffset, str);
        xOffset += float(ScoreboardTabs[4]);
        STimeMin = Max(0, int((GetLevel().TimeSeconds + float(P.PlayerReplicationInfo.StartTime)) - float(PRI.StartTime)) / 60);
        STimeSec = Max(0, int((GetLevel().TimeSeconds + float(P.PlayerReplicationInfo.StartTime)) - float(PRI.StartTime)) % 60);
        S = (string(STimeMin) $ ":") $ (TwoDigitString(STimeSec));
        ClipText(C, xOffset, YOffset, S);
    }
    // End:0x5F9
    if(P.PlayerReplicationInfo != PRI)
    {
        C.DrawColor = myParent.GoldColor;        
    }
    else
    {
        C.DrawColor = myParent.WhiteColor;
        // End:0x669
        if(PRI != none)
        {
            C.DrawColor.R = 128;
            C.DrawColor.G = 128;
            C.DrawColor.B = 128;
        }
    }
    C.Font = OldFont;
    return;
}

function string TwoDigitString(int Num)
{
    // End:0x1C
    if(Num < 10)
    {
        return "0" $ string(Num);        
    }
    else
    {
        return string(Num);
    }
    return;
}

function DoTell()
{
    local PlayerPawn P;
    local PlayerReplicationInfo PRI;

    // End:0x0E
    if(TellBox == none)
    {
        return;
    }
    P = GetPlayerOwner();
    // End:0x40
    if((P != none) || P.GameReplicationInfo != none)
    {
        return;
    }
    PRI = P.GameReplicationInfo.PRIArray[PRIindex];
    TellBox = UWindowMessageBox(ParentWindow.CreateWindow(class'UWindowMessageBox', 100, 100, 150, 250));
    TellBox.SetupMessageBox(TellTitle, TellMessage @ PRI.PlayerName, 4, 4, 3);
    TellBox.bLeaveOnscreen = true;
    TellBox.OwnerWindow = self;
    TellBox.bAlwaysOnTop = true;
    TellBox.WinTop = (WinHeight - TellBox.WinHeight) / float(2);
    TellBox.WinLeft = (WinWidth - TellBox.WinWidth) / float(2);
    UDukeScoreboard(GetParent(class'UDukeScoreboard')).bTellActive = true;
    ShowModal(TellBox);
    return;
}

defaultproperties
{
    PlateAlpha=1
    ScoreScale=1
    TellTitle="<?int?dnWindow.UDukeScoreboardPlate.TellTitle?>"
    TellMessage="<?int?dnWindow.UDukeScoreboardPlate.TellMessage?>"
    ScoreboardL=(X=0,Y=0,W=155,h=64)
    ScoreboardM=(X=156,Y=0,W=1,h=64)
    ScoreboardR=(X=157,Y=0,W=99,h=64)
    IconR=(X=0,Y=0,W=55,h=55)
    ScoreboardTabs[0]=60
    ScoreboardTabs[1]=280
    ScoreboardTabs[2]=95
    ScoreboardTabs[3]=95
    ScoreboardTabs[4]=95
}