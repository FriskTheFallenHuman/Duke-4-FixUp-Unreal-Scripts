/*******************************************************************************
 * dnHitFX_Spawners generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnHitFX_Spawners extends dnFriendFX_Spawners
    collapsecategories
    notplaceable
    hidecategories(Filter,HeatVision,Interactivity,KarmaObject,KarmaOverride,Networking);

var int LastLevelTickStamp;
var array<Vector> PreviousLocationsThisFrame;
var float CloseSoundDistanceSquared;

simulated function ExecuteEffect(bool bPlaySounds)
{
    local int i;

    // End:0xB9
    if(bPlaySounds && CloseSoundDistanceSquared > 0)
    {
        // End:0x4E
        if(LastLevelTickStamp != Level.LevelTickStamp)
        {
            PreviousLocationsThisFrame.Empty();
            LastLevelTickStamp = Level.LevelTickStamp;
        }
        i = string(PreviousLocationsThisFrame) - 1;
        J0x5D:

        // End:0x9B [Loop If]
        if(i >= 0)
        {
            // End:0x91
            if(VSizeSquared(Location - PreviousLocationsThisFrame[i]) <= CloseSoundDistanceSquared)
            {
                bPlaySounds = false;
                // [Explicit Break]
                goto J0x9B;
            }
            -- i;
            // [Loop Continue]
            goto J0x5D;
        }
        J0x9B:

        // End:0xB9
        if(i < 0)
        {
            PreviousLocationsThisFrame[PreviousLocationsThisFrame.Add(1)] = Location;
        }
    }
    super.ExecuteEffect(bPlaySounds);
    return;
}

defaultproperties
{
    LastLevelTickStamp=-1
    CloseSoundDistanceSquared=900
    DestroyWhenEmpty=false
    bDontAutoPlayCreationSounds=true
    bNetTemporary=true
    bDontSimulateMotion=true
    TransientSoundVolume=0.6
    TransientSoundRadius=768
}