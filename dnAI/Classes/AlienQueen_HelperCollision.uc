/*******************************************************************************
 * AlienQueen_HelperCollision generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AlienQueen_HelperCollision extends RenderActor;

var Vector OriginalLocation;

simulated event PostVerifySelf()
{
    super.PostVerifySelf();
    OriginalLocation = Location;
    return;
}

final simulated function SlideOut()
{
    local SDesiredLocation DL;

    DL.Target = OriginalLocation + TransformVectorByRot(Vect(420, 0, 0), Rotation);
    DL.Style = 1;
    DL.TimeTotal = 3;
    DisableDesiredRotation_Pitch(DL);
    return;
}

final simulated function SlideIn()
{
    SetDesiredRotation_Roll();
    SetDesiredRotation(OriginalLocation);
    return;
}

defaultproperties
{
    StaticInteractionClassification=5
    bBlockKarma=true
    bHidden=true
    bCastStencilShadows=false
    TickStyle=0
    DrawType=8
    DrawScale=20
    StaticMesh='sm_class_decorations.Barrels.Barrel_Generic'
}