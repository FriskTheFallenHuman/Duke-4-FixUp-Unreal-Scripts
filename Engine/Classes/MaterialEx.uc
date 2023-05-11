/*******************************************************************************
 * MaterialEx generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MaterialEx extends Object
    abstract
    native
    noexport
    hidecategories(Object);

struct BumpMap
{
    var() MaterialEx NormalMap;
    var() MaterialEx HeightMap;
    var() float BumpScale;
    var() int NumSmoothPasses;
    var() bool bHiResNormals;
    var() bool bInvertBumps;
};

var() MaterialEx FallbackMaterial;
var MaterialEx DefaultMaterial;
var const transient bool UseFallback;
var const transient bool Validated;
var bool bMaterialIsDirty;
var name MaterialName;
var() class<Material> MaterialClass;
var bool bRenderedMaterial;
var bool bBitmapMaterial;
var bool bModifier;
var bool bTexture;
var bool bCombiner;
var bool bBumpShader;
var bool bColorModifier;
var bool bFinalBlend;
var bool bTexModifier;
var bool bConstantMaterial;
var bool bVertexColor;
var bool bProjectorMaterial;
var bool bBumpWaterReflection;
var bool bFakeBumpMap;
var bool bBumpCubeEnvMap;
var bool bCubemap;
var bool bMiscMaterial;
var bool bLayerMaterial;
var bool bBinkMaterial;
var bool bMaterial20;
var bool bMaterial21;
var bool bMaterial22;
var bool bMaterial23;
var bool bMaterial24;
var bool bMaterial25;
var bool bMaterial26;
var bool bMaterial27;
var bool bMaterial28;
var bool bMaterial29;
var bool bMaterial30;
var bool bMaterial31;
var() noexport bool bGoryMaterial "If true, this material's references will be stripped in a gore-free build.  Marked textures will also be turned into 16x16 blackness for gore-free builds.";

// Export UMaterialEx::execGetUSize(FFrame&, void* const)
native(1191) final simulated function int GetUSize();

// Export UMaterialEx::execGetVSize(FFrame&, void* const)
native(1192) final simulated function int GetVSize();

// Export UMaterialEx::execIsMasking(FFrame&, void* const)
native(1193) final simulated function bool IsMasking();

// Export UMaterialEx::execGetPropertyByIndex(FFrame&, void* const)
native final simulated function MaterialEx GetPropertyByIndex(int Index);

// Export UMaterialEx::execSetPropertyByIndex(FFrame&, void* const)
native final simulated function SetPropertyByIndex(int Index, MaterialEx Mat);

// Export UMaterialEx::execDuplicate(FFrame&, void* const)
native final simulated function MaterialEx Duplicate(MaterialEx Mat, string S);

function Reset()
{
    // End:0x1C
    if(FallbackMaterial == none)
    {
        FallbackMaterial.Reset();
    }
    return;
}

function Trigger(Actor Other, Actor EventInstigator)
{
    // End:0x26
    if(FallbackMaterial == none)
    {
        FallbackMaterial.Trigger(Other, EventInstigator);
    }
    return;
}

final simulated event class<Material> GetMaterial()
{
    // End:0x2B
    if((MaterialClass != none) || bMaterialIsDirty)
    {
        bMaterialIsDirty = false;
        MaterialClass = GetCurrentMaterial();
    }
    return MaterialClass;
    return;
}

simulated function class<Material> GetCurrentMaterial()
{
    return MaterialClass;
    return;
}