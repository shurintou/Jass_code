
//===========================================================================
// Trigger: HeroAddItem
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
// 39 xilandao
// 40 kuangzhan
//===========================================================================
function Trig_HeroAddItem_Conditions takes nothing returns boolean
    local unit u= GetTrainedUnit()
    local integer i=GetUnitTypeId(u)
    local integer n
    local integer g
    local player p=GetOwningPlayer(u)
    local integer e=GetUnitPointValue(u)
    
    if  GetPlayerRace(p) == RACE_HUMAN then
    else
        call SetPlayerTechMaxAllowedSwap( i, 1, p )
        call GroupAddUnit( udg_HeroGroup, u )
        if IsUnitAlly(u,Player(5))==true then
            call GroupAddUnit( udg_BlueTeamHero, u )
        else
            call GroupAddUnit( udg_RedTeamHero, u )
        endif
        call TriggerRegisterUnitEvent( gg_trg_herolevelup, u, EVENT_UNIT_HERO_LEVEL )
        call TriggerRegisterUnitEvent( gg_trg_deathcamera, u, EVENT_UNIT_DEATH )
        call TriggerRegisterUnitEvent( gg_trg_learnskill, u, EVENT_UNIT_HERO_SKILL )
        call SetHeroLevel( u, 10, false )
        call ModifyHeroSkillPoints( u, bj_MODIFYMETHOD_SET, 0 )
    endif
    if e==60 then
        call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
        call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
        call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
        call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
        call UnitAddItemToSlotById( u,udg_PreItem[13],5)
        if GetRandomInt(0,1)==0 then
            if i=='Hpal' then
                call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 94) )
                call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(41,42) )
                call SetItemUserData(UnitItemInSlot(u, 3), 34 )
                call SetItemUserData(UnitItemInSlot(u, 4), 21)
                call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(61, 62) )
            else
                set n = GetRandomInt(90, 93)
                call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, n) )
                call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(n+1,94) )
                call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(11, 17) )
                call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(20, 27) )
                call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(61, 63) )
            endif
        else
            if i=='Hpal' then
                call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 94) )
                call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(41,42) )
                call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(32, 40) )
                call SetItemUserData(UnitItemInSlot(u, 4), 61 )
                call SetItemUserData(UnitItemInSlot(u, 5), 62 )
            else
                set n = GetRandomInt(20, 26)
                call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 94) )
                call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,17) )
                call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(20, n) )
                call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(n+1, 27) )
                call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(61, 63) )
            endif
        endif
        
    else
        if IsUnitType(u, UNIT_TYPE_MELEE_ATTACKER) == true then
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[14],5)
            if GetUnitTypeId(u) == 'Edem' then///demonhunter
                set n = GetRandomInt(72, 74)
                call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
                call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,17) )
                call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(32, 37) )
                call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(72, n) )
                call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1, 75) )
            elseif GetUnitTypeId(u) == 'Ewar' then // warden
                if GetRandomInt(0, 1) == 0 then
                    set n = GetRandomInt(90, 93)
                    call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, n) )
                    call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(n+1,94) )
                else
                    call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 94) )
                    call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,17) )
                endif

                call SetItemUserData(UnitItemInSlot(u, 3), 39 )
                call SetItemUserData(UnitItemInSlot(u, 4), 24 )
                call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(62, 63) )
            else/////blade master
                if GetRandomInt(1, 2)==1 then
                    set n = GetRandomInt(72, 76)
                    call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
                    call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,17) )
                    call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(32, 40) )
                    call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(72, n) )
                    call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1, 77) )
                else
                    set g = GetRandomInt(72, 75)
                    set n = GetRandomInt(72, g)
                    call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
                    call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(32,40) )
                    call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(72, n) )
                    set g = GetRandomInt(( n + 1 ), 76)
                    call SetItemUserData(UnitItemInSlot(u, 4), g )
                    call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(g+1, 77) )
                endif
            endif
        else
            if e==61 then
                call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
                call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
                call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
                call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
                call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(14, 15)],5)
                
                if GetUnitTypeId(u) == 'Emoo' then///pom
                    call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
                    call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,17) )
                    call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(30,31) )
                    set n = GetRandomInt(71, 75)
                    call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(71, n) )
                    call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1, 76) )
                else//shadow hunter
                    call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
                    call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,17) )
                    call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(30, 37) )
                    set n = GetRandomInt(51, 55)
                    call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(51, n) )
                    call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1, 56) )
                endif
                
            else
                call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
                call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
                call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(27, 29)],3)
                call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
                call UnitAddItemToSlotById( u,udg_PreItem[15],5)
                call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
                call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,17) )
                call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(30, 37) )
                set n = GetRandomInt(51, 55)
                call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1, 56) )
                call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(51, n) )
            endif
        endif
    endif
    
    if (GetTriggerEvalCount(gg_trg_HeroAddItem)) ==24 then
        call DestroyTrigger( gg_trg_HeroAddItem )
    endif
    
    set u=null
    set p=null
    return false
endfunction



//===========================================================================
function InitTrig_HeroAddItem takes nothing returns nothing
    set gg_trg_HeroAddItem = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_HeroAddItem, Condition( function Trig_HeroAddItem_Conditions ) )
endfunction
