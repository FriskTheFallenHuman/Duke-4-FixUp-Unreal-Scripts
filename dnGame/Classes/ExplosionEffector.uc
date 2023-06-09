/*******************************************************************************
 * ExplosionEffector generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ExplosionEffector extends ParticleEffector
    collapsecategories;

cpptext
{
// Stripped
}

var() noexport float m_fEndRadius "Radius effector will grow to over its lifespan.";
var() noexport float m_fEndAccelSpeed "Accel speed at end of lifespan.";
var float m_fStartRadius;
var float m_fStartAccelSpeed;

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    Disable('Tick');
    m_fStartRadius = m_fRadius;
    m_fStartAccelSpeed = m_fAccelSpeed;
    return;
}

simulated function Tick(float fDeltaTime)
{
    local float fScale, fRadiusRange, fSpeedRange;

    fScale = m_fAge / m_fLifeTime;
    fRadiusRange = m_fEndRadius - m_fStartRadius;
    m_fRadius = m_fStartRadius + (fRadiusRange * fScale);
    fSpeedRange = m_fEndAccelSpeed - m_fStartAccelSpeed;
    m_fAccelSpeed = m_fStartAccelSpeed + (fSpeedRange * fScale);
    super.Tick(fDeltaTime);
    return;
}

defaultproperties
{
    m_fEndRadius=512
    m_fEndAccelSpeed=-400
    m_fRadius=512
    m_fAccelSpeed=800
    m_bAccelOutwards=true
    bNoNativeTick=false
    LifeSpan=1
}