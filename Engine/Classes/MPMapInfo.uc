/*******************************************************************************
 * MPMapInfo generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MPMapInfo extends Info
    native
    config(Maps)
    collapsecategories
    notplaceable
    hidecategories(movement,Collision,Lighting,LightColor,movement,Collision,Lighting,LightColor);

var config array<PlayListEntry> Playlist;
var config array<AvailableMaps> MapList;
var config array<AvailableGameTypes> GameTypes;
var config array<AvailableMutators> MutatorTypes;

event GetMapsForGameType(string GameType, out array<AvailableMaps> mapnames)
{
    local int i, j;
    local string GTPackageName, GTGroupName, GTDLCPackage, PackageName, GroupName, DLCPackage;

    IsInState(GameType, GTPackageName, GTGroupName, GTDLCPackage);
    mapnames.Empty();
    i = 0;
    J0x24:

    // End:0xCA [Loop If]
    if(i < string(MapList))
    {
        j = 0;
        J0x3B:

        // End:0xC0 [Loop If]
        if(j < string(MapList[i].SupportedGameTypes))
        {
            IsInState(MapList[i].SupportedGameTypes[j], PackageName, GroupName, DLCPackage);
            // End:0xB6
            if(GTGroupName == GroupName)
            {
                mapnames.Insert(string(mapnames), 1);
                mapnames[string(mapnames) - 1] = MapList[i];
            }
            ++ j;
            // [Loop Continue]
            goto J0x3B;
        }
        ++ i;
        // [Loop Continue]
        goto J0x24;
    }
    return;
}

event bool GetOptionsForGameType(string GameType, out AvailableGameTypes out_AvailableGameTypes)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4F [Loop If]
    if(i < string(GameTypes))
    {
        // End:0x45
        if(GameTypes[i].EntryName == GameType)
        {
            out_AvailableGameTypes = GameTypes[i];
            return true;
        }
        ++ i;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    return;
}

event GetMapPackageSwap(string GameType, string inMapName, out string SwappedPackage)
{
    local string GTPackageName, GTGroupName, GTDLCPackage, PackageName, GroupName, DLCPackage;

    local int i, j;

    IsInState(GameType, GTPackageName, GTGroupName, GTDLCPackage);
    i = 0;
    J0x1E:

    // End:0xD5 [Loop If]
    if(i < string(MapList))
    {
        // End:0xCB
        if(MapList[i].MapName == inMapName)
        {
            j = 0;
            J0x50:

            // End:0xCB [Loop If]
            if(j < string(MapList[i].SupportedGameTypes))
            {
                IsInState(MapList[i].SupportedGameTypes[j], PackageName, GroupName, DLCPackage);
                // End:0xC1
                if(GTGroupName == GroupName)
                {
                    SwappedPackage = MapList[i].SupportedGameTypes[j];
                    return;
                }
                ++ j;
                // [Loop Continue]
                goto J0x50;
            }
        }
        ++ i;
        // [Loop Continue]
        goto J0x1E;
    }
    SwappedPackage = GameType;
    return;
}

defaultproperties
{
    Playlist(0)=(EntryName="Any",Entry=none,id=-1,IsInfinite=false,MaxPlayers=0,IsRandom=false)
    Playlist(1)=(EntryName="AllMapsDM",Entry=((MapName="DM-MorningWood",Mutator="None",GameType="dnGame.dnDeathmatchGame"),(MapName="DM-Hive",Mutator="None",GameType="dnGame.dnDeathmatchGame"),(MapName="DM-Casino",Mutator="None",GameType="dnGame.dnDeathmatchGame"),(MapName="DM-Industrial",Mutator="None",GameType="dnGame.dnDeathmatchGame"),(MapName="DM-Construction",Mutator="None",GameType="dnGame.dnDeathmatchGame"),(MapName="DM-BuckeyeBurger",Mutator="None",GameType="dnGame.dnDeathmatchGame"),(MapName="DM-VegasRuins",Mutator="None",GameType="dnGame.dnDeathmatchGame"),(MapName="DM-HighwayNoon",Mutator="None",GameType="dnGame.dnDeathmatchGame"),(MapName="DM-HooverDamned",Mutator="None",GameType="dnGame.dnDeathmatchGame"),(MapName="DM-Hollywood",Mutator="None",GameType="dnGame.dnDeathmatchGame")),id=0,IsInfinite=true,MaxPlayers=0,IsRandom=true)
    Playlist(2)=(EntryName="AllMapsTDM",Entry=((MapName="DM-MorningWood",Mutator="None",GameType="dnGame.dnDeathmatchGame_TeamDM"),(MapName="DM-Hive",Mutator="None",GameType="dnGame.dnDeathmatchGame_TeamDM"),(MapName="DM-Casino",Mutator="None",GameType="dnGame.dnDeathmatchGame_TeamDM"),(MapName="DM-Industrial",Mutator="None",GameType="dnGame.dnDeathmatchGame_TeamDM"),(MapName="DM-Construction",Mutator="None",GameType="dnGame.dnDeathmatchGame_TeamDM"),(MapName="DM-BuckeyeBurger",Mutator="None",GameType="dnGame.dnDeathmatchGame_TeamDM"),(MapName="DM-VegasRuins",Mutator="None",GameType="dnGame.dnDeathmatchGame_TeamDM"),(MapName="DM-HighwayNoon",Mutator="None",GameType="dnGame.dnDeathmatchGame_TeamDM"),(MapName="DM-HooverDamned",Mutator="None",GameType="dnGame.dnDeathmatchGame_TeamDM"),(MapName="DM-Hollywood",Mutator="None",GameType="dnGame.dnDeathmatchGame_TeamDM")),id=1,IsInfinite=true,MaxPlayers=0,IsRandom=true)
    Playlist(3)=(EntryName="AllMapsCTB",Entry=((MapName="DM-MorningWood",Mutator="None",GameType="dnGame.dnCaptureTheBabe"),(MapName="DM-Hive",Mutator="None",GameType="dnGame.dnCaptureTheBabe"),(MapName="DM-Casino",Mutator="None",GameType="dnGame.dnCaptureTheBabe"),(MapName="DM-Industrial",Mutator="None",GameType="dnGame.dnCaptureTheBabe"),(MapName="DM-Construction",Mutator="None",GameType="dnGame.dnCaptureTheBabe"),(MapName="DM-VegasRuins",Mutator="None",GameType="dnGame.dnCaptureTheBabe"),(MapName="DM-HooverDamned",Mutator="None",GameType="dnGame.dnCaptureTheBabe"),(MapName="DM-Hollywood",Mutator="None",GameType="dnGame.dnCaptureTheBabe")),id=2,IsInfinite=true,MaxPlayers=0,IsRandom=true)
    Playlist(4)=(EntryName="AllMapsKOTH",Entry=((MapName="DM-MorningWood",Mutator="None",GameType="dnGame.dnKingOfTHeHill"),(MapName="DM-Hive",Mutator="None",GameType="dnGame.dnKingOfTHeHill"),(MapName="DM-Casino",Mutator="None",GameType="dnGame.dnKingOfTHeHill"),(MapName="DM-Industrial",Mutator="None",GameType="dnGame.dnKingOfTHeHill"),(MapName="DM-Construction",Mutator="None",GameType="dnGame.dnKingOfTHeHill"),(MapName="DM-VegasRuins",Mutator="None",GameType="dnGame.dnKingOfTHeHill"),(MapName="DM-HooverDamned",Mutator="None",GameType="dnGame.dnKingOfTHeHill"),(MapName="DM-Hollywood",Mutator="None",GameType="dnGame.dnKingOfTHeHill")),id=3,IsInfinite=true,MaxPlayers=0,IsRandom=true)
    MapList(0)=(id=0,IsDLC=false,MapName="DM-MorningWood",SupportedGameTypes=("dnGame.dnDeathmatchGame","dnGame.dnDeathmatchGame_TeamDM","dnGame.dnCaptureTheBabe","dnGame.dnKingOfTheHill"))
    MapList(1)=(id=1,IsDLC=false,MapName="DM-HooverDamned",SupportedGameTypes=("dnGame.dnDeathmatchGame","dnGame.dnDeathmatchGame_TeamDM","dnGame.dnCaptureTheBabe","dnGame.dnKingOfTheHill"))
    MapList(2)=(id=2,IsDLC=false,MapName="DM-BuckeyeBurger",SupportedGameTypes=("dnGame.dnDeathmatchGame","dnGame.dnDeathmatchGame_TeamDM","dnGame.dnKingOfTheHill"))
    MapList(3)=(id=3,IsDLC=false,MapName="DM-VegasRuins",SupportedGameTypes=("dnGame.dnDeathmatchGame","dnGame.dnDeathmatchGame_TeamDM","dnGame.dnCaptureTheBabe","dnGame.dnKingOfTheHill"))
    MapList(4)=(id=4,IsDLC=false,MapName="DM-Hive",SupportedGameTypes=("dnGame.dnDeathmatchGame","dnGame.dnDeathmatchGame_TeamDM","dnGame.dnCaptureTheBabe","dnGame.dnKingOfTheHill"))
    MapList(5)=(id=5,IsDLC=false,MapName="DM-Industrial",SupportedGameTypes=("dnGame.dnDeathmatchGame","dnGame.dnDeathmatchGame_TeamDM","dnGame.dnCaptureTheBabe","dnGame.dnKingOfTheHill"))
    MapList(6)=(id=6,IsDLC=false,MapName="DM-Casino",SupportedGameTypes=("dnGame.dnDeathmatchGame","dnGame.dnDeathmatchGame_TeamDM","dnGame.dnCaptureTheBabe","dnGame.dnKingOfTheHill"))
    MapList(7)=(id=7,IsDLC=false,MapName="DM-Construction",SupportedGameTypes=("dnGame.dnDeathmatchGame","dnGame.dnDeathmatchGame_TeamDM","dnGame.dnKingOfTheHill"))
    MapList(8)=(id=9,IsDLC=false,MapName="DM-HighwayNoon",SupportedGameTypes=("dnGame.dnDeathmatchGame","dnGame.dnDeathmatchGame_TeamDM","dnGame.dnCaptureTheBabe","dnGame.dnKingOfTheHill"))
    MapList(9)=(id=10,IsDLC=false,MapName="DM-Hollywood",SupportedGameTypes=("dnGame.dnDeathmatchGame","dnGame.dnDeathmatchGame_TeamDM","dnGame.dnKingOfTheHill"))
    GameTypes(0)=(id=0,EntryName="dnGame.dnDeathmatchGame",PlayerStep=1,bUseWinCondition=true,WinConditionMin=10,WinConditionMax=100,WinConditionStep=10,WinConditionDefault=20,WinConditionText="MaxScoreSelect_MaxKills",WinConditionOptionName="FragLimit",ExcludedMutators=none,bUIExclude=false)
    GameTypes(1)=(id=1,EntryName="dnGame.dnDeathmatchGame_TeamDM",PlayerStep=2,bUseWinCondition=true,WinConditionMin=10,WinConditionMax=100,WinConditionStep=10,WinConditionDefault=50,WinConditionText="MaxScoreSelect_TeamMaxKills",WinConditionOptionName="GoalTeamScore",ExcludedMutators=none,bUIExclude=false)
    GameTypes(2)=(id=2,EntryName="dnGame.dnCaptureTheBabe",PlayerStep=2,bUseWinCondition=true,WinConditionMin=5,WinConditionMax=15,WinConditionStep=1,WinConditionDefault=5,WinConditionText="MaxScoreSelect_MaxCaptures",WinConditionOptionName="CaptureLimit",ExcludedMutators=none,bUIExclude=false)
    GameTypes(3)=(id=3,EntryName="dnGame.dnKingOfTheHill",PlayerStep=2,bUseWinCondition=true,WinConditionMin=50,WinConditionMax=250,WinConditionStep=50,WinConditionDefault=100,WinConditionText="MaxScoreSelect_MaxCaptureTime",WinConditionOptionName="CaptureTime",ExcludedMutators=none,bUIExclude=false)
    MutatorTypes(0)=(id=0,EntryName="None")
    MutatorTypes(1)=(id=1,EntryName="dnGame.dnMutator_InfiniteAmmo")
    MutatorTypes(2)=(id=2,EntryName="dnGame.dnMutator_InstaGib")
    MutatorTypes(3)=(id=3,EntryName="dnGame.dnMutator_Heavy")
    MutatorTypes(4)=(id=4,EntryName="dnGame.dnMutator_Knuckle")
    MutatorTypes(5)=(id=5,EntryName="dnGame.dnMutator_Shotgun")
}