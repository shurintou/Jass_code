
//===========================================================================
// Trigger: 未命名触发器 171
//===========================================================================
function Trig_171_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A05A' ) ) then
        return false
    endif
    return true
endfunction

function Trig_171_Actions takes nothing returns nothing
    set udg_Bingfengjinzhidanwei = GetSpellTargetUnit()
    call SetUnitMoveSpeed( GetSpellTargetUnit(), 0.00 )
    set udg_Bingfengjinzhishu = 1
    loop
        exitwhen udg_Bingfengjinzhishu > ( GetUnitAbilityLevelSwapped('A05A', GetTriggerUnit()) + 1 )
        call TriggerSleepAction( 1.00 )
        call UnitDamageTargetBJ( GetTriggerUnit(), udg_Bingfengjinzhidanwei, ( 30.00 + ( I2R(GetUnitAbilityLevelSwapped('A05A', GetTriggerUnit())) * 10.00 ) ), ATTACK_TYPE_HERO, DAMAGE_TYPE_DIVINE )
        set udg_Bingfengjinzhishu = udg_Bingfengjinzhishu + 1
    endloop
    call SetUnitMoveSpeed( udg_Bingfengjinzhidanwei, GetUnitDefaultMoveSpeed(udg_Bingfengjinzhidanwei) )
endfunction

//===========================================================================
function InitTrig_171 takes nothing returns nothing
    set gg_trg_171 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_171, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_171, Condition( function Trig_171_Conditions ) )
    call TriggerAddAction( gg_trg_171, function Trig_171_Actions )
endfunction
