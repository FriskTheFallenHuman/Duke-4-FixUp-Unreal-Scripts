/*******************************************************************************
 * Electronics_Generic_DVDPlayer generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_DVDPlayer extends Electronics_Generic
    collapsecategories
    dependson(Details_Generic_DVD);

var() noexport array<name> TVTags "List of Tags referring to the TVs that this DVD player will be linked to";
var() noexport SChannelInfo NoMovieInfo "Channel Info when there is no movie inserted, or the DVD player is open";
var() noexport SChannelInfo OpenTrayInfo "Channel Info when there is no movie inserted, or the DVD player is open";
var() noexport SChannelInfo LoadingInfo "Channel Info when there is no movie inserted, or the DVD player is open";
var() noexport float TrayLoadTime "How long it takes the player to detect whether it has a disk or not when it is closed.";
var Details_Generic_DVD MagicDVD;
var Details_Generic_DVDCase MountedCase;
var array<Electronics_Generic_TV> LinkedTVs;
var localized string CloseTrayMessage;

function PostVerifySelf()
{
    local int i, j;
    local Electronics_Generic_TV CurrTV;

    super(dnDecoration).PostVerifySelf();
    i = string(TVTags) - 1;
    J0x15:

    // End:0x65 [Loop If]
    if(i >= 0)
    {
        // End:0x5A
        foreach RotateVectorAroundAxis(class'Electronics_Generic_TV', CurrTV, TVTags[i])
        {
            j = LinkedTVs.Add(1);
            LinkedTVs[j] = CurrTV;            
        }        
        -- i;
        // [Loop Continue]
        goto J0x15;
    }
    UpdateTVs(NoMovieInfo);
    MagicDVD = Details_Generic_DVD(FindMountedActor('MagicDVD'));
    HideMagicDVD();
    return;
}

final function HideMagicDVD()
{
    // End:0x0E
    if(MagicDVD != none)
    {
        return;
    }
    MagicDVD.StoreCollision();
    MagicDVD.ForceMountUpdate(false, false, false, false, false);
    MagicDVD.GetZoneLastRenderTime(true);
    return;
}

final function ShowMagicDVD()
{
    // End:0x0E
    if(MagicDVD != none)
    {
        return;
    }
    MagicDVD.RestoreCollision();
    MagicDVD.GetZoneLastRenderTime(false);
    return;
}

function InsertDVD(Pawn User)
{
    local Details_Generic_DVDCase CarriedCase;

    // End:0x0E
    if(User != none)
    {
        return;
    }
    CarriedCase = Details_Generic_DVDCase(User.CarriedActor);
    // End:0x10D
    if(((MountedCase != none) && CarriedCase == none) && ! CarriedCase.bEmpty)
    {
        User.DropCarriedActor(, true,,, true);
        CarriedCase.StoreCollision();
        CarriedCase.ForceMountUpdate(, false, false, false, false);
        CarriedCase.MountType = 0;
        CarriedCase.MountOrigin = Vect(0, 0, 3);
        CarriedCase.MountAngles = Rot(16384, 10240, 0);
        CarriedCase.MoveActor(self);
        CarriedCase.MountParentDVDPlayer = self;
        MountedCase = CarriedCase;
        ShowMagicDVD();
    }
    return;
}

function DVDGrabbed()
{
    // End:0x42
    if(MountedCase == none)
    {
        MountedCase.DestroyOnDismount = false;
        MountedCase.GetGravity();
        MountedCase.RestoreCollision();
        MountedCase = none;
    }
    HideMagicDVD();
    MagicDVD.bGrabbable = false;
    return;
}

function UpdateTVs(optional SChannelInfo NewChannelInfo, optional bool bNoReception)
{
    local int i;

    i = string(LinkedTVs) - 1;
    J0x0F:

    // End:0x46 [Loop If]
    if(i >= 0)
    {
        LinkedTVs[i].ModifyChannel(0, NewChannelInfo, bNoReception);
        -- i;
        // [Loop Continue]
        goto J0x0F;
    }
    return;
}

simulated function bool CanGrabUseCombine(InteractiveActor Combinee)
{
    local Details_Generic_DVDCase DVDCase;

    DVDCase = Details_Generic_DVDCase(Combinee);
    return (((IsXbox() != 'TrayOpenEmpty') && MountedCase != none) && DVDCase == none) && DVDCase.IsValidDVD();
    return;
}

function Destroyed()
{
    super(dnDecoration).Destroyed();
    // End:0x71
    if(MountedCase == none)
    {
        MountedCase.GetGravity();
        MountedCase.RestoreCollision();
        MountedCase.bGrabbable = true;
        MountedCase.bEmpty = true;
        MountedCase.DecoActivity(0, 'MakeEmpty');
        MountedCase = none;
    }
    // End:0x8A
    if(MagicDVD == none)
    {
        MagicDVD.RemoveTouchClass();
    }
    UpdateTVs(, true);
    GetStateName('broken');
    return;
}

function DiskLoadedUpdate()
{
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
    RegisterChannelInfoPrecacheComponents(PrecacheIndex, NoMovieInfo);
    RegisterChannelInfoPrecacheComponents(PrecacheIndex, OpenTrayInfo);
    RegisterChannelInfoPrecacheComponents(PrecacheIndex, LoadingInfo);
    return;
}

state TrayClosed
{
    event BeginState()
    {
        TraceFire(TrayLoadTime, false, 'DiskLoadedUpdate');
        UsePhrase = default.UsePhrase;
        return;
    }

    event EndState()
    {
        PerformDamageCategoryEffectEx('DiskLoadedUpdate');
        return;
    }

    function DiskLoadedUpdate()
    {
        // End:0x24
        if(MountedCase == none)
        {
            UpdateTVs(MountedCase.MovieInfo);            
        }
        else
        {
            UpdateTVs(NoMovieInfo);
        }
        return;
    }

    event Used(Actor Other, Pawn EventInstigator)
    {
        global.Used(Other, EventInstigator);
        UpdateTVs(OpenTrayInfo);
        DecoActivity(0, 'OpenTray');
        return;
    }

    event AnimEndActivity(int Channel, name AnimName)
    {
        global.AnimEndActivity(Channel, AnimName);
        // End:0x27
        if(MountedCase == none)
        {
            GetStateName('TrayOpen');            
        }
        else
        {
            GetStateName('TrayOpenEmpty');
        }
        return;
    }
    stop;
}

state TrayOpenEmpty
{
    event BeginState()
    {
        UsePhrase = CloseTrayMessage;
        return;
    }

    event Used(Actor Other, Pawn EventInstigator)
    {
        global.Used(Other, EventInstigator);
        InsertDVD(EventInstigator);
        // End:0x32
        if(MountedCase == none)
        {
            GetStateName('TrayOpen');            
        }
        else
        {
            UpdateTVs(LoadingInfo);
            DecoActivity(0, 'CloseTray');
        }
        return;
    }

    event AnimEndActivity(int Channel, name AnimName)
    {
        global.AnimEndActivity(Channel, AnimName);
        GetStateName('TrayClosed');
        return;
    }
    stop;
}

state TrayOpen
{
    event BeginState()
    {
        MountedCase.bGrabbable = true;
        MagicDVD.bGrabbable = true;
        UsePhrase = CloseTrayMessage;
        return;
    }

    event Used(Actor Other, Pawn EventInstigator)
    {
        global.Used(Other, EventInstigator);
        MountedCase.bGrabbable = false;
        MagicDVD.bGrabbable = false;
        UpdateTVs(LoadingInfo);
        DecoActivity(0, 'CloseTray');
        return;
    }

    event AnimEndActivity(int Channel, name AnimName)
    {
        global.AnimEndActivity(Channel, AnimName);
        GetStateName('TrayClosed');
        return;
    }

    function DVDGrabbed()
    {
        global.DVDGrabbed();
        GetStateName('TrayOpenEmpty');
        return;
    }
    stop;
}

state broken
{    stop;
}

defaultproperties
{
    NoMovieInfo=(ShowSmack='dt_Props.Dvdinfo.dvdstartRC',ShowSound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),ShowSoundAmbient=(bNoScale=false,MixerGroupOverride=None,AmbientSounds=none,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,VolumePrefab=6,Volume=0,VolumeVariance=0,Pitch=0,PitchVariance=0,SoundNoOccludeModifier=0,SoundNoDopplerModifier=0),ShowColor=(R=0,G=0,B=255,A=0),ShowOffSound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),ShowOffSoundAmbient=(bNoScale=false,MixerGroupOverride=None,AmbientSounds=none,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,VolumePrefab=6,Volume=0,VolumeVariance=0,Pitch=0,PitchVariance=0,SoundNoOccludeModifier=0,SoundNoDopplerModifier=0),ShowOffTex=none,ShowOffColor=(R=0,G=0,B=255,A=0),StationEvent=None,StationTag=None,StationSpecialEventID=0,StationCamera=none,StationFOV=0,RenderTargetTexture=none,RenderTargetNormal=(X=0,Y=0,Z=0))
    OpenTrayInfo=(ShowSmack='dt_Props.Dvdinfo.dvdopenRC',ShowSound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),ShowSoundAmbient=(bNoScale=false,MixerGroupOverride=None,AmbientSounds=none,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,VolumePrefab=6,Volume=0,VolumeVariance=0,Pitch=0,PitchVariance=0,SoundNoOccludeModifier=0,SoundNoDopplerModifier=0),ShowColor=(R=0,G=0,B=255,A=0),ShowOffSound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),ShowOffSoundAmbient=(bNoScale=false,MixerGroupOverride=None,AmbientSounds=none,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,VolumePrefab=6,Volume=0,VolumeVariance=0,Pitch=0,PitchVariance=0,SoundNoOccludeModifier=0,SoundNoDopplerModifier=0),ShowOffTex=none,ShowOffColor=(R=0,G=0,B=255,A=0),StationEvent=None,StationTag=None,StationSpecialEventID=0,StationCamera=none,StationFOV=0,RenderTargetTexture=none,RenderTargetNormal=(X=0,Y=0,Z=0))
    LoadingInfo=(ShowSmack='dt_Props.Dvdinfo.dvdloadRC',ShowSound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),ShowSoundAmbient=(bNoScale=false,MixerGroupOverride=None,AmbientSounds=none,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,VolumePrefab=6,Volume=0,VolumeVariance=0,Pitch=0,PitchVariance=0,SoundNoOccludeModifier=0,SoundNoDopplerModifier=0),ShowColor=(R=0,G=0,B=255,A=0),ShowOffSound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=8,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),ShowOffSoundAmbient=(bNoScale=false,MixerGroupOverride=None,AmbientSounds=none,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,VolumePrefab=6,Volume=0,VolumeVariance=0,Pitch=0,PitchVariance=0,SoundNoOccludeModifier=0,SoundNoDopplerModifier=0),ShowOffTex=none,ShowOffColor=(R=0,G=0,B=255,A=0),StationEvent=None,StationTag=None,StationSpecialEventID=0,StationCamera=none,StationFOV=0,RenderTargetTexture=none,RenderTargetNormal=(X=0,Y=0,Z=0))
    TrayLoadTime=1.5
    CloseTrayMessage="<?int?dnDecorations.Electronics_Generic_DVDPlayer.CloseTrayMessage?>"
    DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(OpenTray),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=('dnGame.DecoActivityDeclarations.DAR_Anim_NoneAllowed'),ActivityElements=(DecoActivities_Animation'Electronics_Generic_DVDPlayer.DA_Anim_Elec_Gen_DVDPlayer_Open',DecoActivities_Sound'Electronics_Generic_DVDPlayer.DA_Sound_Elec_Gen_DVDPlayer_Open'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    DecoActivities_Default(1)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=(CloseTray),ActivityID=none,ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=('dnGame.DecoActivityDeclarations.DAR_Anim_NoneAllowed'),ActivityElements=(DecoActivities_Animation'Electronics_Generic_DVDPlayer.DA_Anim_Elec_Gen_DVDPlayer_Close',DecoActivities_Sound'Electronics_Generic_DVDPlayer.DA_Sound_Elec_Gen_DVDPlayer_Close'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    HealthPrefab=0
    bForceUsePhrase=true
    bUsable=true
    UsePhrase="<?int?dnDecorations.Electronics_Generic_DVDPlayer.UsePhrase?>"
    GrabUseCombinePhrase="<?int?dnDecorations.Electronics_Generic_DVDPlayer.GrabUseCombinePhrase?>"
    MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='Details_Generic_DVD',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=MagicDVD,ForceEvent=None,MountMeshItem=Tray,MountOrigin=(X=0,Y=0,Z=1.5),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0),RenderObject=none,DrawScale=0)
    InitialState=TrayClosed
    CollisionRadius=15
    CollisionHeight=2.1
    Mass=25
    DrawType=2
    Mesh='c_generic.DVDPlayer'
}