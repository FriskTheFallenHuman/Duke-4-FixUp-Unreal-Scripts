/*******************************************************************************
 * Details_Generic_DrinkCan generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Generic_DrinkCan extends Details_Generic
    collapsecategories;

simulated function GrabComplete()
{
    local DrinkCan DrinkCan;
    local Weapon PreviousWeapon;
    local Pawn Drinker;

    // End:0x0E
    if(CarriedBy != none)
    {
        return;
    }
    Drinker = CarriedBy;
    Drinker.DropCarriedActor(-1, true,, true, true);
    Level.Game.GiveInventoryTo(Drinker, class'DrinkCan', true);
    DrinkCan = DrinkCan(Drinker.PhysController_SetDesiredVelocity(class'DrinkCan'));
    // End:0x138
    if(DrinkCan == none)
    {
        // End:0xA3
        if(RadiusActors(1) != MountedActorListActors(1))
        {
            DrinkCan.bIsBeer = true;            
        }
        else
        {
            DrinkCan.bIsBeer = false;
        }
        DrinkCan.VisibleActors(1, RadiusActors(1));
        DrinkCan.Charge = float(Min(1, int(DrinkCan.Charge)));
        DrinkCan.Ammo.Charge = float(Min(1, int(DrinkCan.Ammo.Charge)));
        Drinker.ChangeToWeapon(DrinkCan);
    }
    bSilentDestroy = true;
    RemoveTouchClass();
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.RegisterMaterialClass(class'DrinkCan');
    return;
}

defaultproperties
{
    DestroyedActivities(0)=none
    DestroyedActivities(1)=none
    HealthPrefab=0
    bGrabbable=true
    UsePhrase="<?int?dnDecorations.Details_Generic_DrinkCan.UsePhrase?>"
    GrabInfo=(bCanDuckWhileHeld=true,MountItemOverride=mount_handright,MountOrigin=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),GrabAnimName=None,CarrierAnimName=CarryBarbell100,CarrierMountPose=CarryPoseDrinkCan,GrabSoundName=None,ThrowSoundName=None,GrabSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),ThrowSoundInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none))
    bTickOnlyWhenPhysicsAwake=true
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Metal_Hollow'
    KLinearDamping=0.2
    KAngularDamping=0.8
    PhysicsSoundOverrides(0)=(SoundType=0,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=('a_impact.SpecialCase.FullCan_Impact_01','a_impact.SpecialCase.FullCan_Impact_02','a_impact.SpecialCase.FullCan_Impact_03','a_impact.SpecialCase.FullCan_Impact_04'),SoundInfo=(InputRange=(Min=16,Max=1280),OutputPitchRange=(Min=0.75,Max=1),OutputVolumeRange=(Min=0.4,Max=0.8)),bDisableSoundInWater=true)
    PhysicsSoundOverrides(1)=(SoundType=1,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=('a_impact.SpecialCase.FullCan_Roll_01'),SoundInfo=(InputRange=(Min=8,Max=40),OutputPitchRange=(Min=0.95,Max=1.125),OutputVolumeRange=(Min=0.5,Max=1)),bDisableSoundInWater=true)
    PhysicsSoundOverrides(2)=(SoundType=2,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=('a_impact.SpecialCase.FullCan_Slide_01'),SoundInfo=(InputRange=(Min=400,Max=500),OutputPitchRange=(Min=0.9,Max=1),OutputVolumeRange=(Min=0.5,Max=0.75)),bDisableSoundInWater=true)
    bNoNativeTick=false
    bTickOnlyRecent=false
    CollisionRadius=2.5
    CollisionHeight=5.8
    Mass=10
    TickStyle=2
    StaticMesh='sm_class_dukeitems.Beer_40oz.Beer_40oz_sm'
    Skins(0)=none
    Skins(1)='mt_skins7.Beer_40oz.ChubbeCola_bs'
}