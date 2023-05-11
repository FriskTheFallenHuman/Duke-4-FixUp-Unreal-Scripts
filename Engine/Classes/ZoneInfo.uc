/*******************************************************************************
 * ZoneInfo generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ZoneInfo extends Info
    native
    nativereplication
    collapsecategories
    notplaceable
    dependson(Corpse)
    dependson(GeoWater)
    hidecategories(Lighting,LightColor,Filter,Interactivity,Karma,Networking,Sound);

var() const noexport bool bKillZone "Zone instantly kills any RenderActor that enters. PlayerPawns die... all other RenderActors are silently destroyed.";
var() noexport bool bNeutralZone "Players can't take damage in this zone.";
var() noexport bool bBombDetectorZone "If the player has a bomb detector in their inventory, then it will be activated when the player enters this zone.";
var() noexport bool bZonePhysicsCollision "Consider the BSP in this zone for physics collision?";
var(ZoneDisplay) noexport bool bHasDistanceFog "Set this to true if you want to enable distance fog for this zone.";
var(ZoneDisplay) noexport bool bHasGlobalHeightFog "If true, global height fog will draw for entire level.";
var(ZoneDisplay) noexport bool bAmbientZone "If true, lights with bAmbientLight set to true will light this zone.";
var(ZoneDisplay) bool bHasDOF;
var(ZoneDisplay) bool Scene_UseToneMapping;
var(ZoneEffects) noexport bool bSuffocatePawns "When a Pawn's head enters this zone, then it will start suffocating it. Priority = 1)Hand placed volumes 2)ZoneInfos 3)LevelInfo.";
var(ZoneAudio) noexport bool bZoneMusicAllowReverb "Should the music assocaited with this zone have reverb?";
var(ZoneReverb) noexport bool bReverbZone "Enable reverb for the zone.";
var(ZoneReverb) noexport bool bUseExtendedReverb "Use extended reverb settings.  If true, will ignore ReverbPreset and use the settings from ZoneReverbEx.";
var(ZoneEvent) noexport name ZonePlayerEvent "Event to trigger when the player enters the zone.";
var(ZoneEvent) noexport name ZonePlayerExitEvent "Event to trigger when the player exits the zone.";
var(ZoneEvent) noexport localized string ZoneName "Specific name for this zone. Used in multiplayer to indicate where a player is in the map.";
var(ZoneEvent) noexport name ZoneTag "Same use as 'Tag', but seperate for use with seperate triggers, such as ZoneTrigger. I have no clue why.";
var(ZoneDisplay) noexport int MaxCorpses "Most corpses allowed to be in this zone.";
var(ZoneDisplay) noexport float DefaultVisibilityRadius "Visibility range of the zone. Anything outside of this will not be rendered unless overridden.";
var(ZoneDisplay) noexport float AmbientLightScale "How much to scale the ambient lighting in the current zone.";
var(ZoneDisplay) noexport SDistanceFog DistanceFog "Distance fog definition for this Zone.";
var(ZoneDisplay) noexport SGlobalHeightFog GlobalHeightFog "Global height fog parameters.";
var(ZoneDisplay) noexport float DistanceFogFadeTime "Time in seconds for zone fog to fade in/out.";
var(ZoneDisplay) array<Cubemap> ZoneCubemaps;
var(ZoneDisplay) noexport Cubemap ZoneSpecularCubemap "Specular cubemap override.";
var(ZoneDisplay) MaterialEx ZoneOverrideMaterial;
var(ZoneDisplay) SScaleModifier DOFBlurAmount;
var(ZoneDisplay) SScaleModifier DOFFocalDist;
var(ZoneDisplay) SScaleModifier DOFFocalRangeMin;
var(ZoneDisplay) SScaleModifier DOFFocalRangeMax;
var(ZoneDisplay) SSceneInfo Scene;
var(ZoneEffects) noexport name SkyZoneTag "Tag of sky zone to link to. This lets you have different skies for different zones.";
var(ZoneEffects) noexport name GeoWaterTag "Tag of a specific GeoWater that you want to force actors trying to affect GeoWater to always find instead of doing the normal slower checks to search for one. This only does height checking to see if effects should happen, no others.";
var(ZoneEffects) noexport Actor.EZoneFlotsamEffect ZoneFlotsamEffect "A particle system to mount to players moving through the zone.";
var(ZoneEffects) noexport Rotator ZoneFlotsamRotation "Rotation to apply to this effect to give it a different direction (primarily for windy type effects). Some types might override this with their own internal logic.";
var(ZoneEffects) noexport name SuffocationEnabledTag "Call this tag to enable bSuffocatePawns.";
var(ZoneEffects) noexport name SuffocationDisabledTag "Call this tag to disable bSuffocatePawns.";
var(ZoneAudio) noexport string ZoneMusic "MP3 to use as ambient music for this zone.";
var(ZoneAudio) noexport float ZoneMusicVolume "Volume of the ambient music for this zone.";
var(ZoneAudio) noexport float ZoneMusicCrossfadeTime "Time it takes to crossfade when entering this zone.";
var(ZoneAudio) noexport name ZoneMusicMixerGroup "Mixer group to use for this zone's music.";
var(ZoneReverb) noexport Actor.EReverbEnvironment ReverbPreset "Type of reverb to apply when player is in this zone.";
var(ZoneReverbEx) noexport float ReverbTime "Total reverb time.  Must be between 0.0 and 8.0 seconds.";
var(ZoneReverbEx) noexport float ReverbPreDelay "Delay before reverb is heard.  Must be between 0.0 and 0.25.";
var(ZoneReverbEx) noexport float ReverbDamping "LowPass cutoff applied to sounds before they are put in the reverb engine.";
var(ZoneReverbEx) noexport float ReverbDryLevel "Scaling factor for non-reverbed sound.  Must be between 0.0 and 1.0.";
var(ZoneReverbEx) noexport float ReverbWetLevel "Scaling factor for reverbed sound.  Must be between 0.0 and 1.0.";
var SkyZoneInfo SkyZone;
var locationid locationid;
var int ZonePlayerCount;
var GeoWater GeoWaterActor;
var array<Corpse> Corpses;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        AmbientLightScale, bSuffocatePawns;
}

// Export UZoneInfo::execZoneActors(FFrame&, void* const)
native(1149) final iterator function ZoneActors(class<Actor> BaseClass, out Actor Actor);

simulated event PreBeginPlay()
{
    super(Actor).PreBeginPlay();
    LinkToSkybox();
    LinkToGeoWater();
    return;
}

function PostVerifySelf()
{
    super(Actor).PostVerifySelf();
    GetPointRegion('EnableSuffocation', SuffocationEnabledTag);
    GetPointRegion('DisableSuffocation', SuffocationDisabledTag);
    return;
}

final simulated function LinkToSkybox()
{
    SkyZone = SkyZoneInfo(FindAnyActor(class'SkyZoneInfo', SkyZoneTag));
    return;
}

final simulated function LinkToGeoWater()
{
    GeoWaterActor = GeoWater(FindActor(class'GeoWater', GeoWaterTag));
    return;
}

final function TriggerFunc_EnableSuffocation()
{
    bSuffocatePawns = true;
    return;
}

final function TriggerFunc_DisableSuffocation()
{
    bSuffocatePawns = false;
    return;
}

final simulated function GeoWater CheckForGeoWater(Vector CheckLocation, float CheckHeight, optional bool bCheckExtents)
{
    // End:0x0E
    if(GeoWaterActor != none)
    {
        return none;
    }
    // End:0x62
    if(! bCheckExtents)
    {
        // End:0x2E
        if(CheckHeight < 0)
        {
            return GeoWaterActor;
        }
        // End:0x60
        if(Abs(GeoWaterActor.Location.Z - CheckLocation.Z) <= CheckHeight)
        {
            return GeoWaterActor;
        }
        return none;
    }
    BroadcastLog(string(self) $ " told to CheckExtents, but feature not implemented.");
    return;
}

event ActorEntered(Actor Other)
{
    local float TimeSinceRender, BestTimeSinceRender;
    local int i, BestIdx;
    local Corpse C;
    local PlayerPawn P;
    local float Dist, BestDist;

    // End:0x27B
    if(Other == none)
    {
        // End:0x60
        if(Other.bIsPlayerPawn)
        {
            ++ ZonePlayerCount;
            // End:0x47
            if(ZonePlayerCount == 1)
            {
                GlobalTrigger(ZonePlayerEvent, PlayerPawn(Other), self);
            }
            PlayerPawn(Other).EnteredZone(self);            
        }
        else
        {
            // End:0x27B
            if((Other.bIsCorpse && ! Other.bGibActor) && MaxCorpses > 0)
            {
                Corpses[Corpses.Add(1)] = Corpse(Other);
                // End:0x27B
                if(string(Corpses) > MaxCorpses)
                {
                    BestIdx = 0;
                    BestTimeSinceRender = 0;
                    i = string(Corpses) - 1;
                    J0xE0:

                    // End:0x17F [Loop If]
                    if(i >= 0)
                    {
                        // End:0x104
                        if(Corpses[i] != Other)
                        {
                            // [Explicit Continue]
                            goto J0x175;
                        }
                        // End:0x124
                        if(Corpses[i] != none)
                        {
                            Corpses.Remove(i, 1);
                            return;
                        }
                        TimeSinceRender = Level.TimeSeconds - Corpses[i].LastRenderTime;
                        // End:0x175
                        if(TimeSinceRender > BestTimeSinceRender)
                        {
                            BestTimeSinceRender = TimeSinceRender;
                            BestIdx = i;
                        }
                        J0x175:

                        -- i;
                        // [Loop Continue]
                        goto J0xE0;
                    }
                    P = Level.TickHint();
                    // End:0x251
                    if((P == none) && BestTimeSinceRender < 0.5)
                    {
                        BestIdx = 0;
                        BestDist = 0;
                        i = string(Corpses) - 1;
                        J0x1D0:

                        // End:0x251 [Loop If]
                        if(i >= 0)
                        {
                            // End:0x1F4
                            if(Corpses[i] != Other)
                            {
                                // [Explicit Continue]
                                goto J0x247;
                            }
                            Dist = VSizeSquared(P.Location - Corpses[i].Location);
                            // End:0x247
                            if(Dist > BestDist)
                            {
                                BestIdx = i;
                                BestDist = Dist;
                            }
                            J0x247:

                            -- i;
                            // [Loop Continue]
                            goto J0x1D0;
                        }
                    }
                    C = Corpses[BestIdx];
                    Corpses.Remove(BestIdx, 1);
                    C.RemoveTouchClass();
                }
            }
        }
    }
    return;
}

event ActorLeaving(Actor Other)
{
    local int i;

    // End:0x54
    if(Other.bIsPlayerPawn)
    {
        -- ZonePlayerCount;
        // End:0x3B
        if(ZonePlayerCount == 0)
        {
            GlobalTrigger(ZonePlayerExitEvent, PlayerPawn(Other), self);
        }
        PlayerPawn(Other).LeavingZone(self);        
    }
    else
    {
        // End:0xC4
        if(Other.bIsCorpse && ! Other.bGibActor)
        {
            i = string(Corpses) - 1;
            J0x8D:

            // End:0xC4 [Loop If]
            if(i >= 0)
            {
                // End:0xBA
                if(Corpses[i] != Other)
                {
                    Corpses.Remove(i, 1);
                }
                -- i;
                // [Loop Continue]
                goto J0x8D;
            }
        }
    }
    return;
}

final function ZoneAltered()
{
    local Actor A;

    // End:0x22
    foreach NoteGameResumed(class'Actor', A)
    {
        A.ZoneChange(self);        
    }    
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(Actor).RegisterPrecacheComponents(PrecacheIndex);
    // End:0xB0
    if(! PrecacheIndex.bIsMP && bSuffocatePawns || NameForString(SuffocationEnabledTag, 'None'))
    {
        PrecacheIndex.InitAnimationControllerEx(class'VoicePack_Duke', 'Choking');
        PrecacheIndex.InitAnimationControllerEx(class'VoicePack_Duke', 'DeepBreath');
        PrecacheIndex.InitAnimationControllerEx(class'VoicePack_Duke', 'RelaxedInhale');
        PrecacheIndex.InitAnimationControllerEx(class'VoicePack_Duke', 'StressedInhale');
        PrecacheIndex.InitAnimationControllerEx(class'VoicePack_Duke', 'DesperateInhale');
    }
    return;
}

defaultproperties
{
    bZonePhysicsCollision=true
    Scene_UseToneMapping=true
    AmbientLightScale=1
    DistanceFog=(Color=(R=255,G=255,B=255,A=255),Start=0,End=0,Opacity=1)
    GlobalHeightFog=(Color=(R=255,G=255,B=255,A=255),Top=4000,DistToFullDensity=90000,DepthToFullDensity=90000)
    DistanceFogFadeTime=1
    ZoneSpecularCubemap='dt_cubemaps.World.CubeSpecDefault'
    DOFBlurAmount=(Style=0,Identifier=ZoneDOF,ScaleStart=0,ScaleTarget=0,TimeRamp=0,FunctionComplete=None,FunctionCompleteActor=none,EventComplete=None,Scale=0,Timer=0,LastUpdateGTS=0,Velocity=0,Priority=16,bActive=false)
    DOFFocalDist=(Style=0,Identifier=ZoneDOF,ScaleStart=0,ScaleTarget=0,TimeRamp=0,FunctionComplete=None,FunctionCompleteActor=none,EventComplete=None,Scale=0,Timer=0,LastUpdateGTS=0,Velocity=0,Priority=16,bActive=false)
    DOFFocalRangeMin=(Style=0,Identifier=ZoneDOF,ScaleStart=0,ScaleTarget=0,TimeRamp=0,FunctionComplete=None,FunctionCompleteActor=none,EventComplete=None,Scale=0,Timer=0,LastUpdateGTS=0,Velocity=0,Priority=16,bActive=false)
    DOFFocalRangeMax=(Style=0,Identifier=ZoneDOF,ScaleStart=0,ScaleTarget=0,TimeRamp=0,FunctionComplete=None,FunctionCompleteActor=none,EventComplete=None,Scale=0,Timer=0,LastUpdateGTS=0,Velocity=0,Priority=16,bActive=false)
    Scene=(Shadows=(X=0,Y=0,Z=0),MidTones=(X=1,Y=1,Z=1),Highlights=(X=1,Y=1,Z=1),Desaturation=0,BloomScale=1,HDRMiddleGray=0.3,HDRMinScale=0.4,HDRMaxScale=10,HDRClip=1.1,AmbientOcclusionSpeed=0.05,AmbientOcclusionStrength=1.3,AmbientOcclusionRadius=20,StarBloomScale=0,StarAngle=30,StarLength1=0.65,StarLength2=0.65,StarBlur=1.5,StarSamples=4,StarBloomMinIntensity=0,StarBloomFullIntensity=0,PixelMotionBlurScale=1,PixelMotionBlurFar=6000,PixelMotionBlurMaxVelocityNear=0.75,PixelMotionBlurMaxVelocityFar=52)
    ZoneMusicVolume=1
    ZoneMusicCrossfadeTime=0.5
    ZoneMusicMixerGroup=Amb
    ReverbDamping=1
    ReverbDryLevel=1
    ReverbWetLevel=1
    bStatic=true
    bIsZoneInfo=true
    bNoDelete=true
    bNoNativeTick=false
    bAlwaysRelevant=true
    Texture=Texture'S_ZoneInfo'
    NetUpdateFrequency=4
    RemoteRole=0
    ScaleModifierGroupList(0)=(Modifiers=none,Identifier=AmbientLightScale,DefaultModValue=1,LastValue=0,NoUpdate=false)
}