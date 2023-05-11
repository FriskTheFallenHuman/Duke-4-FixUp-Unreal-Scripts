/*******************************************************************************
 * dnControlHelper_Pinball_BallGate generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControlHelper_Pinball_BallGate extends dnControlHelper_Pinball
    collapsecategories;

var dnControl_Pinball Table;
var Vector RotationAxis;
var Vector DefaultUp;
var Vector PerpVec;

simulated function PostVerifySelf()
{
    super.PostVerifySelf();
    RotationAxis = Vect(0, 1, 0) >> Rotation;
    DefaultUp = Vect(0, 0, 1) >> Rotation;
    PerpVec = Vect(1, 0, 0) >> Rotation;
    Table = dnControl_Pinball(MountParent);
    return;
}

simulated function Scored()
{
    // End:0x21
    if(OwnerMachine == none)
    {
        OwnerMachine.AwardPoints(PointsAwarded);
    }
    return;
}

simulated event Tick(float DeltaSeconds)
{
    local Vector currentUp, absAngularVel;
    local float relativeAngularVel, deltaUpAngle, radiansThisFrame, Side;

    super.Tick(DeltaSeconds);
    currentUp = DefaultUp >> SetScaleModifier().SwapChannel('bone_rotate', true);
    GetConstraint(absAngularVel, 'bone_rotate');
    deltaUpAngle = Acos(currentUp Dot Vect(0, 0, 1));
    relativeAngularVel = absAngularVel Dot RotationAxis;
    radiansThisFrame = relativeAngularVel * DeltaSeconds;
    Side = PerpVec Dot currentUp;
    // End:0xA8
    if(Abs(radiansThisFrame) > 0.05)
    {
        FindAndPlaySound('Pinball_GateSpin');
    }
    // End:0x1D2
    if(relativeAngularVel != 0)
    {
        // End:0x147
        if(radiansThisFrame < 0)
        {
            // End:0xE9
            if(radiansThisFrame <= - 3.141593)
            {
                Scored();
                radiansThisFrame += 3.141593;
            }
            // End:0x119
            if(Side <= 0)
            {
                // End:0x116
                if((- radiansThisFrame + deltaUpAngle) >= 3.141593)
                {
                    Scored();
                }                
            }
            else
            {
                // End:0x144
                if(Side > 0)
                {
                    // End:0x144
                    if((radiansThisFrame + deltaUpAngle) <= 0)
                    {
                        Scored();
                    }
                }
            }            
        }
        else
        {
            // End:0x1D2
            if(radiansThisFrame > 0)
            {
                // End:0x177
                if(radiansThisFrame >= 3.141593)
                {
                    Scored();
                    radiansThisFrame -= 3.141593;
                }
                // End:0x1A7
                if(Side <= 0)
                {
                    // End:0x1A4
                    if((- radiansThisFrame + deltaUpAngle) <= 0)
                    {
                        Scored();
                    }                    
                }
                else
                {
                    // End:0x1D2
                    if(Side > 0)
                    {
                        // End:0x1D2
                        if((radiansThisFrame + deltaUpAngle) >= 3.141593)
                        {
                            Scored();
                        }
                    }
                }
            }
        }
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.InitAnimationControllerEx(VoicePack, 'Pinball_GateSpin');
    return;
}

defaultproperties
{
    bUseMachinePEG=true
    PointsAwarded=250
    AutoConstraints(0)=(bConstraintDisabledOnDeath=false,bConstraintOnDeath=false,BoneName=Root,ConstraintMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=0,DismountPhysics=0),OtherConstraintActor=none,OtherConstraintBone=None,ConstraintClass='Engine.KFixed',ConstraintActor=none)
    HealthPrefab=0
    KAngularDamping=0.06
    EnableDisableThreshold=0
    Physics=18
    bBlockKarma=true
    bNoNativeTick=false
    bTickOnlyRecent=false
    Mass=0.5
    TickStyle=2
    Mesh='c_generic.Pinball_Gate'
}