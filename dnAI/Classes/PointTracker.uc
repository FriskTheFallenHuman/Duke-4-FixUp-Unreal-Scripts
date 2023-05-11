/*******************************************************************************
 * PointTracker generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PointTracker extends Object
    native;

var private float m_fMaxRate;
var private float m_fNextRate;
var private Quat m_qCurRot;
var private Vector m_vConstraints;

// Export UPointTracker::execUpdate(FFrame&, void* const)
native final function Update(Vector vOrigin, Vector vFocus, Vector vCurFwd, Vector vCurUp, Vector vCurRight, Vector vBiasPoint, float fDeltaTime);

event SetConstraints(float fPitchDegrees, float fYawDegrees, float fRollDegrees)
{
    m_vConstraints.X = fPitchDegrees * (3.141593 / 180);
    m_vConstraints.Y = fYawDegrees * (3.141593 / 180);
    m_vConstraints.Z = fRollDegrees * (3.141593 / 180);
    return;
}

function Vector GetConstraints()
{
    return m_vConstraints;
    return;
}

function DelayedSetMaxRate(float fNewRate)
{
    m_fNextRate = fNewRate;
    return;
}

function SetMaxRate(float fRate)
{
    m_fMaxRate = fRate;
    m_fNextRate = fRate;
    return;
}

function float GetMaxRate()
{
    return m_fMaxRate;
    return;
}

event Vector GetDirection()
{
    return QuatGetForward(m_qCurRot);
    return;
}

function GetDirectionAxes(out Vector vFwd, out Vector vUp, out Vector vRight)
{
    QuatGetAxes(m_qCurRot, vFwd, vUp, vRight);
    return;
}

function SetDirection(Rotator rCur)
{
    m_qCurRot = QuatFromRotator(rCur);
    return;
}

defaultproperties
{
    m_fMaxRate=6.2832
    m_fNextRate=6.2832
    m_vConstraints=(X=3.1416,Y=3.1416,Z=0)
}