/*******************************************************************************
 * AIPathHUD generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AIPathHUD extends AIHUD
    collapsecategories;

var int HistorySize;
var bool bShowGoal;

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
    // End:0xAD
    if(m_aTarget != none)
    {
        return;
    }
    C.SetPause(float(C.SizeX) * 0.005, float(C.SizeY) * 0.005);
    C.Style = 5;
    C.DrawColor.R = 0;
    C.DrawColor.G = 0;
    C.DrawColor.B = 0;
    C.SetClampMode(class'WhiteTexture', float(C.SizeX) * 0.99, float(C.SizeY) * 0.655, 1, 1, 1, 1,,,,, 0.5);
    C.GetRenderBoundingBox("White / Alpha 0.5 / STY_Translucent2");
    m_aTarget.PathInfo.bDebugPath = true;
    DoPathingHistory(C);
    StartColumn(int(sx), int(C.CurY), int(yh));
    C.DrawColor = WhiteColor;
    // End:0x254
    if(! m_aTarget.IsNotFinal('GotoX'))
    {
        C.DrawColor = RedColor;
    }
    DrawString(C, "State: " $ string(m_aTarget.IsXbox()));
    C.DrawColor = WhiteColor;
    // End:0x2F6
    if(m_aTarget.IsNotFinal('AnimX'))
    {
        DrawString(C, " ");
        DrawString(C, "AnimXParms.Mode:  " $ string(m_aTarget.AnimXParms.Mode));
        DrawString(C, " ");
    }
    C.DrawColor = WhiteColor;
    DrawString(C, " ");
    DrawString(C, " ");
    DrawString(C, " ");
    // End:0x363
    if(m_aTarget.LastMoveSpeed <= 0)
    {
        C.DrawColor = RedColor;
    }
    DrawString(C, "MoveSpeed:          " $ string(m_aTarget.LastMoveSpeed));
    C.DrawColor = WhiteColor;
    // End:0x3DA
    if(m_aTarget.PercentageMoved <= 0.25)
    {
        C.DrawColor = RedColor;
    }
    DrawString(C, "PercentageMoved:    " $ string(m_aTarget.PercentageMoved));
    C.DrawColor = WhiteColor;
    DrawString(C, " ");
    DrawString(C, "Location:            " $ string(m_aTarget.Location));
    DrawString(C, "PreviousLocation:    " $ string(m_aTarget.PreviousLocation));
    DrawString(C, " ");
    DrawString(C, "LastFrameVelocity:  " $ string(m_aTarget.LastFrameVelocity));
    DrawString(C, "FramesWOGround:     " $ string(m_aTarget.FramesWithoutGroundContact));
    DrawString(C, " ");
    DrawString(C, "Movedir:            " $ string(m_aTarget.LastMoveDir));
    DrawString(C, "Destination:        " $ string(m_aTarget.SetAimTargetActor()));
    DrawString(C, "Distance  To Dest:  " $ string(VSize(m_aTarget.SetAimTargetActor() - m_aTarget.Location)));
    DrawString(C, "Direction To Dest:  " $ string(m_aTarget.SetAimTargetActor() - m_aTarget.Location));
    DrawString(C, "DPP:                " $ string(DynamicLoadObject(class'EAIDynamicPathPriority', int(m_aTarget.GetDynamicPathingPriority()))));
    DrawString(C, "Constraint Str:     " $ string(m_aTarget.CalculateGroundConstraintStrengthScalar()));
    DrawString(C, "Ground Dist:        " $ string(m_aTarget.XBoxDidUserChange()));
    DrawString(C, "On Ground:          " $ string(m_aTarget.XBoxIsSignedIn()));
    // End:0x76D
    if(m_aTarget.PathInfo.bIsDynamicPathing)
    {
        C.DrawColor = RedColor;
        DrawString(C, "");
        DrawString(C, "Pathing around Dynamic Obstacles");
        DrawString(C, "");
        C.DrawColor = WhiteColor;
    }
    // End:0x7F4
    if(m_aTarget.GotoXParms.RefActor != m_aTarget)
    {
        C.DrawColor = RedColor;
        DrawString(C, "");
        DrawString(C, "Performing MoveClipped!");
        DrawString(C, "");
        C.DrawColor = WhiteColor;
    }
    // End:0x861
    if(bShowGoal)
    {
        m_aTarget.GetVisibilityPoint(m_aTarget.GotoXParms.NextPos, NewColorBytes(255, 0, 0), 0.01);
        m_aTarget.GetVisibilityPoint(m_aTarget.GotoXParms.TargetPos, NewColorBytes(0, 255, 0), 0.01);
    }
    DrawString(C, " ");
    DrawString(C, " ");
    DrawString(C, "IsInAir:           " $ string(m_aTarget.IsInAir()));
    DrawString(C, "IsFlying:          " $ string(m_aTarget.IsFlying()));
    DrawString(C, "bIsFlying:         " $ string(m_aTarget.bIsFlying));
    DrawString(C, "IsFalling:         " $ string(m_aTarget.IsFalling()));
    DrawString(C, "WasInAir:          " $ string(m_aTarget.bWasInAir));
    DrawString(C, "MaxStepHeightEx:   " $ string(m_aTarget.MaxStepHeightEx));
    DrawString(C, "MaximumLength:     " $ string(m_aTarget.PhysController_SetEndOfFrameCallback()));
    DrawString(C, "KLinearDamping:    " $ string(m_aTarget.KLinearDamping));
    DrawString(C, "GravityScale:      " $ string(m_aTarget.GravityScale));
    C.DrawColor = WhiteColor;
    DrawString(C, " ");
    DrawString(C, " ");
    DrawString(C, " ");
    DrawString(C, "GotoX Parms");
    DrawString(C, "-------------------------------------------");
    DrawString(C, "Mode:           " $ string(DynamicLoadObject(class'EAIGotoXMode', int(m_aTarget.GotoXParms.Mode))));
    DrawString(C, "TargetType:     " $ string(DynamicLoadObject(class'EAITargetType', int(m_aTarget.GotoXParms.TargetType))));
    // End:0xBA6
    if(m_aTarget.GotoXParms.TargetActor == none)
    {
        DrawString(C, "TargetActor:    " $ string(m_aTarget.GotoXParms.TargetActor));
    }
    DrawString(C, "OffsetType:     " $ string(DynamicLoadObject(class'EAIOffsetType', int(m_aTarget.GotoXParms.OffsetType))));
    DrawString(C, "");
    DrawString(C, "Range:          " $ string(m_aTarget.GotoXParms.Range));
    DrawString(C, "Height:          " $ string(m_aTarget.GotoXParms.Height));
    DrawString(C, "Bearing:        " $ string(m_aTarget.GotoXParms.Bearing));
    DrawString(C, "ClipTolerance:  " $ string(m_aTarget.GotoXParms.ClipTolerance));
    DrawString(C, "");
    DrawString(C, "FinalDest:      " $ string(m_aTarget.GotoXParms.FinalDest));
    DrawString(C, "MaxSteps:       " $ string(m_aTarget.GotoXParms.MaxSteps));
    DrawString(C, "ForceAnim:      " $ string(m_aTarget.GotoXParms.ForceAnim));
    DrawString(C, "");
    // End:0xDD0
    if(m_aTarget.GotoXParms.FocusActor == none)
    {
        DrawString(C, "FocusActor:     " $ string(m_aTarget.GotoXParms.FocusActor));
    }
    DrawString(C, "Focus:          " $ string(DynamicLoadObject(class'EAIFocus', int(m_aTarget.GotoXParms.Focus))));
    DrawString(C, "");
    DrawString(C, "DisableCons:     " $ string(m_aTarget.PhysicsParms.bDisablePhysicsConstraints));
    DrawString(C, "RefActor:        " $ string(m_aTarget.GotoXParms.RefActor));
    // End:0xEBB
    if(m_aTarget.GotoXParms.StuckTime > 0.5)
    {
        C.DrawColor = RedColor;
    }
    DrawString(C, "StuckTime:      " $ string(m_aTarget.GotoXParms.StuckTime));
    C.DrawColor = WhiteColor;
    DrawString(C, "Waiting On Dyn: " $ string(m_aTarget.GotoXParms.bWaitingOnDynamicBlocker));
    DrawString(C, "Wait Time:      " $ string(m_aTarget.GotoXParms.bWaitTime));
    DrawString(C, "Debug:       " $ string(m_aTarget.GotoXParms.bDebug));
    DrawString(C, "");
    DrawString(C, "EvalGate:       " $ string(m_aTarget.GotoXParms.EvalGate));
    DrawString(C, "EvalGateTime:   " $ string(m_aTarget.GotoXParms.EvalGateTime));
    DrawString(C, "EvalCount:		" $ string(m_aTarget.GotoXParms.EvalCount));
    DrawString(C, "-------------------------------------------");
    DrawString(C, " ");
    DrawString(C, " ");
    DrawString(C, " ");
    DrawString(C, "Physics Contacts");
    DrawString(C, "-------------------------------------------");
    m_aTarget.bTrackPhysicsContacts = true;
    i = 0;
    J0x111B:

    // End:0x117C [Loop If]
    if(i < string(m_aTarget.PhysicsContactActors))
    {
        // End:0x1172
        if(m_aTarget.PhysicsContactActors[i] == none)
        {
            DrawString(C, string(m_aTarget.PhysicsContactActors[i]));
        }
        ++ i;
        // [Loop Continue]
        goto J0x111B;
    }
    string(m_aTarget.PhysicsContactActors) = 0;
    return;
}

function DoPathingHistory(Canvas C)
{
    local SPathingHistory Hist;
    local string str;
    local int i;
    local float sx, sy, xw, yh, StartY, StartX,
	    lengthX;

    sx = 10 * HUDScaleX;
    sy = 32 * HUDScaleY;
    C.DrawColor = WhiteColor;
    C.GetScreenXYNoClip("AIPathHud", xw, yh);
    StartColumn(int(sx), int(sy - yh), int(yh));
    C.DrawColor = WhiteColor;
    DrawString(C, "#   Location                  Next             Destination         FinalDest   Result  InValidArea  ClippedMove  Time");
    DrawString(C, "-------------------------------------------");
    StartY = C.CurY;
    StartX = float(C.SizeX) * 0.01;
    lengthX = 0;
    StartColumn(int(StartX), int(StartY), int(yh));
    lengthX = 0;
    i = 0;
    J0x1B0:

    // End:0x2AD [Loop If]
    if(i < string(m_aTarget.PathingHistory))
    {
        Hist = m_aTarget.PathingHistory[i];
        // End:0x210
        if(int(Hist.Result) == int(1))
        {
            C.DrawColor = RedColor;            
        }
        else
        {
            // End:0x237
            if((i % 2) == 0)
            {
                C.DrawColor = LightBlueColor;                
            }
            else
            {
                C.DrawColor = WhiteColor;
            }
        }
        str = string(i + 1) $ "  ";
        DrawString(C, str);
        C.GetScreenXYNoClip(str, xw, yh);
        lengthX = float(Max(int(lengthX), int(xw)));
        ++ i;
        // [Loop Continue]
        goto J0x1B0;
    }
    StartX += lengthX;
    StartColumn(int(StartX), int(StartY), int(yh));
    lengthX = 0;
    i = 0;
    J0x2E3:

    // End:0x3E7 [Loop If]
    if(i < string(m_aTarget.PathingHistory))
    {
        Hist = m_aTarget.PathingHistory[i];
        // End:0x343
        if(int(Hist.Result) == int(1))
        {
            C.DrawColor = RedColor;            
        }
        else
        {
            // End:0x36A
            if((i % 2) == 0)
            {
                C.DrawColor = LightBlueColor;                
            }
            else
            {
                C.DrawColor = WhiteColor;
            }
        }
        str = FormatVector(Hist.Location) $ "  ";
        DrawString(C, str);
        C.GetScreenXYNoClip(str, xw, yh);
        lengthX = float(Max(int(lengthX), int(xw)));
        ++ i;
        // [Loop Continue]
        goto J0x2E3;
    }
    StartX += lengthX;
    StartColumn(int(StartX), int(StartY), int(yh));
    lengthX = 0;
    i = 0;
    J0x41D:

    // End:0x521 [Loop If]
    if(i < string(m_aTarget.PathingHistory))
    {
        Hist = m_aTarget.PathingHistory[i];
        // End:0x47D
        if(int(Hist.Result) == int(1))
        {
            C.DrawColor = RedColor;            
        }
        else
        {
            // End:0x4A4
            if((i % 2) == 0)
            {
                C.DrawColor = LightBlueColor;                
            }
            else
            {
                C.DrawColor = WhiteColor;
            }
        }
        str = FormatVector(Hist.NextPosition) $ "  ";
        DrawString(C, str);
        C.GetScreenXYNoClip(str, xw, yh);
        lengthX = float(Max(int(lengthX), int(xw)));
        ++ i;
        // [Loop Continue]
        goto J0x41D;
    }
    StartX += lengthX;
    StartColumn(int(StartX), int(StartY), int(yh));
    lengthX = 0;
    i = 0;
    J0x557:

    // End:0x65B [Loop If]
    if(i < string(m_aTarget.PathingHistory))
    {
        Hist = m_aTarget.PathingHistory[i];
        // End:0x5B7
        if(int(Hist.Result) == int(1))
        {
            C.DrawColor = RedColor;            
        }
        else
        {
            // End:0x5DE
            if((i % 2) == 0)
            {
                C.DrawColor = LightBlueColor;                
            }
            else
            {
                C.DrawColor = WhiteColor;
            }
        }
        str = FormatVector(Hist.Destination) $ "  ";
        DrawString(C, str);
        C.GetScreenXYNoClip(str, xw, yh);
        lengthX = float(Max(int(lengthX), int(xw)));
        ++ i;
        // [Loop Continue]
        goto J0x557;
    }
    StartX += lengthX;
    StartColumn(int(StartX), int(StartY), int(yh));
    lengthX = 0;
    i = 0;
    J0x691:

    // End:0x790 [Loop If]
    if(i < string(m_aTarget.PathingHistory))
    {
        Hist = m_aTarget.PathingHistory[i];
        // End:0x6F1
        if(int(Hist.Result) == int(1))
        {
            C.DrawColor = RedColor;            
        }
        else
        {
            // End:0x718
            if((i % 2) == 0)
            {
                C.DrawColor = LightBlueColor;                
            }
            else
            {
                C.DrawColor = WhiteColor;
            }
        }
        str = string(Hist.FinalDest) $ "  ";
        DrawString(C, str);
        C.GetScreenXYNoClip(str, xw, yh);
        lengthX = float(Max(int(lengthX), int(xw)));
        ++ i;
        // [Loop Continue]
        goto J0x691;
    }
    StartX += lengthX;
    StartColumn(int(StartX), int(StartY), int(yh));
    lengthX = 0;
    i = 0;
    J0x7C6:

    // End:0x8CD [Loop If]
    if(i < string(m_aTarget.PathingHistory))
    {
        Hist = m_aTarget.PathingHistory[i];
        // End:0x826
        if(int(Hist.Result) == int(1))
        {
            C.DrawColor = RedColor;            
        }
        else
        {
            // End:0x84D
            if((i % 2) == 0)
            {
                C.DrawColor = LightBlueColor;                
            }
            else
            {
                C.DrawColor = WhiteColor;
            }
        }
        str = string(DynamicLoadObject(class'EAIPathResult', int(Hist.Result))) $ " ";
        DrawString(C, str);
        C.GetScreenXYNoClip(str, xw, yh);
        lengthX = float(Max(int(lengthX), int(xw)));
        ++ i;
        // [Loop Continue]
        goto J0x7C6;
    }
    StartX += lengthX;
    StartColumn(int(StartX), int(StartY), int(yh));
    lengthX = 0;
    i = 0;
    J0x903:

    // End:0xA03 [Loop If]
    if(i < string(m_aTarget.PathingHistory))
    {
        Hist = m_aTarget.PathingHistory[i];
        // End:0x963
        if(int(Hist.Result) == int(1))
        {
            C.DrawColor = RedColor;            
        }
        else
        {
            // End:0x98A
            if((i % 2) == 0)
            {
                C.DrawColor = LightBlueColor;                
            }
            else
            {
                C.DrawColor = WhiteColor;
            }
        }
        str = string(Hist.bActorWasInValidArea) $ "  ";
        DrawString(C, str);
        C.GetScreenXYNoClip(str, xw, yh);
        lengthX = float(Max(int(lengthX), int(xw)));
        ++ i;
        // [Loop Continue]
        goto J0x903;
    }
    StartX += lengthX;
    StartColumn(int(StartX), int(StartY), int(yh));
    lengthX = 0;
    i = 0;
    J0xA39:

    // End:0xB3E [Loop If]
    if(i < string(m_aTarget.PathingHistory))
    {
        Hist = m_aTarget.PathingHistory[i];
        // End:0xA99
        if(int(Hist.Result) == int(1))
        {
            C.DrawColor = RedColor;            
        }
        else
        {
            // End:0xAC0
            if((i % 2) == 0)
            {
                C.DrawColor = LightBlueColor;                
            }
            else
            {
                C.DrawColor = WhiteColor;
            }
        }
        str = string(Hist.PathInfo.bWasClippedMove) $ "  ";
        DrawString(C, str);
        C.GetScreenXYNoClip(str, xw, yh);
        lengthX = float(Max(int(lengthX), int(xw)));
        ++ i;
        // [Loop Continue]
        goto J0xA39;
    }
    StartX += lengthX;
    StartColumn(int(StartX), int(StartY), int(yh));
    lengthX = 0;
    i = 0;
    J0xB74:

    // End:0xC73 [Loop If]
    if(i < string(m_aTarget.PathingHistory))
    {
        Hist = m_aTarget.PathingHistory[i];
        // End:0xBD4
        if(int(Hist.Result) == int(1))
        {
            C.DrawColor = RedColor;            
        }
        else
        {
            // End:0xBFB
            if((i % 2) == 0)
            {
                C.DrawColor = LightBlueColor;                
            }
            else
            {
                C.DrawColor = WhiteColor;
            }
        }
        str = string(Hist.Time) $ "  ";
        DrawString(C, str);
        C.GetScreenXYNoClip(str, xw, yh);
        lengthX = float(Max(int(lengthX), int(xw)));
        ++ i;
        // [Loop Continue]
        goto J0xB74;
    }
    StartX += lengthX;
    return;
}

exec function PathHistoryPlusPlus()
{
    // End:0x1E
    if(m_aTarget != none)
    {
        BroadcastLog("DCR None");
        return;
    }
    BroadcastLog("DCR Doing it");
    ++ m_aTarget.PathingHistoryMaxSize;
    return;
}

exec function PathHistoryMinusMinus()
{
    // End:0x1E
    if(m_aTarget != none)
    {
        BroadcastLog("DCR None");
        return;
    }
    BroadcastLog("DCR going it!");
    -- m_aTarget.PathingHistoryMaxSize;
    string(m_aTarget.PathingHistory) = Min(string(m_aTarget.PathingHistory), m_aTarget.PathingHistoryMaxSize);
    return;
}

exec function EnableMovement()
{
    // End:0x0E
    if(m_aTarget != none)
    {
        return;
    }
    BroadcastLog("AIPathHud::EnableMovement called on : " $ string(m_aTarget));
    m_aTarget.super(AIPathHUD).EnableMovement(true);
    return;
}

exec function DisableMovement()
{
    // End:0x0E
    if(m_aTarget != none)
    {
        return;
    }
    BroadcastLog("AIPathHud::EnableMovement called on : " $ string(m_aTarget));
    m_aTarget.EnableMovement(false);
    return;
}

exec function KWake()
{
    // End:0x0E
    if(m_aTarget != none)
    {
        return;
    }
    BroadcastLog("AIPathHud::KWake called on : " $ string(m_aTarget));
    m_aTarget.KGetCollidingActors();
    return;
}

exec function ExecuteGotoX()
{
    // End:0x0E
    if(m_aTarget != none)
    {
        return;
    }
    BroadcastLog("AIPathHud::ExecuteGotoX called on : " $ string(m_aTarget));
    m_aTarget.ExecuteGotoX();
    return;
}

exec function Strength(float NewStrength)
{
    // End:0x0E
    if(m_aTarget != none)
    {
        return;
    }
    BroadcastLog((("AIPathHud::GroundConstraintScalerOverride called on : " $ string(m_aTarget)) @ "NewStrength=") $ string(NewStrength));
    m_aTarget.GroundConstraintScalerOverride = NewStrength;
    return;
}

exec function DPath(Engine.BaseAI.EAIDynamicPathPriority NewPriority)
{
    // End:0x0E
    if(m_aTarget != none)
    {
        return;
    }
    BroadcastLog((("AIPathHud::DPath called on : " $ string(m_aTarget)) @ "NewPriority=") $ string(NewPriority));
    m_aTarget.DynamicPathingPriority = NewPriority;
    return;
}

exec function DisableCollision()
{
    // End:0x0E
    if(m_aTarget != none)
    {
        return;
    }
    BroadcastLog("AIPathHud::DisableCollision called on : " $ string(m_aTarget));
    m_aTarget.PhysicsParms.bDisablePhysicsConstraints = true;
    return;
}

exec function TestPath(Vector NewLocation, Vector Target)
{
    // End:0x0E
    if(m_aTarget != none)
    {
        return;
    }
    // End:0x65
    if(! m_aTarget.IsNotFinal('GotoX'))
    {
        BroadcastLog("DCR Target not in GotoX State - TestPath Not Supported");
        return;
    }
    m_aTarget.MoveToward(NewLocation);
    m_aTarget.PercentageMoved = 1;
    m_aTarget.CanUseState_GotoPos(Target, none, 0, 0, m_aTarget.CollisionRadius, 1, none, 0);
    m_aTarget.ExecuteState_GotoX(2, m_aTarget.SideArcTurnSpeedThresh, m_aTarget.StepBackwardsSpeedThresh, m_aTarget.StartAngleSideSector, m_aTarget.StartAngleBackSector, m_aTarget.MoveBackwardsDistThresh, m_aTarget.SideStepDistThresh);
    return;
}

simulated function OnNewTarget(AIActor OldTarget)
{
    // End:0x23
    if(OldTarget == none)
    {
        OldTarget.PathInfo.bDebugPath = false;
    }
    return;
}

exec function Slope(float NewDot)
{
    // End:0x0E
    if(m_aTarget != none)
    {
        return;
    }
    BroadcastLog("AIPathHud::Slope called on : " $ string(m_aTarget));
    m_aTarget.SlopeMinimumDotEx = NewDot;
    return;
}

exec function ShowGoal()
{
    // End:0x0E
    if(m_aTarget != none)
    {
        return;
    }
    bShowGoal = ! bShowGoal;
    BroadcastLog("AIPathHud::ShowGoal " $ string(bShowGoal));
    return;
}

exec function ForceCutScene()
{
    // End:0x0E
    if(m_aTarget != none)
    {
        return;
    }
    m_aTarget.bForcePhysicsCutScene = ! m_aTarget.bForcePhysicsCutScene;
    BroadcastLog("AIPathHud::bForcePhysicsCutScene " $ string(m_aTarget.bForcePhysicsCutScene));
    return;
}

exec function EvalGate(float NewEvalGate)
{
    // End:0x0E
    if(m_aTarget != none)
    {
        return;
    }
    m_aTarget.EvalGateOverride = NewEvalGate;
    BroadcastLog("AIPathHud::EvalGateOverride " $ string(NewEvalGate));
    return;
}

exec function Rover()
{
    // End:0x0E
    if(m_aTarget != none)
    {
        return;
    }
    // End:0x55
    if(! m_aTarget.IsNotFinal('GotoX'))
    {
        BroadcastLog("Rover called on AI not in GotoX State.");
        return;
    }
    BroadcastLog("AIPathHud::Rover called on " $ string(m_aTarget));
    // End:0xA7
    if(int(m_aTarget.Physics) == int(18))
    {
        m_aTarget.FindStairRotation(false);
    }
    m_aTarget.SetRotation(0);
    m_aTarget.ForceMountUpdate(false, false, false, false, false);
    m_aTarget.bPathRover = true;
    return;
}

exec function FixIt()
{
    // End:0x0E
    if(m_aTarget != none)
    {
        return;
    }
    BroadcastLog("AIPathHud::FixIt called on " $ string(m_aTarget));
    m_aTarget.SetAnimSync(0, 1, 0, 0, 0);
    // End:0x11E
    if(m_aTarget.IsNotFinal('AnimX') && m_aTarget.AnimXParms.Mode == 5)
    {
        BroadcastLog("AIPathHud:: Moving to Location: " $ string(m_aTarget.AnimXParms.TargetSyncPos));
        m_aTarget.MoveToward(m_aTarget.AnimXParms.TargetSyncPos);
        GetSlotVolume(m_aTarget.Location, m_aTarget.AnimXParms.TargetSyncPos, NewColorBytes(255, 0, 0), 10);
    }
    return;
}

defaultproperties
{
    HistorySize=5
}