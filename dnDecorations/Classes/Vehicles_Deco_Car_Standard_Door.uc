/*******************************************************************************
 * Vehicles_Deco_Car_Standard_Door generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Vehicles_Deco_Car_Standard_Door extends Vehicles_Deco_Parts_Karma
    abstract
    collapsecategories
    dependson(Vehicles_Deco_Car_Standard_Windows);

var Vehicles_Deco_Car_Standard_Windows Window;

function PostVerifySelf()
{
    local Vehicles_Deco_Bodies Parent;

    super.PostVerifySelf();
    Parent = Vehicles_Deco_Bodies(MountParent);
    // End:0x71
    if(Parent == none)
    {
        Window = Vehicles_Deco_Car_Standard_Windows(FindMountedActor(, class'Vehicles_Deco_Car_Standard_Windows'));
        // End:0x71
        if(Window == none)
        {
            Parent.VehicleParts[Parent.VehicleParts.Add(1)].VehiclePartActor = Window;
        }
    }
    return;
}

function Explode()
{
    // End:0x19
    if(Window == none)
    {
        Window.RemoveTouchClass();
    }
    super.Explode();
    return;
}

function DetachFromVehicle()
{
    super.DetachFromVehicle();
    KFindPhysicsAction(7);
    bBlockPath = false;
    return;
}

function Destroyed()
{
    bBlockPath = true;
    super.Destroyed();
    return;
}

defaultproperties
{
    DynamicInteractionClassification=0
}