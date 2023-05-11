/*******************************************************************************
 * DecoGlass_Monitor_FlatScreen generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DecoGlass_Monitor_FlatScreen extends dnBreakableGlass_DecoGlass
    collapsecategories;

var Electronics_Generic_Computer_Monitor MonitorActor;

event GlassCracked()
{
    super(dnBreakableGlass).GlassCracked();
    DecoGlassDamaged();
    return;
}

event GlassShattered()
{
    super(dnBreakableGlass).GlassShattered();
    DecoGlassDamaged();
    return;
}

final function DecoGlassDamaged()
{
    // End:0x1C
    if(MonitorActor == none)
    {
        MonitorActor.GlassDamaged();
    }
    MonitorActor = none;
    return;
}

final function CrackSelf()
{
    MonitorActor = none;
    ConstraintSupportsBreaking(Location);
    return;
}

final function Disabled()
{
    bUsable = false;
    bForceUsePhrase = false;
    bDrawUsePhrase = false;
    return;
}

defaultproperties
{
    ParticleSize=6
    bStaticEdgePieces=false
    bDrawHUDInfo=true
    bForceUsePhrase=true
    bUsable=true
    DrawScale3D=(X=24,Y=17,Z=1)
}