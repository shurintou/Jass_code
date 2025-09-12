
//===========================================================================
// Trigger: neoriginhero
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
function RemoveNightElfHeroTrigger takes nothing returns nothing
    local integer i1=GetUnitTypeId(udg_ExtraHero[udg_RacePlayerNum[7]])
    local integer i2=GetUnitTypeId(udg_ExtraHero[udg_RacePlayerNum[8]])
    if i1!='Nngs' and i2!='Nngs' then
        call DestroyTrigger(gg_trg_naga)
        call DestroyTrigger(gg_trg_nageshield)
    endif
    if i1!='Nalc' and i2!='Nalc' then
        call DestroyTrigger(gg_trg_lianjin)
        call DestroyTrigger(gg_trg_lianjingetharm)
        call DestroyTrigger(gg_trg_lianjinyiliaobo)
    endif
    if i1!='Ekgg' and i2!='Ekgg' then
        call DestroyTrigger(gg_trg_nelaolu)
        call DestroyTrigger(gg_trg_nelaolujifeng)
    endif
    if i1!='Hvsh' and i2!='Hvsh' then
        call DestroyTrigger(gg_trg_fishmanstomp)
        call DestroyTrigger(gg_trg_fishmanshield)
    endif
    if i1!='Ewrd' and i2!='Ewrd' then
        call DestroyTrigger(gg_trg_VNW1)
        call DestroyTrigger(gg_trg_VNW2)
        call DestroyTrigger(gg_trg_VNQ)
    endif
    if i1!='Eill' and i2!='Eill' then
        call DestroyTrigger(gg_trg_XINGattack)
        call DestroyTrigger(gg_trg_XINGharmed)
        call DestroyTrigger(gg_trg_XINGSpell)
    endif
    if i1!='Eevi' and i2!='Eevi' then
        call DestroyTrigger(gg_trg_Chaoxiattacked)
        call DestroyTrigger(gg_trg_Chaoxiattack)
        call DestroyTrigger(gg_trg_ChaoxiSpell)
    endif
    if i1!='Emns' and i2!='Emns' then
        call DestroyTrigger(gg_trg_TreeA)
        call DestroyTrigger(gg_trg_TreeS)
    endif
    if i1!='H001' and i2!='H001' then
        call DestroyTrigger(gg_trg_TimeA)
        call DestroyTrigger(gg_trg_TimeS)
    endif
    if i1!='E001' and i2!='E001' then
        call DestroyTrigger(gg_trg_NLA)
        call DestroyTrigger(gg_trg_NLS)
        call DestroyTrigger(gg_trg_NLL)
    endif
    if i1!='H002' and i2!='H002' then
        call DestroyTrigger(gg_trg_LRS)
        call DestroyTrigger(gg_trg_LRA)
    endif
    if i1!='H005' and i2!='H005' then
        call DestroyTrigger(gg_trg_SNagaS)
        call DestroyTrigger(gg_trg_SNagaA)
        call DestroyTrigger(gg_trg_SNagaD)
    endif
    if i1!='E003' and i2!='E003' then
        call DestroyTrigger(gg_trg_GDS)
        call DestroyTrigger(gg_trg_GDA)
    endif
    if i1!='N00C' and i2!='N00C' then
        call DestroyTrigger(gg_trg_LMS)
        call DestroyTrigger(gg_trg_LMA)
    endif
    if i1!='H009' and i2!='H009' then
        call DestroyTrigger(gg_trg_PAS)
        call DestroyTrigger(gg_trg_PAA)
    endif
    if i1!='H00D' and i2!='H00D' then
        call DestroyTrigger(gg_trg_SSS)
        call DestroyTrigger(gg_trg_SSA)
        call DestroyTrigger(gg_trg_SSH)
    endif
endfunction

function Trig_neoriginhero_Conditions takes nothing returns boolean
    local timer tm
    local player p=GetTriggerPlayer()
    local integer i=GetConvertedPlayerId(p)
    local integer n
    local unit u
    local unit m=GetTriggerUnit()
    local unit t
    if udg_Heronumber[i] == 1 and udg_ExtraHero[i] == null then
        set n=GetRandomInt(udg_HeroRandomNum[7],udg_HeroRandomNum[8])
        if n==0 then
            set u = CreateUnit(p, 'Nngs', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            call SetItemUserData(UnitItemInSlot(u, 1), 36 )
            call SetItemUserData(UnitItemInSlot(u, 2), 31 )
            call SetItemUserData(UnitItemInSlot(u, 3), 72 )
            call SetItemUserData(UnitItemInSlot(u, 4), 76 )
            call SetItemUserData(UnitItemInSlot(u, 5), 13 )
            call SetHeroLevel( u, 10, false )
            call IssueImmediateOrderById( u, 852589 )
            call SelectHeroSkill( u, 'ANfl' )
            call SelectHeroSkill( u, 'A009' )
            call EnableTrigger(gg_trg_naga)
            call EnableTrigger(gg_trg_nageshield)
            call TriggerRegisterUnitEvent( gg_trg_naga, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_nageshield, u, EVENT_UNIT_DAMAGED )
        elseif n==1 then
            set u = CreateUnit(p, 'Nalc', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[13],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 95) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 17) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(20, 27) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(32, 37) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(61, 62) )
            call SelectHeroSkill( u, 'ANhs' )
            call SelectHeroSkill( u, 'ANab' )
            call SelectHeroSkill( u, 'ANcr' )
            call SelectHeroSkill( u, 'A027' )
            call EnableTrigger(gg_trg_lianjin)
            call EnableTrigger(gg_trg_lianjingetharm)
            call EnableTrigger(gg_trg_lianjinyiliaobo)
            call TriggerRegisterUnitEvent( gg_trg_lianjin, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_lianjingetharm, u, EVENT_UNIT_DAMAGED )
            call TriggerRegisterUnitEvent( gg_trg_lianjinyiliaobo, u, EVENT_UNIT_SPELL_EFFECT )
        elseif n==2 then
            set u = CreateUnit(p, 'Ekgg', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(27, 29)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 17) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(30, 37) )
            set n = GetRandomInt(51, 56)
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1, 57) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(51, n) )
            call SelectHeroSkill( u, 'ANmo' )
            call SelectHeroSkill( u, 'A00F' )
            call SelectHeroSkill( u, 'A00G' )
            call SelectHeroSkill( u, 'ANto' )
            call EnableTrigger(gg_trg_nelaolu)
            call EnableTrigger(gg_trg_nelaolujifeng)
            call TriggerRegisterUnitEvent( gg_trg_nelaolu, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_nelaolujifeng, u, EVENT_UNIT_SPELL_EFFECT )
            
        elseif n==3 then
            set u = CreateUnit(p, 'Hvsh', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[13],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(92, 94) )
            call SetItemUserData(UnitItemInSlot(u, 2), 91 )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(11, 16) )
            call SetItemUserData(UnitItemInSlot(u, 4), 21 )
            call SetItemUserData(UnitItemInSlot(u, 5), returnonenumberoftwo(63,returnonenumberoftwo(34,73)) )
            call SelectHeroSkill( u, 'A01D' )
            call SelectHeroSkill( u, 'A01B' )
            call SelectHeroSkill( u, 'A01C' )
            call EnableTrigger(gg_trg_fishmanstomp)
            call EnableTrigger(gg_trg_fishmanshield)
            call TriggerRegisterUnitEvent( gg_trg_fishmanstomp, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_fishmanshield, u, EVENT_UNIT_DAMAGED )
        elseif n==4 then
            set tm=CreateTimer()
            set u = CreateUnit(p, 'Ewrd', GetUnitX(m), GetUnitY(m), 270)
            set n=GetRandomInt(71,75)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[14],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 16) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(30, 37) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(71, n) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1, 76) )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A01I' )
            call SelectHeroSkill( u, 'A01J' )
            call EnableTrigger(gg_trg_VNW1)
            call EnableTrigger(gg_trg_VNW2)
            call EnableTrigger(gg_trg_VNQ)
            call TriggerRegisterUnitEvent( gg_trg_VNW1, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_VNW2, u, EVENT_UNIT_DAMAGED )
            call TriggerRegisterUnitEvent( gg_trg_VNQ, u, EVENT_UNIT_SPELL_EFFECT )
        elseif n==5 then
            set u = CreateUnit(p, 'Eill', GetUnitX(m), GetUnitY(m), 270)
            set n=GetRandomInt(90,94)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[16],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, n) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 17) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(n+1, 95) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(20, 27) )
            call SetItemUserData(UnitItemInSlot(u, 5), 61)
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A036' )
            call SelectHeroSkill( u, 'A05D' )
            call EnableTrigger(gg_trg_XINGattack)
            call EnableTrigger(gg_trg_XINGharmed)
            call EnableTrigger(gg_trg_XINGSpell)
            call TriggerRegisterUnitEvent( gg_trg_XINGharmed,u, EVENT_UNIT_DAMAGED )
            call TriggerRegisterUnitEvent( gg_trg_XINGSpell, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_XINGattack, u, EVENT_UNIT_TARGET_IN_RANGE )
        elseif n==6 then
            set u = CreateUnit(p, 'Eevi', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            set n=GetRandomInt(90,94)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[13],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, n) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 17) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(n+1, 95) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(20, 27) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(61, 63))
            call SelectHeroSkill( u, 'A01K' )
            call SelectHeroSkill( u, 'A02K' )
            call SelectHeroSkill( u, 'A03D' )
            call EnableTrigger(gg_trg_Chaoxiattacked)
            call EnableTrigger(gg_trg_Chaoxiattack)
            call EnableTrigger(gg_trg_ChaoxiSpell)
            call TriggerRegisterUnitEvent( gg_trg_Chaoxiattacked, u, EVENT_UNIT_ATTACKED )
            call TriggerRegisterUnitEvent( gg_trg_ChaoxiSpell, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_Chaoxiattack, u, EVENT_UNIT_TARGET_IN_RANGE )
        elseif n==7 then
            set u = CreateUnit(p, 'Emns', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(27, 29)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            set n=GetRandomInt(51,56)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 17) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(30, 37) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(51, n) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1, 57))
            call SelectHeroSkill( u, 'A03W' )
            call SelectHeroSkill( u, 'A03V' )
            call SelectHeroSkill( u, 'A03U' )
            call SelectHeroSkill( u, 'A03X' )
            call SelectHeroSkill( u, 'A05B' )
            call EnableTrigger(gg_trg_TreeA)
            call EnableTrigger(gg_trg_TreeS)
            call TriggerRegisterUnitEvent( gg_trg_TreeS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_TreeA, u, EVENT_UNIT_TARGET_IN_RANGE )
        elseif n==8 then
            set u = CreateUnit(p, 'H001', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(27, 29)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            call SetItemUserData(UnitItemInSlot(u, 1), returnonenumberoftwo(92, 94) )
            call SetItemUserData(UnitItemInSlot(u, 2), returnonenumberoftwo(11, 17) )
            call SetItemUserData(UnitItemInSlot(u, 3), 22 )
            call SetItemUserData(UnitItemInSlot(u, 4), 53)
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(54, 55))
            call SelectHeroSkill( u, 'A04C' )
            call SelectHeroSkill( u, 'A04F' )
            call SelectHeroSkill( u, 'A04B' )
            call EnableTrigger(gg_trg_TimeA)
            call EnableTrigger(gg_trg_TimeS)
            call TriggerRegisterUnitEvent( gg_trg_TimeS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_TimeA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_TimeA, u, EVENT_UNIT_ACQUIRED_TARGET )
        elseif n==9 then
            set u = CreateUnit(p, 'E001', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[14],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 16) )
            call SetItemUserData(UnitItemInSlot(u, 3), 74 )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(71, 72) )
            call SetItemUserData(UnitItemInSlot(u, 5), 36)
            call SelectHeroSkill( u, 'A051' )
            call SelectHeroSkill( u, 'A052' )
            call SelectHeroSkill( u, 'A054' )
            call EnableTrigger(gg_trg_NLA)
            call EnableTrigger(gg_trg_NLS)
            call EnableTrigger(gg_trg_NLL)
            call TriggerRegisterUnitEvent( gg_trg_NLS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_NLA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_NLL, u, EVENT_UNIT_HERO_LEVEL )
        elseif n==10 then
            set u = CreateUnit(p, 'H002', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(13, 14)],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 94) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,17) )
            call SetItemUserData(UnitItemInSlot(u, 3), 21 )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(32, 38) )
            call SetItemUserData(UnitItemInSlot(u, 5), 62)
            call EnableTrigger(gg_trg_LRS)
            call EnableTrigger(gg_trg_LRA)
            call SelectHeroSkill( u, 'A05Z' )
            call SelectHeroSkill( u, 'A05W' )
            call SelectHeroSkill( u, 'A05V' )
            //call TriggerRegisterUnitEvent( gg_trg_LRA, u, EVENT_UNIT_ACQUIRED_TARGET )
            call TriggerRegisterUnitEvent( gg_trg_LRS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_LRA, u, EVENT_UNIT_TARGET_IN_RANGE )
            set tm=CreateTimer()
            set n=GetHandleId(tm)
            call SaveUnitHandle(udg_hash,n,1,u)
            call SaveUnitHandle(udg_hash,n,2,CreateUnit(Player(PLAYER_NEUTRAL_AGGRESSIVE),'n004',0,0,0))
            call TimerStart(tm,1,true,function checktimerday)
            set tm=null
        elseif n==11 then
            set u = CreateUnit(p, 'H005', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(13, 15)],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 95) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(73, 77) )
            call SetItemUserData(UnitItemInSlot(u, 3), 72 )
            call SetItemUserData(UnitItemInSlot(u, 4), 34 )
            call SetItemUserData(UnitItemInSlot(u, 5), 21)
            call SelectHeroSkill( u, 'A06F' )
            call SelectHeroSkill( u, 'A06E' )
            call SelectHeroSkill( u, 'A06H' )
            call SelectHeroSkill( u, 'A06I' )
            call EnableTrigger(gg_trg_SNagaS)
            call EnableTrigger(gg_trg_SNagaA)
            call EnableTrigger(gg_trg_SNagaD)
            call TriggerRegisterUnitEvent( gg_trg_SNagaS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_SNagaD, u, EVENT_UNIT_ATTACKED  )
            call TriggerRegisterUnitEvent( gg_trg_SNagaA, u, EVENT_UNIT_TARGET_IN_RANGE )
        elseif n==12 then
            set udg_DianGroup[i]=CreateGroup()
            set u = CreateUnit(p, 'E003', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(13, 15)],5)
            set n=GetRandomInt(52,55)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 17) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(71, 72) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(52, n))
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(n+1, 56))
            call EnableTrigger(gg_trg_GDS)
            call EnableTrigger(gg_trg_GDA)
            call SelectHeroSkill( u, 'A07I' )
            call SelectHeroSkill( u, 'A07J' )
            call SelectHeroSkill( u, 'A07G' )
            call TriggerRegisterUnitEvent( gg_trg_GDS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_GDA, u, EVENT_UNIT_TARGET_IN_RANGE )
        elseif n==13 then
            set u = CreateUnit(p, 'N00C', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            set n=GetRandomInt(52,56)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(13, 15)],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 17) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(71,72) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(52, n))
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(n+1, 57))
            call EnableTrigger(gg_trg_LMS)
            call EnableTrigger(gg_trg_LMA)
            call SelectHeroSkill( u, 'A08O' )
            call SelectHeroSkill( u, 'A08P' )
            call SelectHeroSkill( u, 'A08V' )
            call TriggerRegisterUnitEvent( gg_trg_LMS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_LMA, u, EVENT_UNIT_TARGET_IN_RANGE )
        elseif n==14 then
            set u = CreateUnit(p, 'H009', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(13, 15)],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            set n=GetRandomInt(71,75)
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(71,n) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(n+1, 76))
            set n=GetRandomInt(52,53)
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(52, n))
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(n+1, 54) )
            call EnableTrigger(gg_trg_PAS)
            call EnableTrigger(gg_trg_PAA)
            call SelectHeroSkill( u, 'A09E' )
            call SelectHeroSkill( u, 'A09F' )
            call SelectHeroSkill( u, 'A09G' )
            call TriggerRegisterUnitEvent( gg_trg_PAS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_PAA, u, EVENT_UNIT_TARGET_IN_RANGE )
        elseif n==15 then
            set udg_DianGroup[i]=CreateGroup()
            set u = CreateUnit(p, 'H00D', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[13],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 95))
            call SetItemUserData(UnitItemInSlot(u, 4), returnonenumberoftwo(returnonenumberoftwo(61,36),63))
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(20, 27))
            call SetItemUserData(UnitItemInSlot(u, 5), 62)
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(11, 17))
            call EnableTrigger(gg_trg_SSS)
            call EnableTrigger(gg_trg_SSA)
            call EnableTrigger(gg_trg_SSH)
            call SelectHeroSkill( u, 'A0A1' )
            call SelectHeroSkill( u, 'A0A4' )
            call SelectHeroSkill( u, 'A0A6' )
            call TriggerRegisterUnitEvent( gg_trg_SSS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_SSA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_SSH, u, EVENT_UNIT_DAMAGED )
        endif
        set udg_Chaoxi[0]=udg_Chaoxi[0]+1
        call BJDebugMsg( I2S(udg_Chaoxi[0])+GetPlayerName(p)+GetUnitName(u) )
        call SetPlayerName( p, GetUnitName(u) )
        call ModifyHeroSkillPoints( u, bj_MODIFYMETHOD_SET, 0 )
        set i=GetConvertedPlayerId(p)
        set udg_SpellTimer[i]=0
        set udg_ExtraHero[i] = u
        if udg_ExtraHero[udg_RacePlayerNum[7]]!=null and udg_ExtraHero[udg_RacePlayerNum[8]]!=null then
            call RemoveNightElfHeroTrigger()
            
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
    if  n== 'Ekee' then
        call EnableTrigger(gg_trg_ATTackHum)
        call TriggerRegisterUnitEvent( gg_trg_ATTackHum, t, EVENT_UNIT_TARGET_IN_RANGE )
        
    endif
    
    
    if udg_Heronumber[udg_RacePlayerNum[7]]==3 and udg_Heronumber[udg_RacePlayerNum[8]]==3 then
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
function InitTrig_neoriginhero takes nothing returns nothing
    set gg_trg_neoriginhero = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_neoriginhero, Condition( function Trig_neoriginhero_Conditions ) )
endfunction
