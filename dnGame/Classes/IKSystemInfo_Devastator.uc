/*******************************************************************************
 * IKSystemInfo_Devastator generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class IKSystemInfo_Devastator extends IKSystemInfo_Inventory
    collapsecategories;

defaultproperties
{
    IKHierarchy(0)=(BoneName="arm_left_upper",ConstrainY=170,ConstrainZ=170,ConstrainZPitch=0,ConstrainX=170)
    IKHierarchy(1)=(BoneName="arm_left_lower",ConstrainY=70,ConstrainZ=160,ConstrainZPitch=0,ConstrainX=10)
    IKHierarchy(2)=(BoneName="hand_left",ConstrainY=30,ConstrainZ=160,ConstrainZPitch=0,ConstrainX=28)
    MountBoneName="mount_hand_l"
    IKEvents(0)=(EventType=1,EventName="Weapon_IK_Detach",EventData="")
    IKEvents(1)=(EventType=0,EventName="Weapon_IK_Attach",EventData="mount_hand_l")
}