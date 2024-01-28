
//===========================================================================
// Trigger: humoriginhero
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
function RemoveHumanHeroTrigger takes nothing returns nothing
    local integer i1=GetUnitTypeId(udg_ExtraHero[udg_RacePlayerNum[1]])
    local integer i2=GetUnitTypeId(udg_ExtraHero[udg_RacePlayerNum[2]])
    if i1!='Hvwd' and i2!='Hvwd' then
        call DestroyTrigger(gg_trg_fengxingkaiw)
        call DestroyTrigger(gg_trg_fengxingkaida)
        call DestroyTrigger(gg_trg_windwalkshanbi)
    endif
    if i1!='Nfir' and i2!='Nfir' then
        call DestroyTrigger(gg_trg_FLvocalno)
        call DestroyTrigger(gg_trg_FireLoadVocalno)
    endif
    if i1!='Ntin' and i2!='Ntin' then
        call DestroyTrigger(gg_trg_daodans)
        call DestroyTrigger(gg_trg_fangdaodan)
    endif
    if i1!='Harf' and i2!='Harf' then
        call DestroyTrigger(gg_trg_Arthasdazhao)
        call DestroyTrigger(gg_trg_Arthashealingnova)
        call DestroyTrigger(gg_trg_Arthasgetharm)
    endif
    if i1!='Hjai' and i2!='Hjai' then
        call DestroyTrigger(gg_trg_novaasdasd)
        call DestroyTrigger(gg_trg_bingfengqiu)
    endif
    if i1!='Ecen' and i2!='Ecen' then
        call DestroyTrigger(gg_trg_medivengongji)
        call DestroyTrigger(gg_trg_medivenshifa)
    endif
    if i1!='Hlgr' and i2!='Hlgr' then
        call DestroyTrigger(gg_trg_DragonA)
        call DestroyTrigger(gg_trg_DragonS)
    endif
    if i1!='Hkal' and i2!='Hkal' then
        call DestroyTrigger(gg_trg_RiftA)
        call DestroyTrigger(gg_trg_RiftS)
        call DestroyTrigger(gg_trg_RiftL)
    endif
    if i1!='H003' and i2!='H003' then
        call DestroyTrigger(gg_trg_GhostShip)
        call DestroyTrigger(gg_trg_attackbycaptain)
    endif
    if i1!='N003' and i2!='N003' then
        call DestroyTrigger(gg_trg_SQS)
        call DestroyTrigger(gg_trg_SOA)
    endif
    if i1!='Hgam' and i2!='Hgam' then
        call DestroyTrigger(gg_trg_GFS)
        call DestroyTrigger(gg_trg_GFA)
    endif
    if i1!='N008' and i2!='N008' then
        call DestroyTrigger(gg_trg_FTS)
        call DestroyTrigger(gg_trg_FTA)
        call DestroyTrigger(gg_trg_FTD)
    endif
    if i1!='H008' and i2!='H008' then
        call DestroyTrigger(gg_trg_JKS)
        call DestroyTrigger(gg_trg_JKA)
        call DestroyTrigger(gg_trg_JKH)
    endif
    if i1!='N00D' and i2!='N00D' then
        call DestroyTrigger(gg_trg_LAS)
        call DestroyTrigger(gg_trg_LAA)
        call DestroyTrigger(gg_trg_LAH)
    endif
    if i1!='H007' and i2!='H007' then
        call DestroyTrigger(gg_trg_TTS)
        call DestroyTrigger(gg_trg_TTA)
        call DestroyTrigger(gg_trg_TTH)
    endif
endfunction




function Trig_humoriginhero_Conditions takes nothing returns boolean
    local timer tm
    local player p=GetTriggerPlayer()
    local integer i=GetConvertedPlayerId(p)
    local integer n
    local unit u
    local unit m=GetTriggerUnit()
    local unit t
    local integer g
    
    if udg_Heronumber[i] == 0 and udg_ExtraHero[i] == null then
        
        set n=GetRandomInt(udg_HeroRandomNum[1],udg_HeroRandomNum[2])
        if n==0 then
            set u = CreateUnit(p, 'Hvwd', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(27, 29)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            call SetHeroLevel( u, 10, false )
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,17) )
            set n=GetRandomInt(0,2)
            if n==0 then
                call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(30, 37) )
                call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(51, 54) )
                call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(41, 42) )
            else
                if n==1 then
                    set n = GetRandomInt(51, 53)
                    call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1, 54) )
                    call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(51, n) )
                    call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(41, 42) )
                else
                    call SetItemUserData(UnitItemInSlot(u, 3), 52 )
                    call SetItemUserData(UnitItemInSlot(u, 4), 53 )
                    call SetItemUserData(UnitItemInSlot(u, 5), 54 )
                endif
            endif
            call SelectHeroSkill( u, 'A00B' )
            call SelectHeroSkill( u, 'A00A' )
            call SelectHeroSkill( u, 'ANsi' )
            call EnableTrigger(gg_trg_fengxingkaiw)
            call EnableTrigger(gg_trg_fengxingkaida)
            call EnableTrigger(gg_trg_windwalkshanbi)
            call SetPlayerAbilityAvailable( p, 'A07W', false )
            call TriggerRegisterUnitEvent( gg_trg_fengxingkaiw, u, EVENT_UNIT_DAMAGED )
            call TriggerRegisterUnitEvent( gg_trg_fengxingkaida, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_windwalkshanbi, u, EVENT_UNIT_SPELL_EFFECT )
        elseif n==1 then
            set u = CreateUnit(p, 'Nfir', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[8],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[14],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,17) )
            call SetItemUserData(UnitItemInSlot(u, 3), 72 )
            call SetItemUserData(UnitItemInSlot(u, 4), returnonenumberoftwo(51,52) )
            call SetItemUserData(UnitItemInSlot(u, 5), 76 )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'ANic' )
            call SelectHeroSkill( u, 'ANso' )
            call SelectHeroSkill( u, 'ANlm' )
            call SelectHeroSkill( u, 'ANvc' )
            call EnableTrigger(gg_trg_FLvocalno)
            call EnableTrigger(gg_trg_FireLoadVocalno)
            call TriggerRegisterUnitEvent( gg_trg_FireLoadVocalno, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_FLvocalno, u, EVENT_UNIT_SPELL_EFFECT )
        elseif n==2 then
            set u = CreateUnit(p, 'Ntin', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(27, 29)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[14],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 94) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,17) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(20,27) )
            call SetItemUserData(UnitItemInSlot(u, 3), 74 )
            call SetItemUserData(UnitItemInSlot(u, 5), 77 )
            call SelectHeroSkill( u, 'ANsy' )
            call SelectHeroSkill( u, 'ANcs' )
            call SelectHeroSkill( u, 'ANeg' )
            call SelectHeroSkill( u, 'A02H' )
            call SetUnitAbilityLevel( u, 'ANeg', 3 )
            call SetUnitAbilityLevel( u, 'ANs3', 3 )
            call SetUnitAbilityLevel( u, 'ANc3', 3 )
            call SetUnitAbilityLevel( u, 'ANd3', 3 )
            call EnableTrigger(gg_trg_daodans)
            call EnableTrigger(gg_trg_fangdaodan)
            call TriggerRegisterUnitEvent( gg_trg_daodans, u, EVENT_UNIT_ACQUIRED_TARGET )
            call TriggerRegisterUnitEvent( gg_trg_fangdaodan, u, EVENT_UNIT_SPELL_EFFECT )
        elseif n==3 then
            set u =CreateUnit(p, 'Harf', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            set n = GetRandomInt(72, 76)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 95) )
            call SetItemUserData(UnitItemInSlot(u, 4), 38)
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(72,n) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(n+1,77) )
            call SetItemUserData(UnitItemInSlot(u, 5), 62 )
            call SelectHeroSkill( u, 'A00M' )
            call SelectHeroSkill( u, 'A00I' )
            call SelectHeroSkill( u, 'A00O' )
            call SelectHeroSkill( u, 'A00Q' )
            call SetPlayerAbilityAvailable( p, 'A07N', false )
            call EnableTrigger(gg_trg_Arthasdazhao)
            call EnableTrigger(gg_trg_Arthashealingnova)
            call EnableTrigger(gg_trg_Arthasgetharm)
            call TriggerRegisterUnitEvent( gg_trg_Arthasdazhao, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_Arthashealingnova, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_Arthasgetharm, u, EVENT_UNIT_DAMAGED )
        elseif n==4 then
            set u = CreateUnit(p, 'Hjai', GetUnitX(m), GetUnitY(m), 270)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(27, 29)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            set n=GetRandomInt(51,56)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,14) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(15,17) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(51,n) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1,57) )
            call SetHeroLevel( u, 10, false )
            call SelectHeroSkill( u, 'A01Y' )
            call SelectHeroSkill( u, 'A021' )
            call SelectHeroSkill( u, 'A023' )
            call EnableTrigger(gg_trg_novaasdasd)
            call EnableTrigger(gg_trg_bingfengqiu)
            call TriggerRegisterUnitEvent(  gg_trg_novaasdasd, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_bingfengqiu, u, EVENT_UNIT_SPELL_EFFECT )
        elseif n==5 then
            set u = CreateUnit(p, 'Ecen', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(27, 29)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            set n=GetRandomInt(51,56)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,17) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(30,37) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(51,n) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1,57) )
            call SelectHeroSkill( u, 'A02X' )
            call SelectHeroSkill( u, 'A030' )
            call SelectHeroSkill( u, 'A032' )
            call SelectHeroSkill( u, 'SNin' )
            call EnableTrigger(gg_trg_medivengongji)
            call EnableTrigger(gg_trg_medivenshifa)
            call TriggerRegisterUnitEvent( gg_trg_medivengongji, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_medivenshifa, u, EVENT_UNIT_SPELL_EFFECT )
        elseif n==6 then
            set u = CreateUnit(p, 'Hlgr', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[13],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 94) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,16) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(20,27) )
            call SetItemUserData(UnitItemInSlot(u, 3), 41 )
            call SetItemUserData(UnitItemInSlot(u, 5), 36 )
            call SelectHeroSkill( u, 'A03I' )
            call SelectHeroSkill( u, 'A03J' )
            call SelectHeroSkill( u, 'A03L' )
            call EnableTrigger(gg_trg_DragonA)
            call EnableTrigger(gg_trg_DragonS)
            call TriggerRegisterUnitEvent( gg_trg_DragonA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_DragonS, u, EVENT_UNIT_SPELL_EFFECT )
        elseif n==7 then
            set u = CreateUnit(p, 'Hkal', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(17, 19)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[14],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            if GetRandomInt(0,1)==0 then
                call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,16) )
                call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(30,37) )
            else
                call SetItemUserData(UnitItemInSlot(u, 2), 36 )
                call SetItemUserData(UnitItemInSlot(u, 3), 31 )
            endif
            set n=GetRandomInt(71,75)
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(71,n) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1,76) )
            call SelectHeroSkill( u, 'A02D' )
            call SelectHeroSkill( u, 'A03R' )
            call SelectHeroSkill( u, 'A03T' )
            call EnableTrigger(gg_trg_RiftA)
            call EnableTrigger(gg_trg_RiftS)
            call EnableTrigger(gg_trg_RiftL)
            call TriggerRegisterUnitEvent( gg_trg_RiftL, u, EVENT_UNIT_HERO_LEVEL )
            call TriggerRegisterUnitEvent( gg_trg_RiftA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_RiftS, u, EVENT_UNIT_SPELL_EFFECT )
        elseif n==8 then
            set u = CreateUnit(p, 'H003', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[14],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 94) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,16) )
            call SetItemUserData(UnitItemInSlot(u, 4), 21 )
            call SetItemUserData(UnitItemInSlot(u, 3), 41 )
            call SetItemUserData(UnitItemInSlot(u, 5), 40 )
            call SelectHeroSkill( u, 'A025' )
            call SelectHeroSkill( u, 'A028' )
            call SelectHeroSkill( u, 'A02C' )
            call EnableTrigger(gg_trg_GhostShip)
            call EnableTrigger(gg_trg_attackbycaptain)
            call TriggerRegisterUnitEvent( gg_trg_attackbycaptain, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_GhostShip, u, EVENT_UNIT_SPELL_EFFECT )
        elseif n==9 then
            set u = CreateUnit(p, 'N003', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            set n=GetRandomInt(90,94)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[13],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, n) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(n+1,95) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(20,27) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(11, 17) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(52, 55) )
            call SelectHeroSkill( u, 'A01E' )
            call SelectHeroSkill( u, 'A01G' )
            call SelectHeroSkill( u, 'A011' )
            call SelectHeroSkill( u, 'A00V' )
            call EnableTrigger(gg_trg_SQS)
            call EnableTrigger(gg_trg_SOA)
            call TriggerRegisterUnitEvent( gg_trg_SOA, u, EVENT_UNIT_ACQUIRED_TARGET )
            call TriggerRegisterUnitEvent( gg_trg_SQS, u, EVENT_UNIT_SPELL_EFFECT )
            if udg_TimerBoolean[1]==0 then
                set udg_TimerBoolean[1]=1
                call TimerStart(CreateTimer(),1,true,function checkherohp)
            endif
            if IsUnitAlly(u,Player(5))==true then
                set udg_HelperHero[1]=u
            else
                set udg_HelperHero[2]=u
            endif
        elseif n==10 then
            set u = CreateUnit(p, 'Hgam', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            set n=GetRandomInt(51,54)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(27, 29)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,17) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(n+1, 55) )
            call SetItemUserData(UnitItemInSlot(u, 3), 57 )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(51, n) )
            call SelectHeroSkill( u, 'A05C' )
            call SelectHeroSkill( u, 'A05F' )
            call SelectHeroSkill( u, 'A05G' )
            call SelectHeroSkill( u, 'A05H' )
            call EnableTrigger(gg_trg_GFS)
            call EnableTrigger(gg_trg_GFA)
            call TriggerRegisterUnitEvent( gg_trg_GFA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_GFS, u, EVENT_UNIT_SPELL_EFFECT )
            if IsUnitAlly(u,Player(5))==true then
                set i=udg_RacePlayerNum[1]
            else
                set i=udg_RacePlayerNum[2]
            endif
            set udg_Silinglong[i]=u
            if udg_DeathKnight==null then
                set udg_DeathKnight=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE),'u00C',0,0,0)
            endif
            call UnitAddAbility( udg_DeathKnight, 'ANmr' )
        elseif n==11 then
            set u = CreateUnit(p, 'N008', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 94) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,17) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(20,27) )
            call SetItemUserData(UnitItemInSlot(u, 5), GetRandomInt(52, 57) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(61, 63) )
            call EnableTrigger(gg_trg_FTS)
            call EnableTrigger(gg_trg_FTA)
            call EnableTrigger(gg_trg_FTD)
            call SelectHeroSkill( u, 'A069' )
            call SelectHeroSkill( u, 'A068' )
            call SelectHeroSkill( u, 'A067' )
            call SelectHeroSkill( u, 'A04O' )
            call SetUnitPathing( u, false )
            call TriggerRegisterUnitEvent( gg_trg_FTA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_FTS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_FTD, u, EVENT_UNIT_DAMAGED )
        elseif n==12 then
            set u = CreateUnit(p, 'H008', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 94) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(11,17) )
            call SetItemUserData(UnitItemInSlot(u, 4), 21 )
            call SetItemUserData(UnitItemInSlot(u, 5), 62 )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(32, 40) )
            call EnableTrigger(gg_trg_JKS)
            call EnableTrigger(gg_trg_JKA)
            call EnableTrigger(gg_trg_JKH)
            call SelectHeroSkill( u, 'A080' )
            call SelectHeroSkill( u, 'A082' )
            call SelectHeroSkill( u, 'A084' )
            call SelectHeroSkill( u, 'A085' )
            call TriggerRegisterUnitEvent( gg_trg_JKA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_JKS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_JKH, u, EVENT_UNIT_DAMAGED )
        elseif n==13 then
            set u = CreateUnit(p, 'N00D', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[6],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(27, 29)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[15],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 93) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(13,17) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(52,55) )
            call SetItemUserData(UnitItemInSlot(u, 4), 51 )
            call SetItemUserData(UnitItemInSlot(u, 5), 52 )
            call SelectHeroSkill( u, 'A08J' )
            call SelectHeroSkill( u, 'A08K' )
            call SelectHeroSkill( u, 'A08L' )
            call EnableTrigger(gg_trg_LAS)
            call EnableTrigger(gg_trg_LAA)
            call EnableTrigger(gg_trg_LAH)
            call TriggerRegisterUnitEvent( gg_trg_LAA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_LAS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_LAH, u, EVENT_UNIT_DAMAGED )
            if udg_TimerBoolean[1]==0 then
                set udg_TimerBoolean[1]=1
                call TimerStart(CreateTimer(),1,true,function checkherohp)
            endif
            if IsUnitAlly(u,Player(5))==true then
                set udg_HelperHero[1]=u
            else
                set udg_HelperHero[2]=u
            endif
        elseif n==14 then
            set u = CreateUnit(p, 'H007', GetUnitX(m), GetUnitY(m), 270)
            call SetHeroLevel( u, 10, false )
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(1, 3)],1)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(4, 6)],2)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(7, 9)],3)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(10, 12)],4)
            call UnitAddItemToSlotById( u,udg_PreItem[GetRandomInt(14, 15)],5)
            call SetItemUserData(UnitItemInSlot(u, 1), GetRandomInt(90, 95) )
            call SetItemUserData(UnitItemInSlot(u, 3), GetRandomInt(32, 40) )
            call SetItemUserData(UnitItemInSlot(u, 4), GetRandomInt(20, 27) )
            call SetItemUserData(UnitItemInSlot(u, 2), GetRandomInt(61, 62) )
            call SetItemUserData(UnitItemInSlot(u, 5), 41 )
            call EnableTrigger(gg_trg_TTS)
            call EnableTrigger(gg_trg_TTA)
            call EnableTrigger(gg_trg_TTH)
            call SelectHeroSkill( u, 'A08Z' )
            call SelectHeroSkill( u, 'A090' )
            call SelectHeroSkill( u, 'A091' )
            call TriggerRegisterUnitEvent( gg_trg_TTA, u, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_TTS, u, EVENT_UNIT_SPELL_EFFECT )
            call TriggerRegisterUnitEvent( gg_trg_TTH, u, EVENT_UNIT_DAMAGED )
        endif
        set udg_Chaoxi[0]=udg_Chaoxi[0]+1
        call BJDebugMsg( I2S(udg_Chaoxi[0])+GetPlayerName(p)+GetUnitName(u) )
        call SetPlayerName( p, GetUnitName(u) )
        call ModifyHeroSkillPoints( u, bj_MODIFYMETHOD_SET, 0 )
        set i=GetConvertedPlayerId(p)
        set udg_SpellTimer[i]=0
        set udg_ExtraHero[i] = u
        if udg_ExtraHero[udg_RacePlayerNum[1]]!=null and udg_ExtraHero[udg_RacePlayerNum[2]]!=null then
            call RemoveHumanHeroTrigger()
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
    if GetHeroSkillPoints(t)==0 then
        set udg_ComHero[( ( ( 3 * i ) - 2 ) + udg_Heronumber[i] )] = t
        set udg_LiveComHero[i]=t
        set udg_Heronumber[i] = ( udg_Heronumber[i] + 1 )
        set n=GetUnitTypeId(t)
        if n == 'Hamg' then
            call EnableTrigger(gg_trg_readybilizard)
            call EnableTrigger(gg_trg_ATTackHum)
            call EnableTrigger(gg_trg_billizardorder)
            call TriggerRegisterUnitEvent( gg_trg_ATTackHum, t, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_readybilizard, t, EVENT_UNIT_SPELL_EFFECT  )
            call TriggerRegisterUnitEvent( gg_trg_billizardorder, t, EVENT_UNIT_ISSUED_POINT_ORDER )
            
        elseif n == 'Hblm' then
            call EnableTrigger(gg_trg_Bloodmageattacked)
            call EnableTrigger(gg_trg_ATTackHum)
            call TriggerRegisterUnitEvent( gg_trg_ATTackHum, t, EVENT_UNIT_TARGET_IN_RANGE )
            call TriggerRegisterUnitEvent( gg_trg_Bloodmageattacked, t, EVENT_UNIT_ATTACKED   )
            if udg_DeathKnight==null then
                set udg_DeathKnight=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE),'u00C',0,0,0)
            endif
            call UnitAddAbility( udg_DeathKnight, 'ACbn' )
        endif
        call SetPlayerTechMaxAllowedSwap( n, 1, p )
        call GroupAddUnit( udg_HeroGroup, t )
        if IsUnitAlly(t,Player(5))==true then
            call GroupAddUnit( udg_BlueTeamHero, t )
        else
            call GroupAddUnit( udg_RedTeamHero, t )
        endif
        call TriggerRegisterUnitEvent( gg_trg_herolevelup, t, EVENT_UNIT_HERO_LEVEL )
        call TriggerRegisterUnitEvent( gg_trg_deathcamera, t, EVENT_UNIT_DEATH )
        call TriggerRegisterUnitEvent( gg_trg_learnskill, t, EVENT_UNIT_HERO_SKILL )
        call SetHeroLevel( t, 10, false )
        call ModifyHeroSkillPoints( t, bj_MODIFYMETHOD_SET, 0 )
    else
        call RemoveItem( UnitItemInSlot(t, 0) )
        call RemoveItem( UnitItemInSlot(t, 1) )
        call RemoveItem( UnitItemInSlot(t, 2) )
        call RemoveItem( UnitItemInSlot(t, 3) )
        call RemoveItem( UnitItemInSlot(t, 4) )
        call RemoveItem( UnitItemInSlot(t, 5) )
        call RemoveUnit(t)
    endif
    if udg_Heronumber[i]<2 then
        call IssueImmediateOrderById( m, 'Hpal' )
        call IssueImmediateOrderById( m, 'Hamg' )
        call IssueImmediateOrderById( m, 'Hmkg' )
        call IssueImmediateOrderById( m, 'Hblm' )
    endif
    if GetTriggerEvalCount(GetTriggeringTrigger())==8 then
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
function InitTrig_humoriginhero takes nothing returns nothing
    set gg_trg_humoriginhero = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_humoriginhero, Condition( function Trig_humoriginhero_Conditions ) )
endfunction
