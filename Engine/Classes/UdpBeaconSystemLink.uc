/*******************************************************************************
 * UdpBeaconSystemLink generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UdpBeaconSystemLink extends UdpLink
    transient
    native
    collapsecategories
    notplaceable
    hidecategories(movement,Collision,Lighting,LightColor);

var() int ServerBeaconPort;

// Export UUdpBeaconSystemLink::execBroadcastBeacon(FFrame&, void* const)
native function BroadcastBeacon(IpAddr Addr, int Nonce);

function BeginPlay()
{
    local IpAddr Addr;
    local int boundport;

    boundport = ReadBinary(ServerBeaconPort, true);
    // End:0x4E
    if(boundport == 0)
    {
        Localize("UdpBeaconSystemLink failed to bind a port.");
        return;        
    }
    else
    {
        Localize("UdpBeaconSystemLink bound to port" @ string(boundport));
    }
    return;
}

event ReceivedText(IpAddr Addr, string Text)
{
    local int n, Nonce;

    n = Len("REPORT");
    // End:0x67
    if(Left(Text, n + 1) ~= "REPORT ")
    {
        Addr.Addr = BroadcastAddr;
        Nonce = int(Mid(Text, n + 1));
        BroadcastBeacon(Addr, Nonce);
    }
    return;
}

defaultproperties
{
    ServerBeaconPort=1001
}