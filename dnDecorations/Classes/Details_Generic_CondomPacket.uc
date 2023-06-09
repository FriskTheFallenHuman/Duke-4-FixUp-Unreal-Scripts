/*******************************************************************************
 * Details_Generic_CondomPacket generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Generic_CondomPacket extends Details_Generic_VendItem
    collapsecategories
    dependson(Settings_Bathroom_VendingMachine_Condom);

var() bool bQuestItemHack;

function PostVerifySelf()
{
    super.PostVerifySelf();
    bGrabbable = bQuestItemHack;
    return;
}

function DoVendTransition()
{
    super.DoVendTransition();
    SetDesiredRotation_Pitch(0, true);
    bDoOverlayEffect = bQuestItemHack;
    return;
}

function Grabbed(Pawn Grabber)
{
    local Details_Generic_CondomPacket C;
    local Settings_Bathroom_VendingMachine_Condom V;

    super(dnDecoration).Grabbed(Grabber);
    // End:0x40
    foreach RotateVectorAroundAxis(class'Details_Generic_CondomPacket', C)
    {
        C.bQuestItemHack = false;
        C.bGrabbable = false;        
    }    
    // End:0x64
    foreach RotateVectorAroundAxis(class'Settings_Bathroom_VendingMachine_Condom', V)
    {
        V.bQuestItemHack = false;        
    }    
    class'Inventory'.static.AttemptPickup(class'dnQuestItem_Condom', none, Grabber, 2);
    GlobalTrigger('Condom_QuestItem_Located');
    Grabber.bGrabbing = false;
    Grabber.DropCarriedActor(, true,, true, true);
    bSilentDestroy = true;
    RemoveTouchClass();
    return;
}

defaultproperties
{
    DestroyedActivities(0)=none
    DestroyedActivities(1)=none
    ThrowPhysics=18
    UsePhrase="<?int?dnDecorations.Details_Generic_CondomPacket.UsePhrase?>"
    PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Plastic'
    Physics=18
    bGoryActor=true
    bOverlayEffectUsedAsHint=true
    CollisionRadius=2
    CollisionHeight=0.1
    DesiredLocation(0)=(bTemporal=false,bComplete=false,bRelativeMotion=false,Target=(X=2.5,Y=0,Z=0),TargetVariance=(X=0,Y=0,Z=0),RealTarget=(X=0,Y=0,Z=0),Start=(X=0,Y=0,Z=0),Speed=(Value=0,Variance=0),Rate=(X=0,Y=0,Z=0),Exponent=0,TimeTotal=0.3,TimeMid=0,RealTimeMid=0,Timer=0,Style=1,StyleStopped=0,CrushDamage=(DamageHow=0,Damage=(Value=0,Variance=0),Rate=(Value=0,Variance=0),Timer=0),Event=None,EventAbort=None,FunctionComplete=None,FunctionAbort=None)
    StaticMesh='sm_class_decorations.CondomTamponMachine.CondomPacket'
}