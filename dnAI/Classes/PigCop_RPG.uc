/*******************************************************************************
 * PigCop_RPG generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PigCop_RPG extends PigCop_Captain
    config
    collapsecategories;

static function class<AIActor> GetSpawnClass(AIActorFactory Factory)
{
    return default.Class;
    return;
}

defaultproperties
{
    WeaponConfig='WeaponCfg_PigCopRPG'
}