/*******************************************************************************
 * GeoWater generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GeoWater extends RenderActor
    native
    collapsecategories
    notplaceable
    hidecategories(Filter,HeatVision,Interactivity,Networking,Sound,SpawnOnDestroyed,Interpolation);

cpptext
{
// Stripped
}

enum EGeoWaterPhysicsCollision
{
    GEOCOLL_Bounds,
    GEOCOLL_Dynamic
};

var() const noexport int GridSizeX "Simulation grid size on x axis.  Also the rendering grid size if bAllowLOD is off.";
var() const noexport int GridSizeY "Simulation grid size on y axis.  Also the rendering grid size if bAllowLOD is off.";
var() noexport float TextureScaleU "Scale texture coordinates on the U axis";
var() noexport float TextureScaleV "Scale texture coordinates on the V axis";
var() noexport float WaterDepth "Used to determine the depth of the water for collision.";
var() noexport float DisturbWaterStrengthScale "How much to scale disturbance of water when players walk through it.";
var() noexport float WaterDamping "How fast the water settles down back to normal.";
var() noexport float WaterSpeed "How fast the ripples travel outward.";
var() noexport float WaterScrollYSpeed "How fast to scroll the simulation bitmap to simulate moving water.";
var() noexport float UpdateRate "Framerate at which water simulation runs at.  Higher is slower, but looks better.";
var() noexport bool bAllowLOD "Automatically tesselate rendering grid based on viewpoint relative to the water.  This does not affect the simulation grid size.";
var() bool bLineCheckAgainstVolume;
var() noexport bool bDontClampEdges "If true we will let the edge vertices move about freely - for carpet";
var() noexport float EdgeDeltaMin "How far the edge vertices are allowed to deviate from the geowaters location";
var() noexport float EdgeDeltaMax "How far the edge vertices are allowed to deviate from the geowaters location";
var() noexport float VertexDeltaMin "How far all vertices are allowed to deviate from the geowaters location";
var() noexport float VertexDeltaMax "How far all vertices are allowed to deviate from the geowaters location";
var() noexport int MinTreeDepth "When bAllowLOD is on, this is the minimum tessellation amount on the rendering x/y grid.  It is expressed as 2^n, where n is MinTreeDepth.";
var() noexport int MaxTreeDepth "When bAllowLOD is on, this is the maximum tessellation amount on the rendering x/y grid.  It is expressed as 2^n, where n is MaxTreeDepth.";
var() noexport float TessellationSensitivity "When bAllowLOD is on, this is the sensitivity used to tessellate the water.  Higher values will be more tessellated, but slower.";
var() Vector WaterAmbientLight;
var() noexport float RandomNoiseTime "Time in seconds between each random splash. A value of 0 will disable the random splashing.";
var() noexport float RandomNoiseStrength "When a random spash occurs, this will be the strength.";
var() noexport float RandomNoiseRadius "When a random spash occurs, this will be the radius.";
var(KarmaGeoWater) const noexport GeoWater.EGeoWaterPhysicsCollision PhysicsCollisionType "GEOCOLL_Bounds - this object will be represented as a volume (no rigid collision, but surface buoyancy potential)." "GEOCOLL_Dynamic - solid-but-frequently-changing surfaces. (Be careful!)";
var(KarmaGeoWater) const noexport float PhysicsDepth "This is the distance (in Unreal units) that the water will be considered to exist below the waterline.";
var(KarmaGeoWater) const noexport float PhysicsHeight "This is the maximum height (in Unreal units) that the water will be checked for collisions with physics objects.";
var(KarmaGeoWater) noexport float PhysicsDensity "The density of this water. More dense liquids will enable more dense objects to float. Units are a scaled (lbs./cubic inch), where 1.0 is considered normal water.";
var(KarmaGeoWater) noexport float PhysicsDrag "This value affects how much fluid friction (in addition to normal air damping) is applied to the parts of objects that are underwater.";
var(KarmaGeoWater) noexport array<name> OnlyAffectTagged "If not empty, this geowater will only do special physics stuff to Actors whose tag matches one entry in the list.";
var const int WaterVersion;
var const editconst transient nontrans pointer InternalData;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        DisturbWaterStrengthScale, GridSizeX, 
        GridSizeY, MaxTreeDepth, 
        MinTreeDepth, RandomNoiseRadius, 
        RandomNoiseStrength, RandomNoiseTime, 
        TessellationSensitivity, UpdateRate, 
        WaterAmbientLight, WaterDamping, 
        WaterDepth, WaterScrollYSpeed, 
        WaterSpeed, bAllowLOD, 
        bLineCheckAgainstVolume;
}

// Export UGeoWater::execSplashWater(FFrame&, void* const)
native(1115) final simulated function SplashWater(Vector Location, optional float Strength, optional float Radius);

// Export UGeoWater::execSampleHeight(FFrame&, void* const)
native(1116) final simulated function float SampleHeight(Vector Location);

// Export UGeoWater::execInternalTick(FFrame&, void* const)
native(1117) final simulated function InternalTick(float DeltaTime);

// Export UGeoWater::execAttachOscillator(FFrame&, void* const)
native(1118) final function AttachOscillator(GeoWaterOscillator Oscillator);

// Export UGeoWater::execDetachOscillator(FFrame&, void* const)
native(1119) final function DetachOscillator(GeoWaterOscillator Oscillator);

function PostBeginPlay()
{
    GetLastError(0);
    super.PostBeginPlay();
    return;
}

defaultproperties
{
    GridSizeX=32
    GridSizeY=32
    TextureScaleU=1
    TextureScaleV=1
    WaterDepth=32
    DisturbWaterStrengthScale=1
    WaterDamping=0.3
    WaterSpeed=140
    UpdateRate=30
    bAllowLOD=true
    EdgeDeltaMin=-100000
    EdgeDeltaMax=100000
    VertexDeltaMin=-100000
    VertexDeltaMax=100000
    MinTreeDepth=2
    MaxTreeDepth=6
    TessellationSensitivity=1
    RandomNoiseTime=1.5
    RandomNoiseStrength=-200
    RandomNoiseRadius=34
    PhysicsDepth=64
    PhysicsHeight=64
    PhysicsDensity=1
    PhysicsDrag=0.006
    WaterVersion=1
    StaticInteractionClassification=3
    bTraceUsable=false
    bAITransparent=true
    bBlockBeams=false
    bNoDelete=true
    bNoNativeTick=true
    bTickOnlyRecent=true
    bTickOnlyZoneRecent=true
    bTickOnlyNearby=true
    bAcceptsDecalProjectors=false
    CollisionRadius=30
    CollisionHeight=30
    TickSelfRecentTime=1
    DrawType=11
    AlphaSortGroup=6
    DrawScale3D=(X=128,Y=128,Z=1)
    TraceFireHitResponse=1
    MirrorNormal=(X=0,Y=0,Z=1)
}