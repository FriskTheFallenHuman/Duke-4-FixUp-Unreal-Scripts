/*******************************************************************************
 * Details_Generic_Calendar generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Generic_Calendar extends Details_Generic
    collapsecategories;

const CALENDAR_NumMonths = 6;

var int Month;
var bool bNoChange;
var bool bFlippingDown;
var MaterialEx MonthMaterials[6];
var MaterialEx GirlyMaterials[6];
var byte MonthViewed[6];
var byte MonthsViewed;
var anim name FlipUpAnim;
var anim name FlipDownAnim;

event PostVerifySelf()
{
    super(dnDecoration).PostVerifySelf();
    Month = Rand(6);
    bNoChange = true;
    // End:0x8D
    if(Month == (6 - 1))
    {
        VisibleActors(0, GirlyMaterials[Month - 1]);
        VisibleActors(2, MonthMaterials[Month - 1]);
        VisibleActors(3, GirlyMaterials[Month]);
        VisibleActors(1, MonthMaterials[Month]);
        DecoPlayAnim(FlipUpAnim);
        SetScaleModifier().ResetTimeWitholding(0, 1);
        GetLastRenderTime();        
    }
    else
    {
        VisibleActors(0, GirlyMaterials[Month]);
        VisibleActors(2, MonthMaterials[Month]);
        VisibleActors(3, GirlyMaterials[Month + 1]);
        VisibleActors(1, MonthMaterials[Month + 1]);
    }
    UpdatedViewedMonths(none);
    return;
}

event Used(Actor Other, Pawn EventInstigator)
{
    super(dnDecoration).Used(Other, EventInstigator);
    // End:0x38
    if(DukePlayer(EventInstigator) == none)
    {
        DukePlayer(EventInstigator).GivePermanentEgoCapAward(11);
    }
    // End:0x56
    if(Month == 0)
    {
        bNoChange = true;
        bFlippingDown = false;        
    }
    else
    {
        // End:0x75
        if(Month == (6 - 1))
        {
            bNoChange = true;
            bFlippingDown = true;
        }
    }
    // End:0xDD
    if(bFlippingDown)
    {
        DecoPlayAnim(FlipDownAnim);
        GetLastRenderTime();
        -- Month;
        UpdatedViewedMonths(EventInstigator);
        // End:0xDA
        if(! bNoChange)
        {
            VisibleActors(1, RadiusActors(2));
            VisibleActors(3, RadiusActors(0));
            VisibleActors(2, MonthMaterials[Month]);
            VisibleActors(0, GirlyMaterials[Month]);
        }        
    }
    else
    {
        DecoPlayAnim(FlipUpAnim);
        GetLastRenderTime();
        ++ Month;
        UpdatedViewedMonths(EventInstigator);
        // End:0x139
        if(! bNoChange)
        {
            VisibleActors(2, RadiusActors(1));
            VisibleActors(0, RadiusActors(3));
            VisibleActors(1, MonthMaterials[Month]);
            VisibleActors(3, GirlyMaterials[Month]);
        }
    }
    bUsable = false;
    bNoChange = false;
    return;
}

final simulated function UpdatedViewedMonths(Actor EventInstigator)
{
    // End:0x27
    if(int(MonthViewed[Month]) == 0)
    {
        MonthViewed[Month] = 1;
        ++ MonthsViewed;
    }
    // End:0x5E
    if((int(MonthsViewed) == 6) && DukePlayer(EventInstigator) == none)
    {
        DukePlayer(EventInstigator).AwardAchievement(20);
    }
    return;
}

simulated event AnimEndEx(SAnimEndInfo AnimEndInfo)
{
    super(dnDecoration).AnimEndEx(AnimEndInfo);
    bUsable = true;
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    local int i;

    super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.SetChannelEventState(Mesh, FlipUpAnim);
    PrecacheIndex.SetChannelEventState(Mesh, FlipDownAnim);
    i = 0;
    J0x40:

    // End:0x86 [Loop If]
    if(i < 6)
    {
        PrecacheIndex.RegisterAnimationControllerEntry(MonthMaterials[i]);
        PrecacheIndex.RegisterAnimationControllerEntry(GirlyMaterials[i]);
        ++ i;
        // [Loop Continue]
        goto J0x40;
    }
    return;
}

defaultproperties
{
    MonthMaterials[0]='mt_skins6.Calendar.Calendar_1_bs'
    MonthMaterials[1]='mt_skins6.Calendar.Calendar_2_bs'
    MonthMaterials[2]='mt_skins6.Calendar.Calendar_3_bs'
    MonthMaterials[3]='mt_skins6.Calendar.Calendar_4_bs'
    MonthMaterials[4]='mt_skins6.Calendar.Calendar_5_bs'
    MonthMaterials[5]='mt_skins6.Calendar.Calendar_6_bs'
    GirlyMaterials[0]='mt_skins6.Calendar.CalendarPic_1_bs'
    GirlyMaterials[1]='mt_skins6.Calendar.CalendarPic_2_bs'
    GirlyMaterials[2]='mt_skins6.Calendar.CalendarPic_3_bs'
    GirlyMaterials[3]='mt_skins6.Calendar.CalendarPic_4_bs'
    GirlyMaterials[4]='mt_skins6.Calendar.CalendarPic_5_bs'
    GirlyMaterials[5]='mt_skins6.Calendar.CalendarPic_6_bs'
    FlipUpAnim=a_calendar_downtoup
    FlipDownAnim=a_calendar_uptodown
    DecoActivities_Default(0)=(ActivityData=(bInitialized=false,CurrentIndex=0,NextPerformTime=0,NextPerformTime_Failure=0),ActivityIDScript=none,ActivityID=(3),ActivityMethod=0,ActivityStates_Success=none,ActivityStates_Failure=none,ActivityDebugID="",Activities=((ActivityRules=none,ActivityElements=(DecoActivities_Sound'Details_Generic_Calendar.DA_Sound_Calendar'),ActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0),FailureActivityElements=none,FailureActivitySetup=(bDisabled=false,bPerformedThisRound=false,PerformedCounter=0,LoopCount=0,PerformAgainDelay=0))),bDisabled=false)
    HealthPrefab=0
    bUsable=true
    StartAnimSequence=a_calendar_downpose
    bBlockKarma=false
    bNoNativeTick=false
    CollisionRadius=10
    CollisionHeight=15
    DrawType=2
    Mesh='c_generic.Calendar_1'
}