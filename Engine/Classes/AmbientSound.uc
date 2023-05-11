/*******************************************************************************
 * AmbientSound generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AmbientSound extends Keypoint
    collapsecategories
    notplaceable;

var() Object.ESoundVolumePrefab VolumePrefab;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x90
    if(int(VolumePrefab) != int(0))
    {
        SoundVolume = byte(255 * Level.VolumePrefabTable[int(VolumePrefab)].Volume);
        // End:0x90
        if(Level.VolumePrefabTable[int(VolumePrefab)].VolumeVariance > 0)
        {
            SoundVolume += byte(Rand(int(byte(255 * Level.VolumePrefabTable[int(VolumePrefab)].VolumeVariance))));
        }
    }
    return;
}

defaultproperties
{
    bNeverMeshAccurate=true
    bCollisionAssumeValid=true
    bUnlisted=true
    bTickOnlyRecent=true
    bTickOnlyZoneRecent=true
    bTickOnlyNearby=true
    CollisionRadius=0
    CollisionHeight=0
    TickNearbyRadius=0
    Texture=Texture'S_Ambient'
    SoundVolume=190
    SoundRadius=1600
    SoundInnerRadius=800
}