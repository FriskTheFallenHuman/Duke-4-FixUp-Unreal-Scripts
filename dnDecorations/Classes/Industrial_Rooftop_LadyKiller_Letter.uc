/*******************************************************************************
 * Industrial_Rooftop_LadyKiller_Letter generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Industrial_Rooftop_LadyKiller_Letter extends Industrial_Generic
    collapsecategories;

defaultproperties
{
    bSurviveDeath=true
    DestroyedActivities(0)=none
    DestroyedActivities(1)='dnGame.DecoActivityDeclarations.DA_Physics_PHYS_Karma_Set'
    begin object name=DA_KImpulse_Letter_Destroyed class=DecoActivities_KarmaImpulse
        ImpulseForce=80000
        ImpulseOffsetVariance=(X=0,Y=10,Z=10)
        ImpulseDirectionVariance=(Pitch=16384,Yaw=16384,Roll=0)
    object end
    // Reference: DecoActivities_KarmaImpulse'Industrial_Rooftop_LadyKiller_Letter.DA_KImpulse_Letter_Destroyed'
    DestroyedActivities(2)=DA_KImpulse_Letter_Destroyed
    begin object name=DA_Display_Rooftop_LK_Letter_Destroyed class=DecoActivities_Display
        Skins(0)=(Index=0,NewMaterialEx='smt_skins9.LK_RoofTop.LK_rooftop_letters_destroyed_BS')
    object end
    // Reference: DecoActivities_Display'Industrial_Rooftop_LadyKiller_Letter.DA_Display_Rooftop_LK_Letter_Destroyed'
    DestroyedActivities(3)=DA_Display_Rooftop_LK_Letter_Destroyed
    begin object name=DA_Sound_Rooftop_LK_Letter_Destroyed class=DecoActivities_Sound
        SoundNames(0)=Neon_Explode
    object end
    // Reference: DecoActivities_Sound'Industrial_Rooftop_LadyKiller_Letter.DA_Sound_Rooftop_LK_Letter_Destroyed'
    DestroyedActivities(4)=DA_Sound_Rooftop_LK_Letter_Destroyed
    HealthPrefab=4
    Mass=5000
    StaticMesh='sm_lvl_ladykiller.LK_RoofTop.LadyKiller_L'
}