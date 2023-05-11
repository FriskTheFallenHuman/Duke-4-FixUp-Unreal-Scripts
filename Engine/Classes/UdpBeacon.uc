/*******************************************************************************
 * UdpBeacon generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UdpBeacon extends UdpLink
    transient
    config
    collapsecategories
    notplaceable
    hidecategories(movement,Collision,Lighting,LightColor);

var() globalconfig bool DoBeacon;
var() globalconfig int ServerBeaconPort;
var() globalconfig int BeaconPort;
var() globalconfig float BeaconTimeout;
var() globalconfig string BeaconProduct;
var int UdpServerQueryPort;
var int boundport;

function BeginPlay()
{
    local IpAddr Addr;

    boundport = ReadBinary(ServerBeaconPort, true);
    // End:0x41
    if(boundport == 0)
    {
        Localize("UdpBeacon failed to bind a port.");
        return;
    }
    Addr.Addr = BroadcastAddr;
    Addr.Port = BeaconPort;
    BroadcastBeacon(Addr);
    return;
}

function BroadcastBeacon(IpAddr Addr)
{
    ZoneActors(Addr, (BeaconProduct @ Mid(Level.GetAddressURL(), InStr(Level.GetAddressURL(), ":") + 1)) @ Level.Game.GetBeaconText());
    return;
}

function BroadcastBeaconQuery(IpAddr Addr)
{
    ZoneActors(Addr, BeaconProduct @ string(UdpServerQueryPort));
    return;
}

event ReceivedText(IpAddr Addr, string Text)
{
    // End:0x1E
    if(Text == "REPORT")
    {
        BroadcastBeacon(Addr);
    }
    // End:0x41
    if(Text == "REPORTQUERY")
    {
        BroadcastBeaconQuery(Addr);
    }
    return;
}

function Destroyed()
{
    super(Actor).Destroyed();
    return;
}

defaultproperties
{
    DoBeacon=true
    ServerBeaconPort=8777
    BeaconPort=9777
    BeaconTimeout=5
    BeaconProduct="dnf"
}