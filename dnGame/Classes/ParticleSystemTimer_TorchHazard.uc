/*******************************************************************************
 * ParticleSystemTimer_TorchHazard generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ParticleSystemTimer_TorchHazard extends ParticleSystemTimer
    collapsecategories
    hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Actor,Collision,Display,HeatVision,Interpolation,Material,Tick,TickTules,ParticleSystemTimer_Display,ParticleSystemTimer_Sound);

defaultproperties
{
    ParticleSystemClass='p_MapEvents.Map02_TorchHazard.TorchHazard_Main'
    LightClass='TriggerLightEx_PST_Fire'
    bEffectActive=true
    Delay=2
    DelayVariance=0.75
    Duration=3
    DurationVariance=0.5
    SoundName=FlameJet
    SoundFadeOutTime=0.75
    DamageRadius=80
    DamagePerTimeUnit=2
    DamageTimeInterval=0.1
    DamageTypeDealt='Engine.FireDamage'
}