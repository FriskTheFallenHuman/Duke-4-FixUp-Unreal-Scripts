/*******************************************************************************
 * Biology_Generic_AlienSensor generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Biology_Generic_AlienSensor extends KSphereSensor;

var Pawn CurrentlySensingPawn;

event BeginSenseObject(KarmaActor Actor)
{
    super(KSensor).BeginSenseObject(Actor);
    CurrentlySensingPawn = BindPort(false, true);
    // End:0x34
    if(CurrentlySensingPawn == none)
    {
        MountParent.AddTouchClass('OnSenseHumanPawn');
    }
    return;
}

event EndSenseObject(KarmaActor Actor)
{
    super(KSensor).EndSenseObject(Actor);
    CurrentlySensingPawn = BindPort(false, true);
    // End:0x24
    if(MountParent != none)
    {
        return;
    }
    // End:0x45
    if(CurrentlySensingPawn != none)
    {
        MountParent.AddTouchClass('OnUnsenseHumanPawn');        
    }
    else
    {
        MountParent.AddTouchClass('OnSenseHumanPawn');
    }
    return;
}

defaultproperties
{
    StaticInteractionClassification=7
    bAITransparent=true
    bTickOnlyWhenOwnerShould=true
}