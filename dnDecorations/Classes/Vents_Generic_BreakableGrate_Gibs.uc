/*******************************************************************************
 * Vents_Generic_BreakableGrate_Gibs generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Vents_Generic_BreakableGrate_Gibs extends Vents_Generic;

function PostBeginPlay()
{
    // End:0x50
    if(int(Level.NetMode) != int(NM_Standalone))
    {
        bTickOnlyWhenPhysicsAwake = false;
        TickStyle = 1;
        LifeSpan = 6;
        LifeSpanVariance = 2;
        LifeSpan = FVar(LifeSpan, LifeSpanVariance);
    }
    super(dnDecoration).PostBeginPlay();
    return;
}

defaultproperties
{
    HealthPrefab=0
    bIgnorePawnAirCushion=true
    bTickOnlyWhenPhysicsAwake=true
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Metal_Solid'
    PhysicsEntityGroup=VentGibs
    bBlockPlayers=false
    bGibActor=true
    bDontUseMeqonPhysics=true
    CollisionRadius=0
    CollisionHeight=0
    RemoteRole=0
}