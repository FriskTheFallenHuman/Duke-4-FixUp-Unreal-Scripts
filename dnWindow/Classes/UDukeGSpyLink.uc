/*******************************************************************************
 * UDukeGSpyLink generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeGSpyLink extends UBrowserBufferedTCPLink
    transient
    collapsecategories
    dependson(UDukeGSpyFact)
    hidecategories(movement,Collision,Lighting,LightColor);

const FoundSecureRequest = 1;
const FoundSecret = 2;
const NextIP = 3;
const NextAddress = 4;

var UDukeGSpyFact OwnerFactory;
var IpAddr MasterServerIpAddr;
var bool bOpened;
var string MasterServerAddress;
var int MasterServerTCPPort;
var int Region;
var int MasterServerTimeout;
var string GameName;
var localized string ResolveFailedError;
var localized string TimeOutError;
var localized string CouldNotConnectError;

function BeginPlay()
{
    GetPropertyText('Tick');
    super(Actor).BeginPlay();
    return;
}

function Start()
{
    ResetBuffer();
    MasterServerIpAddr.Port = MasterServerTCPPort;
    // End:0x3F
    if(MasterServerAddress == "")
    {
        MasterServerAddress = "dukenet.3drealms.com";
    }
    Open(MasterServerAddress);
    return;
}

function DoBufferQueueIO()
{
    super.DoBufferQueueIO();
    return;
}

function Resolved(IpAddr Addr)
{
    MasterServerIpAddr.Addr = Addr.Addr;
    // End:0x63
    if(MasterServerIpAddr.Addr == 0)
    {
        Localize("UDukeGSpyLink: Invalid master server address, aborting.");
        return;
    }
    Localize((("UDukeGSpyLink: Master Server is " $ MasterServerAddress) $ ":") $ string(MasterServerIpAddr.Port));
    // End:0xE6
    if(RegisterLevelEvent() == 0)
    {
        Localize("UDukeGSpyLink: Error binding local port, aborting.");
        return;
    }
    PerformStandaloneSimulation(MasterServerIpAddr);
    Destroy(float(MasterServerTimeout), false, 'MasterServerTimeoutCallback');
    return;
}

function MasterServerTimeoutCallback()
{
    // End:0x67
    if(! bOpened)
    {
        Localize("UDukeGSpyLink: Couldn't connect to master server.");
        OwnerFactory.QueryFinished(false, CouldNotConnectError $ MasterServerAddress);
        GetStateName('Done');
    }
    return;
}

event Closed()
{
    return;
}

function ResolveFailed()
{
    Localize("UDukeGSpyLink: Failed to resolve master server address, aborting.");
    OwnerFactory.QueryFinished(false, ResolveFailedError $ MasterServerAddress);
    GetStateName('Done');
    return;
}

event Opened()
{
    bOpened = true;
    Disable('Tick');
    WaitFor("\\basic\\\\secure\\", 5, 1);
    return;
}

function Tick(float DeltaTime)
{
    DoBufferQueueIO();
    return;
}

function HandleServer(string Text)
{
    local string address, Port;

    // End:0x19
    if(Text == "NoServers\\")
    {
        return;
    }
    address = ParseDelimited(Text, ":", 1);
    Port = ParseDelimited(ParseDelimited(Text, ":", 2), "\\", 1);
    OwnerFactory.FoundServer(address, int(Port), "", GameName);
    return;
}

function GotMatch(int MatchData)
{
    switch(MatchData)
    {
        // End:0x26
        case 1:
            Disable('Tick');
            WaitForCount(6, 5, 2);
            // End:0x11B
            break;
        // End:0x9B
        case 2:
            Disable('Tick');
            SendBufferedData(((((("\\gamename\\" $ GameName) $ "\\location\\") $ string(Region)) $ "\\validate\\") $ SendBinary(WaitResult, GameName)) $ "\\final\\");
            GetStateName('FoundSecretState');
            // End:0x11B
            break;
        // End:0xEA
        case 3:
            Disable('Tick');
            // End:0xD7
            if(WaitResult == "final\\")
            {
                OwnerFactory.QueryFinished(true);
                GetStateName('Done');                
            }
            else
            {
                WaitFor("\\", 10, 4);
            }
            // End:0x11B
            break;
        // End:0x115
        case 4:
            Disable('Tick');
            HandleServer(WaitResult);
            WaitFor("\\", 5, 3);
            // End:0x11B
            break;
        // End:0xFFFF
        default:
            // End:0x11B
            break;
            break;
    }
    return;
}

function GotMatchTimeout(int MatchData)
{
    Localize((("Timed out in master server protocol.  Waiting for " $ WaitingFor) $ " in state ") $ string(MatchData));
    OwnerFactory.QueryFinished(false, TimeOutError);
    GetStateName('Done');
    return;
}

state FoundSecretState
{
    function Tick(float Delta)
    {
        global.Tick(Delta);
        // End:0x42
        if(! CheckAIGate() && WaitResult == "\\final\\")
        {
            OwnerFactory.QueryFinished(true);
            GetStateName('Done');
        }
        return;
    }
Begin:

    Disable('Tick');
    SendBufferedData(("\\list\\\\gamename\\" $ GameName) $ "\\final\\");
    WaitFor("ip\\", 30, 3);
    stop;    
}

state Done
{Begin:

    GetPropertyText('Tick');
    stop;            
}

defaultproperties
{
    ResolveFailedError="<?int?dnWindow.UDukeGSpyLink.ResolveFailedError?>"
    TimeOutError="<?int?dnWindow.UDukeGSpyLink.TimeOutError?>"
    CouldNotConnectError="<?int?dnWindow.UDukeGSpyLink.CouldNotConnectError?>"
}