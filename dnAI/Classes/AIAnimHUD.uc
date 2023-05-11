/*******************************************************************************
 * AIAnimHUD generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AIAnimHUD extends AIHUD
    collapsecategories;

const ANIMHUD_AnimControllerEntry = 1;

var Vector startLocation;
var Rotator StartRotation;
var BGInfo TreeLogBG;
var BGInfo InspectAnimBG;
var BGInfo AnimEntryInfoBG;
var BGInfo AnimqQueueBG;
var int AnimEntryInfoIndex;
var array<Color> ColorTable;
var bool bInspectAnims;
var bool bDrawDiamonds;
var bool bSingleTargetInspect;
var bool bDrawTargetCylinder;
var bool bShowProgrammerAnimNames;
var array<string> SearchStrings;
var bool bDebugSearch;
var bool AnimSinglePlay;
var bool bPlayingQueuedAnims;
var int QueueIndex;
var array<name> AnimNameQueue;

simulated function DrawAIHUD(Canvas C)
{
    local SPathingHistory Hist;
    local string str;
    local int i;
    local float sx, sy, xw, yh, StartY;

    // End:0x0E
    if(C != none)
    {
        return;
    }
    sx = 10 * HUDScaleX;
    sy = 32 * HUDScaleY;
    C.DrawColor = WhiteColor;
    C.GetScreenXYNoClip("AIPathHud", xw, yh);
    StartColumn(int(sx), int(sy - yh), int(yh));
    C.SetPause(0, 0);
    DrawString(C, "AI Animation DebugHUD");
    // End:0xCF
    if(string(DebugTreeItems) <= 0)
    {
        return;
    }
    // End:0x190
    if((DebugTreeBGSizeX != float(0)) && DebugTreeBGSizeY != float(0))
    {
        C.SetPause(sx, sy);
        C.Style = 5;
        C.DrawColor.R = 0;
        C.DrawColor.G = 0;
        C.DrawColor.B = 0;
        C.SetClampMode(class'WhiteTexture', DebugTreeBGSizeX, DebugTreeBGSizeY, 1, 1, 1, 1,,,,, 0.5);
    }
    C.SetPause(sx, sy);
    DrawDebugTree(C, DebugTreeItems, C.CurX, C.CurY);
    // End:0x262
    if(bInspectAnims)
    {
        C.SetPause(DebugTreeBGSizeX + (float(30) * HUDScaleX), 32 * HUDScaleY);
        StartColumn(int(C.CurX), int(C.CurY), int(yh));
        StartBG(C, InspectAnimBG);
        DrawInspectAnimHUD(C);
        EndBG(C, InspectAnimBG);        
    }
    else
    {
        // End:0x2BC
        if(bDrawTargetCylinder && m_aTarget == none)
        {
            GetSoundDuration(m_aTarget.Location, m_aTarget.CollisionRadius, m_aTarget.CollisionHeight, NewColorBytes(255, 255, 255, 255), 0.001);
        }
    }
    C.SetPause(sx, sy + DebugTreeBGSizeY);
    StartColumn(int(sx), int(sy + DebugTreeBGSizeY), int(yh));
    // End:0x3A2
    if(AnimEntryInfoIndex >= 0)
    {
        C.SetPause(C.CurX, C.CurY + (HUDScaleY * 32));
        StartColumn(int(C.CurX), int(C.CurY + (HUDScaleY * 32)), int(yh));
        StartBG(C, AnimEntryInfoBG);
        DrawAnimEntryInfoHUD(C);
        EndBG(C, AnimEntryInfoBG);
    }
    // End:0x438
    if(string(AnimNameQueue) > 0)
    {
        C.SetPause(sx, C.CurY + (HUDScaleY * 32));
        StartColumn(int(sx), int(C.CurY + (HUDScaleY * 32)), int(yh));
        StartBG(C, AnimqQueueBG);
        DrawAnimQueue(C);
        EndBG(C, AnimqQueueBG);
    }
    C.DrawColor = WhiteColor;
    DrawString(C, " ");
    DrawString(C, " ");
    DrawString(C, " ");
    DrawString(C, " ");
    DrawString(C, " ");
    return;
}

function LoadAnimations()
{
    local int i, Index;
    local SHUDDebugTreeItem Item;
    local name MenuName;

    Index = DebugTreeGetIndex(0, "Browse_AnimController");
    Item = DebugTreeItems[Index];
    string(DebugTreeItems) = Index + 1;
    BroadcastLog("AIAnim HUD loading animations...");
    // End:0x8D
    if(m_aTarget != none)
    {
        DebugTreeItems[Index].Push = false;
        return;
    }
    DebugTreeItems[Index].Push = true;
    i = 0;
    J0xA7:

    // End:0x171 [Loop If]
    if(i < string(m_aTarget.AnimCtrl.m_oController.Animations))
    {
        // End:0x10B
        if(bShowProgrammerAnimNames)
        {
            MenuName = m_aTarget.AnimCtrl.m_oController.Animations[i].AnimationName;            
        }
        else
        {
            MenuName = m_aTarget.AnimCtrl.m_oController.Animations[i].AnimSequence;
        }
        // End:0x14E
        if(! ValidAnim(string(MenuName)))
        {
            // [Explicit Continue]
            goto J0x167;
        }
        DebugTreeAddItem(,, MenuName, 'PlayAnim', 1, float(i));
        J0x167:

        ++ i;
        // [Loop Continue]
        goto J0xA7;
    }
    DebugTreeEndGroup();
    startLocation = m_aTarget.Location;
    StartRotation = m_aTarget.Rotation;
    return;
}

function bool ValidAnim(coerce string str)
{
    local int i, K;

    str = Caps(str);
    i = 0;
    J0x15:

    // End:0xAA [Loop If]
    if(i < string(SearchStrings))
    {
        K = InStr(str, SearchStrings[i]);
        // End:0x93
        if(bDebugSearch)
        {
            BroadcastLog((((("DCR str=" $ str) @ "SearchStrings[i]=") $ SearchStrings[i]) @ "k=") $ string(K));
        }
        // End:0xA0
        if(K < 0)
        {
            return false;
        }
        ++ i;
        // [Loop Continue]
        goto J0x15;
    }
    return true;
    return;
}

simulated function OnNewTarget(AIActor OldTarget)
{
    OldTarget.MyAnimHUD = none;
    super.OnNewTarget(OldTarget);
    LoadAnimations();
    return;
}

function bool DebugTreeOnEnter(optional bool Found)
{
    local SHUDDebugTreeItem Item;

    super(HUD).DebugTreeOnEnter(Found);
    return true;
    return;
}

function DebugTreeKeyEvent(Engine.Object.EInputKey Key, Engine.Object.EInputAction Action, float Delta)
{
    local SHUDDebugTreeItem Item;

    super(HUD).DebugTreeKeyEvent(Key, Action, Delta);
    Item = DebugTreeItems[DebugTreeUseIndex];
    // End:0x4A
    if(Item.var1 == 1)
    {
        AnimEntryInfoIndex = int(Item.var2);        
    }
    else
    {
        AnimEntryInfoIndex = -1;
    }
    return;
}

function string GetAnimOpStr(int Op)
{
    local string str;

    switch(Op)
    {
        // End:0x26
        case 1:
            str = str $ "Replace";
            // End:0x7B
            break;
        // End:0x41
        case 2:
            str = str $ "Add";
            // End:0x7B
            break;
        // End:0x61
        case 3:
            str = str $ "Subtract";
            // End:0x7B
            break;
        // End:0xFFFF
        default:
            str = str $ "NULL";
            // End:0x7B
            break;
            break;
    }
    return str;
    return;
}

simulated function AIDrawAnimsInternal(Canvas C, RenderActor A, optional name GroupName)
{
    local SAllAnimInfo AnimInfo;
    local string str;

    // End:0x0E
    if(A != none)
    {
        return;
    }
    // End:0x13F
    foreach A.AttachActor(AnimInfo, GroupName)
    {
        // End:0x9D
        if(AnimInfo.bIsGroup)
        {
            str = ((((("Group: <" $ string(AnimInfo.Channel)) $ ">  Op: <") $ (GetAnimOpStr(int(AnimInfo.Op)))) $ ">   Alpha: <") $ string(AnimInfo.Blend)) $ ">";            
        }
        else
        {
            str = ((((("    Animation: <" $ string(AnimInfo.Sequence)) $ ">   Alpha: <") $ string(AnimInfo.Blend)) $ ">   Time: <") $ string(AnimInfo.Time)) $ ">";
        }
        DrawString(C, str);
        // End:0x13E
        if(AnimInfo.bIsGroup)
        {
            AIDrawAnimsInternal(C, A, AnimInfo.Sequence);
        }        
    }    
    DrawString(C, "   ");
    return;
}

function DrawInspectAnimHUD(Canvas C)
{
    local AIActor A;
    local int i;

    // End:0x40
    if(bSingleTargetInspect && m_aTarget == none)
    {
        C.DrawColor = ColorTable[0];
        InspectAnim(C, m_aTarget);
        return;
    }
    // End:0xC8
    foreach RotateVectorAroundAxis(class'AIActor', A)
    {
        // End:0x7E
        if((Level.TimeSeconds - A.LastRenderTime) > 1)
        {
            continue;            
        }
        C.DrawColor = ColorTable[i];
        InspectAnim(C, A);
        ++ i;
        // End:0xC7
        if(i >= string(ColorTable))
        {
            i = 0;
        }        
    }    
    return;
}

function DrawAnimEntryInfoHUD(Canvas C)
{
    local SAnimationInfo AnimInfo;

    C.DrawColor = WhiteColor;
    AnimInfo = m_aTarget.AnimCtrl.m_oController.Animations[AnimEntryInfoIndex];
    DrawString(C, "Animation Information:");
    DrawString(C, "Name:                    " $ string(AnimInfo.AnimationName));
    DrawString(C, "Animation:               " $ string(AnimInfo.AnimSequence));
    DrawString(C, "AnimRate:                " $ string(AnimInfo.AnimRate));
    DrawString(C, "AnimEarlyEndTime:        " $ string(AnimInfo.AnimEarlyEndTime));
    DrawString(C, "GroupCrossfadeOverride:  " $ string(AnimInfo.AnimEarlyEndTime));
    return;
}

function DrawAnimQueue(Canvas C)
{
    local int i;

    C.DrawColor = WhiteColor;
    DrawString(C, "Animation Queue:");
    DrawString(C, "----------------");
    i = 0;
    J0x56:

    // End:0xF5 [Loop If]
    if(i < string(AnimNameQueue))
    {
        // End:0xB7
        if((QueueIndex == i) && bPlayingQueuedAnims)
        {
            C.DrawColor = LightBlueColor;
            DrawString(C, " > " $ string(AnimNameQueue[i]));
            // [Explicit Continue]
            goto J0xEB;
        }
        C.DrawColor = WhiteColor;
        DrawString(C, "   " $ string(AnimNameQueue[i]));
        J0xEB:

        ++ i;
        // [Loop Continue]
        goto J0x56;
    }
    return;
}

function InspectAnim(Canvas C, AIActor A)
{
    DrawString(C, string(A));
    AIDrawAnimsInternal(C, A);
    // End:0xA1
    if(bDrawDiamonds)
    {
        GetSoundDuration(A.Location, A.CollisionRadius, A.CollisionHeight, NewColorBytes(C.DrawColor.R, C.DrawColor.G, C.DrawColor.B), 0.001);
    }
    return;
}

function ResetWindows()
{
    return;
}

function Inspect_Playing_Animations()
{
    bInspectAnims = ! bInspectAnims;
    return;
}

function Hide_Cylinder()
{
    bDrawDiamonds = ! bDrawDiamonds;
    return;
}

function Single_Target()
{
    bSingleTargetInspect = ! bSingleTargetInspect;
    return;
}

exec function AnimSearch(optional name Str1, optional name Str2, optional name str3, optional name str4, optional name str5)
{
    local int i;

    string(SearchStrings) = 0;
    // End:0x2F
    if(NameForString(Str1, 'None'))
    {
        SearchStrings[SearchStrings.Add(1)] = Caps(string(Str1));
    }
    // End:0x56
    if(NameForString(Str2, 'None'))
    {
        SearchStrings[SearchStrings.Add(1)] = Caps(string(Str2));
    }
    // End:0x7D
    if(NameForString(str3, 'None'))
    {
        SearchStrings[SearchStrings.Add(1)] = Caps(string(str3));
    }
    // End:0xA4
    if(NameForString(str4, 'None'))
    {
        SearchStrings[SearchStrings.Add(1)] = Caps(string(str4));
    }
    // End:0xCB
    if(NameForString(str5, 'None'))
    {
        SearchStrings[SearchStrings.Add(1)] = Caps(string(str5));
    }
    LoadAnimations();
    return;
}

function Draw_TargetCollisionCyclinder()
{
    bDrawTargetCylinder = ! bDrawTargetCylinder;
    return;
}

function Show_ProgrammerNames()
{
    bShowProgrammerAnimNames = true;
    LoadAnimations();
    ReplaceFunc('Show_ProgrammerNames', 'Show_AnimatorNames');
    return;
}

function Show_AnimatorNames()
{
    bShowProgrammerAnimNames = false;
    LoadAnimations();
    ReplaceFunc('Show_AnimatorNames', 'Show_ProgrammerNames');
    return;
}

function PlayAnim()
{
    local SHUDDebugTreeItem Item;
    local SAnimationInfo AnimInfo;

    Item = DebugTreeItems[DebugTreeUseIndex];
    AnimInfo = m_aTarget.AnimCtrl.m_oController.Animations[AnimEntryInfoIndex];
    // End:0x9C
    if((m_aTarget == none) && AnimSinglePlay)
    {
        m_aTarget.MyAnimHUD = self;
        m_aTarget.SuspendExecutive(true);
        m_aTarget.PlayAnim(AnimInfo.AnimationName,,, true);
        bPlayingQueuedAnims = false;        
    }
    else
    {
        AnimNameQueue[AnimNameQueue.Add(1)] = AnimInfo.AnimationName;
    }
    return;
}

function NotifyAnimEnd(AIActor act, int nChannel, name AnimName, int nRefId)
{
    // End:0x19
    if(bPlayingQueuedAnims)
    {
        ++ QueueIndex;
        PlayNextQueuedAnim();        
    }
    else
    {
        act.MyAnimHUD = none;
        act.Anim_Idle();
    }
    return;
}

function DebugSearch()
{
    bDebugSearch = ! bDebugSearch;
    return;
}

function Clear_Queue()
{
    string(AnimNameQueue) = 0;
    return;
}

function Play_Queue()
{
    // End:0x24
    if(string(AnimNameQueue) > 0)
    {
        bPlayingQueuedAnims = true;
        QueueIndex = 0;
        PlayNextQueuedAnim();        
    }
    else
    {
        BroadcastLog("AI AnimHUD Warning: No anims queued to play!");
    }
    return;
}

function PlayNextQueuedAnim()
{
    // End:0x53
    if(string(AnimNameQueue) > QueueIndex)
    {
        m_aTarget.MyAnimHUD = self;
        m_aTarget.SuspendExecutive(true);
        m_aTarget.PlayAnim(AnimNameQueue[QueueIndex],,, true);        
    }
    else
    {
        bPlayingQueuedAnims = false;
        m_aTarget.MyAnimHUD = none;
        m_aTarget.Anim_Idle();
    }
    return;
}

function Enable_Queuing()
{
    AnimSinglePlay = false;
    ReplaceFunc('Enable_Queuing', 'Enable_SinglePlay');
    return;
}

function Enable_SinglePlay()
{
    AnimSinglePlay = true;
    ReplaceFunc('Enable_SinglePlay', 'Enable_Queuing');
    return;
}

defaultproperties
{
    AnimEntryInfoIndex=-1
    ColorTable(0)=(R=255,G=255,B=255,A=0)
    ColorTable(1)=(R=255,G=0,B=0,A=0)
    ColorTable(2)=(R=0,G=255,B=0,A=0)
    ColorTable(3)=(R=0,G=0,B=255,A=0)
    ColorTable(4)=(R=255,G=255,B=0,A=0)
    ColorTable(5)=(R=255,G=0,B=255,A=0)
    ColorTable(6)=(R=0,G=255,B=255,A=0)
    ColorTable(7)=(R=255,G=128,B=64,A=0)
    ColorTable(8)=(R=64,G=128,B=255,A=0)
    ColorTable(9)=(R=128,G=64,B=255,A=0)
    ColorTable(10)=(R=64,G=255,B=128,A=0)
    bDrawDiamonds=true
    bDrawTargetCylinder=true
    AnimSinglePlay=true
    bActiveTargeting=true
    DebugTreeItems(0)=(Text="Options",ConsoleCommand="",TriggerEvent=None,Func=None,Pop=false,Push=true,bHideChildren=true,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(1)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Draw_TargetCollisionCyclinder,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(2)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=DebugSearch,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(3)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Show_ProgrammerNames,Pop=true,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(4)=(Text="Inspect_Playing_Animations",ConsoleCommand="",TriggerEvent=None,Func=Inspect_Playing_Animations,Pop=false,Push=true,bHideChildren=true,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(5)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Hide_Cylinder,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(6)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Single_Target,Pop=true,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(7)=(Text="Playback",ConsoleCommand="",TriggerEvent=None,Func=None,Pop=false,Push=true,bHideChildren=true,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(8)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Enable_Queuing,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(9)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Play_Queue,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(10)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Clear_Queue,Pop=true,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(11)=(Text="Browse_AnimController",ConsoleCommand="",TriggerEvent=None,Func=Browse_AnimController,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=10,ChildrenOffset=0)
}