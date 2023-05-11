/*******************************************************************************
 * AIPerfHUD generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AIPerfHUD extends TriggerHUD
    collapsecategories;

struct AITickItem
{
    var AIActor AI;
    var HUDLineGraph LineGraph;
    var HUDLineGraph PathingGraph;
};

struct AIStateColorPair
{
    var int ColorIndex;
    var Color RGBColor;
    var name StateName;
    var name PathingExName;
};

var BGInfo StateLegendBGInfo;
var HUDLineGraph FPSLineGraph;
var HUDLineGraph DefaultAITickMSGraph;
var HUDLineGraph PathGraph;
var array<AITickItem> AITickInfo;
var array<AIStateColorPair> AIStateInfo;
var float StrWidth;
var float StrHeight;
var bool bDontDraw;
var bool MarkDecisionTreeExecutions;
var bool MarkSetLocations;
var bool DrawPathingTime;
var bool DrawProcAimTime;
var bool DrawPathingEx;

event PostBeginPlay()
{
    super(DukeHUD).PostBeginPlay();
    return;
}

simulated function DrawAIHUD(Canvas C)
{
    super.DrawAIHUD(C);
    RefreshAI();
    DrawTickingAIGraphs(C);
    C.SetPause(0, float(C.SizeY) - FPSLineGraph.GraphHeight);
    FPSLineGraph.UpdateGraph(0, 1 / Level.TimeDeltaSeconds, 4);
    FPSLineGraph.DrawGraph(C, self, bDontDraw);
    // End:0xAA
    if(! bDontDraw)
    {
        DrawColorLegend(C);
    }
    return;
}

function DrawTickingAIGraphs(Canvas C)
{
    local int i;
    local float CurrentY, Sum, PCT;

    CurrentY = C.CurY + 100;
    i = 0;
    J0x23:

    // End:0x8E3 [Loop If]
    if(i < string(AITickInfo))
    {
        // End:0x248
        if(! bDontDraw)
        {
            C.SetPause(0, CurrentY);
            C.GetRenderBoundingBox(string(AITickInfo[i].AI) @ string(AITickInfo[i].AI.IsXbox()));
            C.GetScreenXYNoClip(string(AITickInfo[i].AI), StrWidth, StrHeight);
            CurrentY += StrHeight;
            // End:0x174
            if((AITickInfo[i].AI.PathInfo.PathCacheHitCnt + AITickInfo[i].AI.PathInfo.PathCacheMissCnt) > 0)
            {
                PCT = float(AITickInfo[i].AI.PathInfo.PathCacheHitCnt / (AITickInfo[i].AI.PathInfo.PathCacheHitCnt + AITickInfo[i].AI.PathInfo.PathCacheMissCnt));                
            }
            else
            {
                PCT = 0;
            }
            C.SetPause(0, CurrentY);
            C.GetRenderBoundingBox(((((("Hit: " $ string(AITickInfo[i].AI.PathInfo.PathCacheHitCnt)) @ "Miss: ") $ string(AITickInfo[i].AI.PathInfo.PathCacheMissCnt)) @ "Pct: ") $ string(PCT)) $ "%");
            C.GetScreenXYNoClip(string(AITickInfo[i].AI), StrWidth, StrHeight);
            CurrentY += StrHeight;
        }
        C.SetPause(0, CurrentY);
        // End:0x8B1
        if(! Level.bPlayersOnly)
        {
            // End:0x6C1
            if(DrawPathingEx)
            {
                AITickInfo[i].PathingGraph.UpdateGraph(0, AITickInfo[i].AI.PerfInfo.PathTimeLastFrame, 5);
                AITickInfo[i].PathingGraph.UpdateGraph(1, AITickInfo[i].AI.PathInfo.AvoidDynamicObstacles, 1);
                AITickInfo[i].PathingGraph.UpdateGraph(2, AITickInfo[i].AI.PathInfo.GenerateStaticPath, 2);
                AITickInfo[i].PathingGraph.UpdateGraph(3, AITickInfo[i].AI.PathInfo.FinalizeNextPathPos, 3);
                AITickInfo[i].PathingGraph.UpdateGraph(4, AITickInfo[i].AI.PathInfo.PostStaticPath, 6);
                AITickInfo[i].PathingGraph.UpdateGraph(5, AITickInfo[i].AI.PathInfo.PreStaticPath, 4);
                Sum = (((AITickInfo[i].AI.PathInfo.AvoidDynamicObstacles + AITickInfo[i].AI.PathInfo.GenerateStaticPath) + AITickInfo[i].AI.PathInfo.FinalizeNextPathPos) + AITickInfo[i].AI.PathInfo.PreStaticPath) + AITickInfo[i].AI.PathInfo.PostStaticPath;
                // End:0x56F
                if(AITickInfo[i].AI.PathInfo.bNavFloodAPCacheMiss)
                {
                    GetVisibilityPoint(AITickInfo[i].AI.Location, NewColorBytes(255, 0, 0), 3);
                    BroadcastLog(("APCache MISS - Total Path time: " $ string(AITickInfo[i].AI.PerfInfo.PathTimeLastFrame)) @ AITickInfo[i].AI.TreeDescentLog);
                    AITickInfo[i].PathingGraph.AddSpecialMark(1);                    
                }
                else
                {
                    // End:0x647
                    if(AITickInfo[i].AI.PathInfo.bNavFloodAP)
                    {
                        GetVisibilityPoint(AITickInfo[i].AI.Location, NewColorBytes(0, 255, 0), 3);
                        BroadcastLog(("APCache HIT - Total Path time: " $ string(AITickInfo[i].AI.PerfInfo.PathTimeLastFrame)) @ AITickInfo[i].AI.TreeDescentLog);
                        AITickInfo[i].PathingGraph.AddSpecialMark(2);                        
                    }
                    else
                    {
                        // End:0x687
                        if(AITickInfo[i].AI.PathInfo.bPushPointOntoNavFail)
                        {
                            AITickInfo[i].PathingGraph.AddSpecialMark(4);
                        }
                    }
                }
                AITickInfo[i].PathingGraph.DrawGraph(C, self, bDontDraw, Level.bPlayersOnly);                
            }
            else
            {
                // End:0x70F
                if(MarkDecisionTreeExecutions && AITickInfo[i].AI.PerfInfo.ExecuteDecisionTree)
                {
                    AITickInfo[i].LineGraph.AddSpecialMark(3);                    
                }
                else
                {
                    // End:0x75D
                    if(MarkSetLocations && AITickInfo[i].AI.PerfInfo.SetLocation)
                    {
                        AITickInfo[i].LineGraph.AddSpecialMark(4);                        
                    }
                    else
                    {
                        // End:0x79C
                        if(AITickInfo[i].AI.PathInfo.bNavFloodAP)
                        {
                            AITickInfo[i].LineGraph.AddSpecialMark(1);
                        }
                    }
                }
                AITickInfo[i].LineGraph.UpdateGraph(0, AITickInfo[i].AI.PerfInfo.TickTimeLastFrame, GetDrawColorIndex(AITickInfo[i].AI));
                // End:0x833
                if(DrawPathingTime)
                {
                    AITickInfo[i].LineGraph.UpdateGraph(1, AITickInfo[i].AI.PerfInfo.PathTimeLastFrame, 5);
                }
                // End:0x87A
                if(DrawProcAimTime)
                {
                    AITickInfo[i].LineGraph.UpdateGraph(2, AITickInfo[i].AI.PerfInfo.ProcAimTimeLastFrame, 3);
                }
                AITickInfo[i].LineGraph.DrawGraph(C, self, bDontDraw, Level.bPlayersOnly);
            }
        }
        CurrentY += (AITickInfo[i].LineGraph.GraphHeight * 1.25);
        ++ i;
        // [Loop Continue]
        goto J0x23;
    }
    return;
}

function int GetDrawColorIndex(AIActor AI)
{
    local int i;
    local name StateName;

    StateName = AI.IsXbox();
    i = 0;
    J0x1A:

    // End:0x60 [Loop If]
    if(i < string(AIStateInfo))
    {
        // End:0x56
        if(AIStateInfo[i].StateName != StateName)
        {
            return AIStateInfo[i].ColorIndex;
        }
        ++ i;
        // [Loop Continue]
        goto J0x1A;
    }
    return 5;
    return;
}

function RefreshAI()
{
    local int i;
    local AITickItem TickItem;
    local AIActor AI;
    local bool Found;
    local HUDLineGraph LineGraph, PathingGraph;

    i = string(AITickInfo) - 1;
    J0x0F:

    // End:0x80 [Loop If]
    if(i >= 0)
    {
        // End:0x76
        if((AITickInfo[i].AI != none) || ! AITickInfo[i].AI.bTickedLastFrame && ! Level.bPlayersOnly)
        {
            AITickInfo.Remove(i, 1);
        }
        -- i;
        // [Loop Continue]
        goto J0x0F;
    }
    // End:0x1E9
    foreach RotateVectorAroundAxis(class'AIActor', AI)
    {
        Found = false;
        // End:0xB1
        if(! AI.bTickedLastFrame)
        {
            continue;            
        }
        i = 0;
        J0xB8:

        // End:0xF8 [Loop If]
        if(i < string(AITickInfo))
        {
            // End:0xEE
            if(AITickInfo[i].AI != AI)
            {
                Found = true;
                // [Explicit Break]
                goto J0xF8;
            }
            ++ i;
            // [Loop Continue]
            goto J0xB8;
        }
        J0xF8:

        // End:0x1E8
        if(! Found)
        {
            LineGraph = new (Level.XLevel) class'HUDLineGraph';
            LineGraph.CurrentPixel = FPSLineGraph.CurrentPixel;
            PathingGraph = new (Level.XLevel) class'HUDLineGraph';
            PathingGraph.CurrentPixel = FPSLineGraph.CurrentPixel;
            PathGraph.CopyAndInit(PathingGraph);
            DefaultAITickMSGraph.CopyAndInit(LineGraph);
            TickItem.AI = AI;
            TickItem.LineGraph = LineGraph;
            TickItem.PathingGraph = PathingGraph;
            AITickInfo[AITickInfo.Add(1)] = TickItem;
        }        
    }    
    return;
}

function Disable_DecisionTree()
{
    local AIActor AI;

    // End:0x34
    foreach RotateVectorAroundAxis(class'AIActor', AI)
    {
        AI.SetExecutive(0);
        AI.SuspendExecutive(true);        
    }    
    return;
}

function Enable_DecisionTree()
{
    local AIActor AI;

    // End:0x34
    foreach RotateVectorAroundAxis(class'AIActor', AI)
    {
        AI.SetExecutive(2);
        AI.SuspendExecutive(false);        
    }    
    return;
}

function Disable_Physics()
{
    local AIActor AI;

    // End:0x40
    foreach RotateVectorAroundAxis(class'AIActor', AI)
    {
        AI.FindStairRotation(false);
        AI.SetRotation(0);
        AI.ForceMountUpdate(false, false, false, false, false);        
    }    
    return;
}

function Force_Idle()
{
    local AIActor AI;

    // End:0x46
    foreach RotateVectorAroundAxis(class'AIActor', AI)
    {
        AI.SetExecutive(0);
        AI.SuspendExecutive(true);
        AI.ExecuteOp(85);        
    }    
    return;
}

function Disable_Ticking()
{
    local AIActor AI;

    // End:0x35
    foreach RotateVectorAroundAxis(class'AIActor', AI)
    {
        AI.TickStyle = 0;
        AI.bNoNativeTick = true;        
    }    
    return;
}

function Enable_Ticking()
{
    local AIActor AI;

    // End:0x35
    foreach RotateVectorAroundAxis(class'AIActor', AI)
    {
        AI.TickStyle = 2;
        AI.bNoNativeTick = false;        
    }    
    return;
}

function Toggle_Graphs()
{
    bDontDraw = ! bDontDraw;
    return;
}

function Toggle_MarkDecisionTree()
{
    MarkDecisionTreeExecutions = ! MarkDecisionTreeExecutions;
    return;
}

function Toggle_MarkSetLocation()
{
    MarkSetLocations = ! MarkSetLocations;
    return;
}

function Toggle_DrawPathingTime()
{
    DrawPathingTime = ! DrawPathingTime;
    return;
}

function Toggle_ProcAimTime()
{
    DrawProcAimTime = ! DrawProcAimTime;
    return;
}

function Toggle_PathingEx()
{
    DrawPathingEx = ! DrawPathingEx;
    return;
}

function Disable_GotoXEval()
{
    local AIActor AI;

    // End:0x28
    foreach RotateVectorAroundAxis(class'AIActor', AI)
    {
        AI.GotoXParms.bDisableEvalGate = true;        
    }    
    return;
}

function ForceCutScene()
{
    local AIActor AI;

    // End:0x23
    foreach RotateVectorAroundAxis(class'AIActor', AI)
    {
        AI.bForcePhysicsCutScene = true;        
    }    
    return;
}

final function DrawColorLegend(Canvas C)
{
    local int i;

    C.SetPause(float(C.SizeX) / 2, 32 * HUDScaleY);
    StartColumn(int(C.CurX), int(C.CurY), 15);
    StartBG(C, StateLegendBGInfo);
    i = 0;
    J0x6F:

    // End:0xED [Loop If]
    if(i < string(AIStateInfo))
    {
        C.DrawColor = AIStateInfo[i].RGBColor;
        // End:0xC7
        if(DrawPathingEx)
        {
            DrawString(C, string(AIStateInfo[i].PathingExName));
            // [Explicit Continue]
            goto J0xE3;
        }
        DrawString(C, string(AIStateInfo[i].StateName));
        J0xE3:

        ++ i;
        // [Loop Continue]
        goto J0x6F;
    }
    EndBG(C, StateLegendBGInfo);
    C.DrawColor = WhiteColor;
    return;
}

defaultproperties
{
    begin object name=AIPERF_FPSGraph class=HUDLineGraph
        MaxValue=100
        GraphLength=768
        GraphHeight=128
        AxisInfo(0)=(Value=30,Label="30fps",ColorIndex=1,PixelValue=0)
        AxisInfo(1)=(Value=60,Label="60fps",ColorIndex=3,PixelValue=0)
    object end
    // Reference: HUDLineGraph'AIPerfHUD.AIPERF_FPSGraph'
    FPSLineGraph=AIPERF_FPSGraph
    begin object name=AIPERF_TickMSGraph class=HUDLineGraph
        MaxValue=2
        AxisInfo(0)=(Value=1,Label="1ms",ColorIndex=1,PixelValue=0)
    object end
    // Reference: HUDLineGraph'AIPerfHUD.AIPERF_TickMSGraph'
    DefaultAITickMSGraph=AIPERF_TickMSGraph
    begin object name=AIPERF_PathingGraph class=HUDLineGraph
        MaxValue=0.5
        AxisInfo(0)=(Value=0.25,Label="0.25ms",ColorIndex=1,PixelValue=0)
    object end
    // Reference: HUDLineGraph'AIPerfHUD.AIPERF_PathingGraph'
    PathGraph=AIPERF_PathingGraph
    AIStateInfo(0)=(ColorIndex=1,RGBColor=(R=255,G=0,B=0,A=0),StateName=GotoX,PathingExName=AvoidDynamicObstacles)
    AIStateInfo(1)=(ColorIndex=2,RGBColor=(R=0,G=0,B=255,A=0),StateName=AnimX,PathingExName=GenerateStaticPath)
    AIStateInfo(2)=(ColorIndex=3,RGBColor=(R=0,G=255,B=0,A=0),StateName=TurnToX,PathingExName=FinalizeNextPathPos)
    AIStateInfo(3)=(ColorIndex=4,RGBColor=(R=255,G=255,B=0,A=0),StateName=SetFireMode,PathingExName=PreStaticPath)
    AIStateInfo(4)=(ColorIndex=6,RGBColor=(R=200,G=0,B=200,A=0),StateName=Jump,PathingExName=PostStaticPath)
    DrawPathingTime=true
    DrawPathingEx=true
    DebugTreeItems(0)=(Text="Options",ConsoleCommand="",TriggerEvent=None,Func=None,Pop=false,Push=true,bHideChildren=true,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(1)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Toggle_Graphs,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(2)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Disable_DecisionTree,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(3)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Enable_DecisionTree,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(4)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Disable_Ticking,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(5)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Enable_Ticking,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(6)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Force_Idle,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(7)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Disable_GotoXEval,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(8)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Toggle_MarkDecisionTree,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(9)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Toggle_MarkSetLocation,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(10)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Toggle_DrawPathingTime,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(11)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Toggle_ProcAimTime,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(12)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Toggle_PathingEx,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(13)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=ForceCutScene,Pop=false,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
    DebugTreeItems(14)=(Text="",ConsoleCommand="",TriggerEvent=None,Func=Disable_Physics,Pop=true,Push=false,bHideChildren=false,var1=0,var2=0,MaxVisibleChildren=0,ChildrenOffset=0)
}