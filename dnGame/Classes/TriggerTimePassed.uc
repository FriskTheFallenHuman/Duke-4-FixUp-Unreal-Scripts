/*******************************************************************************
 * TriggerTimePassed generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerTimePassed extends Triggers
    collapsecategories
    hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

var float LastTriggerTime;

function PostBeginPlay()
{
    LastTriggerTime = Level.GameTimeSeconds;
    return;
}

function Trigger(Actor Other, Pawn Instigator)
{
    BroadcastMessage(("Time passed since last trigger: " $ string(Level.GameTimeSeconds - LastTriggerTime)) $ "");
    LastTriggerTime = Level.GameTimeSeconds;
    return;
}