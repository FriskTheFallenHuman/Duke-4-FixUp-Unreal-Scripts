/*******************************************************************************
 * PodGirl_Base generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PodGirl_Base extends dnDecoration
    native;

cpptext
{
// Stripped
}

var() noexport class<AIActor> ClassToSpawn "Class to spawn";
var() noexport float SensorRadius "Radius of the KSphereSensor around this pod. Only used if not using a PodGirlManger";

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.RegisterMaterialClass(ClassToSpawn);
    return;
}
