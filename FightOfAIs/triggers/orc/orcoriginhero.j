
//===========================================================================
// Trigger: orcoriginhero
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
function RemoveOrcHeroTrigger takes nothing returns nothing
    local integer i1=GetUnitTypeId(udg_ExtraHero[udg_RacePlayerNum[6]])
    local integer i2=GetUnitTypeId(udg_ExtraHero[udg_RacePlayerNum[5]])
    if i1!='Npbm' and i2!='Npbm' then
        call DestroyTrigger(gg_trg_panda)
        call DestroyTrigger(gg_trg_pandafangda)
    endif
    if i1!='Nbst' and i2!='Nbst' then
        call DestroyTrigger(gg_trg_shouwang)
        call DestroyTrigger(gg_trg_shouwangH)
        call DestroyTrigger(gg_trg_shouwangfangda)
    endif
    if i1!='Opgh' and i2!='Opgh' then
        call DestroyTrigger(gg_trg_Gromattacked)
        call DestroyTrigger(gg_trg_GromTaunt)
        call DestroyTrigger(gg_trg_Gromchaofeng )
    endif
    if i1!='Naka' and i2!='Naka' then
        call DestroyTrigger(gg_trg_Akamaillusion)
    endif
    if i1!='Ogld' and i2!='Ogld' then
        call DestroyTrigger(gg_trg_guerdant)
        call DestroyTrigger(gg_trg_healingunit)
    endif
    if i1!='Odrt' and i2!='Odrt' then
        call DestroyTrigger(gg_trg_shenlingAren)
        call DestroyTrigger(gg_trg_huixueV)
        call DestroyTrigger(gg_trg_shenlinggetharm)
    endif
    if i1!='Ogrh' and i2!='Ogrh' then
        call DestroyTrigger(gg_trg_ChaosA)
        call DestroyTrigger(gg_trg_ChaosS)
    endif
    if i1!='Orkn' and i2!='Orkn' then
        call DestroyTrigger(gg_trg_JDA)
        call DestroyTrigger(gg_trg_JDS)
        call DestroyTrigger(gg_trg_JDD)
    endif
    if i1!='O00A' and i2!='O00A' then
        call DestroyTrigger(gg_trg_MengmaA)
        call DestroyTrigger(gg_trg_MengmaS)
        call DestroyTrigger(gg_trg_MengmaH)
    endif
    if i1!='O009' and i2!='O009' then
        call DestroyTrigger(gg_trg_AMA)
        call DestroyTrigger(gg_trg_AMS)
        call DestroyTrigger(gg_trg_AMY)
    endif
    if i1!='O00B' and i2!='O00B' then
        call DestroyTrigger(gg_trg_ZDA)
        call DestroyTrigger(gg_trg_ZDS)
    endif
    if i1!='O00D' and i2!='O00D' then
        call DestroyTrigger(gg_trg_WLA)
        call DestroyTrigger(gg_trg_WLS)
        call DestroyTrigger(gg_trg_WLH)
    endif
    if i1!='O00F' and i2!='O00F' then
        call DestroyTrigger(gg_trg_JumoA)
        call DestroyTrigger(gg_trg_JumoS)
    endif
    if i1!='O00G' and i2!='O00G' then
        call DestroyTrigger(gg_trg_TCA)
        call DestroyTrigger(gg_trg_TCS)
        call DestroyTrigger(gg_trg_TCH)
    endif
    if i1!='O00H' and i2!='O00H' then
        call DestroyTrigger(gg_trg_IBA)
        call DestroyTrigger(gg_trg_IBS)
        call DestroyTrigger(gg_trg_IBH)
    endif
    if i1!='O00J' and i2!='O00J' then
        call DestroyTrigger(gg_trg_MonkeyA)
        call DestroyTrigger(gg_trg_MonkeyS)
        call DestroyTrigger(gg_trg_MonkeyH)
        call DestroyTrigger(gg_trg_illusionControler)
    endif
endfunction


function Trig_orcoriginhero_Conditions takes nothing returns boolean
    local timer tm
    local player p=GetTriggerPlayer()
    local integer i=GetConvertedPlayerId(p)
    local integer n
    local unit u
    local unit m=GetTriggerUnit()
    local unit t
    if udg_Heronumber[i] == 0 and udg_ExtraHero[i] == null then
        set n=GetRandomInt(udg_HeroRandomNum[3],udg_HeroRandomNum[4])
        if n==0 then
            set u = CreateUnit(p, 'Npbm', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[13],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 94) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,16) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(32, 40) )
            call SetItemUserData(UnitItemInSlot(u, 3), 21 )
            call SetItemUserData(UnitItemInSlot(u, 5), 40 )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'ANbf' )
            call SelectHeroSkill( u, 'ANdh' )
            call SelectHeroSkill( u, 'ANdb' )
            call SelectHeroSkill( u, 'ANef' )
            call EnableTrigger(gg_trg_panda)
            call EnableTrigger(gg_trg_pandafangda)
            call TriggerRegisterUnitEvent( gg_trg_panda, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_pandafangda, u, EVENT_UNIT_DAMAGED )
        elseif n==1 then
            set u = CreateUnit(p, 'Nbst', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[13],5)
            if GetRandomInt(0,1)==0 then
                call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90,94) )
                call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(20, 27) )
                call SetItemUserData(UnitItemInSlot(u, 4), returnonenumberoftwo(12,14) )
                call SetItemUserData(UnitItemInSlot(u, 3), 74 )
                call SetItemUserData(UnitItemInSlot(u, 5), 77 )
            else
                call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90,94) )
                call SetItemUserData(UnitItemInSlot(u, 2), 21 )
                call SetItemUserData(UnitItemInSlot(u, 4), returnonenumberoftwo(12,14) )
                call SetItemUserData(UnitItemInSlot(u, 3), 74 )
                call SetItemUserData(UnitItemInSlot(u, 5), 77 )
            endif
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'ANsg' )
            call SelectHeroSkill( u, 'ANsq' )
            call SelectHeroSkill( u, 'ANsw' )
            call SelectHeroSkill( u, 'ANst' )
            call SetPlayerAbilityAvailable( p, 'A09Y', false )
            call EnableTrigger(gg_trg_shouwang)
            call EnableTrigger(gg_trg_shouwangH)
            call EnableTrigger(gg_trg_shouwangfangda)
            call TriggerRegisterUnitEvent( gg_trg_shouwang, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_shouwangfangda, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_shouwangH, u, EVENT_UNIT_DAMAGED )
        elseif n==2 then
            set u= CreateUnit(p, 'Opgh', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 94) )
            call SetItemUserData(UnitItemInSlot(u, 4), 27 )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 14) )
            call SetItemUserData(UnitItemInSlot(u, 5), 24 )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(61, 63) )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'ANbr' )
            call SelectHeroSkill( u, 'A00N' )
            call SelectHeroSkill( u, 'A00K')
            call EnableTrigger(gg_trg_Gromattacked)
            call EnableTrigger(gg_trg_GromTaunt)
            call EnableTrigger(gg_trg_Gromchaofeng )
            call TriggerRegisterUnitEvent( gg_trg_Gromchaofeng , u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_Gromattacked, u, EVENT_UNIT_ATTACKED )
            call TriggerRegisterUnitEvent( gg_trg_GromTaunt, u, EVENT_UNIT_TARGET_IN_RANGE )
        elseif n==3 then
            set u= CreateUnit(p, 'Naka', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(13, 14)],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 94) )
            call SetItemUserData(UnitItemInSlot(u, 2), 76 )
            call SetItemUserData(UnitItemInSlot(u, 4), 72 )
            call SetItemUserData(UnitItemInSlot(u, 3), 41 )
            call SetItemUserData(UnitItemInSlot(u, 5), 61 )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A019' )
            call SelectHeroSkill( u, 'A01A' )
            call SelectHeroSkill( u, 'A018' )
            call SelectHeroSkill( u, 'Ashs' )
            call EnableTrigger(gg_trg_Akamaillusion)
            call TriggerRegisterUnitEvent( gg_trg_Akamaillusion, u, EVENT_UNIT_TARGET_IN_RANGE )
        elseif n==4 then
            if udg_TimerBoolean[1]==0 then
                set udg_TimerBoolean[1]=1
                call TimerStart(CreateTimer(),1,true,function checkherohp)
            endif
            set u = CreateUnit(p, 'Ogld', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(27, 29)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            set n=GetRandomInt(51, 56)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,17) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(51, n) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(30, 37) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1, 57) )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A01Q' )
            call SelectHeroSkill( u, 'A01R' )
            call SelectHeroSkill( u, 'A01U' )
            call SelectHeroSkill( u, 'A01W' )
            call EnableTrigger(gg_trg_guerdant)
            call EnableTrigger(gg_trg_healingunit)
            call TriggerRegisterUnitEvent(  gg_trg_guerdant, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_healingunit, u, EVENT_UNIT_SPELL_EFFECT )
            if IsUnitAlly(u,Player(5))==true then
                set udg_HelperHero[3]=u
            else
                set udg_HelperHero[4]=u
            endif
        elseif n==5 then
            set u = CreateUnit(p, 'Odrt', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            call SetItemUserData(UnitItemInSlot(u, 1), 91 )
            call SetItemUserData(UnitItemInSlot(u, 2), 92 )
            call SetItemUserData(UnitItemInSlot(u, 4), 36 )
            call SetItemUserData(UnitItemInSlot(u, 3), returnonenumberoftwo(11,17) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(41, 42) )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A02M' )
            call SelectHeroSkill( u, 'A02N' )
            call SelectHeroSkill( u, 'AEpa' )
            call EnableTrigger(gg_trg_shenlingAren)
            call EnableTrigger(gg_trg_huixueV)
            call EnableTrigger(gg_trg_shenlinggetharm)
            call TriggerRegisterUnitEvent(  gg_trg_shenlinggetharm,  u, EVENT_UNIT_DAMAGED )
            call TriggerRegisterUnitEvent(  gg_trg_shenlingAren, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_huixueV, u, EVENT_UNIT_SPELL_EFFECT )
        elseif n==6 then
            set u = CreateUnit(p, 'Ogrh', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(13, 14)],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 95) )
            call SetItemUserData(UnitItemInSlot(u, 2), returnonenumberoftwo(62,40) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(41,42) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(32,40) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(61, 62) )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A03O' )
            call SelectHeroSkill( u, 'A03M' )
            call EnableTrigger(gg_trg_ChaosA)
            call EnableTrigger(gg_trg_ChaosS)
            call TriggerRegisterUnitEvent(   gg_trg_ChaosA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_ChaosS, u, EVENT_UNIT_SPELL_EFFECT )
            call SetPlayerAbilityAvailable( p, 'A098', false )
        elseif n==7 then
            set u = CreateUnit(p, 'Orkn', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(13, 15)],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 17) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(52,57) )
            call SetItemUserData(UnitItemInSlot(u, 4), 24 )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(20,27) )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A03Y' )
            call SelectHeroSkill( u, 'A040' )
            call SelectHeroSkill( u, 'A042' )
            call EnableTrigger(gg_trg_JDA)
            call EnableTrigger(gg_trg_JDS)
            call EnableTrigger(gg_trg_JDD)
            call TriggerRegisterUnitEvent( gg_trg_JDA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_JDS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_JDD, u, EVENT_UNIT_ATTACKED )
        elseif n==8 then
            set u = CreateUnit(p, 'O00A', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(13, 14)],5)
            if GetRandomInt(0,1)==0 then
                set n = GetRandomInt(90, 94)
                call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, n) )
                call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(n+1, 95) )
                call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(11,16) )
                call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(20,27) )
                call SetItemUserData(UnitItemInSlot(u, 5), 77 )
            else
                call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 95) )
                call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 16) )
                call SetItemUserData(UnitItemInSlot(u, 3), 74 )
                call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(20,27) )
                call SetItemUserData(UnitItemInSlot(u, 5), 77 )
            endif
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A02R' )
            call SelectHeroSkill( u, 'A04I' )
            call SelectHeroSkill( u, 'A04J' )
            call SelectHeroSkill( u, 'A045' )
            call EnableTrigger(gg_trg_MengmaA)
            call EnableTrigger(gg_trg_MengmaS)
            call EnableTrigger(gg_trg_MengmaH)
            call SetPlayerAbilityAvailable( p, 'A07V', false )
            call TriggerRegisterUnitEvent( gg_trg_MengmaA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_MengmaS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_MengmaH, u, EVENT_UNIT_ATTACKED )
        elseif n==9 then
            set u = CreateUnit(p, 'O009', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(27, 29)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            set n = GetRandomInt(51, 56)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 17) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(30,37) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(51,n) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1,57) )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A039' )
            call SelectHeroSkill( u, 'A04R' )
            call SelectHeroSkill( u, 'A04U' )
            call SelectHeroSkill( u, 'A04T' )
            call EnableTrigger(gg_trg_AMA)
            call EnableTrigger(gg_trg_AMS)
            call EnableTrigger(gg_trg_AMY)
            call TriggerRegisterUnitEvent( gg_trg_AMA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_AMS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_AMY, u, EVENT_UNIT_ACQUIRED_TARGET )
            if udg_TimerBoolean[1]==0 then
                set udg_TimerBoolean[1]=1
                call TimerStart(CreateTimer(),1,true,function checkherohp)
            endif
            if IsUnitAlly(u,Player(5))==true then
                set udg_HelperHero[5]=u
            else
                set udg_HelperHero[6]=u
            endif
        elseif n==10 then
            set u = CreateUnit(p, 'O00B', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(27, 29)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            set n = GetRandomInt(51, 56)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 17) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(30,37) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(51,n) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1,57) )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A066' )
            call SelectHeroSkill( u, 'A061' )
            call SelectHeroSkill( u, 'A064' )
            call EnableTrigger(gg_trg_ZDA)
            call EnableTrigger(gg_trg_ZDS)
            call TriggerRegisterUnitEvent( gg_trg_ZDA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_ZDS, u, EVENT_UNIT_SPELL_EFFECT )
            if udg_TimerBoolean[1]==0 then
                set udg_TimerBoolean[1]=1
                call TimerStart(CreateTimer(),1,true,function checkherohp)
            endif
            if IsUnitAlly(u,Player(5))==true then
                set udg_HelperHero[8]=u
            else
                set udg_HelperHero[7]=u
            endif
        elseif n==11 then
            set u = CreateUnit(p, 'O00D', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(27, 29)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            set n = GetRandomInt(90, 93)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, n) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(n+1, 94) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(11,17) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(61,63) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(52,57) )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A06K' )
            call SelectHeroSkill( u, 'A06L' )
            call SelectHeroSkill( u, 'AOs2' )
            call EnableTrigger(gg_trg_WLA)
            call EnableTrigger(gg_trg_WLS)
            call EnableTrigger(gg_trg_WLH)
            call TriggerRegisterUnitEvent( gg_trg_WLA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_WLS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent(  gg_trg_WLH,  u, EVENT_UNIT_DAMAGED )
            if udg_DeathKnight==null then
                set udg_DeathKnight=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE),'u00C',0,0,0)
            endif
            call UnitAddAbility( udg_DeathKnight, 'A007' )
        elseif n==12 then
            set u = CreateUnit(p, 'O00F', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(13, 15)],5)
            set n = GetRandomInt(71, 75)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(91, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 17) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(30,37) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(71,n) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1,76) )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A07P' )
            call SelectHeroSkill( u, 'A07R' )
            call SelectHeroSkill( u, 'A07O' )
            call EnableTrigger(gg_trg_JumoA)
            call EnableTrigger(gg_trg_JumoS)
            call TriggerRegisterUnitEvent( gg_trg_JumoA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_JumoS, u, EVENT_UNIT_SPELL_EFFECT )
        elseif n==13 then
            set u = CreateUnit(p, 'O00G', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,'stwp',0)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(13, 14)],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 95) )
            call SetItemUserData(UnitItemInSlot(u, 2), returnonenumberoftwo(15,16) )
            call SetItemUserData(UnitItemInSlot(u, 3), returnonenumberoftwo(21,62) )
            call SetItemUserData(UnitItemInSlot(u, 5), 38 )
            call SetItemUserData(UnitItemInSlot(u, 4), 22 )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A08S' )
            call SelectHeroSkill( u, 'A08T' )
            call SelectHeroSkill( u, 'A09B' )
            call EnableTrigger(gg_trg_TCA)
            call EnableTrigger(gg_trg_TCS)
            call EnableTrigger(gg_trg_TCH)
            call TriggerRegisterUnitEvent( gg_trg_TCA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_TCS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_TCH, u, EVENT_UNIT_DAMAGED )
        elseif n==14 then
            set u = CreateUnit(p, 'O00H', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,'stwp',0)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[16],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(91, 94) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11, 17) )
            call SetItemUserData(UnitItemInSlot(u, 3), 34 )
            call SetItemUserData(UnitItemInSlot(u, 5), 61 )
            call SetItemUserData(UnitItemInSlot(u, 4), 21 )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A09J' )
            call SelectHeroSkill( u, 'A09K' )
            call EnableTrigger(gg_trg_IBA)
            call EnableTrigger(gg_trg_IBS)
            call EnableTrigger(gg_trg_IBH)
            call TriggerRegisterUnitEvent( gg_trg_IBA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_IBS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_IBH, u, EVENT_UNIT_DAMAGED )
        elseif n==15 then
            set u = CreateUnit(p, 'O00J', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,'stwp',0)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 2)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(13, 15)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[16],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 94) )
            call SetItemUserData(UnitItemInSlot(u, 2), returnonenumberoftwo(72,74) )
            call SetItemUserData(UnitItemInSlot(u, 3), returnonenumberoftwo(76,24) )
            call SetItemUserData(UnitItemInSlot(u, 4), 61 )
            call SetItemUserData(UnitItemInSlot(u, 5), 33 )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A09V' )
            call SelectHeroSkill( u, 'A0A5' )
            call SelectHeroSkill( u, 'A0AB' )
            call EnableTrigger(gg_trg_MonkeyA)
            call EnableTrigger(gg_trg_MonkeyS)
            call EnableTrigger(gg_trg_MonkeyH)
            call EnableTrigger(gg_trg_illusionControler)
            call TriggerRegisterUnitEvent( gg_trg_MonkeyA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_MonkeyS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_MonkeyH, u, EVENT_UNIT_DAMAGED )
            if IsUnitAlly(u,Player(5)) then
                call TriggerRegisterPlayerUnitEventSimple( gg_trg_illusionControler, Player(5), EVENT_PLAYER_UNIT_SUMMON )
            else
                call TriggerRegisterPlayerUnitEventSimple( gg_trg_illusionControler, Player(11), EVENT_PLAYER_UNIT_SUMMON )
            endif
        endif
        set udg_Chaoxi[0]=udg_Chaoxi[0]+1
        call BJDebugMsg( I2S(udg_Chaoxi[0])+GetPlayerName(p)+GetUnitName(u) )
        call SetPlayerName( p, GetUnitName(u) )
        call ModifyHeroSkillPoints( u, bj_MODIFYMETHOD_SET, 0 )
        set i=GetConvertedPlayerId(p)
        set udg_SpellTimer[i]=0
        set udg_ExtraHero[i] = u
        if udg_ExtraHero[udg_RacePlayerNum[5]]!=null and udg_ExtraHero[udg_RacePlayerNum[6]]!=null then
            call RemoveOrcHeroTrigger()
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
    if  n== 'Oshd' then
        call EnableTrigger(gg_trg_bianyang)
        //call TriggerRegisterUnitEvent( gg_trg_bianyang, t, EVENT_UNIT_ACQUIRED_TARGET )
        call TriggerRegisterUnitEvent( gg_trg_bianyang, t, EVENT_UNIT_TARGET_IN_RANGE )
        if udg_DeathKnight==null then
            set udg_DeathKnight=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE),'u00C',0,0,0)
        endif
        call UnitAddAbility( udg_DeathKnight, 'AChx' )
        
    elseif n == 'Ofar' then
        call EnableTrigger(gg_trg_farseeR)
        //call TriggerRegisterUnitEvent( gg_trg_farseeR, t, EVENT_UNIT_ACQUIRED_TARGET )
        call TriggerRegisterUnitEvent( gg_trg_farseeR, t, EVENT_UNIT_TARGET_IN_RANGE )
    elseif n=='Otch' then
        call EnableTrigger(gg_trg_TC)
        call TriggerRegisterUnitEvent( gg_trg_TC, t, EVENT_UNIT_TARGET_IN_RANGE )
    endif
    
    
    if udg_Heronumber[udg_RacePlayerNum[5]]==2 and udg_Heronumber[udg_RacePlayerNum[6]]==2 then
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
function InitTrig_orcoriginhero takes nothing returns nothing
    set gg_trg_orcoriginhero = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_orcoriginhero, Condition( function Trig_orcoriginhero_Conditions ) )
endfunction
