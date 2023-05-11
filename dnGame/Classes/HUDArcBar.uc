/*******************************************************************************
 * HUDArcBar generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class HUDArcBar extends Object;

var float OffsetX;
var float OffsetY;
var float StartAngle;
var float EndAngle;
var float InnerRadius;
var float Thickness;
var Color PrimaryColor;
var Color FadeColor;
var float PCTFill;
var float TargetPCT;
var float FadeSpeedDown;
var float FadeSpeedUp;
var float PCTWarn;
var bool bPulseUp;
var bool bPulsingUp;
var bool bPulsingWarn;
var bool bInterallyManageAlpha;
var bool bDebug;
var float PCTGhost;
var bool bGhost;
var float GhostFadeSpeed;
var float GhostFadeDelay;
var Color WarnColor;
var Color WarnFadeColor;
var bool bDrawBG;
var Color BGColor;
var Sound WarnSound;
var MaterialEx bodyMaterial;
var MaterialEx EndMaterial;
var float PulseLockTime;

final function DrawArcBar(Canvas C)
{
    local float End, Ghost, bgstart;

    End = (PCTFill * (EndAngle - StartAngle)) + StartAngle;
    InternalDrawBar(C, (C.ClipX / 2) + OffsetX, (C.ClipY / 2) + OffsetY, InnerRadius * C.FixedScale, C.FixedScale * (InnerRadius + Thickness), StartAngle, End, 0.1, GetColor());
    bgstart = End;
    // End:0x17F
    if(PCTGhost > PCTFill)
    {
        Ghost = (PCTGhost * (EndAngle - StartAngle)) + StartAngle;
        bgstart = Ghost;
        InternalDrawBar(C, (C.ClipX / 2) + OffsetX, (C.ClipY / 2) + OffsetY, InnerRadius * C.FixedScale, C.FixedScale * (InnerRadius + Thickness), Ghost, End, 0.1, GetFadeColor());
    }
    // End:0x225
    if(bDrawBG && End != EndAngle)
    {
        InternalDrawBar(C, (C.ClipX / 2) + OffsetX, (C.ClipY / 2) + OffsetY, InnerRadius * C.FixedScale, C.FixedScale * (InnerRadius + Thickness), bgstart, EndAngle, 0.1, BGColor);
    }
    return;
}

final function InternalDrawBar(Canvas C, float X, float Y, float iR, float or, float Start, float End, float Step, Color col)
{
    local float tmp;
    local bool startCap, endCap;

    // End:0x11
    if(Start == End)
    {
        return;
    }
    // End:0x41
    if(Start > End)
    {
        tmp = Start;
        Start = End;
        End = tmp;
    }
    // End:0x69
    if((Start == StartAngle) || Start == EndAngle)
    {
        startCap = true;
    }
    // End:0x91
    if((End == StartAngle) || End == EndAngle)
    {
        endCap = true;
    }
    C.RegisterTexture(X, Y, iR, or, Start * 3.141593, End * 3.141593, Step, col, startCap, endCap, bodyMaterial, EndMaterial);
    return;
}

final function Color GetColor()
{
    // End:0x15
    if(TargetPCT <= PCTWarn)
    {
        return WarnColor;
    }
    return PrimaryColor;
    return;
}

final function Color GetFadeColor()
{
    // End:0x15
    if(TargetPCT <= PCTWarn)
    {
        return WarnFadeColor;
    }
    return FadeColor;
    return;
}

final function Tick(float Delta, DukeHUD MyHUD)
{
    // End:0xBD
    if(PCTFill != TargetPCT)
    {
        // End:0x41
        if(TargetPCT < PCTFill)
        {
            PCTFill = FMax(PCTFill - (FadeSpeedDown * Delta), TargetPCT);            
        }
        else
        {
            PCTFill = FMin(PCTFill + (FadeSpeedUp * Delta), TargetPCT);
            // End:0xBD
            if(bPulseUp)
            {
                // End:0x84
                if(PulseLockTime <= 0)
                {
                    PulseLockTime = default.PulseLockTime;
                }
                PrimaryColor.A = byte(int(MyHUD.CalculateDrawScaleDifference('ArcHUDPulse', 'Pulse')));
                WarnColor.A = PrimaryColor.A;
            }
        }
    }
    // End:0x10E
    if(TargetPCT <= PCTWarn)
    {
        // End:0x10E
        if(bPulsingWarn)
        {
            PrimaryColor.A = byte(int(MyHUD.CalculateDrawScaleDifference('ArcHUDPulse', 'Pulse')));
            WarnColor.A = PrimaryColor.A;
        }
    }
    // End:0x173
    if(bGhost && PCTGhost > PCTFill)
    {
        // End:0x153
        if(GhostFadeDelay > 0)
        {
            GhostFadeDelay = FMax(GhostFadeDelay - Delta, 0);            
        }
        else
        {
            PCTGhost = FMax(PCTGhost - (GhostFadeSpeed * Delta), PCTFill);
        }
    }
    // End:0x19B
    if(PulseLockTime > 0)
    {
        PulseLockTime = FMax(PulseLockTime - Delta, 0);
    }
    return;
}

final function SetPCTFill(float PCT, optional bool bForce, optional HUD MyHUD)
{
    // End:0x21
    if(bForce)
    {
        PCTFill = PCT;
        TargetPCT = PCT;
        return;
    }
    // End:0x51
    if(bGhost && PCTGhost <= PCT)
    {
        PCTGhost = PCTFill;
        GhostFadeDelay = default.GhostFadeDelay;
    }
    // End:0x91
    if((PCT < PCTWarn) && TargetPCT > PCTWarn)
    {
        MyHUD.PlayerOwner.HasAnim(1, WarnSound, 0);
    }
    TargetPCT = PCT;
    return;
}

final function SetAlpha(float A)
{
    // End:0x5A
    if(((PCTFill == TargetPCT) && PCTGhost <= PCTFill) && PulseLockTime <= 0)
    {
        PrimaryColor.A = byte(A);
        BGColor.A = byte(A / 4);
    }
    return;
}

final function bool IsActive()
{
    return bGhost && PCTGhost > PCTFill;
    return;
}

final function float GetAlpha()
{
    return float(PrimaryColor.A);
    return;
}

final function Init(DukeHUD MyHUD)
{
    PulseLockTime = 0;
    return;
}

defaultproperties
{
    PrimaryColor=(R=255,G=0,B=0,A=128)
    PCTFill=1
    TargetPCT=1
    FadeSpeedDown=0.5
    FadeSpeedUp=0.7
    PCTWarn=0.5
    bPulseUp=true
    bPulsingWarn=true
    GhostFadeSpeed=0.75
    GhostFadeDelay=3
    bodyMaterial='dt_hud.ingame_hud.arcbody'
    EndMaterial='dt_hud.ingame_hud.arcend'
    PulseLockTime=1
}