/*******************************************************************************
 * Barrels_Generic_Explosive_C9_Gibs generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Barrels_Generic_Explosive_C9_Gibs extends aFinalDecoration_Gibs
    abstract
    collapsecategories;

function PostBeginPlay()
{
    // End:0x48
    if(int(Level.NetMode) != int(NM_Standalone))
    {
        TickStyle = 1;
        LifeSpan = 6;
        LifeSpanVariance = 2;
        LifeSpan = FVar(LifeSpan, LifeSpanVariance);
    }
    super(dnDecoration_Gibs).PostBeginPlay();
    return;
}

defaultproperties
{
    Gibs(0)=(RenderObject='sm_class_decorations.Containers.c9_GIb_1',bForcedOnly=false)
    Gibs(1)=(RenderObject='sm_class_decorations.Containers.c9_GIb_2',bForcedOnly=false)
    Gibs(2)=(RenderObject='sm_class_decorations.Containers.c9_GIb_3',bForcedOnly=false)
    Gibs(3)=(RenderObject='sm_class_decorations.Containers.c9_GIb_4',bForcedOnly=false)
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Metal_Solid'
    PhysicsMassType=0
    Density=3
    PhysicsEntityGroup=C9BarellGibsEntityGroup
    bDontUseMeqonPhysics=true
}