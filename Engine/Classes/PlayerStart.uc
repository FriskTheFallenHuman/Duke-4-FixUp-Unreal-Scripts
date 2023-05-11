/*******************************************************************************
 * PlayerStart generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PlayerStart extends NavigationPoint
    native
    collapsecategories
    notplaceable;

var() noexport byte TeamNumber "Team 0 - Blue Team,  Team 1 - Red Team,  Team 2+ - No Team : also see Game Mode Implementation Instructions";
var() bool bSinglePlayerStart;
var() noexport bool bEnabled "Set to true if usable";
var() noexport bool bCaptureTheFlag "Set to true if usable in Capture the Babe";
var() noexport bool bKingOfTheHill "Set to true if usable in KOTH";
var() noexport bool bDeathMatch "Set to true if usable in Deathmatch";
var() noexport bool bTeamDeathMatch "Set to true if usable in Team Deathmatch";
var() noexport bool bInitial "Set to true if want to spawn there when first come into game : don't forget to set team for team games";
var() noexport bool bSpawnShrunk "Set to true if the player needs to spawn shrunk at this PlayerStart (SP Only)";
var() noexport Vector PositionalOverride "Set this to 'fool' the spawn system into thinking that its location is actually somewhere else.  Used with MP spawn logic which has problems with extreme locations to counteract spawn predicatbility.";

function Trigger(Actor Other, Pawn EventInstigator)
{
    bEnabled = ! bEnabled;
    return;
}

function PlayTeleportEffect(Actor Incoming, bool bOut)
{
    Level.Game.PlayTeleportEffect(Incoming, bOut, Level.Game.bDeathMatch);
    return;
}

event Vector GetSpawnLocation()
{
    return Location;
    return;
}

event Vector GetSpawnLocationWithOverride()
{
    // End:0x15
    if(PositionalOverride != default.PositionalOverride)
    {
        return PositionalOverride;
    }
    return Location;
    return;
}

function Rotator GetSpawnRotation()
{
    return Rotation;
    return;
}

defaultproperties
{
    bSinglePlayerStart=true
    bEnabled=true
    bDirectional=true
    CollisionRadius=18
    CollisionHeight=40
    Texture=Texture'S_Player'
}