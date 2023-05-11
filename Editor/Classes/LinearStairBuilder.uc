/*******************************************************************************
 * LinearStairBuilder generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class LinearStairBuilder extends BrushBuilder;

var() int StepLength;
var() int StepHeight;
var() int StepWidth;
var() int NumSteps;
var() int AddToFirstStep;
var() name GroupName;

event bool Build()
{
    local int i, LastIdx, CurrentX, CurrentY, CurrentZ, Adjustment;

    // End:0x2C
    if(((StepLength <= 0) || StepHeight <= 0) || StepWidth <= 0)
    {
        return BadParameters();
    }
    // End:0x7F
    if((NumSteps <= 1) || NumSteps > 45)
    {
        return BadParameters("NumSteps must be greater than 1 and less than 45.");
    }
    BeginBrush(false, GroupName);
    CurrentX = 0;
    CurrentY = 0;
    CurrentZ = 0;
    LastIdx = GetVertexCount();
    Vertex3f(0, 0, float(- StepHeight));
    Vertex3f(0, float(StepWidth), float(- StepHeight));
    Vertex3f(float(StepLength * NumSteps), float(StepWidth), float(- StepHeight));
    Vertex3f(float(StepLength * NumSteps), 0, float(- StepHeight));
    Poly4i(1, 0, 1, 2, 3, 'Base');
    LastIdx += 4;
    Vertex3f(float(StepLength * NumSteps), float(StepWidth), float(- StepHeight));
    Vertex3f(float(StepLength * NumSteps), float(StepWidth), float(StepHeight * (NumSteps - 1)) + float(AddToFirstStep));
    Vertex3f(float(StepLength * NumSteps), 0, float(StepHeight * (NumSteps - 1)) + float(AddToFirstStep));
    Vertex3f(float(StepLength * NumSteps), 0, float(- StepHeight));
    Poly4i(1, 4, 5, 6, 7, 'Back');
    LastIdx += 4;
    i = 0;
    J0x1FF:

    // End:0x316 [Loop If]
    if(i < NumSteps)
    {
        CurrentX = i * StepLength;
        CurrentZ = (i * StepHeight) + AddToFirstStep;
        Vertex3f(float(CurrentX), float(CurrentY), float(CurrentZ));
        Vertex3f(float(CurrentX), float(CurrentY + StepWidth), float(CurrentZ));
        Vertex3f(float(CurrentX + StepLength), float(CurrentY + StepWidth), float(CurrentZ));
        Vertex3f(float(CurrentX + StepLength), float(CurrentY), float(CurrentZ));
        Poly4i(1, (LastIdx + (i * 4)) + 3, (LastIdx + (i * 4)) + 2, (LastIdx + (i * 4)) + 1, LastIdx + (i * 4), 'Step');
        ++ i;
        // [Loop Continue]
        goto J0x1FF;
    }
    LastIdx += (NumSteps * 4);
    i = 0;
    J0x32D:

    // End:0x692 [Loop If]
    if(i < NumSteps)
    {
        CurrentX = i * StepLength;
        CurrentZ = (i * StepHeight) + AddToFirstStep;
        // End:0x380
        if(i == 0)
        {
            Adjustment = AddToFirstStep;            
        }
        else
        {
            Adjustment = 0;
        }
        Vertex3f(float(CurrentX), float(CurrentY), float(CurrentZ));
        Vertex3f(float(CurrentX), float(CurrentY), float((CurrentZ - StepHeight) - Adjustment));
        Vertex3f(float(CurrentX), float(CurrentY + StepWidth), float((CurrentZ - StepHeight) - Adjustment));
        Vertex3f(float(CurrentX), float(CurrentY + StepWidth), float(CurrentZ));
        Poly4i(1, (LastIdx + (i * 12)) + 3, (LastIdx + (i * 12)) + 2, (LastIdx + (i * 12)) + 1, LastIdx + (i * 12), 'Rise');
        Vertex3f(float(CurrentX), float(CurrentY), float(CurrentZ));
        Vertex3f(float(CurrentX), float(CurrentY), float((CurrentZ - StepHeight) - Adjustment));
        Vertex3f(float(CurrentX + (StepLength * (NumSteps - i))), float(CurrentY), float((CurrentZ - StepHeight) - Adjustment));
        Vertex3f(float(CurrentX + (StepLength * (NumSteps - i))), float(CurrentY), float(CurrentZ));
        Poly4i(1, (LastIdx + (i * 12)) + 4, (LastIdx + (i * 12)) + 5, (LastIdx + (i * 12)) + 6, (LastIdx + (i * 12)) + 7, 'Side');
        Vertex3f(float(CurrentX), float(CurrentY + StepWidth), float(CurrentZ));
        Vertex3f(float(CurrentX), float(CurrentY + StepWidth), float((CurrentZ - StepHeight) - Adjustment));
        Vertex3f(float(CurrentX + (StepLength * (NumSteps - i))), float(CurrentY + StepWidth), float((CurrentZ - StepHeight) - Adjustment));
        Vertex3f(float(CurrentX + (StepLength * (NumSteps - i))), float(CurrentY + StepWidth), float(CurrentZ));
        Poly4i(1, (LastIdx + (i * 12)) + 11, (LastIdx + (i * 12)) + 10, (LastIdx + (i * 12)) + 9, (LastIdx + (i * 12)) + 8, 'Side');
        ++ i;
        // [Loop Continue]
        goto J0x32D;
    }
    return EndBrush();
    return;
}

defaultproperties
{
    StepLength=32
    StepHeight=16
    StepWidth=256
    NumSteps=8
    GroupName=LinearStair
    BitmapFilename="BBLinearStair"
    ToolTip="Linear Staircase"
}