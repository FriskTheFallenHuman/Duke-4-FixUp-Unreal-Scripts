/*******************************************************************************
 * dnTeamDMMessage generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnTeamDMMessage extends CriticalEventMessage
    collapsecategories
    hidecategories(movement,Collision,Lighting,LightColor);

var localized string EDFWinRoundString;
var localized string PigcopWinRoundString;
var localized string EDFWinMatchString;
var localized string PigcopWinMatchString;
var localized string TieGameString;
var localized string TiedMatchString;
var Sound CheerSound;
var Sound BooSound;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional Class OptionalClass)
{
    switch(Switch)
    {
        // End:0x19
        case -1:
            return default.TieGameString;
            // End:0x69
            break;
        // End:0x26
        case 0:
            return default.EDFWinRoundString;
            // End:0x69
            break;
        // End:0x33
        case 1:
            return default.PigcopWinRoundString;
            // End:0x69
            break;
        // End:0x42
        case 500:
            return default.EDFWinMatchString;
            // End:0x69
            break;
        // End:0x51
        case 501:
            return default.PigcopWinMatchString;
            // End:0x69
            break;
        // End:0x60
        case 600:
            return default.TiedMatchString;
            // End:0x69
            break;
        // End:0xFFFF
        default:
            return "";
            break;
    }    
    // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 1 & Type:Switch Position:0x069
    return;
    // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 1 & Type:Switch Position:0x069
    // Failed to format remaining nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 1 & Type:Switch Position:0x069
}

static function ClientReceive(PlayerPawn P, optional int Switch, optional PlayerReplicationInfo KillerPRI, optional PlayerReplicationInfo VictimPRI, optional Object OptionalObject, optional Class OptionalClass)
{
    super(LocalMessage).ClientReceive(P, Switch, KillerPRI, VictimPRI, OptionalObject, OptionalClass);
    switch(Switch)
    {
        // End:0x30
        case 0:
        // End:0x34
        case 1:
        // End:0x3A
        case 500:
        // End:0xBD
        case 501:
            // End:0xA6
            if((int(P.PlayerReplicationInfo.Team) == Switch) || (int(P.PlayerReplicationInfo.Team) + 500) == Switch)
            {
                P.HasAnim(0, default.CheerSound);                
            }
            else
            {
                P.HasAnim(0, default.BooSound);
            }
            // End:0xC3
            break;
        // End:0xFFFF
        default:
            // End:0xC3
            break;
            break;
    }
    return;
}

defaultproperties
{
    EDFWinRoundString="<?int?dnGame.dnTeamDMMessage.EDFWinRoundString?>"
    PigcopWinRoundString="<?int?dnGame.dnTeamDMMessage.PigcopWinRoundString?>"
    EDFWinMatchString="<?int?dnGame.dnTeamDMMessage.EDFWinMatchString?>"
    PigcopWinMatchString="<?int?dnGame.dnTeamDMMessage.PigcopWinMatchString?>"
    TieGameString="<?int?dnGame.dnTeamDMMessage.TieGameString?>"
    TiedMatchString="<?int?dnGame.dnTeamDMMessage.TiedMatchString?>"
    CheerSound='a_npcvoice.Audience.AudApplause01'
    BooSound='a_npcvoice.Audience.AudBoo01'
    bIsConsoleMessage=true
    bBeep=false
    Lifetime=10
    DrawColor=(R=255,G=255,B=255,A=0)
}