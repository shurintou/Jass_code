
//===========================================================================
// Trigger: fuhuo
//
// 一个触发完成所有英雄复活...
// 注意变量"jishiqi"的数组为复活时间...
// 如果不想让敌人复活   加个条件吧....
//===========================================================================
function Trig_fuhuo_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_fuhuo_Actions takes nothing returns nothing
    set udg_die = ( udg_die + 1 )
    set udg_die = ModuloInteger(udg_die, 10)
    set udg_yingxiong[udg_die] = GetTriggerUnit()
    call StartTimerBJ( udg_jishiqi[udg_die], false, I2R(( GetHeroLevel(udg_yingxiong[udg_die]) * 2 )) )
    call CreateTimerDialogBJ( udg_jishiqi[udg_die], ( GetUnitName(udg_yingxiong[udg_die]) + "复活:" ) )
    set udg_jishiqichuangkou[udg_die] = GetLastCreatedTimerDialogBJ()
    call TriggerSleepAction( ( I2R(GetHeroLevel(udg_yingxiong[udg_die])) * 2.00 ) )
    set udg_revive = ( udg_revive + 1 )
    set udg_revive = ModuloInteger(udg_revive, 10)
    call DestroyTimerDialog( udg_jishiqichuangkou[udg_revive] )
endfunction

//===========================================================================
function InitTrig_fuhuo takes nothing returns nothing
    set gg_trg_fuhuo = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_fuhuo, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_fuhuo, Condition( function Trig_fuhuo_Conditions ) )
    call TriggerAddAction( gg_trg_fuhuo, function Trig_fuhuo_Actions )
endfunction
