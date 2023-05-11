/*******************************************************************************
 * ShrinkerDamage generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ShrinkerDamage extends DamageType
    abstract;

var() noexport float ShrinkTime "Time a pawn hit with this will remain shrunken.";

static function float ReduceDamage(Pawn DamagedPawn, float inDamage, Pawn DamageInstigator)
{
    DamagedPawn.TakeShrinkerDamage(DamageInstigator);
    return 0;
    return;
}

static function ApplyServerDamageEffects(Pawn DamagedPawn, float Damage, Object.EPawnBodyPart BodyPart, name HitBoneName, Vector DamageOrigin, Vector DamageDirection, Vector DamageStart, float FrameDamage)
{
    super.ApplyServerDamageEffects(DamagedPawn, Damage, BodyPart, HitBoneName, DamageOrigin, DamageDirection, DamageStart, FrameDamage);
    // End:0x81
    if((DamagedPawn.CanShrink(default.Class) || default.ShrinkTime < 0) && DamagedPawn.TakenEnoughShrinkerDamage())
    {
        DamagedPawn.ShrinkPawn(default.ShrinkTime);
    }
    return;
}

defaultproperties
{
    ShrinkTime=12
    DamageName="<?int?Engine.ShrinkerDamage.DamageName?>"
    DeathMessage="<?int?Engine.ShrinkerDamage.DeathMessage?>"
    SuicideDeathMessage="<?int?Engine.ShrinkerDamage.SuicideDeathMessage?>"
    MomentumTransfer=0
    DamageRumbles(0)=(RumbleName=TraceDamageRumble,RumbleDuration=0.1,RumbleLeftMagnitude=0.7,RumbleRightMagnitude=0.7,FalloffActor=none,FalloffDistance=0)
    bIgnoreDrawScale=true
}