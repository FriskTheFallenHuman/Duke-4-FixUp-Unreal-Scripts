/*******************************************************************************
 * Settings_Construction_Jersey_Barrier_Chunk generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Settings_Construction_Jersey_Barrier_Chunk extends Pillars_Destructible_Chunk;

event Destroyed()
{
    super.Destroyed();
    KFindPhysicsAction(7);
    return;
}

defaultproperties
{
    DynamicInteractionClassification=0
}