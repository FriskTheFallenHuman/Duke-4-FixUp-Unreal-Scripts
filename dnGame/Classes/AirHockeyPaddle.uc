/*******************************************************************************
 * AirHockeyPaddle generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AirHockeyPaddle extends Decoration;

function UserAttached(Pawn NewUser)
{
    MountType = 2;
    MountMeshItem = 'mount_handright';
    MountOrigin = Vect(0, 0, 0);
    MountAngles = Rot(0, 0, 0);
    MoveActor(NewUser);
    return;
}

function UserDetached(dnControl_AirHockeyPlayer MyControl)
{
    MountType = 0;
    MoveActor(MyControl, true, true);
    return;
}

defaultproperties
{
    CollisionRadius=3.5
    CollisionHeight=3
    Mass=5
    TickStyle=0
    DrawType=8
    StaticMesh='sm_class_decorations.Arcades.Air_Hockey_Paddle'
    RemoteRole=0
    VoicePack='SoundConfig.Interactive.VoicePack_AirHockey'
}