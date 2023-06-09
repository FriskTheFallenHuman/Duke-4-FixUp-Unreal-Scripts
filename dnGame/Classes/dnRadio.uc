/*******************************************************************************
 * dnRadio generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnRadio extends Actor
    collapsecategories
    notplaceable
    dependson(dnRadioTower);

var() noexport float InitialFrequency "Initial station.";
var() noexport float ChangeChannelTime "Amount of time it takes to switch stations.  Radio will play static during this time.";
var float CurrFreq;
var dnRadioTower RadioTower;

event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x1A
    foreach RotateVectorAroundAxis(class'dnRadioTower', RadioTower)
    {
        // End:0x1A
        break;        
    }    
    // End:0x41
    if(RadioTower != none)
    {
        RadioTower = EmptyTouchClasses(class'dnRadioTower');
        Log(RadioTower == none);
    }
    // End:0x66
    if(! RadioTower.bInitialized)
    {
        RadioTower.InitializeTower();
    }
    HandleInitialStation(InitialFrequency);
    return;
}

final function InitializeFrom(Actor Other)
{
    Log(Other == none);
    AmbientMusicInnerRadius = Other.AmbientMusicInnerRadius;
    AmbientMusicRadius = Other.AmbientMusicRadius;
    AmbientMusicVolume = Other.AmbientMusicVolume;
    SoundNoOcclude = Other.SoundNoOcclude;
    SoundNoDoppler = Other.SoundNoDoppler;
    SoundOcclusionScale = Other.SoundOcclusionScale;
    SoundRadius = Other.SoundRadius;
    SoundInnerRadius = Other.SoundInnerRadius;
    SoundVolume = Other.SoundVolume;
    SoundPitch = Other.SoundPitch;
    return;
}

final function HandleInitialStation(float Frequency)
{
    Log(RadioTower == none);
    // End:0x39
    if(Frequency == 0)
    {
        CurrFreq = RadioTower.SeekNextStation(0);        
    }
    else
    {
        CurrFreq = Frequency;
    }
    HandleNewStation();
    return;
}

final function TuneNextStation()
{
    Log(RadioTower == none);
    CurrFreq = RadioTower.SeekNextStation(CurrFreq);
    HandleNewStation();
    return;
}

final function TunePrevStation()
{
    Log(RadioTower == none);
    CurrFreq = RadioTower.SeekPrevStation(CurrFreq);
    HandleNewStation();
    return;
}

final function HandleNewStation()
{
    // End:0x18
    if(CurrFreq == 0)
    {
        TurnOff();        
    }
    else
    {
        // End:0x30
        if(ChangeChannelTime > 0)
        {
            PreTuneStation();            
        }
        else
        {
            TuneStation();
        }
    }
    return;
}

final function PreTuneStation()
{
    Log(RadioTower == none);
    RadioTower.UntuneStation(self);
    TraceFire(ChangeChannelTime, false, 'TuneStation');
    return;
}

final function TuneStation()
{
    local float ReTuneTime;

    Log(CurrFreq != 0);
    Log(RadioTower == none);
    ReTuneTime = RadioTower.TuneStationByFrequency(self, CurrFreq);
    // End:0x5A
    if(ReTuneTime == -1)
    {
        CurrFreq = 0;
        TurnOff();        
    }
    else
    {
        // End:0x74
        if(ReTuneTime == 0)
        {
            ReTuneTime = 0.001;
        }
        TraceFire(ReTuneTime, false, 'TuneStation');
    }
    return;
}

final function TurnOff()
{
    Log(RadioTower == none);
    SetAnimRate("");
    CurrFreq = 0;
    PerformDamageCategoryEffectEx('TuneStation');
    return;
}

final function string GetStationName()
{
    Log(RadioTower == none);
    return RadioTower.super(dnRadio).GetStationName(CurrFreq);
    return;
}

defaultproperties
{
    ChangeChannelTime=0.4
    bHidden=true
    bNoNativeTick=true
    TickStyle=0
    AmbientMusicVolume=0.75
    AmbientMusicEarlyEndTime=0
    AmbientMusicInnerRadius=256
    AmbientMusicRadius=512
    AmbientMusicCrossfadeTime=0
}