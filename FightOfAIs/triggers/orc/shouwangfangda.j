
//===========================================================================
// Trigger: shouwangfangda
//
// 
// 90 Azhang    95shuaxin
// 91longxin         11heihuang   15  zhangu              20huixuejia             21qiangxi    25 tiantangzhidun
// 92fuhuo           12tiaozhan    16  mianju  17meiken             22bingjia       26 shandianhudun
// 93xuejingshi     13linken       14 kajiachangdi         23weak shield   27 zhenfenkaijia
// 94xixuegui                                                              24herald shield
// 30 lvzhang                                                   
// 31 bingyan      41 dapao      51 yuezhiqiang  54 yangdao
// 32 huoyan     42 yunchui    52 ziyuan   55 silingshu
// 33 sanshi                        53  dagen  56shuaxin
// 34 anmie       61 huiyao                 71  yuezhiqiang   76 huanyingfu
// 35 leichui        62 fensuifu            72   hudie     75 yindao 77kuangzhan
// 36 sadan         63 leichui            73  yunchui   74 dapao
// 37duqiu           
// 38shuangzhiaishang     
// 39 kuangzhan       
//===========================================================================
function Trig_shouwangfangda_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    //local integer l
    local integer n=GetConvertedPlayerId(GetTriggerPlayer())
    //local integer level=R2I((GetHeroLevel(u)-5)/5)
    //local integer array i
    
    call UnitRemoveAbility( u, 'A09Y' )
    call UnitAddAbility( u, 'A09Y' )
    
    if  GetSpellAbilityId() == 'ANst'  then
        set udg_SpellTimer[n]=8
    endif
    
    
    //call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Orc\\FeralSpirit\\feralspiritdone.mdl", GetUnitX(udg_SpellTarget[n]),GetUnitY(udg_SpellTarget[n])) )
    //call RemoveUnit(udg_SpellTarget[n])
    //set udg_SpellTarget[n]=CreateUnit(Player(n-1) ,'nwwd',GetUnitX(u),GetUnitY(u),0)
    //set i[5]=udg_Item[61]
    //set i[4]=udg_Item[34]
    //set i[3]=udg_Item[41]
    //set i[2]=udg_Item[21]
    //set i[1]=udg_Item[39]
    //call UnitAddItemToSlotById( udg_SpellTarget[n],'stwp',0)
    //call UnitAddAbility( udg_SpellTarget[n], 'A08W' )
    //call SetUnitAbilityLevel( udg_SpellTarget[n], 'A08W', level+1 )
    //call UnitRemoveAbility( udg_SpellTarget[n], 'A08W' )
    //set l=5
    //loop
    //exitwhen level==0
    //call UnitAddItemToSlotById( udg_SpellTarget[n],i[l],l)
    //set level=level-1
    //set l=l-1
    //endloop
    
    set u=null
    
    return false
endfunction



//===========================================================================
function InitTrig_shouwangfangda takes nothing returns nothing
    set gg_trg_shouwangfangda = CreateTrigger(  )
    call DisableTrigger( gg_trg_shouwangfangda)
    call TriggerAddCondition( gg_trg_shouwangfangda, Condition( function Trig_shouwangfangda_Conditions ) )
    
endfunction
