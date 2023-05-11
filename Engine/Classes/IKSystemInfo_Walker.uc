/*******************************************************************************
 * IKSystemInfo_Walker generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class IKSystemInfo_Walker extends IKSystemInfo
    abstract
    native
    collapsecategories
    notplaceable;

var() noexport float FootRadius "Radius of the feet.";
var() noexport float FloorHeightOfs "Fudge value added to foot height which is calculated from bone positions.";
var() noexport float OverExtendedOfs "Dist below base bone used to determine when foot is over extended.";
var() noexport float PlantedOfs "Dist above base bone to determine when foot is planted.";
var() noexport float TraceMaxOfs "Min Z value of Trace";
var() noexport float TraceMinOfs "Max Z value of Trace";
var() noexport float MaxZOffsetABS "Max Absolute Z value that we will adjust prepivot by.";

defaultproperties
{
    FootRadius=7
    OverExtendedOfs=1
    PlantedOfs=2.5
    TraceMaxOfs=25
    TraceMinOfs=-32
    MaxZOffsetABS=16
    IKEvents(0)=(EventType=1,EventName="Walker_IK_Detach",EventData="")
    IKEvents(1)=(EventType=0,EventName="Walker_IK_Attach",EventData="")
}