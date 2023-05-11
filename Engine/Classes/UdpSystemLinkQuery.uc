/*******************************************************************************
 * UdpSystemLinkQuery generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UdpSystemLinkQuery extends UdpLink
    transient
    native
    collapsecategories
    notplaceable
    hidecategories(movement,Collision,Lighting,LightColor);

struct SystemLinkGame
{
    var int NumPlayers;
    var int MaxPlayers;
    var string MapName;
    var byte GameInfo[255];
};

var int Nonce;
var int ServerBeaconPort;
var array<SystemLinkGame> GameList;

// Export UUdpSystemLinkQuery::execServerReceived(FFrame&, void* const)
native function ServerReceived(out byte B[255], int Count);

// Export UUdpSystemLinkQuery::execBindToSystemLinkGame(FFrame&, void* const)
native function BindToSystemLinkGame(int GameIndex, out string address, out int KeyIDUpper, out int KeyIDLower);

function BeginPlay()
{
    local int Port;

    Port = ReadBinary();
    // End:0x52
    if(Port == 0)
    {
        Localize("UDukeSystemLinkQuery: Could not bind to a free port.");
        return;        
    }
    else
    {
        Localize("UDukeSystemLinkQuery: bound to port" @ string(Port));
    }
    return;
}

function Query()
{
    local IpAddr Addr;
    local int i;

    LinkMode = 2;
    Nonce = Rand(2147483647);
    GameList.Empty();
    Addr.Addr = BroadcastAddr;
    Addr.Port = ServerBeaconPort;
    ZoneActors(Addr, "REPORT" @ string(Nonce));
    return;
}

event ReceivedBinary(IpAddr Addr, int Count, byte B[255])
{
    local int i;

    ServerReceived(B, Count);
    return;
}

defaultproperties
{
    ServerBeaconPort=1001
}