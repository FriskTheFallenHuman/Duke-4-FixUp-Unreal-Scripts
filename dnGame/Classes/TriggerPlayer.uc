/*******************************************************************************
 * TriggerPlayer generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerPlayer extends Triggers
    collapsecategories
    hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

enum TriggerVehicleViewStyle
{
    VehicleView_DontChange,
    VehicleView_FirstPerson,
    VehicleView_ThirdPerson,
    VehicleView_Toggle
};

enum EBossMeterAction
{
    BOSSMETER_NoAction,
    BOSSMETER_AddMeter,
    BOSSMETER_RemoveMeter
};

var(TPDamage) noexport Engine.Object.EBitModifier TakeOnlyTransferredDamage "When this is set, the player will only accept damage of transferred type.";
var(TPDamage) noexport Engine.Object.EBitModifier InvinciblePlayer "Whether the player can take any damage at all or not.";
var(TPWeapon) noexport Engine.Object.EBitModifier InfiniteAmmo "Give the player infinite ammo or not.";
var(TPWeapon) noexport Engine.Object.EBitModifier WeaponsUseable "Enable/Disable 'Safe Mode', which dictates whether the player can use weapons or not.";
var(TPWeapon) noexport bool ForceQuickKick "Force the player to do a quick kick.";
var(TPEffects) noexport array<SScreenFlash> ScreenFlashes "List of screen flashes to apply to the player when triggered.";
var(TPEffects) noexport array<name> ScreenFlashRemoveList "List of screen flashes to remove from the player when triggered.";
var(TPEffects) noexport bool bRestartShakes "When true, will check to see if player already has the" "shakes listed in the ViewShakeInfo array," "and then will restart them if they exist." "Otherwise, will readd them to the active list.";
var(TPEffects) noexport array<SViewShakeInfo> ViewShakeInfo "List of camera shakes to apply to the player when triggered.";
var(TPEffects) noexport array<name> ShakeRemoveList "List of shake names that you want to remove from the player when triggered.";
var(TPEffects) noexport bool bDeafenPlayer "Cause the player to go deaf.";
var(TPEffects) noexport array<SScaleModifier> BlurScreenAddList "Causes the screen to blur. Value from 0-1 for the target to scale the overall blur effect happening to the player.";
var(TPEffects) noexport array<name> BlurScreenRemoveList "List of screen blurs to remove from the player.";
var(TPEffects) noexport array<SScaleModifier> BlurBrightnessAddList "Causes the screen (only when when blurred) to get brighter and bloomed. This is added to whatever currently exists (not a scaler).";
var(TPEffects) noexport array<name> BlurBrightnessRemoveList "List of screen BlurBrightness to remove from the player.";
var(TPEffects) noexport array<SScaleModifier> MotionBlurAddList "Causes the screen display a motion blur type effect. Value from 0-1 for the target to scale the overall motion blur effect happening to the player.";
var(TPEffects) noexport array<name> MotionBlurRemoveList "List of motion blurs to remove from the player.";
var(TPEffects) noexport array<SScaleModifier> DOFBlurAmountAddList "List of Depth of Field modifiers to apply";
var(TPEffects) noexport array<name> DOFBlurAmountRemoveList "List of Depth of Field modifiers to remove";
var(TPEffects) noexport array<SScaleModifier> DOFFocalDistAddList "List of Depth of Field focal distance modifiers to apply";
var(TPEffects) noexport array<name> DOFFocalDistRemoveList "List of Depth of Field focal distance modifiers to remove";
var(TPEffects) noexport array<SScaleModifier> DOFFocalRangeMinAddList "List of Depth of Field focal min range modifiers to apply";
var(TPEffects) noexport array<name> DOFFocalRangeMinRemoveList "List of Depth of Field focal min range modifiers to remove";
var(TPEffects) noexport array<SScaleModifier> DOFFocalRangeMaxAddList "List of Depth of Field focal max range modifiers to apply";
var(TPEffects) noexport array<name> DOFFocalRangeMaxRemoveList "List of Depth of Field focal max range modifiers to remove";
var(TPEffects) noexport array<SRumbleInfo> RumbleInfo "List of controller rumbles to apply to the player when triggered.";
var(TPInventory) noexport array< class<Inventory> > GiveItemClass "List of Inventory items to give the player";
var(TPInventory) noexport array< class<Inventory> > TakeItemClass "List of Inventory items to remove from the player's inventory if they have them. This does not consider subclasses.";
var(TPInventory) noexport array< class<Inventory> > TakeItemGroupClass "List of Inventory classes. If the player has any items of this class or a subclass of it, that item will be removed.";
var(TPState) noexport bool bForceUnregisterQuestItem "If true, UnregisterQuestItem will be called which will stop displaying the quest item status on the HUD.  This is useful for quest situations where a dnControl won't be used.";
var(TPState) noexport bool bForceGrabActor "When true, triggering this TriggerPlayer will force the player to grab the actor specified by ForcedGrabActor.";
var(TPState) noexport deprecated InteractiveActor ForcedGrabActor "Actor the player will be forced to grab if bForceGrabActor is true.";
var(TPControl) noexport Engine.Object.EBitModifier PhysicsControllerEnabled "Will the player's physics control be enabled? If false, the player won't be able to move under their own control.";
var(TPControl) bool bSetViewRotationMode;
var(TPControl) Engine.Object.EPlayerViewRotationMode NewViewRotationMode;
var(TPControl) noexport Engine.Object.EBitModifier MenuDisabled "Control the status of MenuDisabled";
var(TPEffects) noexport array<SScaleModifier> FOVAddList "Zooms the player's view in/out. The Target is a percentage of the current FOV. So if at 90, then 0.5 would put the player at 45.";
var(TPEffects) noexport array<name> FOVRemoveList "List of motion blurs to remove from the player.";
var(TPState) noexport bool bForceShrink "If this is true, the Player will shrink instantly upon trigger.";
var(TPState) noexport bool bForceShrinkWithEffects "If this is true, the Player will start shrinking upon trigger.  bForceShrink must also be true.";
var(TPState) noexport bool bForceUnshrink "If this is true, the Player will return to full-size upon trigger.";
var(TPState) noexport bool bForceUnfreeze "If this is true, the Player will unfreeze upon trigger.";
var(TPState) noexport bool bMarkLevelAsCompleted "If this is true, the current level will be marked as completed upon trigger.";
var(TPState) noexport Engine.Object.EBitModifier ForceCrouchModifier "How to modify the bForceCrouch flag on the player.";
var(TPState) noexport Engine.Object.EFloatModifier HoldBreathTimeModifier "How to modify HoldBreathTime.";
var(TPState) noexport float HoldBreathTime "Modifier value for HoldBreathTime.";
var(TPVoice) noexport name VoicePackEntry "The name of an entry in the player's VoicePack that will cause them to 'speak' it.";
var(TPView) noexport TriggerPlayer.TriggerVehicleViewStyle VehicleViewStyle "Change vehicle view style to this if riding in vehicle.";
var(TPFaction) noexport class<AIFaction> NewFaction "If this is set, change the players faction accordingly.";
var(TPConsole) noexport array<string> ConsoleCommands "Execute these console commands in order. For the love of god do not use this for real gameplay - only for debugging!!!";
var(TPEgo) noexport Engine.Object.EBitModifier EgoCapAwardsEnabledModifier "Use this to modify the current state of EgoCapAwardsEnabled.";
var(TPEgo) noexport bool bIncreaseEgoCap "If true, EgoCap will be increased by EgoCapIncrease.";
var(TPEgo) noexport float EgoCapIncrease "If bIncreaseEgoCap, this is the amount the EgoCap will be increased by.";
var(TPEgo) noexport array<Engine.Object.EEgoAwardID> EgoCapAwards "Awards to give the player when triggering this TriggerPlayer.";
var(TPBossMeter) noexport TriggerPlayer.EBossMeterAction BossMeterAction "Action to take for boss meter.";
var(TPBossMeter) noexport deprecated RenderActor BossMeterActor "Actor for boss meter.";
var(TPBossMeter) noexport deprecated name BossMeterActorTag "Tag lookup for BossMeterActor when dealing with a Boss actor that is spawned in.";
var(TPBossMeter) noexport localized string BossMeterName "Text to draw along with the boss meter.  Name of the boss.";

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        ClientHandleScreenFlash;
}

event Trigger(Actor Other, Pawn Instigator)
{
    local DukePlayer C;
    local int i;
    local WindowConsole WC;
    local float StoredHoldBreathTime;

    super(Actor).Trigger(Other, Instigator);
    // End:0xB45
    foreach RotateVectorAroundAxis(class'DukePlayer', C)
    {
        // End:0x39
        if(bForceUnregisterQuestItem)
        {
            C.UnregisterQuestItem();
        }
        TakeItemActivity(C);
        GiveItemActivity(C);
        WeaponsUseableActivity(C);
        // End:0x73
        if(ForceQuickKick)
        {
            C.StartKick();
        }
        // End:0xB4
        if(bForceShrink)
        {
            // End:0x9D
            if(bForceShrinkWithEffects)
            {
                C.ShrinkPawn(-1);                
            }
            else
            {
                C.ShrinkPawn(-1, true, true);
            }
        }
        // End:0xCD
        if(bForceUnshrink)
        {
            C.ExpandPawn();
        }
        // End:0xE6
        if(bForceUnfreeze)
        {
            C.StartUnFreezing();
        }
        // End:0xFF
        if(bMarkLevelAsCompleted)
        {
            C.UpdateLevelEndAchievements();
        }
        C.bForceCrouch = HandleIntModifier(ForceCrouchModifier, C.bForceCrouch);
        // End:0x19E
        if(int(HoldBreathTimeModifier) != int(0))
        {
            StoredHoldBreathTime = C.HoldBreathTime;
            C.HoldBreathTime = HandleVectModifier(HoldBreathTimeModifier, C.HoldBreathTime, HoldBreathTime);
            C.RemainingAir += (C.HoldBreathTime - StoredHoldBreathTime);
        }
        // End:0x1C1
        if(bDeafenPlayer)
        {
            C.ClientDeafen(5, 0.5);
        }
        i = string(ShakeRemoveList) - 1;
        J0x1D0:

        // End:0x200 [Loop If]
        if(i >= 0)
        {
            C.StopShake(ShakeRemoveList[i]);
            -- i;
            // [Loop Continue]
            goto J0x1D0;
        }
        i = string(ViewShakeInfo) - 1;
        J0x20F:

        // End:0x245 [Loop If]
        if(i >= 0)
        {
            C.ShakeView(ViewShakeInfo[i], bRestartShakes);
            -- i;
            // [Loop Continue]
            goto J0x20F;
        }
        i = string(RumbleInfo) - 1;
        J0x254:

        // End:0x284 [Loop If]
        if(i >= 0)
        {
            C.AddRumble(RumbleInfo[i]);
            -- i;
            // [Loop Continue]
            goto J0x254;
        }
        // End:0x339
        if((C.MyHUD == none) || ! IsMP())
        {
            i = string(ScreenFlashRemoveList) - 1;
            J0x2B6:

            // End:0x2F0 [Loop If]
            if(i >= 0)
            {
                C.MyHUD.RemoveScreenFlash(ScreenFlashRemoveList[i]);
                -- i;
                // [Loop Continue]
                goto J0x2B6;
            }
            i = string(ScreenFlashes) - 1;
            J0x2FF:

            // End:0x339 [Loop If]
            if(i >= 0)
            {
                C.MyHUD.AddScreenFlash(ScreenFlashes[i]);
                -- i;
                // [Loop Continue]
                goto J0x2FF;
            }
        }
        i = string(BlurScreenRemoveList) - 1;
        J0x348:

        // End:0x37A [Loop If]
        if(i >= 0)
        {
            C.SetDrawscale3D('Blur', BlurScreenRemoveList[i]);
            -- i;
            // [Loop Continue]
            goto J0x348;
        }
        i = string(BlurScreenAddList) - 1;
        J0x389:

        // End:0x3BB [Loop If]
        if(i >= 0)
        {
            C.GetScaleModifierTime('Blur', BlurScreenAddList[i]);
            -- i;
            // [Loop Continue]
            goto J0x389;
        }
        i = string(BlurBrightnessRemoveList) - 1;
        J0x3CA:

        // End:0x3FC [Loop If]
        if(i >= 0)
        {
            C.SetDrawscale3D('BlurBrightness', BlurBrightnessRemoveList[i]);
            -- i;
            // [Loop Continue]
            goto J0x3CA;
        }
        i = string(BlurBrightnessAddList) - 1;
        J0x40B:

        // End:0x43D [Loop If]
        if(i >= 0)
        {
            C.GetScaleModifierTime('BlurBrightness', BlurBrightnessAddList[i]);
            -- i;
            // [Loop Continue]
            goto J0x40B;
        }
        i = string(MotionBlurRemoveList) - 1;
        J0x44C:

        // End:0x47E [Loop If]
        if(i >= 0)
        {
            C.SetDrawscale3D('MotionBlur', MotionBlurRemoveList[i]);
            -- i;
            // [Loop Continue]
            goto J0x44C;
        }
        i = string(MotionBlurAddList) - 1;
        J0x48D:

        // End:0x4BF [Loop If]
        if(i >= 0)
        {
            C.GetScaleModifierTime('MotionBlur', MotionBlurAddList[i]);
            -- i;
            // [Loop Continue]
            goto J0x48D;
        }
        i = string(FOVRemoveList) - 1;
        J0x4CE:

        // End:0x500 [Loop If]
        if(i >= 0)
        {
            C.SetDrawscale3D('FOV', FOVRemoveList[i]);
            -- i;
            // [Loop Continue]
            goto J0x4CE;
        }
        i = string(FOVAddList) - 1;
        J0x50F:

        // End:0x541 [Loop If]
        if(i >= 0)
        {
            C.GetScaleModifierTime('FOV', FOVAddList[i]);
            -- i;
            // [Loop Continue]
            goto J0x50F;
        }
        i = string(DOFBlurAmountAddList) - 1;
        J0x550:

        // End:0x582 [Loop If]
        if(i >= 0)
        {
            C.GetScaleModifierTime('DOFBlurAmount', DOFBlurAmountAddList[i]);
            -- i;
            // [Loop Continue]
            goto J0x550;
        }
        i = string(DOFBlurAmountRemoveList) - 1;
        J0x591:

        // End:0x5C3 [Loop If]
        if(i >= 0)
        {
            C.SetDrawscale3D('DOFBlurAmount', DOFBlurAmountRemoveList[i]);
            -- i;
            // [Loop Continue]
            goto J0x591;
        }
        i = string(DOFFocalDistAddList) - 1;
        J0x5D2:

        // End:0x604 [Loop If]
        if(i >= 0)
        {
            C.GetScaleModifierTime('DOFFocalDistance', DOFFocalDistAddList[i]);
            -- i;
            // [Loop Continue]
            goto J0x5D2;
        }
        i = string(DOFFocalDistRemoveList) - 1;
        J0x613:

        // End:0x645 [Loop If]
        if(i >= 0)
        {
            C.SetDrawscale3D('DOFFocalDistance', DOFFocalDistRemoveList[i]);
            -- i;
            // [Loop Continue]
            goto J0x613;
        }
        i = string(DOFFocalRangeMinAddList) - 1;
        J0x654:

        // End:0x686 [Loop If]
        if(i >= 0)
        {
            C.GetScaleModifierTime('DOFFocalRangeMin', DOFFocalRangeMinAddList[i]);
            -- i;
            // [Loop Continue]
            goto J0x654;
        }
        i = string(DOFFocalRangeMinRemoveList) - 1;
        J0x695:

        // End:0x6C7 [Loop If]
        if(i >= 0)
        {
            C.SetDrawscale3D('DOFFocalRangeMin', DOFFocalRangeMinRemoveList[i]);
            -- i;
            // [Loop Continue]
            goto J0x695;
        }
        i = string(DOFFocalRangeMaxAddList) - 1;
        J0x6D6:

        // End:0x708 [Loop If]
        if(i >= 0)
        {
            C.GetScaleModifierTime('DOFFocalRangeMax', DOFFocalRangeMaxAddList[i]);
            -- i;
            // [Loop Continue]
            goto J0x6D6;
        }
        i = string(DOFFocalRangeMaxRemoveList) - 1;
        J0x717:

        // End:0x749 [Loop If]
        if(i >= 0)
        {
            C.SetDrawscale3D('DOFFocalRangeMax', DOFFocalRangeMaxRemoveList[i]);
            -- i;
            // [Loop Continue]
            goto J0x717;
        }
        // End:0x767
        if(bSetViewRotationMode)
        {
            C.ViewRotationMode = NewViewRotationMode;
        }
        C.bInfiniteAmmo = HandleIntModifier(InfiniteAmmo, C.bInfiniteAmmo);
        C.bNoDamage = HandleIntModifier(InvinciblePlayer, C.bNoDamage);
        C.bOnlyTakeTransferredDamage = HandleIntModifier(TakeOnlyTransferredDamage, C.bOnlyTakeTransferredDamage);
        C.FindStairRotation(HandleIntModifier(PhysicsControllerEnabled, C.bPhysicsControllerActive));
        // End:0x876
        if(C.Player == none)
        {
            WC = WindowConsole(C.Player.Console);
            // End:0x876
            if(WC == none)
            {
                WC.bLocked = HandleIntModifier(MenuDisabled, WC.bLocked);
            }
        }
        // End:0x89B
        if(NameForString(VoicePackEntry, 'None'))
        {
            C.FindSoundAndSpeak(VoicePackEntry);
        }
        // End:0x94A
        if((int(VehicleViewStyle) != int(0)) && VehicleSpaceBase(C.InteractiveDecoration) == none)
        {
            switch(VehicleViewStyle)
            {
                // End:0x8F7
                case 1:
                    VehicleSpaceBase(C.InteractiveDecoration).SetRiderPOV(0);
                    // End:0x94A
                    break;
                // End:0x920
                case 2:
                    VehicleSpaceBase(C.InteractiveDecoration).SetRiderPOV(1);
                    // End:0x94A
                    break;
                // End:0x947
                case 3:
                    VehicleSpaceBase(C.InteractiveDecoration).CycleRiderPOV();
                    // End:0x94A
                    break;
                // End:0xFFFF
                default:
                    break;
            }
        }
        else
        {
            // End:0x96B
            if(NewFaction == none)
            {
                C.Faction = NewFaction;
            }
            // End:0x9D8
            if(bForceGrabActor && ForcedGrabActor == none)
            {
                // End:0x9AB
                if(C.CarryingAnActor())
                {
                    C.DropCarriedActor(-1, true);
                }
                // End:0x9D8
                if(C.CanGrabActor(ForcedGrabActor))
                {
                    C.Grab(ForcedGrabActor);
                }
            }
            C.EgoCapAwardsEnabled = HandleIntModifier(EgoCapAwardsEnabledModifier, C.EgoCapAwardsEnabled);
            // End:0xA1F
            if(bIncreaseEgoCap)
            {
                C.GiveEgoCapAward(EgoCapIncrease);
            }
            i = string(EgoCapAwards) - 1;
            J0xA2E:

            // End:0xA5E [Loop If]
            if(i >= 0)
            {
                C.GivePermanentEgoCapAward(EgoCapAwards[i]);
                -- i;
                // [Loop Continue]
                goto J0xA2E;
            }
            i = string(ConsoleCommands) - 1;
            J0xA6D:

            // End:0xA9E [Loop If]
            if(i >= 0)
            {                
                C.ConsoleCommand(ConsoleCommands[i]);
                -- i;
                // [Loop Continue]
                goto J0xA6D;
            }
            // End:0xB44
            if(int(BossMeterAction) != int(0))
            {
                // End:0xAE5
                if((BossMeterActor != none) && NameForString(BossMeterActorTag, 'None'))
                {
                    BossMeterActor = RenderActor(FindActor(class'RenderActor', BossMeterActorTag));
                }
                switch(BossMeterAction)
                {
                    // End:0xB1A
                    case 1:
                        C.MyHUD.AddBossMeter(BossMeterActor, BossMeterName, self);
                        // End:0xB44
                        break;
                    // End:0xB41
                    case 2:
                        C.MyHUD.RemoveBossMeter(BossMeterActor);
                        // End:0xB44
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
            }
            else
            {                
            }/* !MISMATCHING REMOVE, tried ForEach got Type:Else Position:0xB44! */            
            // End:0xB55
            if(IsMP())
            {
                ClientHandleScreenFlash();
            }
            return;
        }
    }/* !MISMATCHING REMOVE, tried Else got Type:ForEach Position:0x010! */
}

simulated delegate ClientHandleScreenFlash()
{
    local DukePlayer C;
    local int i;

    // End:0xCE
    foreach RotateVectorAroundAxis(class'DukePlayer', C)
    {
        // End:0xCD
        if(C.IsLocallyControlled() && C.MyHUD == none)
        {
            i = string(ScreenFlashRemoveList) - 1;
            J0x4A:

            // End:0x84 [Loop If]
            if(i >= 0)
            {
                C.MyHUD.RemoveScreenFlash(ScreenFlashRemoveList[i]);
                -- i;
                // [Loop Continue]
                goto J0x4A;
            }
            i = string(ScreenFlashes) - 1;
            J0x93:

            // End:0xCD [Loop If]
            if(i >= 0)
            {
                C.MyHUD.AddScreenFlash(ScreenFlashes[i]);
                -- i;
                // [Loop Continue]
                goto J0x93;
            }
        }        
    }    
    return;
}

final function GiveItemActivity(DukePlayer C)
{
    local Inventory InventoryItem;
    local int i;
    local bool SavebPlayPickupSounds;

    i = string(GiveItemClass) - 1;
    J0x0F:

    // End:0x13C [Loop If]
    if(i >= 0)
    {
        // End:0x132
        if(GiveItemClass[i] == none)
        {
            // End:0xD1
            if(! IsA(GiveItemClass[i], class'Inventory'))
            {
                Warn(((((string(self) $ ".GiveItemActivity - GiveItemClass") @ string(i)) @ "is") @ string(GiveItemClass[i])) @ "which is not a valid subclass of Inventory.  Please fix.");
                // [Explicit Continue]
                goto J0x132;
            }
            SavebPlayPickupSounds = C.bPlayPickupSounds;
            C.bPlayPickupSounds = false;
            class'Inventory'.static.AttemptPickup(GiveItemClass[i], none, C);
            C.bPlayPickupSounds = SavebPlayPickupSounds;
        }
        J0x132:

        -- i;
        // [Loop Continue]
        goto J0x0F;
    }
    return;
}

final function TakeItemActivity(DukePlayer C)
{
    local Inventory InventoryItem;
    local int i;

    i = string(TakeItemClass) - 1;
    J0x0F:

    // End:0x8C [Loop If]
    if(i >= 0)
    {
        // End:0x82
        if(TakeItemClass[i] == none)
        {
            J0x2C:

            // End:0x82 [Loop If]
            if(true)
            {
                InventoryItem = C.PhysController_SetDesiredVelocity(TakeItemClass[i]);
                // End:0x5D
                if(InventoryItem != none)
                {
                    // [Explicit Break]
                    goto J0x82;
                }
                C.RemoveInventory(InventoryItem);
                InventoryItem.RemoveTouchClass();
                // [Loop Continue]
                goto J0x2C;
            }
        }
        J0x82:

        -- i;
        // [Loop Continue]
        goto J0x0F;
    }
    i = string(TakeItemGroupClass) - 1;
    J0x9B:

    // End:0x118 [Loop If]
    if(i >= 0)
    {
        // End:0x10E
        if(TakeItemGroupClass[i] == none)
        {
            J0xB8:

            // End:0x10E [Loop If]
            if(true)
            {
                InventoryItem = C.PhysController_SetConstraintGroundType(TakeItemGroupClass[i]);
                // End:0xE9
                if(InventoryItem != none)
                {
                    // [Explicit Break]
                    goto J0x10E;
                }
                C.RemoveInventory(InventoryItem);
                InventoryItem.RemoveTouchClass();
                // [Loop Continue]
                goto J0xB8;
            }
        }
        J0x10E:

        -- i;
        // [Loop Continue]
        goto J0x9B;
    }
    return;
}

final function EnableWeapons(DukePlayer C)
{
    C.bWeaponsActive = true;
    C.BringUpLastWeapon();
    return;
}

final function DisableWeapons(DukePlayer C)
{
    C.WeaponDown(1, false, true);
    return;
}

final function WeaponsUseableActivity(DukePlayer C)
{
    switch(WeaponsUseable)
    {
        // End:0x1B
        case 1:
            EnableWeapons(C);
            // End:0x65
            break;
        // End:0x2E
        case 2:
            DisableWeapons(C);
            // End:0x65
            break;
        // End:0x62
        case 3:
            // End:0x54
            if(C.bWeaponsActive)
            {
                DisableWeapons(C);                
            }
            else
            {
                EnableWeapons(C);
            }
            // End:0x65
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    local int i;

    i = string(GiveItemClass) - 1;
    J0x0F:

    // End:0x3C [Loop If]
    if(i >= 0)
    {
        PrecacheIndex.RegisterMaterialClass(GiveItemClass[i]);
        -- i;
        // [Loop Continue]
        goto J0x0F;
    }
    // End:0x66
    if(int(BossMeterAction) == int(1))
    {
        PrecacheIndex.RegisterAnimationControllerEntry(class'DukeHUD'.default.BossMeterAtlas);
    }
    // End:0x8D
    if(NameForString(VoicePackEntry, 'None'))
    {
        PrecacheIndex.InitAnimationControllerEx(class'VoicePack_Duke', VoicePackEntry);
    }
    return;
}

defaultproperties
{
    BossMeterName="<?int?dnGame.TriggerPlayer.BossMeterName?>"
    Texture='dt_editor.Icons.trigPLAYER'
}