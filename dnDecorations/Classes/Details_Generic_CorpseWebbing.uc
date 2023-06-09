/*******************************************************************************
 * Details_Generic_CorpseWebbing generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Generic_CorpseWebbing extends Details_Generic
    collapsecategories;

var() deprecated Actor Actor1;
var() deprecated name Actor1Tag;
var() name Actor1Bone;
var() deprecated Actor Actor2;
var() deprecated name Actor2Tag;
var() name Actor2Bone;
var array<StaticMesh> WebbingStyles;

simulated event PostVerifySelf()
{
    super(dnDecoration).PostVerifySelf();
    GetOverlayEffectAlpha(WebbingStyles[Rand(string(WebbingStyles))]);
    Update();
    return;
}

simulated event Tick(float DeltaSeconds)
{
    super(Actor).Tick(DeltaSeconds);
    Update();
    return;
}

final simulated function Update()
{
    local Vector Location1, Location2, Offset, Scale, X, Y,
	    Z, W;

    local float DotVal;
    local int Angle;

    // End:0x34
    if((Actor1 != none) && NameForString(Actor1Tag, 'None'))
    {
        Actor1 = FindActor(class'Actor', Actor1Tag);
    }
    // End:0x68
    if((Actor2 != none) && NameForString(Actor2Tag, 'None'))
    {
        Actor2 = FindActor(class'Actor', Actor2Tag);
    }
    // End:0x84
    if((Actor1 != none) || Actor2 != none)
    {
        return;
    }
    // End:0xD0
    if(NameForString(Actor1Bone, 'None') && Actor1.SetScaleModifier() == none)
    {
        Location1 = Actor1.MeshInstance.CreateAnimGroup(Actor1Bone, true);        
    }
    else
    {
        Location1 = Actor1.Location;
    }
    // End:0x131
    if(NameForString(Actor2Bone, 'None') && Actor2.SetScaleModifier() == none)
    {
        Location2 = Actor2.MeshInstance.CreateAnimGroup(Actor2Bone, true);        
    }
    else
    {
        Location2 = Actor2.Location;
    }
    Offset = Location2 - Location1;
    SetDesiredRotation(Location1 + (0.5 * Offset));
    GetAxes(Rotation, X, Y, Z);
    DotVal = Normal(Offset) Dot X;
    // End:0x1D2
    if(DotVal < -0.9999999)
    {
        X = - X;
        Y = - Y;
        Z = - Z;        
    }
    else
    {
        // End:0x24E
        if(DotVal < 0.9999999)
        {
            Angle = int((Acos(DotVal) * 32768) / 3.141593);
            W = Normal(Offset) Cross X;
            X = Normal(Offset);
            Y = RotateAroundAxis(Y, W, Angle);
            Z = RotateAroundAxis(Z, W, Angle);
        }
    }
    DisableDesiredRotation_Roll(OrthoRotation(X, Y, Z));
    Scale.X = VSize(Offset) / 256;
    Scale.Y = FMin(1, Scale.X);
    Scale.Z = Scale.Y;
    SetActorColor(Scale);
    return;
}

defaultproperties
{
    WebbingStyles(0)='sm_geo_decorations.alien.corpes_Webbing_A'
    WebbingStyles(1)='sm_geo_decorations.alien.corpes_Webbing_B'
    HealthPrefab=0
    bBlockKarma=false
    bCanExistOutOfWorld=true
    bNoNativeTick=false
    bTickOnlyZoneRecent=false
    bLateTicker=true
    bCollideWorld=false
    TickSelfRecentTime=1
    TickStyle=2
    StaticMesh='sm_geo_decorations.alien.corpes_Webbing_A'
}