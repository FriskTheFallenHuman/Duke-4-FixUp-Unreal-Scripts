/*******************************************************************************
 * AmmoPickup generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AmmoPickup extends Pickup
    abstract
    collapsecategories
    notplaceable;

simulated event PostBeginPlay()
{
    super(InteractiveActor).PostBeginPlay();
    // End:0x1B
    if(IsMP())
    {
        SetRotation(0);
        ForceMountUpdate(,,, false);
    }
    return;
}

defaultproperties
{
    RespawnTime=30
    bAllowUsePickup=false
    bDoOverlayEffect=true
    bOverlayEffectUsedAsHint=true
}