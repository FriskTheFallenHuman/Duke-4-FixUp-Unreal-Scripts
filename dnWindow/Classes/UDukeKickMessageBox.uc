/*******************************************************************************
 * UDukeKickMessageBox generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeKickMessageBox extends UDukeSuperMessageBox;

function setPlayerName(string sName)
{
    local int i, nameLen;
    local string shortName;

    i = InStr(MessageText, "<PlayerName>");
    // End:0x9F
    if(i != -1)
    {
        shortName = sName;
        nameLen = Len(sName);
        // End:0x68
        if(nameLen > 17)
        {
            shortName = Left(sName, 17) $ "...";
        }
        MessageText = ((Left(MessageText, i) $ Chr(13)) $ shortName) $ Mid(MessageText, i + 12);
    }
    return;
}
