/*******************************************************************************
 * UDukeCreateMultiWindow generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeCreateMultiWindow extends UDukeFramedWindow;

var UDukeEmbeddedClient ScrollClient;

function BeforePaint(Canvas C, float X, float Y)
{
    local float ClientHeight;
    local Region ClientAreaRegion;

    // End:0x1A7
    if(ScrollClient == none)
    {
        ClientAreaRegion = LookAndFeel.FW_GetClientArea(self);
        ClientHeight = ScrollClient.ClientArea.DesiredHeight;
        bShowVertSB = ClientHeight > ScrollClient.WinHeight;
        // End:0x157
        if(bShowVertSB && ! bPlayingSmack)
        {
            // End:0x9A
            if(! VertSB.bWindowVisible)
            {
                VertSB.ShowWindow();
            }
            VertSB.WinTop = float(ClientAreaRegion.Y);
            VertSB.WinLeft = (WinWidth - float(LookAndFeel.SBPosIndicator.W)) - float(25);
            VertSB.WinWidth = float(LookAndFeel.SBPosIndicator.W);
            VertSB.WinHeight = float(ClientAreaRegion.h);
            VertSB.SetRange(0, ClientHeight, VertSB.WinHeight, 10);            
        }
        else
        {
            VertSB.HideWindow();
            VertSB.pos = 0;
        }
        ScrollClient.ClientArea.WinTop = - VertSB.pos;
    }
    super(UWindowFramedWindow).BeforePaint(C, X, Y);
    return;
}

defaultproperties
{
    ClientClass='UDukeCreateMultiSC'
    WindowTitle="<?int?dnWindow.UDukeCreateMultiWindow.WindowTitle?>"
    bStatusBar=true
}