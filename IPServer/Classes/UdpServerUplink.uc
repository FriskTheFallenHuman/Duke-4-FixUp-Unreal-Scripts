/*******************************************************************************
 * UdpServerUplink generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UdpServerUplink extends UdpLink
    transient
    config
    collapsecategories
    hidecategories(movement,Collision,Lighting,LightColor);

var() config bool DoUplink;
var() config int UpdateMinutes;
var() config string MasterServerAddress;
var() config int MasterServerPort;
var() config int ServerRegion;
var() name TargetQueryName;
var IpAddr MasterServerIpAddr;
var string HeartbeatMessage;
var UdpServerQuery Query;
var int CurrentQueryNum;

function PreBeginPlay()
{
    // End:0x48
    if(! DoUplink)
    {
        Localize("DoUplink is not set.  Not connecting to Master Server.");
        return;
    }
    // End:0x61
    foreach RotateVectorAroundAxis(class'UdpServerQuery', Query, TargetQueryName)
    {
        // End:0x61
        break;        
    }    
    // End:0xB7
    if(Query != none)
    {
        Localize("UdpServerUplink: Could not find a UdpServerQuery object, aborting.");
        return;
    }
    HeartbeatMessage = (("\\heartbeat\\" $ string(Query.Port)) $ "\\gamename\\") $ Query.GameName;
    MasterServerIpAddr.Port = MasterServerPort;
    // End:0x143
    if(MasterServerAddress == "")
    {
        MasterServerAddress = ("master" $ string(ServerRegion)) $ ".gamespy.com";
    }
    Open(MasterServerAddress);
    return;
}

function Resolved(IpAddr Addr)
{
    local bool Result;
    local int UplinkPort;

    MasterServerIpAddr.Addr = Addr.Addr;
    // End:0x65
    if(MasterServerIpAddr.Addr == 0)
    {
        Localize("UdpServerUplink: Invalid master server address, aborting.");
        return;
    }
    Localize((("UdpServerUplink: Master Server is " $ MasterServerAddress) $ ":") $ string(MasterServerIpAddr.Port));
    UplinkPort = Query.Port + 1;
    // End:0x104
    if(ReadBinary(UplinkPort, true) == 0)
    {
        Localize("UdpServerUplink: Error binding port, aborting.");
        return;
    }
    Localize(("UdpServerUplink: Port " $ string(UplinkPort)) $ " successfully bound.");
    Resume();
    return;
}

function ResolveFailed()
{
    Localize("UdpServerUplink: Failed to resolve master server address, aborting.");
    return;
}

function HeartbeatTimer()
{
    local bool Result;

    Result = ZoneActors(MasterServerIpAddr, HeartbeatMessage);
    // End:0x4E
    if(! Result)
    {
        Localize("Failed to send heartbeat to master server.");
    }
    return;
}

function halt()
{
    Spawn('HeartbeatTimer');
    return;
}

function Resume()
{
    Destroy(float(UpdateMinutes * 60), true, 'HeartbeatTimer');
    HeartbeatTimer();
    return;
}

event ReceivedText(IpAddr Addr, string Text)
{
    local string Query;
    local bool QueryRemaining;
    local int QueryNum, PacketNum;

    ++ CurrentQueryNum;
    // End:0x1A
    if(CurrentQueryNum > 100)
    {
        CurrentQueryNum = 1;
    }
    QueryNum = CurrentQueryNum;
    Query = Text;
    // End:0x48
    if(Query == "")
    {
        QueryRemaining = false;        
    }
    else
    {
        QueryRemaining = true;
    }
    J0x50:

    // End:0x9C [Loop If]
    if(QueryRemaining)
    {
        Query = ParseQuery(Addr, Query, QueryNum, PacketNum);
        // End:0x91
        if(Query == "")
        {
            QueryRemaining = false;            
        }
        else
        {
            QueryRemaining = true;
        }
        // [Loop Continue]
        goto J0x50;
    }
    return;
}

function bool ParseNextQuery(string Query, out string QueryType, out string QueryValue, out string QueryRest, out string FinalPacket)
{
    local string TempQuery;
    local int ClosingSlash;

    // End:0x0F
    if(Query == "")
    {
        return false;
    }
    // End:0x17A
    if(Left(Query, 1) == "\\")
    {
        ClosingSlash = InStr(Right(Query, Len(Query) - 1), "\\");
        // End:0x4D
        if(ClosingSlash == 0)
        {
            return false;
        }
        TempQuery = Query;
        QueryType = Right(Query, Len(Query) - 1);
        QueryType = Left(QueryType, ClosingSlash);
        QueryRest = Right(Query, Len(Query) - (Len(QueryType) + 2));
        // End:0xD7
        if((QueryRest == "") || Len(QueryRest) == 1)
        {
            FinalPacket = "final";
            return true;            
        }
        else
        {
            // End:0xEB
            if(Left(QueryRest, 1) == "\\")
            {
                return true;
            }
        }
        ClosingSlash = InStr(QueryRest, "\\");
        // End:0x11D
        if(ClosingSlash >= 0)
        {
            QueryValue = Left(QueryRest, ClosingSlash);            
        }
        else
        {
            QueryValue = QueryRest;
        }
        QueryRest = Right(Query, Len(Query) - ((Len(QueryType) + Len(QueryValue)) + 3));
        // End:0x175
        if(QueryRest == "")
        {
            FinalPacket = "final";
            return true;            
        }
        else
        {
            return true;
        }        
    }
    else
    {
        return false;
    }
    return;
}

function string ParseQuery(IpAddr Addr, coerce string QueryStr, int QueryNum, out int PacketNum)
{
    local string QueryType, QueryValue, QueryRest, ValidationString;
    local bool Result;
    local string FinalPacket;

    Result = ParseNextQuery(QueryStr, QueryType, QueryValue, QueryRest, FinalPacket);
    // End:0x34
    if(! Result)
    {
        return "";
    }
    // End:0x51
    if(QueryType == "basic")
    {
        Result = true;        
    }
    else
    {
        // End:0xBB
        if(QueryType == "secure")
        {
            ValidationString = "\\validate\\" $ SendBinary(QueryValue, Query.GameName);
            Result = SendQueryPacket(Addr, ValidationString, QueryNum, ++ PacketNum, FinalPacket);            
        }
        else
        {
            Localize("UdpServerQuery: Unknown query: " $ QueryType);
        }
    }
    // End:0x121
    if(! Result)
    {
        Localize("UdpServerQuery: Error responding to query.");
    }
    return QueryRest;
    return;
}

function bool SendQueryPacket(IpAddr Addr, coerce string SendString, int QueryNum, int PacketNum, string FinalPacket)
{
    local bool Result;

    // End:0x29
    if(FinalPacket == "final")
    {
        SendString = SendString $ "\\final\\";
    }
    SendString = (((SendString $ "\\queryid\\") $ string(QueryNum)) $ ".") $ string(PacketNum);
    Result = ZoneActors(Addr, SendString);
    return Result;
    return;
}

defaultproperties
{
    DoUplink=true
    UpdateMinutes=1
    MasterServerAddress="dnf.3drealms.com"
    MasterServerPort=27900
    TargetQueryName=MasterUplink
}