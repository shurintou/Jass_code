
//===========================================================================
// Trigger: udoriginhero
//
// 90 Azhang    95shuaxin   100 changed item
// 91longxin         11heihuang   15  zhangu              20huixuejia             21qiangxi    25 tiantangzhidun
// 92fuhuo           12tiaozhan    16  mianju  17meiken             22bingjia       26 shandianhudun
// 93xuejingshi     13linken       14 kajiachangdi         23weak shield   27 zhenfenkaijia
// 94xixuegui                                                              24herald shield
// 30 lvzhang                                                   
// 31 bingyan      41 dapao      51 yuezhiqiang  54 yangdao
// 32 huoyan     42 yunchui    52 ziyuan   55 silingshu
// 33 sanshi                        53  dagen  56tongzhi 57 shuaxin
// 34 anmie       61 huiyao                 71  yuezhiqiang   76 huanyingfu
// 35 leichui        62 fensuifu            72   hudie     75 yindao 77kuangzhan
// 36 sadan         63 leichui            73  yunchui   74 dapao
// 37duqiu           
// 38shuangzhiaishang     
// 39 kuangzhan       
//===========================================================================
function RemoveUndeadHeroTrigger takes nothing returns nothing
    local integer i1=GetUnitTypeId(udg_ExtraHero[udg_RacePlayerNum[3]])
    local integer i2=GetUnitTypeId(udg_ExtraHero[udg_RacePlayerNum[4]])
    if i1!='Uwar' and i2!='Uwar' then
        call DestroyTrigger(gg_trg_deathfinger)
        call DestroyTrigger(gg_trg_chixushifa)
    endif
    if i1!='Nbrn' and i2!='Nbrn' then
        call DestroyTrigger(gg_trg_meihuodanwei)
        call DestroyTrigger(gg_trg_xiaoheilevelup)
        call DestroyTrigger(gg_trg_XiaoheiS)
    endif
    if i1!='Nplh' and i2!='Nplh' then
        call DestroyTrigger(gg_trg_pitlord)
        call DestroyTrigger(gg_trg_Archmagebillizard)
        call DestroyTrigger( gg_trg_pitloadfirerain)
    endif
    if i1!='Usyl' and i2!='Usyl' then
        call DestroyTrigger(gg_trg_souldragon)
        call DestroyTrigger(gg_trg_souldragona)
        call DestroyTrigger(gg_trg_magicshield)
    endif
    if i1!='Udth' and i2!='Udth' then
        call DestroyTrigger(gg_trg_UG1)
        call DestroyTrigger(gg_trg_UG2)
        call DestroyTrigger(gg_trg_UGDA)
    endif
    if i1!='Nman' and i2!='Nman' then
        call DestroyTrigger( gg_trg_summondeadbody )
        call DestroyTrigger(gg_trg_deadkingharm)
    endif
    if i1!='Uktl' and i2!='Uktl' then
        call DestroyTrigger( gg_trg_kuloubingjian)
        call DestroyTrigger( gg_trg_gugongyinshenhero)
    endif
    if i1!='Npld' and i2!='Npld' then
        call DestroyTrigger( gg_trg_DianS )
        call DestroyTrigger(gg_trg_DianA)
        call DestroyTrigger(gg_trg_DianD)
    endif
    if i1!='N002' and i2!='N002' then
        call DestroyTrigger( gg_trg_FireQueenA )
        call DestroyTrigger(gg_trg_FireQueen)
    endif
    if i1!='E002' and i2!='E002' then
        call DestroyTrigger( gg_trg_CKA )
        call DestroyTrigger(gg_trg_CKH)
        call DestroyTrigger(gg_trg_CKS)
    endif
    if i1!='U001' and i2!='U001' then
        call DestroyTrigger( gg_trg_XNA )
        call DestroyTrigger(gg_trg_XNS)
    endif
    if i1!='N001' and i2!='N001' then
        call DestroyTrigger( gg_trg_DZA )
        call DestroyTrigger(gg_trg_DZS)
        call DestroyTrigger(gg_trg_DZD)
    endif
    if i1!='N007' and i2!='N007' then
        call DestroyTrigger( gg_trg_SJA )
        call DestroyTrigger(gg_trg_SJH)
        call DestroyTrigger(gg_trg_SJS)
    endif
    if i1!='N009' and i2!='N009' then
        call DestroyTrigger( gg_trg_DAA )
        call DestroyTrigger(gg_trg_DAS)
    endif
    if i1!='N00F' and i2!='N00F' then
        call DestroyTrigger( gg_trg_SPA )
        call DestroyTrigger(gg_trg_SPS)
    endif
    if i1!='N00B' and i2!='N00B' then
        call DestroyTrigger( gg_trg_DOA )
        call DestroyTrigger(gg_trg_DOS)
        call DestroyTrigger(gg_trg_DOH)
    endif
endfunction

function ronghuahp takes nothing returns nothing
    local unit u=LoadUnitHandle(udg_hash,GetHandleId(GetExpiredTimer()),1)
    local unit m
    local integer i=GetConvertedPlayerId(GetOwningPlayer(u))
    local real r=GetUnitState(u, UNIT_STATE_LIFE)
    if udg_UGharm[i]>0 and r>0 then
        call SetUnitState( u, UNIT_STATE_LIFE, r-(udg_UGharm[i]/10))
        set udg_UGharm[i]=udg_UGharm[i]*0.9-(GetHeroLevel(u)*(1+GetUnitAbilityLevel(u,'B01T')))
    else
        set udg_UGharm[i]=0
    endif
    
    if udg_Chaoxi[i]>0 then
        set m=CreateUnit(getcorrectplayer(u) ,'u002',GetUnitX(u),GetUnitY(u),0)
        call SetUnitAbilityLevel(m,'Apmf',GetUnitAbilityLevel(u,'A07A'))
        call PauseUnit( m, true )
        call PauseUnit( m, false)
        call UnitApplyTimedLife( m, 'BTLF', udg_Chaoxi[i] )
        set udg_Chaoxi[i]=udg_Chaoxi[i]-1
    else
        call UnitRemoveAbility(u,'A07E')
        call UnitRemoveAbility(u,'Apmf')
    endif
    set u=null
    set m=null
endfunction

function Trig_udoriginhero_Conditions takes nothing returns boolean
    local timer tm
    local player p=GetTriggerPlayer()
    local integer i=GetConvertedPlayerId(p)
    local integer n
    local unit u
    local unit m=GetTriggerUnit()
    local unit t
    if udg_Heronumber[i] == 1 and udg_ExtraHero[i] == null then
        set n=GetRandomInt(udg_HeroRandomNum[5],udg_HeroRandomNum[6])
        if n==0 then
            set u = CreateUnit(p, 'Uwar', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(27, 29)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 17) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(30,37) )
            set n = GetRandomInt(51, 56)
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1, 57) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(51, n) )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'ANdp' )
            call SelectHeroSkill( u, 'A00C' )
            call SelectHeroSkill( u, 'A09Q' )
            call SelectHeroSkill( u, 'A05K' )
            call EnableTrigger(gg_trg_deathfinger)
            call EnableTrigger(gg_trg_chixushifa)
            call TriggerRegisterUnitEvent( gg_trg_deathfinger, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_chixushifa, u, EVENT_UNIT_SPELL_EFFECT )
        elseif n==1 then
            set u = CreateUnit(p, 'Nbrn', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(13, 15)],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), 76 )
            call SetItemUserData(UnitItemInSlot(u, 3), 41 )
            call SetItemUserData(UnitItemInSlot(u, 4), 72 )
            call SetItemUserData(UnitItemInSlot(u, 5), 36 )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A008' )
            call SelectHeroSkill( u, 'A002' )
            call SelectHeroSkill( u, 'A03Q' )
            call SelectHeroSkill( u, 'A02E' )
            call EnableTrigger(gg_trg_meihuodanwei)
            call EnableTrigger(gg_trg_xiaoheilevelup)
            call EnableTrigger(gg_trg_XiaoheiS)
            call TriggerRegisterUnitEvent( gg_trg_XiaoheiS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_meihuodanwei, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_xiaoheilevelup, u, EVENT_UNIT_HERO_LEVEL)
        elseif n==2 then
            set u= CreateUnit(p, 'Nplh', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[13],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 92) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 17) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(93,94) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(20,27) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(61,63) )
            call SelectHeroSkill( u, 'ANrf' )
            call SelectHeroSkill( u, 'ANht' )
            call SelectHeroSkill( u, 'ANdo' )
            call EnableTrigger(gg_trg_pitlord)
            call EnableTrigger(gg_trg_Archmagebillizard)
            call EnableTrigger( gg_trg_pitloadfirerain)
            call TriggerRegisterUnitEvent( gg_trg_pitlord, u, EVENT_UNIT_ATTACKED )
            call TriggerRegisterUnitEvent( gg_trg_pitloadfirerain, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_Archmagebillizard, u, EVENT_UNIT_SPELL_EFFECT )
        elseif n==3 then
            set u = CreateUnit(p, 'Usyl', GetUnitX(m), GetUnitY(m),270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(27, 29)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[16],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 17) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(53,55) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(20,27) )
            call SetItemUserData(UnitItemInSlot(u, 5), 61 )
            call SelectHeroSkill( u, 'A00W' )
            call SelectHeroSkill( u, 'A00X' )
            call SelectHeroSkill( u, 'A00Z' )
            call SelectHeroSkill( u, 'A026' )
            call EnableTrigger(gg_trg_souldragon)
            call EnableTrigger(gg_trg_souldragona)
            call EnableTrigger(gg_trg_magicshield)
            call TriggerRegisterUnitEvent( gg_trg_souldragon, u, EVENT_UNIT_DAMAGED )
            call TriggerRegisterUnitEvent( gg_trg_souldragona, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_magicshield, u, EVENT_UNIT_SPELL_EFFECT )
            call UnitAddAbility( u, 'Amrf' )
            call UnitRemoveAbility( u, 'Amrf' )
            call SetUnitFlyHeight( u, 240.00, 1.00 )
            if IsUnitAlly(u,Player(5))==true then
                set i=udg_RacePlayerNum[3]
            else
                set i=udg_RacePlayerNum[4]
            endif
            set udg_Silinglong[i]=u
        elseif n==4 then//
            set u = CreateUnit(p, 'Udth', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[1],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[16],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(92, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), 91 )
            call SetItemUserData(UnitItemInSlot(u, 3), returnonenumberoftwo(12,14) )
            call SetItemUserData(UnitItemInSlot(u, 4), 33 )
            call SetItemUserData(UnitItemInSlot(u, 5), 61 )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A01O' )
            call SelectHeroSkill( u, 'A01M' )
            call SelectHeroSkill( u, 'A07L' )
            call SelectHeroSkill( u, 'A07K' )
            call EnableTrigger(gg_trg_UG1)
            call EnableTrigger(gg_trg_UG2)
            call EnableTrigger(gg_trg_UGDA)
            call TriggerRegisterUnitEvent( gg_trg_UG1,  u, EVENT_UNIT_ACQUIRED_TARGET )
            //call TriggerRegisterUnitEvent( gg_trg_UG1, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_UG2, u, EVENT_UNIT_DAMAGED )
            call TriggerRegisterUnitEvent( gg_trg_UGDA, u, EVENT_UNIT_SPELL_EFFECT )
        elseif n==5 then
            set u = CreateUnit(p, 'Nman', GetUnitX(m), GetUnitY(m), 270)
            set n = GetRandomInt(90, 93)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[16],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, n) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(n+1, 94) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(11,17) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(20,27) )
            call SetItemUserData(UnitItemInSlot(u, 5), 61 )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A02L' )
            call SelectHeroSkill( u, 'A02Q' )
            call SelectHeroSkill( u, 'A02S' )
            call EnableTrigger( gg_trg_summondeadbody )
            call EnableTrigger(gg_trg_deadkingharm)
            call TriggerRegisterUnitEvent( gg_trg_deadkingharm, u, EVENT_UNIT_DAMAGED )
            call TriggerRegisterUnitEvent( gg_trg_summondeadbody, u, EVENT_UNIT_SPELL_EFFECT )
            if udg_DeathKnight==null then
                set udg_DeathKnight=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE),'u00C',0,0,0)
            endif
            call UnitAddAbility( udg_DeathKnight, 'ACcr' )
        elseif n==6 then
            set u = CreateUnit(p, 'Uktl', GetUnitX(m), GetUnitY(m), 270)
            if udg_TimerBoolean[1]==0 then
                set udg_TimerBoolean[1]=1
                call TimerStart(CreateTimer(),1,true,function checkherohp)
            endif
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[14],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), 81 )
            call SetItemUserData(UnitItemInSlot(u, 3), 41 )
            call SetItemUserData(UnitItemInSlot(u, 4), returnonenumberoftwo(71,42) )
            call SetItemUserData(UnitItemInSlot(u, 5), returnonenumberoftwo(72,52) )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A02U' )
            call SelectHeroSkill( u, 'A02W' )
            call SelectHeroSkill( u, 'A06O' )
            set  udg_Chaoxi[i]=0
            call EnableTrigger( gg_trg_kuloubingjian)
            call EnableTrigger( gg_trg_gugongyinshenhero)
            call TriggerRegisterUnitEvent( gg_trg_kuloubingjian, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_gugongyinshenhero, u, EVENT_UNIT_SPELL_EFFECT )
            if IsUnitAlly(u,Player(5))==true then
                set udg_HelperHero[9]=u
            else
                set udg_HelperHero[10]=u
            endif
        elseif n==7 then
            set udg_DianGroup[i]=CreateGroup()
            set u = CreateUnit(p, 'Npld', GetUnitX(m), GetUnitY(m), 270)
            set n = GetRandomInt(90, 92)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, n) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(n+1, 93) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(11, 17) )
            set n = GetRandomInt(52, 56)
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(52,n) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1,57))
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A046' )
            call SelectHeroSkill( u, 'A047' )
            call SelectHeroSkill( u, 'A044' )
            call EnableTrigger( gg_trg_DianS )
            call EnableTrigger(gg_trg_DianA)
            call EnableTrigger(gg_trg_DianD)
            call TriggerRegisterUnitEvent( gg_trg_DianA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_DianD, u, EVENT_UNIT_ATTACKED )
            call TriggerRegisterUnitEvent( gg_trg_DianS, u, EVENT_UNIT_SPELL_EFFECT )
        elseif n==8 then
            set u = CreateUnit(p, 'N002', GetUnitX(m), GetUnitY(m), 270)
            set n = GetRandomInt(52, 55)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(27, 29)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 17) )
            call SetItemUserData(UnitItemInSlot(u, 4), 51 )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(52,n) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1,56) )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A04N' )
            call SelectHeroSkill( u, 'A04G' )
            call SelectHeroSkill( u, 'A01H' )
            call EnableTrigger( gg_trg_FireQueenA )
            call EnableTrigger(gg_trg_FireQueen)
            call TriggerRegisterUnitEvent( gg_trg_FireQueenA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_FireQueen, u, EVENT_UNIT_SPELL_EFFECT )
            if IsUnitAlly(u,Player(5))==true then
                set udg_SpellTarget[udg_RacePlayerNum[3]]=CreateUnit(Player(5),'u00C',0,0,0)
                call UnitAddAbility(udg_SpellTarget[udg_RacePlayerNum[3]],'A04Q')
            else
                set udg_SpellTarget[udg_RacePlayerNum[4]]=CreateUnit(Player(11),'u00C',0,0,0)
                call UnitAddAbility(udg_SpellTarget[udg_RacePlayerNum[4]],'A04Q')
            endif
        elseif n==9 then
            set u = CreateUnit(p, 'E002', GetUnitX(m), GetUnitY(m), 270)
            set n = GetRandomInt(72, 76)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[14],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 94) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 15) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(32, 40) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(72,n) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1,77) )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A04Y' )
            call SelectHeroSkill( u, 'A058' )
            call SelectHeroSkill( u, 'A05A' )
            call EnableTrigger( gg_trg_CKA )
            call EnableTrigger(gg_trg_CKH)
            call EnableTrigger(gg_trg_CKS)
            call TriggerRegisterUnitEvent( gg_trg_CKA, u, EVENT_UNIT_ACQUIRED_TARGET )
            //call TriggerRegisterUnitEvent( gg_trg_CKA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_CKS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_CKH, u, EVENT_UNIT_DAMAGED )
        elseif n==10 then
            set u = CreateUnit(p, 'U001', GetUnitX(m), GetUnitY(m), 270)
            set n = GetRandomInt(51, 56)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(27, 29)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 16) )
            call SetItemUserData(UnitItemInSlot(u, 3), 22 )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(51,n) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1,57) )
            call SetHeroLevel( u, 10, false )
            call EnableTrigger( gg_trg_XNA )
            call EnableTrigger(gg_trg_XNS)
            call SelectHeroSkill( u, 'A05O' )
            call SelectHeroSkill( u, 'A05P' )
            call SelectHeroSkill( u, 'A05R' )
            call SelectHeroSkill( u, 'A05M' )
            call TriggerRegisterUnitEvent( gg_trg_XNA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_XNS, u, EVENT_UNIT_SPELL_EFFECT )
            if udg_TimerBoolean[1]==0 then
                set udg_TimerBoolean[1]=1
                call TimerStart(CreateTimer(),1,true,function checkherohp)
            endif
            if IsUnitAlly(u,Player(5))==true then
                set udg_HelperHero[11]=u
            else
                set udg_HelperHero[12]=u
            endif
        elseif n==11 then
            set u = CreateUnit(p, 'N001', GetUnitX(m), GetUnitY(m), 270)
            set n = GetRandomInt(90, 93)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[16],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, n) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(n+1, 94) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(11,17) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(20,27) )
            call SetItemUserData(UnitItemInSlot(u, 5), 61 )
            call SetHeroLevel( u, 10, false )
            call EnableTrigger( gg_trg_DZA )
            call EnableTrigger(gg_trg_DZS)
            call EnableTrigger(gg_trg_DZD)
            call SelectHeroSkill( u, 'A01N' )
            call SelectHeroSkill( u, 'A03G' )
            call TriggerRegisterUnitEvent( gg_trg_DZA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_DZS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_DZD, u, EVENT_UNIT_DAMAGED )
        elseif n==12 then
            set tm=CreateTimer()
            set u = CreateUnit(p, 'N007', GetUnitX(m), GetUnitY(m), 270)
            call SaveUnitHandle(udg_hash,GetHandleId(tm),1,u)
            call TimerStart(tm,1,true,function ronghuahp)
            set n = GetRandomInt(61, 62)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[16],5)
            call SetItemUserData(UnitItemInSlot(u, 1), 91 )
            call SetItemUserData(UnitItemInSlot(u, 2), returnonenumberoftwo(20, 27) )
            call SetItemUserData(UnitItemInSlot(u, 3), returnonenumberoftwo(12,17) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(61,n) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1,63) )
            call SetHeroLevel( u, 10, false )
            call EnableTrigger( gg_trg_SJA )
            call EnableTrigger(gg_trg_SJS)
            call EnableTrigger(gg_trg_SJH)
            call SelectHeroSkill( u, 'A079' )
            call SelectHeroSkill( u, 'A07A' )
            call SelectHeroSkill( u, 'A07B' )
            call SelectHeroSkill( u, 'A07D' )
            call TriggerRegisterUnitEvent( gg_trg_SJA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_SJS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_SJH, u, EVENT_UNIT_DAMAGED )
            set tm=null
        elseif n==13 then
            set u = CreateUnit(p, 'N009', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(27, 29)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            set n = GetRandomInt(51, 56)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,17) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(32,38) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(51,n) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1,57) )
            call SetHeroLevel( u, 10, false )
            call EnableTrigger( gg_trg_DAA )
            call EnableTrigger(gg_trg_DAS)
            call SelectHeroSkill( u, 'A089' )
            call SelectHeroSkill( u, 'A08A' )
            call SelectHeroSkill( u, 'A088' )
            call TriggerRegisterUnitEvent( gg_trg_DAA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_DAS, u, EVENT_UNIT_SPELL_EFFECT )
        elseif n==14 then
            set u = CreateUnit(p, 'N00F', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(14, 16)],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 94) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 17)  )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(61, 62)  )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(20, 27)  )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(62, 63)  )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A097' )
            call SelectHeroSkill( u, 'ANsy' )
            call SelectHeroSkill( u, 'A093' )
            call SelectHeroSkill( u, 'A094' )
            call EnableTrigger(gg_trg_SPS)
            call EnableTrigger(gg_trg_SPA)
            call TriggerRegisterUnitEvent( gg_trg_SPA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_SPS, u, EVENT_UNIT_SPELL_EFFECT )
            if IsUnitAlly(u,Player(5))==true then
                set udg_Chaoxi[i]=11
            else
                set udg_Chaoxi[i]=5
            endif
        elseif n==15 then
            set u = CreateUnit(p, 'N00B', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(14, 16)],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 95) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 17)  )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(61, 62)  )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(20, 27)  )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(62, 63)  )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A0AI' )
            call SelectHeroSkill( u, 'A0AR' )
            call SelectHeroSkill( u, 'A0AK' )
            call SelectHeroSkill( u, 'A0AJ' )
            call EnableTrigger(gg_trg_DOS)
            call EnableTrigger(gg_trg_DOA)
            call EnableTrigger(gg_trg_DOH)
            call TriggerRegisterUnitEvent( gg_trg_DOA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_DOS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_DOH, u, EVENT_UNIT_DAMAGED )
        endif
        set udg_Chaoxi[0]=udg_Chaoxi[0]+1
        call BJDebugMsg( I2S(udg_Chaoxi[0])+GetPlayerName(p)+GetUnitName(u) )
        call SetPlayerName( p, GetUnitName(u) )
        call ModifyHeroSkillPoints( u, bj_MODIFYMETHOD_SET, 0 )
        set i=GetConvertedPlayerId(p)
        set udg_SpellTimer[i]=0
        set udg_ExtraHero[i] = u
        if udg_ExtraHero[udg_RacePlayerNum[3]]!=null and udg_ExtraHero[udg_RacePlayerNum[4]]!=null then
            call RemoveUndeadHeroTrigger()
        endif
        call TriggerRegisterUnitEvent( gg_trg_herolevelup, u, EVENT_UNIT_HERO_LEVEL )
        call TriggerRegisterUnitEvent( gg_trg_deathcamera, u, EVENT_UNIT_DEATH )
        call GroupAddUnit( udg_HeroGroup, u )
        if IsUnitAlly(u,Player(5))==true then
            call GroupAddUnit( udg_BlueTeamHero, u )
        else
            call GroupAddUnit( udg_RedTeamHero, u )
        endif
    endif
    
    set t= GetTrainedUnit()
    set udg_ComHero[( ( ( 3 * i ) - 2 ) + udg_Heronumber[i] )] = t
    set udg_LiveComHero[i]=t
    set udg_Heronumber[i] = ( udg_Heronumber[i] + 1 )
    set n=GetUnitTypeId(t)
    if  n== 'Ulic' then
        call EnableTrigger(gg_trg_lichnova)
        call EnableTrigger(gg_trg_lichdetah)
        call TriggerRegisterUnitEvent( gg_trg_lichnova, t, EVENT_UNIT_TARGET_IN_RANGE )
        //call TriggerRegisterUnitEvent( gg_trg_lichnova, t, EVENT_UNIT_ACQUIRED_TARGET )
        call TriggerRegisterUnitEvent( gg_trg_lichdetah, t, EVENT_UNIT_DEATH )
    elseif n == 'Udea' then
        call EnableTrigger(gg_trg_deathknightC)
        call TriggerRegisterUnitEvent( gg_trg_deathknightC, t, EVENT_UNIT_ATTACKED )
        if udg_DeathKnight==null then
            set udg_DeathKnight=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE),'u00C',0,0,0)
        endif
        call UnitAddAbility( udg_DeathKnight, 'ACdc' )
    elseif n == 'Udre' then
        call EnableTrigger(gg_trg_NightKingE)
        call TriggerRegisterUnitEvent( gg_trg_NightKingE, t, EVENT_UNIT_ATTACKED )
        if udg_DeathKnight==null then
            set udg_DeathKnight=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE),'u00C',0,0,0)
        endif
        call UnitAddAbility( udg_DeathKnight, 'A04E' )
    endif
    
    if udg_Heronumber[udg_RacePlayerNum[3]]==3 and udg_Heronumber[udg_RacePlayerNum[4]]==3 then
        call DestroyTrigger( GetTriggeringTrigger() )
    endif
    
    set t=null
    set p=null
    set u=null
    set m=null
    set tm=null
    return false
endfunction


//===========================================================================
function InitTrig_udoriginhero takes nothing returns nothing
    set gg_trg_udoriginhero = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_udoriginhero, Condition( function Trig_udoriginhero_Conditions ) )
endfunction
