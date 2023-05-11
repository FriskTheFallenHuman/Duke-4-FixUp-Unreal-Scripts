/*******************************************************************************
 * ExplosionDamage generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ExplosionDamage extends DamageType
    abstract;

var float DeafenThreshold;

static function ApplyClientDamageEffects(Pawn DamagedPawn, float Damage, Object.EPawnBodyPart BodyPart, name HitBoneName, Vector DamageOrigin, Vector DamageDirection, Vector DamageStart, float FrameDamage)
{
    // End:0x37
    if((Damage > default.DeafenThreshold) && DamagedPawn == none)
    {
        DamagedPawn.ClientDeafen(5, 0.5);
    }
    super.ApplyClientDamageEffects(DamagedPawn, Damage, BodyPart, HitBoneName, DamageOrigin, DamageDirection, DamageStart, FrameDamage);
    return;
}

static function bool CanGibCorpses()
{
    return true;
    return;
}

static function bool ShouldCreateDirectionalIndicator()
{
    return true;
    return;
}

defaultproperties
{
    DeafenThreshold=50
    DeathMessage="<?int?Engine.ExplosionDamage.DeathMessage?>"
    SuicideDeathMessage="<?int?Engine.ExplosionDamage.SuicideDeathMessage?>"
    MomentumTransfer=2500
    Icon="dt_hud.ingame_hud.kill_explosive_barrel"
}