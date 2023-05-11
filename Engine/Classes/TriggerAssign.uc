/*******************************************************************************
 * TriggerAssign generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerAssign extends Triggers
    collapsecategories
    notplaceable
    hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound,Collision,Interpolation,movement);

var(Events) noexport deprecated array<name> AltEvents "Other actors with different Tags to perform the Assign on.";
var(AssignEvents) noexport bool AssignNewEvent "(TriggerAssign-specific)";
var(AssignEvents) noexport name NewNewEvent "(TriggerAssign-specific)";
var(AssignEvents) noexport bool AssignNewTag "(TriggerAssign-specific)";
var(AssignEvents) noexport name NewNewTag "(TriggerAssign-specific)";
var(AssignEvents) noexport bool AssignResponsible "Apply these assignments to the actor responsible for triggering us.";
var(AssignEvents) noexport bool AssignInstigator "Apply these assignments to the pawn who instigated the triggering of us.";
var(AssignEvents) bool AssignEvent;
var(AssignEvents) name NewEvent;
var(AssignEvents) bool AssignTag;
var(AssignEvents) name NewTag;
var(AssignInteractivity) noexport bool AssignbDrawHUDInfo "(InteractiveActor-specific)";
var(AssignInteractivity) noexport bool NewbDrawHUDInfo "(InteractiveActor-specific)";
var(AssignInteractivity) noexport bool AssignbUseTriggered "(InteractiveActor-specific)";
var(AssignInteractivity) noexport bool NewbUseTriggered "(InteractiveActor-specific)";
var(AssignInteractivity) noexport bool AssignUsePhrase "(InteractiveActor-specific)";
var(AssignInteractivity) noexport localized string NewUsePhrase "(InteractiveActor-specific)";
var(AssignInteractivity) noexport bool AssignbNoUseKeyInfo "(InteractiveActor-specific)";
var(AssignInteractivity) noexport bool NewbNoUseKeyInfo "(InteractiveActor-specific)";
var(AssignInteractivity) noexport Object.EBitModifier bUsableModifier "(InteractiveActor-specific) How to modify bUsable.";
var(AssignInteractivity) noexport Object.EBitModifier bTelekineticableModifier "(InteractiveActor-specific) How to modify bTelekineticable.";
var(AssignInteractivity) noexport Object.EBitModifier bGrabbableModifier "(InteractiveActor-specific) How to modify bGrabbable.";
var(AssignInterpolation) noexport Object.EBitModifier AssignbNoInterpolationRotPitch "How to modify the ability to interpolate along the Pitch.";
var(AssignInterpolation) noexport Object.EBitModifier AssignbNoInterpolationRotYaw "How to modify the ability to interpolate along the Yaw.";
var(AssignInterpolation) noexport Object.EBitModifier AssignbNoInterpolationRotRoll "How to modify the ability to interpolate along the Roll.";
var(AssignInterpolation) noexport Object.EBitModifier AssignbNoInterpolationLocX "How to modify the ability to interpolate along the Location along the X axis.";
var(AssignInterpolation) noexport Object.EBitModifier AssignbNoInterpolationLocY "How to modify the ability to interpolate along the Location along the Y axis.";
var(AssignInterpolation) noexport Object.EBitModifier AssignbNoInterpolationLocZ "How to modify the ability to interpolate along the Location along the Z axis.";
var(AssignInterpolation) noexport bool AssignPhysRate "Modify the rate of this object when moving.";
var(AssignInterpolation) noexport float NewPhysRate "(Actor-specific)";
var(AssignInterpolation) noexport name StartingInterpolationPoint "If != None, actor will path attach to a path starting at the interpolation point with this tag.";
var(AssignCollision) bool AssignNewCollisionRadius;
var(AssignCollision) float NewCollisionRadius;
var(AssignCollision) bool AssignNewCollisionHeight;
var(AssignCollision) float NewCollisionHeight;
var(AssignCollision) bool AssignNewCollision;
var(AssignCollision) bool NewCollideActors;
var(AssignCollision) bool NewCollideWorld;
var(AssignCollision) bool NewBlockKarma;
var(AssignCollision) bool NewBlockActors;
var(AssignCollision) bool NewBlockPlayers;
var(AssignCollision) bool AssignNewTraceUsable;
var(AssignCollision) bool NewTraceUsable;
var(AssignCollision) Object.EBitModifier bTraceShootableModifier;
var(AssignCollision) Object.EBitModifier bCollisionAssumeValidModifier;
var(AssignCollision) bool AssignNewTraceFireHitResponse;
var(AssignCollision) Actor.ETraceFireHitResponse NewTraceFireHitResponse;
var(AssignMovement) noexport bool bDisableDesiredLocation "If true, desired location will be disabled before the rest of the TriggerAssign is processed.";
var(AssignMovement) noexport bool bDisableFixedRotationRate "If true, fixed rotation rate will be disabled before the rest of the TriggerAssign is processed.";
var(AssignMovement) noexport bool bDisableDesiredRotation "If true, all desired rotation will be stopped before the rest of the TriggerAssign is processed.";
var(AssignMovement) noexport bool bDisableDesiredRotationPitch "If true, pitch desired rotation will be stopped before the rest of the TriggerAssign is processed.";
var(AssignMovement) noexport bool bDisableDesiredRotationYaw "If true, yaw desired rotation will be stopped before the rest of the TriggerAssign is processed.";
var(AssignMovement) noexport bool bDisableDesiredRotationRoll "If true, roll desired rotation will be stopped before the rest of the TriggerAssign is processed.";
var(AssignMovement) bool AssignNewAcceleration;
var(AssignMovement) Vector NewAcceleration;
var(AssignMovement) bool AssignNewPhysics;
var(AssignMovement) Object.EPhysics NewPhysics;
var(AssignMovement) bool AssignNewRotationRate;
var(AssignMovement) Rotator NewRotationRate;
var(AssignMovement) float NewRotationRateChangeTime;
var(AssignMovement) bool AssignVelocity;
var(AssignMovement) Vector NewVelocity;
var(AssignMovement) noexport Object.EVectModifier NewLocationMod "How to modify the location of the specified actors.";
var(AssignMovement) noexport bool NewLocationUseMyLoc "When this is true, then set the actors to my specific location instantly.";
var(AssignMovement) noexport bool NewRotationUseMyRot "When this is true, then set the actors to my specific rotation instantly.";
var(AssignMovement) noexport Vector NewLocation "Instantly place the actor at the specified location.";
var(AssignMovement) noexport Object.EFloatModifier NewMassModifier "How to apply NewMass";
var(AssignMovement) float NewMass;
var(AssignDisplay) noexport bool bAssignDisplayToggle "When triggered repeatedly, should this trigger switch between two different display settings?";
var bool bLastAssigned;
var(AssignDisplay) bool AssignNewMesh;
var(AssignDisplay) Mesh NewMesh;
var(AssignDisplay) Mesh NewMeshAlt;
var(AssignDisplay) bool AssignNewStaticMesh;
var(AssignDisplay) StaticMesh NewStaticMesh;
var(AssignDisplay) StaticMesh NewStaticMeshAlt;
var(AssignDisplay) bool AssignbUnlit;
var(AssignDisplay) bool NewbUnlit;
var(AssignDisplay) bool NewbUnlitAlt;
var(AssignDisplay) bool AssignNewDrawScale;
var(AssignDisplay) float NewDrawscale;
var(AssignDisplay) float NewDrawScaleAlt;
var(AssignDisplay) bool AssignNewStyle;
var(AssignDisplay) Object.ERenderStyle NewStyle;
var(AssignDisplay) Object.ERenderStyle NewStyleAlt;
var(AssignDisplay) bool AssignDumbMesh;
var(AssignDisplay) bool NewDumbMesh;
var(AssignDisplay) bool NewDumbMeshAlt;
var(AssignDisplay) bool AssignNewSkins;
var(AssignDisplay) array<SUpdateMaterialEx> NewSkins;
var(AssignDisplay) array<SUpdateMaterialEx> NewSkinsAlt;
var(AssignDisplay) bool AssignNewCameraActor;
var(AssignDisplay) deprecated Actor NewCameraActor;
var(AssignDisplay) Object.EFloatModifier NewCameraFOVMod;
var(AssignDisplay) float NewCameraFOV;
var(AssignDisplay) bool AssignNewMirrorRenderTarget;
var(AssignDisplay) RenderTarget NewMirrorRenderTarget;
var(AssignDisplay) Vector NewMirrorNormal;
var(AssignDisplay) Object.EVectModifier NewMirrorNormalMod;
var(AssignDisplay) Object.EBitModifier bAlwaysVisibleModifier;
var(AssignDisplay) Object.EBitModifier bDontReflectModifier;
var(AssignDisplay) Object.EBitModifier bCastStencilShadowsModifier;
var(AssignDisplay) Object.EBitModifier bForceSmoothShadowUpdatesModifier;
var(AssignDisplay) Object.EBitModifier bDoOverlayEffectModifier;
var(AssignDisplay) Object.EBitModifier bOverlayEffectUsedAsHintModifier;
var(AssignDisplay) bool AssignOverlayEffectAlpha;
var(AssignDisplay) float NewOverlayEffectAlpha;
var(AssignDisplay) float OverlayEffectAlphaTransitionTime;
var(AssignDisplay) noexport array<SActorColor> ActorColorAssigns "List of ActorColor settings to add.";
var(AssignDisplay) noexport array<name> ActorColorRemoves "List of ActorColor id's to remove.";
var(AssignSound) bool AssignSoundOcclusionScale;
var(AssignSound) noexport float NewSoundOcclusionScale "Scale the volume of ambient sounds, normal sounds, and ambient music by this when occluded.";
var(AssignSound) bool AssignSoundRadius;
var(AssignSound) bool AssignSoundInnerRadius;
var(AssignSound) bool AssignSoundVolume;
var(AssignSound) bool AssignSoundPitch;
var(AssignSound) noexport int NewSoundRadius "Radius of the ambient sound.";
var(AssignSound) noexport int NewSoundInnerRadius "Radius at which ambient sound volume will start falling off.";
var(AssignSound) noexport byte NewSoundVolume "Volume of the ambient sound.";
var(AssignSound) noexport byte NewSoundPitch "Pitch shift of the ambient sound. 64=No Shift";
var(AssignSound) bool AssignAmbientMusicVolume;
var(AssignSound) bool AssignAmbientMusicStartTime;
var(AssignSound) bool AssignAmbientMusicEarlyEndTime;
var(AssignSound) bool AssignAmbientMusicInnerRadius;
var(AssignSound) bool AssignAmbientMusicRadius;
var(AssignSound) bool AssignAmbientMusicCrossfadeTime;
var(AssignSound) noexport float NewAmbientMusicVolume "Value from 0.0 - 1.0 that defines the full volume of the AmbientMusic.";
var(AssignSound) noexport float NewAmbientMusicStartTime "Time in seconds from start of the stream that the stream will actually begin.";
var(AssignSound) noexport float NewAmbientMusicEarlyEndTime "Time in seconds before the end of the stream that the sound system will call AmbientMusicEarlyEnd.";
var(AssignSound) noexport float NewAmbientMusicInnerRadius "See SoundInnerRadius.";
var(AssignSound) noexport float NewAmbientMusicRadius "Maximum distance from actor that music will be audible.";
var(AssignSound) noexport float NewAmbientMusicCrossfadeTime "Time in seconds to crossfade between songs (when AmbientMusic changes).";
var(AssignSound) bool AssignTransientSoundVolume;
var(AssignSound) bool AssignTransientSoundRadius;
var(AssignSound) bool AssignTransientSoundInnerRadius;
var(AssignSound) bool AssignTransientSoundPitch;
var(AssignSound) float NewTransientSoundVolume;
var(AssignSound) float NewTransientSoundRadius;
var(AssignSound) float NewTransientSoundInnerRadius;
var(AssignSound) float NewTransientSoundPitch;
var(AssignSound) class<CharacterVoicePack> NewVoicePack;
var(AssignSound) bool AssignAmbientMusicEnableVis;
var(AssignSound) bool AssignbOccludeSounds;
var(AssignSound) bool AssignSoundScaled;
var(AssignSound) bool AssignSoundNoOcclude;
var(AssignSound) bool AssignSoundNoDoppler;
var(AssignSound) bool AssignTransientSoundNoOcclude;
var(AssignSound) bool AssignTransientSoundScaled;
var(AssignSound) noexport bool AssignNewVoicePack "When true, will assign NewVoicePack.";
var(AssignSound) noexport bool NewAmbientMusicEnableVis "When true, visualization calculations will be enabled for the AmbientMusic";
var(AssignSound) noexport bool NewbOccludeSounds "Occlude sounds played by other actors (If this is false, it will never occlude... however if true, other things can prevent it from still not blocking).";
var(AssignSound) noexport bool NewSoundScaled "If true, scale ambient sounds being played.";
var(AssignSound) noexport bool NewSoundNoOcclude "If true, don't occlude the ambient played through this actor.  This applies to ambient sound and music.";
var(AssignSound) noexport bool NewSoundNoDoppler "If true, don't doppler the ambient sound.";
var(AssignSound) noexport bool NewTransientSoundNoOcclude "If true, don't occlude any sounds played.";
var(AssignSound) noexport bool NewTransientSoundScaled "If true, scale sounds being played.";
var(AssignSound) noexport Object.EBitModifier TransientSoundNoDopplerModifier "How to modify TransientSoundNoDoppler.";
var(AssignTicking) noexport bool bUseClassTickingDefaults "Use the default of the class that we're TriggerAssigning?";
var(AssignTicking) noexport bool AssignTickStyle "Whether to assign the specified TickStyle or not.";
var(AssignTicking) noexport Object.ETickStyle NewTickStyle "TickStyle to apply to the actor.";
var(AssignTicking) noexport Object.EBitModifier bNoNativeTickModifier "Modify the bNoNativeTick flag in this manner.";
var(AssignTicking) noexport Object.EBitModifier bTickOnlyNearbyModifier "How to modify bTickOnlyNearby.";
var(AssignTicking) noexport Object.EBitModifier bTickOnlyRecentModifier "How to modify bTickOnlyRecent.";
var(AssignTicking) noexport Object.EBitModifier bTickOnlyZoneRecentModifier "How to modify bTickOnlyZoneRecent.";
var(AssignTicking) noexport Object.EFloatModifier TickSelfRecentTimeModifier "How to modify TickSelfRecentTime.";
var(AssignTicking) noexport Object.EFloatModifier TickZoneRecentTimeModifier "How to modify TickZoneRecentTime.";
var(AssignTicking) noexport Object.EFloatModifier TickNearbyRadiusModifier "How to modify TickNearbyRadius.";
var(AssignTicking) noexport float NewTickSelfRecentTime "..";
var(AssignTicking) noexport float NewTickZoneRecentTime "..";
var(AssignTicking) noexport float NewTickNearbyRadius "..";
var(AssignBList) bool AssignbIgnoreBList;
var(AssignBList) bool NewbIgnoreBList;
var(AssignBList) noexport bool AssignVisibilityRadius "(RenderActor-specific)";
var(AssignBList) noexport float NewVisibilityRadius "(RenderActor-specific)";
var(AssignHealth) noexport Object.EBitModifier AssignbNoDamage "(RenderActor-specific)";
var(AssignHealth) noexport Object.EIntModifier NewHealthMod "(RenderActor-specific)";
var(AssignHealth) noexport int NewHealth "(RenderActor-specific)";
var(AssignHealth) noexport Object.EIntModifier NewHealthCapMod "(RenderActor-specific)";
var(AssignHealth) noexport int NewHealthCap "(RenderActor-specific)";
var(AssignHealth) noexport Object.EIntModifier NewHealthMinMod "(RenderActor-specific)";
var(AssignHealth) noexport int NewHealthMin "(RenderActor-specific)";

event Trigger(Actor Other, Pawn EventInstigator)
{
    local Actor A;
    local int i;

    super(Actor).Trigger(Other, EventInstigator);
    // End:0x32
    if(AssignResponsible && Other == none)
    {
        DoAssign(Other);
    }
    // End:0x54
    if(AssignInstigator && EventInstigator == none)
    {
        DoAssign(EventInstigator);
    }
    // End:0x86
    if(NameForString(Event, 'None'))
    {
        // End:0x85
        foreach RotateVectorAroundAxis(class'Actor', A, Event)
        {
            DoAssign(A);            
        }        
    }
    // End:0xF4
    if(string(AltEvents) > 0)
    {
        i = string(AltEvents) - 1;
        J0xA1:

        // End:0xF4 [Loop If]
        if(i >= 0)
        {
            // End:0xEA
            if(NameForString(AltEvents[i], 'None'))
            {
                // End:0xE9
                foreach RotateVectorAroundAxis(class'Actor', A, AltEvents[i])
                {
                    DoAssign(A);                    
                }                
            }
            -- i;
            // [Loop Continue]
            goto J0xA1;
        }
    }
    // End:0x10C
    if(bAssignDisplayToggle)
    {
        bLastAssigned = ! bLastAssigned;
    }
    return;
}

function DoAssign(Actor A)
{
    local RenderActor RA;
    local InteractiveActor IA;
    local TriggerAssign TA;
    local int i;
    local bool bTemp;

    // End:0x16
    if(bDisableDesiredLocation)
    {
        A.SetDesiredRotation_Roll();
    }
    // End:0x2C
    if(bDisableFixedRotationRate)
    {
        A.CreateDesiredRotation_Pitch();
    }
    // End:0x42
    if(bDisableDesiredRotation)
    {
        A.FinishInterpolation();
    }
    // End:0x58
    if(bDisableDesiredRotationPitch)
    {
        A.Markers_AddPoint();
    }
    // End:0x6E
    if(bDisableDesiredRotationYaw)
    {
        A.Markers_AddDiamond();
    }
    // End:0x84
    if(bDisableDesiredRotationRoll)
    {
        A.Markers_AddArrow();
    }
    // End:0xA2
    if(AssignEvent)
    {
        A.Event = NewEvent;
    }
    // End:0xBD
    if(AssignTag)
    {
        A.GetAnimationStart(NewTag);
    }
    // End:0xDB
    if(AssignVelocity)
    {
        A.Velocity = NewVelocity;
    }
    // End:0xF9
    if(AssignNewAcceleration)
    {
        A.Acceleration = NewAcceleration;
    }
    // End:0x12D
    if(AssignNewCollision)
    {
        A.ForceMountUpdate(NewCollideActors, NewBlockActors, NewBlockPlayers, NewBlockKarma, NewCollideWorld);
    }
    // End:0x148
    if(AssignNewPhysics)
    {
        A.SetRotation(NewPhysics);
    }
    // End:0x168
    if(AssignNewTraceUsable)
    {
        A.bTraceUsable = NewTraceUsable;
    }
    // End:0x192
    if(AssignNewCollisionRadius)
    {
        A.IsMountedTo(NewCollisionRadius, A.CollisionHeight);
    }
    // End:0x1BC
    if(AssignNewCollisionHeight)
    {
        A.IsMountedTo(A.CollisionRadius, NewCollisionHeight);
    }
    // End:0x1DC
    if(AssignbIgnoreBList)
    {
        A.bIgnoreBList = NewbIgnoreBList;
    }
    // End:0x1FC
    if(AssignNewRotationRate)
    {
        A.CreateDesiredRotation(NewRotationRate, NewRotationRateChangeTime);
    }
    // End:0x21A
    if(NewLocationUseMyLoc)
    {
        A.SetDesiredRotation(Location);        
    }
    else
    {
        // End:0x251
        if(int(NewLocationMod) != int(0))
        {
            A.SetDesiredRotation(HandleRotModifier(NewLocationMod, A.Location, NewLocation));
        }
    }
    // End:0x26C
    if(NewRotationUseMyRot)
    {
        A.DisableDesiredRotation_Roll(Rotation);
    }
    A.DisableDesiredLocation(HandleVectModifier(NewMassModifier, A.Mass, NewMass));
    A.bTraceShootable = HandleIntModifier(bTraceShootableModifier, A.bTraceShootable);
    A.bCollisionAssumeValid = HandleIntModifier(bCollisionAssumeValidModifier, A.bCollisionAssumeValid);
    // End:0x305
    if(AssignNewTraceFireHitResponse)
    {
        A.TraceFireHitResponse = NewTraceFireHitResponse;
    }
    // End:0x34D
    if(AssignNewMesh)
    {
        // End:0x33B
        if(! bAssignDisplayToggle || ! bLastAssigned)
        {
            A.GetOverlayEffectAlpha(NewMesh);            
        }
        else
        {
            A.GetOverlayEffectAlpha(NewMeshAlt);
        }
    }
    // End:0x395
    if(AssignNewStaticMesh)
    {
        // End:0x383
        if(! bAssignDisplayToggle || ! bLastAssigned)
        {
            A.GetOverlayEffectAlpha(NewStaticMesh);            
        }
        else
        {
            A.GetOverlayEffectAlpha(NewStaticMeshAlt);
        }
    }
    // End:0x3E7
    if(AssignbUnlit)
    {
        // End:0x3D0
        if(! bAssignDisplayToggle || ! bLastAssigned)
        {
            A.bUnlit = NewbUnlit;            
        }
        else
        {
            A.bUnlit = NewbUnlitAlt;
        }
    }
    // End:0x439
    if(AssignDumbMesh)
    {
        // End:0x422
        if(! bAssignDisplayToggle || ! bLastAssigned)
        {
            A.bDumbMesh = NewDumbMesh;            
        }
        else
        {
            A.bDumbMesh = NewDumbMeshAlt;
        }
    }
    // End:0x481
    if(AssignNewDrawScale)
    {
        // End:0x46F
        if(! bAssignDisplayToggle || ! bLastAssigned)
        {
            A.RemoveActorColor(NewDrawscale);            
        }
        else
        {
            A.RemoveActorColor(NewDrawScaleAlt);
        }
    }
    // End:0x4CF
    if(AssignNewStyle)
    {
        // End:0x4BA
        if(! bAssignDisplayToggle || ! bLastAssigned)
        {
            A.Style = NewStyle;            
        }
        else
        {
            A.Style = NewStyleAlt;
        }
    }
    i = 0;
    J0x4D6:

    // End:0x508 [Loop If]
    if(i < string(ActorColorRemoves))
    {
        A.CopyTimers(ActorColorRemoves[i]);
        ++ i;
        // [Loop Continue]
        goto J0x4D6;
    }
    i = 0;
    J0x50F:

    // End:0x541 [Loop If]
    if(i < string(ActorColorAssigns))
    {
        A.FinishSlottedSound(ActorColorAssigns[i]);
        ++ i;
        // [Loop Continue]
        goto J0x50F;
    }
    // End:0x55F
    if(AssignNewCameraActor)
    {
        A.CameraActor = NewCameraActor;
    }
    A.CameraFOV = HandleVectModifier(NewCameraFOVMod, A.CameraFOV, NewCameraFOV);
    // End:0x5A9
    if(AssignNewMirrorRenderTarget)
    {
        A.MirrorRenderTarget = NewMirrorRenderTarget;
    }
    A.MirrorNormal = HandleRotModifier(NewMirrorNormalMod, A.MirrorNormal, NewMirrorNormal);
    A.bAlwaysVisible = HandleIntModifier(bAlwaysVisibleModifier, A.bAlwaysVisible);
    A.bCastStencilShadows = HandleIntModifier(bCastStencilShadowsModifier, A.bCastStencilShadows);
    A.bForceSmoothShadowUpdates = HandleIntModifier(bForceSmoothShadowUpdatesModifier, A.bForceSmoothShadowUpdates);
    A.bDontReflect = HandleIntModifier(bDontReflectModifier, A.bDontReflect);
    A.bDoOverlayEffect = HandleIntModifier(bDoOverlayEffectModifier, A.bDoOverlayEffect);
    A.bOverlayEffectUsedAsHint = HandleIntModifier(bOverlayEffectUsedAsHintModifier, A.bOverlayEffectUsedAsHint);
    // End:0x6EE
    if(AssignOverlayEffectAlpha)
    {
        A.FadeOverlayEffect(NewOverlayEffectAlpha, OverlayEffectAlphaTransitionTime);
    }
    A.bNoInterpolationRotPitch = HandleIntModifier(AssignbNoInterpolationRotPitch, A.bNoInterpolationRotPitch);
    A.bNoInterpolationRotYaw = HandleIntModifier(AssignbNoInterpolationRotYaw, A.bNoInterpolationRotYaw);
    A.bNoInterpolationRotRoll = HandleIntModifier(AssignbNoInterpolationRotRoll, A.bNoInterpolationRotRoll);
    A.bNoInterpolationLocX = HandleIntModifier(AssignbNoInterpolationLocX, A.bNoInterpolationLocX);
    A.bNoInterpolationLocY = HandleIntModifier(AssignbNoInterpolationLocY, A.bNoInterpolationLocY);
    A.bNoInterpolationLocZ = HandleIntModifier(AssignbNoInterpolationLocZ, A.bNoInterpolationLocZ);
    // End:0x802
    if(AssignPhysRate)
    {
        A.PhysRate = NewPhysRate;
    }
    // End:0x828
    if(NameForString(StartingInterpolationPoint, 'None'))
    {
        A.AttachToPath(StartingInterpolationPoint, true);
    }
    // End:0x934
    if(bUseClassTickingDefaults)
    {
        A.TickStyle = A.default.TickStyle;
        A.bNoNativeTick = A.default.bNoNativeTick;
        A.bTickOnlyNearby = A.default.bTickOnlyNearby;
        A.bTickOnlyRecent = A.default.bTickOnlyRecent;
        A.bTickOnlyZoneRecent = A.default.bTickOnlyZoneRecent;
        A.TickSelfRecentTime = A.default.TickSelfRecentTime;
        A.TickZoneRecentTime = A.default.TickZoneRecentTime;
        A.TickNearbyRadius = A.default.TickNearbyRadius;        
    }
    else
    {
        // End:0x952
        if(AssignTickStyle)
        {
            A.TickStyle = NewTickStyle;
        }
        A.bNoNativeTick = HandleIntModifier(bNoNativeTickModifier, A.bNoNativeTick);
        A.bTickOnlyNearby = HandleIntModifier(bTickOnlyNearbyModifier, A.bTickOnlyNearby);
        A.bTickOnlyRecent = HandleIntModifier(bTickOnlyRecentModifier, A.bTickOnlyRecent);
        A.bTickOnlyZoneRecent = HandleIntModifier(bTickOnlyZoneRecentModifier, A.bTickOnlyZoneRecent);
        A.TickSelfRecentTime = HandleVectModifier(TickSelfRecentTimeModifier, A.TickSelfRecentTime, NewTickSelfRecentTime);
        A.TickZoneRecentTime = HandleVectModifier(TickZoneRecentTimeModifier, A.TickZoneRecentTime, NewTickZoneRecentTime);
        A.TickNearbyRadius = HandleVectModifier(TickNearbyRadiusModifier, A.TickNearbyRadius, NewTickNearbyRadius);
    }
    // End:0xB40
    if(AssignNewSkins)
    {
        // End:0xAEF
        if(! bAssignDisplayToggle || ! bLastAssigned)
        {
            i = string(NewSkins) - 1;
            J0xAAA:

            // End:0xAEC [Loop If]
            if(i >= 0)
            {
                A.VisibleActors(NewSkins[i].Index, NewSkins[i].NewMaterialEx);
                -- i;
                // [Loop Continue]
                goto J0xAAA;
            }            
        }
        else
        {
            i = string(NewSkins) - 1;
            J0xAFE:

            // End:0xB40 [Loop If]
            if(i >= 0)
            {
                A.VisibleActors(NewSkinsAlt[i].Index, NewSkinsAlt[i].NewMaterialEx);
                -- i;
                // [Loop Continue]
                goto J0xAFE;
            }
        }
    }
    TA = TriggerAssign(A);
    // End:0xB98
    if(TA == none)
    {
        // End:0xB7A
        if(AssignNewEvent)
        {
            TA.NewEvent = NewNewEvent;
        }
        // End:0xB98
        if(AssignNewTag)
        {
            TA.NewTag = NewNewTag;
        }
    }
    // End:0xC8B
    if(A.bIsRenderActor)
    {
        RA = RenderActor(A);
        // End:0xBD9
        if(AssignVisibilityRadius)
        {
            RA.VisibilityRadius = NewVisibilityRadius;
        }
        RA.bNoDamage = HandleIntModifier(AssignbNoDamage, RA.bNoDamage);
        RA.SetHealthCap(float(HandleFloatModifier(NewHealthCapMod, int(RA.GetHealthCap()), NewHealthCap)));
        RA.SetHealthMin(float(HandleFloatModifier(NewHealthMinMod, int(RA.GetHealthMin()), NewHealthMin)));
        RA.EnableIKSystem(float(HandleFloatModifier(NewHealthMod, int(RA.Health), NewHealth)));
    }
    // End:0xDA6
    if(A.bIsInteractiveActor)
    {
        IA = InteractiveActor(A);
        // End:0xCCE
        if(AssignbDrawHUDInfo)
        {
            IA.bDrawHUDInfo = NewbDrawHUDInfo;
        }
        // End:0xCEC
        if(AssignUsePhrase)
        {
            IA.UsePhrase = NewUsePhrase;
        }
        // End:0xD0C
        if(AssignbUseTriggered)
        {
            IA.bUseTriggered = NewbUseTriggered;
        }
        // End:0xD2C
        if(AssignbNoUseKeyInfo)
        {
            IA.bNoUseKeyInfo = NewbNoUseKeyInfo;
        }
        IA.bUsable = HandleIntModifier(bUsableModifier, IA.bUsable);
        IA.SetTelekineticable(HandleIntModifier(bTelekineticableModifier, IA.bTelekineticable));
        IA.bGrabbable = HandleIntModifier(bGrabbableModifier, IA.bGrabbable);
    }
    // End:0xDC4
    if(AssignNewVoicePack)
    {
        A.VoicePack = NewVoicePack;
    }
    // End:0xDE2
    if(AssignSoundOcclusionScale)
    {
        A.SoundOcclusionScale = NewSoundOcclusionScale;
    }
    // End:0xE00
    if(AssignSoundRadius)
    {
        A.SoundRadius = NewSoundRadius;
    }
    // End:0xE1E
    if(AssignSoundInnerRadius)
    {
        A.SoundInnerRadius = NewSoundInnerRadius;
    }
    // End:0xE3C
    if(AssignSoundVolume)
    {
        A.SoundVolume = NewSoundVolume;
    }
    // End:0xE5A
    if(AssignSoundPitch)
    {
        A.SoundPitch = NewSoundPitch;
    }
    // End:0xE78
    if(AssignAmbientMusicVolume)
    {
        A.AmbientMusicVolume = NewAmbientMusicVolume;
    }
    // End:0xE96
    if(AssignAmbientMusicStartTime)
    {
        A.AmbientMusicStartTime = NewAmbientMusicStartTime;
    }
    // End:0xEB4
    if(AssignAmbientMusicEarlyEndTime)
    {
        A.AmbientMusicEarlyEndTime = NewAmbientMusicEarlyEndTime;
    }
    // End:0xED2
    if(AssignAmbientMusicInnerRadius)
    {
        A.AmbientMusicInnerRadius = NewAmbientMusicInnerRadius;
    }
    // End:0xEF0
    if(AssignAmbientMusicRadius)
    {
        A.AmbientMusicRadius = NewAmbientMusicRadius;
    }
    // End:0xF0E
    if(AssignAmbientMusicCrossfadeTime)
    {
        A.AmbientMusicCrossfadeTime = NewAmbientMusicCrossfadeTime;
    }
    // End:0xF2C
    if(AssignTransientSoundVolume)
    {
        A.TransientSoundVolume = NewTransientSoundVolume;
    }
    // End:0xF4A
    if(AssignTransientSoundRadius)
    {
        A.TransientSoundRadius = NewTransientSoundRadius;
    }
    // End:0xF68
    if(AssignTransientSoundInnerRadius)
    {
        A.TransientSoundInnerRadius = NewTransientSoundInnerRadius;
    }
    // End:0xF86
    if(AssignTransientSoundPitch)
    {
        A.TransientSoundPitch = NewTransientSoundPitch;
    }
    // End:0xFA6
    if(AssignAmbientMusicEnableVis)
    {
        A.AmbientMusicEnableVis = NewAmbientMusicEnableVis;
    }
    // End:0xFC6
    if(AssignbOccludeSounds)
    {
        A.bOccludeSounds = NewbOccludeSounds;
    }
    // End:0xFE6
    if(AssignSoundScaled)
    {
        A.SoundScaled = NewSoundScaled;
    }
    // End:0x1006
    if(AssignSoundNoOcclude)
    {
        A.SoundNoOcclude = NewSoundNoOcclude;
    }
    // End:0x1026
    if(AssignSoundNoDoppler)
    {
        A.SoundNoDoppler = NewSoundNoDoppler;
    }
    // End:0x1046
    if(AssignTransientSoundNoOcclude)
    {
        A.TransientSoundNoOcclude = NewTransientSoundNoOcclude;
    }
    // End:0x1066
    if(AssignTransientSoundScaled)
    {
        A.TransientSoundScaled = NewTransientSoundScaled;
    }
    A.TransientSoundNoDoppler = HandleIntModifier(TransientSoundNoDopplerModifier, A.TransientSoundNoDoppler);
    A.TraceFalseMask = -1;
    A.TraceTrueMask = -1;
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    local int i;

    // End:0x36
    if(AssignNewMesh)
    {
        PrecacheIndex.RegisterPawnAnimation(NewMesh);
        // End:0x36
        if(bAssignDisplayToggle)
        {
            PrecacheIndex.RegisterPawnAnimation(NewMeshAlt);
        }
    }
    // End:0x6C
    if(AssignNewStaticMesh)
    {
        PrecacheIndex.RegisterPawnAnimation(NewStaticMesh);
        // End:0x6C
        if(bAssignDisplayToggle)
        {
            PrecacheIndex.RegisterPawnAnimation(NewStaticMeshAlt);
        }
    }
    // End:0x100
    if(AssignNewSkins)
    {
        i = string(NewSkins) - 1;
        J0x84:

        // End:0xB6 [Loop If]
        if(i >= 0)
        {
            PrecacheIndex.RegisterAnimationControllerEntry(NewSkins[i].NewMaterialEx);
            -- i;
            // [Loop Continue]
            goto J0x84;
        }
        // End:0x100
        if(bAssignDisplayToggle)
        {
            i = string(NewSkinsAlt) - 1;
            J0xCE:

            // End:0x100 [Loop If]
            if(i >= 0)
            {
                PrecacheIndex.RegisterAnimationControllerEntry(NewSkinsAlt[i].NewMaterialEx);
                -- i;
                // [Loop Continue]
                goto J0xCE;
            }
        }
    }
    return;
}

defaultproperties
{
    NewOverlayEffectAlpha=1
    OverlayEffectAlphaTransitionTime=1
    Texture=Texture'S_TriggerAssign'
}