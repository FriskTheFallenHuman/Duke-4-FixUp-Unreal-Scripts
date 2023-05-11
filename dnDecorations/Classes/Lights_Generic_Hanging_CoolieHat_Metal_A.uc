/*******************************************************************************
 * Lights_Generic_Hanging_CoolieHat_Metal_A generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Lights_Generic_Hanging_CoolieHat_Metal_A extends Lights_Generic_Hanging_CoolieHat
    collapsecategories;

defaultproperties
{
    DestroyedActivities(0)=none
    DestroyedActivities(1)='dnGame.DecoActivityDeclarations.DA_Sound_Destroyed_Glass_Large'
    DestroyedActivities(2)=DecoActivities_Events'Lights_Generic.DA_Events_Lights_Generic_Destroyed'
    begin object name=DA_Display_Lights_Generic_Hng_CHat_Metal_A_Brkn class=DecoActivities_Display
        RenderObject='sm_class_lights.Hanging.HangingLampMetalBrkn_cd'
        Skins(0)=(Index=1,NewMaterialEx=none)
    object end
    // Reference: DecoActivities_Display'Lights_Generic_Hanging_CoolieHat_Metal_A.DA_Display_Lights_Generic_Hng_CHat_Metal_A_Brkn'
    DestroyedActivities(3)=DA_Display_Lights_Generic_Hng_CHat_Metal_A_Brkn
    StaticMesh='sm_class_lights.Hanging.HangingLampMetalOn_cd'
}