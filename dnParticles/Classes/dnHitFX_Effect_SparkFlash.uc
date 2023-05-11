/*******************************************************************************
 * dnHitFX_Effect_SparkFlash generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnHitFX_Effect_SparkFlash extends dnHitFX_Effects
    collapsecategories
    hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

defaultproperties
{
    UseZoneGravity=false
    bUseAlphaRamp=true
    Lifetime=0.15
    SpawnOffset=(X=1,Y=0,Z=0)
    InitialVelocity=(X=0,Y=0,Z=0)
    MaxVelocityVariance=(X=0,Y=0,Z=0)
    AlphaMid=1
    AlphaEnd=0
    AlphaRampMid=0.85
    Textures(0)='dt_effects.Sparks.sparkblast3RC'
    StartDrawScale=0.1
    EndDrawScale=0.25
    bForceNonFinalBlendBlooms=true
}