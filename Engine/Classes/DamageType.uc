/*******************************************************************************
 * DamageType generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DamageType extends Object
    abstract
    native
    dependson(Material)
    dependson(HUD);

struct SDamageCategoryEffectMapping
{
    var() array< class<Material> > MaterialClasses;
    var() SDamageCategoryEffect Effect;
};

var localized string DamageName;
var localized string DeathMessage;
var localized string SuicideDeathMessage;
var bool bScoreHit;
var float MomentumTransfer;
var bool bRestartVibrations;
var array<SViewShakeInfo> DamageVibrations;
var array<SRumbleInfo> DamageRumbles;
var string Icon;
var string WeaponSpreeMessageType;
var localized string WeaponSpreePhrase;
var string WeaponSpreeSound;
var bool bIgnoreDrawScale;
var bool bIgnoreDifficultyDamageScaling;
var noexport float PlayerDamageScale "Scalar for damage from this damage type when the damagee is a playerpawn in single player.";
var noexport float SelfDamageScale "Scalar for damage from this damage type when the damagee is the damager.";
var float FrameDamageLerp;
var float BodyPartDamageScaleLerp;
var float DeathMomentumScale;
var float DeathLiftScale;
var SSoundInfo DamageSound;
var() SScreenFlash DamageScreenFlash;
var float DamageScreenFlashScaleDenominator;
var Color DamageScreenFlashColorMin;
var Color DamageScreenFlashColorMax;
var float DamageScreenFlashTimeMin;
var float DamageScreenFlashTimeMax;
var float DamageScreenFlashTimeMidScale;
var() noexport MaterialEx DamageIndicatorIcon "Material to use for the damage indicator.";
var() noexport Color DamageIndicatorColor "Overrides the default color of damage indicators.  Ignored if black.";
var() noexport float DamageIndicatorLifetime "How long to display the damage indicator for this damage type.";
var() noexport float DamageIndicatorRadius "Radius of the damage indicator circle.";
var() noexport float BlurDamageThreshold "Minimum damage required to do a standard blur.  In truth, the damage must be higher to get a blur, because at the minimum it would cause 0 blur.";
var() noexport float MotionBlurDamageThreshold "Minimum damage required to do motion blur instead of the standard blur.";
var bool bIgnoreUseHitEffectOverrides;
var() array<SDamageCategoryEffectMapping> MaterialEffectMappings;
var() SDamageCategoryEffect DefaultDamageCategoryEffect;
var float NearMissChance;
var float NearMissMaxDistSq;
var class<NearMissEffect> NearMissClass;
var float DamageScaleMap[20];
var bool DoesApplyViewkick;
var() float SteroidsImpulseMultiplier;
var() float SteroidsMeleeZImpulse;
var() float SteroidsDamageMultiplier;
var() bool bIgnoreShrunkDamageScaling;
var bool bIsTraceDamageType;
var bool bShowIndicatorOnZeroDamage;

static function float ReduceDamage(Pawn DamagedPawn, float inDamage, Pawn DamageInstigator)
{
    // End:0x34
    if((DamagedPawn != DamageInstigator) && ! DamageInstigator.IsMP())
    {
        return default.SelfDamageScale * inDamage;
    }
    return inDamage;
    return;
}

static function bool CanDismemberCorpses()
{
    return true;
    return;
}

static function bool CanGibCorpses()
{
    return false;
    return;
}

static function bool InstagibCorpses()
{
    return false;
    return;
}

static function bool CanKill()
{
    return true;
    return;
}

static function bool AllowDeathWhenInvincible()
{
    return false;
    return;
}

static function bool ShouldCreateDirectionalIndicator()
{
    return false;
    return;
}

static function bool ShouldDoSteroidsSpecialFX()
{
    return false;
    return;
}

static function ApplyServerDamageEffects(Pawn DamagedPawn, float Damage, Object.EPawnBodyPart BodyPart, name HitBoneName, Vector DamageOrigin, Vector DamageDirection, Vector DamageStart, float FrameDamage)
{
    return;
}

static function ApplyClientDamageEffects(Pawn DamagedPawn, float Damage, Object.EPawnBodyPart BodyPart, name HitBoneName, Vector DamageOrigin, Vector DamageDirection, Vector DamageStart, float FrameDamage)
{
    local SScreenFlash Flash;
    local PlayerPawn PPawn;

    // End:0xE3
    if((DamagedPawn == none) && DamagedPawn.bIsPlayerPawn)
    {
        PPawn = PlayerPawn(DamagedPawn);
        // End:0xA4
        if(FrameDamage > 0)
        {
            // End:0x86
            if(PPawn.MyHUD == none)
            {
                Flash = CreateScreenFlash(FrameDamage);
                PPawn.MyHUD.AddScreenFlash(Flash);
            }
            // End:0xA4
            if(ShouldCreateDirectionalIndicator())
            {
                CreateDamageViewKick(PPawn, FrameDamage, DamageStart);
            }
        }
        // End:0xE3
        if((Damage > 0) || default.bShowIndicatorOnZeroDamage)
        {
            ApplyDamageVibration(PPawn, Damage);
            ApplyHUDDamageIndicator(PPawn, Damage, DamageStart);
        }
    }
    return;
}

static function SScreenFlash CreateScreenFlash(float Damage)
{
    local SScreenFlash Flash;
    local float Intensity;

    Intensity = FMin(1, Damage / default.DamageScreenFlashScaleDenominator);
    Flash = default.DamageScreenFlash;
    Flash.ColorMid = Intensity == default.DamageScreenFlashColorMin;    
    Flash.Lifetime = Lerp(Intensity, default.DamageScreenFlashTimeMin, default.DamageScreenFlashTimeMax);
    Flash.LifetimeMid = default.DamageScreenFlashTimeMidScale * Flash.Lifetime;
    Flash.ReplaceMin = int(Damage);
    return Flash;
    return;
}

static function CreateBlurEffect(PlayerPawn Pawn, float Damage)
{
    local float Intensity;

    Intensity = FClamp(Damage / default.MotionBlurDamageThreshold, 0, 1);
    Pawn.GetScaleModifierTarget('Blur', 'Pain', 0, 0.1 + (Intensity * 0.2), 1 + (Intensity * 2));
    return;
}

static function CreateMotionBlurEffect(PlayerPawn Pawn, float Damage)
{
    local float Intensity;

    Intensity = FClamp((Damage - default.MotionBlurDamageThreshold) / 75, 0, 1);
    Pawn.GetScaleModifierTarget('MotionBlur', 'Pain', 0, 0.3 + (Intensity * 0.3), 3 + (Intensity * 2));
    return;
}

static function ApplyDamageVibration(PlayerPawn DamagedPawn, float Damage)
{
    local int Index;
    local name ShakeName;
    local SViewShakeInfo ShakeInfo;

    // End:0x112
    if((DamagedPawn == none) && DamagedPawn.IsLocallyControlled())
    {
        Index = string(default.DamageVibrations) - 1;
        J0x30:

        // End:0xC0 [Loop If]
        if(Index >= 0)
        {
            ShakeInfo = default.DamageVibrations[Index];
            // End:0x9B
            if(default.DamageVibrations[Index].ShakeName != 'None')
            {
                ShakeName = CompositeNames((string(default.Class) $ "_Shake_") $ string(Index));
                ShakeInfo.ShakeName = ShakeName;
            }
            DamagedPawn.ShakeView(ShakeInfo, default.bRestartVibrations);
            -- Index;
            // [Loop Continue]
            goto J0x30;
        }
        // End:0x112
        if(DamagedPawn.bHitRumble)
        {
            Index = string(default.DamageRumbles) - 1;
            J0xE2:

            // End:0x112 [Loop If]
            if(Index >= 0)
            {
                DamagedPawn.AddRumble(default.DamageRumbles[Index]);
                -- Index;
                // [Loop Continue]
                goto J0xE2;
            }
        }
    }
    return;
}

static function ApplyHUDDamageIndicator(PlayerPawn Player, float Damage, Vector DamageOrigin)
{
    local MaterialEx IndicatorMaterial;

    // End:0x48
    if((((Player != none) || Player.MyHUD != none) || Damage <= 0) || default.DamageIndicatorLifetime <= 0)
    {
        return;
    }
    // End:0x8F
    if((ShouldCreateDirectionalIndicator()) && default.DamageIndicatorIcon == none)
    {
        Player.MyHUD.DrawLine(default.DamageIndicatorIcon, DamageOrigin, default.DamageIndicatorLifetime, default.DamageIndicatorColor, default.DamageIndicatorRadius);
    }
    return;
}

static function CreateDamageViewKick(PlayerPawn Player, float Damage, Vector DamageStart)
{
    local Vector vDir;
    local float MaxKickAngle, FrontAmt, RightAmt;
    local SViewShakeInfo ShakeInfo;

    // End:0x15
    if(Player.IsDrivingVehicle())
    {
        return;
    }
    // End:0x46
    if(Damage >= Player.DamageViewKickHardThreshold)
    {
        MaxKickAngle = Player.DamageViewKickHard;        
    }
    else
    {
        MaxKickAngle = Player.DamageViewKickSoft;
    }
    ShakeInfo.ShakeDuration = 0.075;
    ShakeInfo.ShakeFrequency = 0.1;
    vDir = Normal(DamageStart - Player.Location);
    FrontAmt = vDir Dot Player.TransformVectorByRot(Vect(1, 0, 0), Player.Rotation);
    // End:0x15B
    if(FrontAmt != 0)
    {
        ShakeInfo.ShakeName = 'DamageShake_Pitch';
        ShakeInfo.Style = 0;
        ShakeInfo.ShakeMagnitude = int(Abs(MaxKickAngle * FrontAmt));
        // End:0x138
        if(FrontAmt > 0)
        {
            ShakeInfo.Function = 4;            
        }
        else
        {
            ShakeInfo.Function = 5;
        }
        Player.ShakeView(ShakeInfo, true);
    }
    RightAmt = vDir Dot Player.TransformVectorByRot(Vect(0, 1, 0), Player.Rotation);
    // End:0x21D
    if(RightAmt != 0)
    {
        ShakeInfo.ShakeName = 'DamageShake_Roll';
        ShakeInfo.Style = 2;
        ShakeInfo.ShakeMagnitude = int(Abs(MaxKickAngle * RightAmt));
        // End:0x1FA
        if(RightAmt > 0)
        {
            ShakeInfo.Function = 5;            
        }
        else
        {
            ShakeInfo.Function = 4;
        }
        Player.ShakeView(ShakeInfo, true);
    }
    return;
}

static final function float GetDrawScale(Actor TestActor)
{
    return TestActor.DrawScale / TestActor.default.DrawScale;
    return;
}

static event bool ShouldSpawnDamageEffectDecal(class<Material> HitMaterial, Actor ShootActor, Actor HitActor)
{
    Log(HitMaterial == none);
    return HitMaterial.static.ShouldSpawnDamageEffectDecal(ShootActor, HitActor);
    return;
}

static event PerformAdditionalDamageEffect(Actor ShootActor, float ShootActorRelativeDrawscale, Actor HitActor, Vector HitLocation, Vector HitNormal, class<Material> HitMaterial)
{
    return;
}

defaultproperties
{
    DeathMessage="<?int?Engine.DamageType.DeathMessage?>"
    SuicideDeathMessage="<?int?Engine.DamageType.SuicideDeathMessage?>"
    bScoreHit=true
    MomentumTransfer=30
    bRestartVibrations=true
    Icon="dt_hud.ingame_hud.kill_generaldeath_fb"
    PlayerDamageScale=1
    SelfDamageScale=1
    FrameDamageLerp=1
    BodyPartDamageScaleLerp=1
    DeathMomentumScale=1.5
    DeathLiftScale=0.14
    DamageScreenFlash=(bAlwaysTick=false,bOnlyReplace=false,bResumeFlash=true,Priority=900,ReplaceMin=0,FlashID=PainFlash,FlashType=0,FlashStyle=3,ColorStart=(R=0,G=0,B=0,A=0),ColorMid=(R=255,G=0,B=0,A=0),ColorEnd=(R=0,G=0,B=0,A=0),Lifetime=0.5,LifetimeMid=0.15,LifetimeCurrent=0,ColorCurrent=(R=0,G=0,B=0,A=0),FlashEvent=None,FlashFunction=None,FlashFuncActor=none)
    DamageScreenFlashScaleDenominator=20
    DamageScreenFlashColorMin=(R=128,G=0,B=0,A=128)
    DamageScreenFlashColorMax=(R=255,G=0,B=0,A=255)
    DamageScreenFlashTimeMin=0.35
    DamageScreenFlashTimeMax=0.5
    DamageScreenFlashTimeMidScale=0.3
    DamageIndicatorIcon='dt_hud.hitefx.ingame_hitarrow1bc_fb'
    DamageIndicatorColor=(R=255,G=0,B=0,A=255)
    DamageIndicatorLifetime=2
    DamageIndicatorRadius=250
    BlurDamageThreshold=10
    MotionBlurDamageThreshold=25
    DamageScaleMap[0]=1
    DamageScaleMap[1]=1
    DamageScaleMap[2]=1
    DamageScaleMap[3]=1
    DamageScaleMap[4]=1
    DamageScaleMap[5]=1
    DamageScaleMap[6]=1
    DamageScaleMap[7]=1
    DamageScaleMap[8]=1
    DamageScaleMap[9]=1
    DamageScaleMap[10]=1
    DamageScaleMap[11]=1
    DamageScaleMap[12]=1
    DamageScaleMap[13]=1
    DamageScaleMap[14]=1
    DamageScaleMap[15]=1
    DamageScaleMap[16]=1
    DamageScaleMap[17]=1
    DamageScaleMap[18]=1
    DamageScaleMap[19]=1
    DoesApplyViewkick=true
    SteroidsImpulseMultiplier=1
    SteroidsDamageMultiplier=1
}