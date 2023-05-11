/*******************************************************************************
 * dnGauge generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnGauge extends dnDecoration
    abstract
    collapsecategories;

var() bool bInverseGauge;
var() int GaugeStartState;
var int GaugeState;
var() name SE_GaugeLeft;
var() name SE_GaugeRight;
var name GaugeLeftTag;
var name GaugeRightTag;

event PreLoadMap()
{
    super.PreLoadMap();
    GaugeLeftTag = EvaluateCompare(Tag, 'Left');
    GaugeRightTag = EvaluateCompare(Tag, 'Right');
    return;
}

event PreBeginPlay()
{
    GetPointRegion('GaugeLeft', SE_GaugeLeft);
    GetPointRegion('GaugeRight', SE_GaugeRight);
    super.PreBeginPlay();
    return;
}

function SetGaugeState(int NewGaugeState)
{
    return;
}

function AdjustGaugeState(int GaugeStateAdjustment)
{
    return;
}

function HandleGaugeLeft()
{
    return;
}

function HandleGaugeRight()
{
    return;
}

function TriggerFunc_GaugeLeft()
{
    // End:0x12
    if(bInverseGauge)
    {
        HandleGaugeRight();        
    }
    else
    {
        HandleGaugeLeft();
    }
    return;
}

function TriggerFunc_GaugeRight()
{
    // End:0x12
    if(bInverseGauge)
    {
        HandleGaugeLeft();        
    }
    else
    {
        HandleGaugeRight();
    }
    return;
}

defaultproperties
{
    GaugeStartState=3
    bNoDamage=true
    CollisionRadius=6
    CollisionHeight=6
    Mesh=none
}