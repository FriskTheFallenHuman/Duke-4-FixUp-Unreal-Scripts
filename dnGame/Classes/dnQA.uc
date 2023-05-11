/*******************************************************************************
 * dnQA generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnQA extends TcpLink
    transient
    config(User)
    collapsecategories
    hidecategories(movement,Collision,Lighting,LightColor);

var IpAddr QAServerIpAddr;
var() config string QAServerAddress;
var() config int QAServerPort;
var bool bOpenSuccess;
var string LastMapFileName;
var DukePlayer Duke;

function Connect(DukePlayer inDuke)
{
    // End:0x20
    if(! CheckAIGate())
    {
        QAServerIpAddr.Port = QAServerPort;
        Open(QAServerAddress);
    }
    Duke = inDuke;
    LinkMode = 1;
    return;
}

function Disconnect()
{
    local string disconnectmessage;

    // End:0x5D
    if(CheckAIGate())
    {
        disconnectmessage = (("DISCONNECT machine:" @ Level.ComputerName) @ ", dnQA:") @ string(Duke.default.dnQAState);
        UpdateAIGate(disconnectmessage);
        PerformTeamDialog();
    }
    BroadcastLog("dnQA disabled");
    return;
}

function Resolved(IpAddr Addr)
{
    QAServerIpAddr.Addr = Addr.Addr;
    // End:0x53
    if(QAServerIpAddr.Addr == 0)
    {
        BroadcastLog("Invalid master QA address, aborting.");
        return;
    }
    // End:0x8C
    if(RegisterLevelEvent() == 0)
    {
        BroadcastLog("Error binding QA local port, aborting.");
        return;
    }
    bOpenSuccess = false;
    PerformStandaloneSimulation(QAServerIpAddr);
    return;
}

event Opened()
{
    local string connectmessage;

    bOpenSuccess = true;
    super.Opened();
    LinkMode = 1;
    connectmessage = (((("CONNECT machine:" @ Level.ComputerName) @ ", builddate:") @ Level.EngineBuildDate) @ ", dnQA:") @ string(Duke.default.dnQAState);
    UpdateAIGate(connectmessage);
    EnterMap(Level.MapFileName);
    BroadcastLog("dnQA: Connected to" @ QAServerAddress);
    return;
}

event Closed()
{
    super.Closed();
    // End:0x44
    if(! bOpenSuccess)
    {
        BroadcastLog((("Failed to connect to" @ QAServerAddress) $ ":") $ string(QAServerPort));
    }
    return;
}

function string TwoDigitString(int Num)
{
    // End:0x1C
    if(Num < 10)
    {
        return "0" $ string(Num);        
    }
    else
    {
        return string(Num);
    }
    return;
}

function Update()
{
    local string updatemessage, WeaponName, WeaponString;
    local Inventory Inv;
    local Weapon Weap;

    // End:0x38D
    if(CheckAIGate())
    {
        updatemessage = ((((((((((((((((((((((((((((((((((((("DATA" @ "machine:") @ Level.ComputerName) @ ", dnQA:") @ string(Duke.default.dnQAState)) @ ", map:") @ Level.MapFileName) @ ", maptime:") @ string(int(Level.GameTimeSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.GameTimeSeconds % float(60))))) @ ", sessiontime:") @ string(int(Level.SessionSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.SessionSeconds % float(60))))) @ ", lastcp:") @ Duke.QALastCheckpoint) @ ", pos:") @ string(Duke.Location.X)) @ string(Duke.Location.Y)) @ string(Duke.Location.Z)) @ ", health:") @ string(int(Duke.Health))) @ ", heading:") @ string(Duke.Rotation.Yaw)) @ ", god:") @ string(Duke.bGodMode)) @ ", dndemo:") @ string(Duke.bDemoMode)) @ ", ghost:") @ string(Duke.bGhostMode)) @ ", invisible:") @ string(Duke.bHidden)) @ ", rmode:") @ string(Duke.RendMap)) @ ", playersonly:") @ string(Level.bPlayersOnly)) @ ", fps:") @ string(1 / Level.TimeDeltaSeconds);
        Inv = Duke.InventoryListHead;
        J0x2CD:

        // End:0x385 [Loop If]
        if(Inv == none)
        {
            Weap = Weapon(Inv);
            // End:0x36D
            if((Weap == none) && Weap.bActivatableByCategoryIteration)
            {
                WeaponName = string(Weap.Class.Name);
                WeaponString = (("," @ WeaponName) $ ":") @ string(int(Weap.Ammo.Charge));                
                updatemessage @= WeaponString;
            }
            Inv = Inv.NextInventory;
            // [Loop Continue]
            goto J0x2CD;
        }
        UpdateAIGate(updatemessage);
    }
    return;
}

function Died(optional Pawn Killer, optional int Damage, optional Vector DamageOrigin, optional class<DamageType> DamageType)
{
    local string updatemessage;

    // End:0x1FF
    if(CheckAIGate())
    {
        updatemessage = ((((((((((((((((((((((((((((("DIED" @ "machine:") @ Level.ComputerName) @ ", dnQA:") @ string(Duke.default.dnQAState)) @ ", map:") @ Level.MapFileName) @ ", maptime:") @ string(int(Level.GameTimeSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.GameTimeSeconds % float(60))))) @ ", sessiontime:") @ string(int(Level.SessionSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.SessionSeconds % float(60))))) @ ", lastcp:") @ Duke.QALastCheckpoint) @ ", pos:") @ string(Duke.Location.X)) @ string(Duke.Location.Y)) @ string(Duke.Location.Z)) @ ", killer:") @ string(Killer)) @ ", damage:") @ string(Damage)) @ ", origin:") @ string(DamageOrigin.X)) @ string(DamageOrigin.Y)) @ string(DamageOrigin.Z)) @ ", type:") @ string(DamageType);
        UpdateAIGate(updatemessage);
    }
    return;
}

function EnterMap(string URL)
{
    local string updatemessage;

    // End:0x148
    if(CheckAIGate() && URL != default.LastMapFileName)
    {
        default.LastMapFileName = URL;
        updatemessage = ((((((((((((((("ENTERMAP" @ "machine:") @ Level.ComputerName) @ ", dnQA:") @ string(Duke.default.dnQAState)) @ ", map:") @ URL) @ ", maptime:") @ string(int(Level.GameTimeSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.GameTimeSeconds % float(60))))) @ ", sessiontime:") @ string(int(Level.SessionSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.SessionSeconds % float(60))))) @ ", lastcp:") @ Duke.QALastCheckpoint;
        UpdateAIGate(updatemessage);
    }
    return;
}

function ExitMap()
{
    local string updatemessage;

    // End:0x114
    if(CheckAIGate())
    {
        updatemessage = ((((((((((((("EXITMAP" @ "machine:") @ Level.ComputerName) @ ", dnQA:") @ string(Duke.default.dnQAState)) @ ", map:") @ Level.MapFileName) @ ", maptime:") @ string(int(Level.GameTimeSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.GameTimeSeconds % float(60))))) @ ", sessiontime:") @ string(int(Level.SessionSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.SessionSeconds % float(60))));
        UpdateAIGate(updatemessage);
    }
    return;
}

function checkpoint()
{
    local string updatemessage;

    // End:0x188
    if(CheckAIGate())
    {
        updatemessage = ((((((((((((((((((("CHECKPOINT" @ "machine:") @ Level.ComputerName) @ ", dnQA:") @ string(Duke.default.dnQAState)) @ ", map:") @ Level.MapFileName) @ ", maptime:") @ string(int(Level.GameTimeSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.GameTimeSeconds % float(60))))) @ ", sessiontime:") @ string(int(Level.SessionSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.SessionSeconds % float(60))))) @ ", pos:") @ string(Duke.Location.X)) @ string(Duke.Location.Y)) @ string(Duke.Location.Z)) @ ", name:") @ Duke.QALastCheckpoint;
        UpdateAIGate(updatemessage);
    }
    return;
}

function AnimationLoad(string AnimName, int AnimSize)
{
    local string updatemessage;

    // End:0x1A0
    if(CheckAIGate())
    {
        updatemessage = ((((((((((((((((((((("ANIMATIONLOAD" @ "machine:") @ Level.ComputerName) @ ", dnQA:") @ string(Duke.default.dnQAState)) @ ", map:") @ Level.MapFileName) @ ", maptime:") @ string(int(Level.GameTimeSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.GameTimeSeconds % float(60))))) @ ", sessiontime:") @ string(int(Level.SessionSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.SessionSeconds % float(60))))) @ ", pos:") @ string(Duke.Location.X)) @ string(Duke.Location.Y)) @ string(Duke.Location.Z)) @ ", anim_name:") @ AnimName) @ ", anim_size:") @ string(AnimSize);
        UpdateAIGate(updatemessage);
    }
    return;
}

function SkinMeshLoad(string SkinMeshName, int SkinMeshSize)
{
    local string updatemessage;

    // End:0x1A9
    if(CheckAIGate())
    {
        updatemessage = ((((((((((((((((((((("SKINMESHLOAD" @ "machine:") @ Level.ComputerName) @ ", dnQA:") @ string(Duke.default.dnQAState)) @ ", map:") @ Level.MapFileName) @ ", maptime:") @ string(int(Level.GameTimeSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.GameTimeSeconds % float(60))))) @ ", sessiontime:") @ string(int(Level.SessionSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.SessionSeconds % float(60))))) @ ", pos:") @ string(Duke.Location.X)) @ string(Duke.Location.Y)) @ string(Duke.Location.Z)) @ ", skin_mesh_name:") @ SkinMeshName) @ ", skin_mesh_size:") @ string(SkinMeshSize);
        UpdateAIGate(updatemessage);
    }
    return;
}

function TextureLoad(string TextureName, int TextureSize)
{
    local string updatemessage;

    // End:0x1A4
    if(CheckAIGate())
    {
        updatemessage = ((((((((((((((((((((("TEXTURELOAD" @ "machine:") @ Level.ComputerName) @ ", dnQA:") @ string(Duke.default.dnQAState)) @ ", map:") @ Level.MapFileName) @ ", maptime:") @ string(int(Level.GameTimeSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.GameTimeSeconds % float(60))))) @ ", sessiontime:") @ string(int(Level.SessionSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.SessionSeconds % float(60))))) @ ", pos:") @ string(Duke.Location.X)) @ string(Duke.Location.Y)) @ string(Duke.Location.Z)) @ ", texture_name:") @ TextureName) @ ", texture_size:") @ string(TextureSize);
        UpdateAIGate(updatemessage);
    }
    return;
}

function BumpmapLoad(string BumpmapName, int BumpmapSize)
{
    local string updatemessage;

    // End:0x1A4
    if(CheckAIGate())
    {
        updatemessage = ((((((((((((((((((((("BUMPMAPLOAD" @ "machine:") @ Level.ComputerName) @ ", dnQA:") @ string(Duke.default.dnQAState)) @ ", map:") @ Level.MapFileName) @ ", maptime:") @ string(int(Level.GameTimeSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.GameTimeSeconds % float(60))))) @ ", sessiontime:") @ string(int(Level.SessionSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.SessionSeconds % float(60))))) @ ", pos:") @ string(Duke.Location.X)) @ string(Duke.Location.Y)) @ string(Duke.Location.Z)) @ ", bumpmap_name:") @ BumpmapName) @ ", bumpmap_size:") @ string(BumpmapSize);
        UpdateAIGate(updatemessage);
    }
    return;
}

function SoundLoad(string SoundName, int SoundSize)
{
    local string updatemessage;

    // End:0x19E
    if(CheckAIGate())
    {
        updatemessage = ((((((((((((((((((((("SOUNDLOAD" @ "machine:") @ Level.ComputerName) @ ", dnQA:") @ string(Duke.default.dnQAState)) @ ", map:") @ Level.MapFileName) @ ", maptime:") @ string(int(Level.GameTimeSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.GameTimeSeconds % float(60))))) @ ", sessiontime:") @ string(int(Level.SessionSeconds / float(60)))) $ ":") $ (TwoDigitString(int(Level.SessionSeconds % float(60))))) @ ", pos:") @ string(Duke.Location.X)) @ string(Duke.Location.Y)) @ string(Duke.Location.Z)) @ ", sound_name:") @ SoundName) @ ", sound_size:") @ string(SoundSize);
        UpdateAIGate(updatemessage);
    }
    return;
}

defaultproperties
{
    QAServerAddress="dnqa.3drealms.com"
    QAServerPort=5150
}