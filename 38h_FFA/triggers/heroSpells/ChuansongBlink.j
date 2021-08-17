
//===========================================================================
// Trigger: ChuansongBlink
//===========================================================================
function Trig_ChuansongBlink_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0AG' 
endfunction

function Trig_ChuansongBlink_Actions takes nothing returns nothing
    local real x
    local real y
    local unit u=GetTriggerUnit()
    local integer level
    local real r=GetUnitState(u, UNIT_STATE_MANA)
    local real mr=GetUnitState(u, UNIT_STATE_MAX_MANA)
    local real d=r-0.07*mr-60

    if d<=0 then
    call PlaySoundBJ( gg_snd_Error )
    call IssueImmediateOrderById( u, 851972 )
    call DisplayTextToPlayer( GetTriggerPlayer(), 0, 0, "|cfffeba0e魔法不足，无法使用原力闪现|r" )
    else 
    set x=GetSpellTargetX()
    set y=GetSpellTargetY()
    set level=GetUnitAbilityLevel(u,'A0AG')
    call SetUnitX(u,x)
    call SetUnitY(u,y)
    call SetUnitAnimation( u, "spell" )
    call SetUnitState( u, UNIT_STATE_MANA,d)
    call HarmGroup(u,150+50*level,r*(0.02*level+0.06))
    call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", x, y) )
    endif
    
    set u=null
endfunction

//===========================================================================
function InitTrig_ChuansongBlink takes nothing returns nothing
    set gg_trg_ChuansongBlink = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_ChuansongBlink, Condition( function Trig_ChuansongBlink_Conditions ) )
    call TriggerAddAction( gg_trg_ChuansongBlink, function Trig_ChuansongBlink_Actions )
endfunction
