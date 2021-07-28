
//===========================================================================
// Trigger: learnrrrrrr
//===========================================================================
function Trig_learnrrrrrr_Conditions takes nothing returns boolean
     return GetLearnedSkill() == 'Arsg' 
endfunction

function Trig_learnrrrrrr_Actions takes nothing returns nothing
local integer i= GetUnitAbilityLevel(GetTriggerUnit(), 'Arsg')
local unit m=LoadUnitHandle(udg_Hash1,GetHandleId(gg_trg_zhaohuanxiong),2)
local real w=1.2+0.1*i

    
if i==4 then
    call UnitAddAbility( m, 'ANd1' )
       if LoadInteger(udg_Hash1,GetHandleId(gg_trg_zhaohuanxiong),5)==0 then
       call SaveInteger(udg_Hash1,GetHandleId(gg_trg_zhaohuanxiong),5,1)
       call TriggerRegisterUnitEvent( gg_trg_attacktree, m, EVENT_UNIT_TARGET_IN_RANGE )
       endif
    call UnitAddAbility( m, 'A07X' )
    call UnitAddAbility( m, 'A022' )//魔抗
    call UnitAddAbility( m, 'A0BH' )//闪烁
    call UnitAddAbility( m, 'A070' )
    call SetPlayerTechResearchedSwap( 'Resm',i, GetTriggerPlayer() )
    else
    if i==3 then
    call UnitAddAbility( m, 'A07X' )
    call UnitAddAbility( m, 'A070' )
    call UnitAddAbility( m, 'A0BH' )//闪烁
       if LoadInteger(udg_Hash1,GetHandleId(gg_trg_zhaohuanxiong),5)==0 then
       call SaveInteger(udg_Hash1,GetHandleId(gg_trg_zhaohuanxiong),5,1)
       call TriggerRegisterUnitEvent( gg_trg_attacktree, m, EVENT_UNIT_TARGET_IN_RANGE )
       endif
    call SetPlayerTechResearchedSwap( 'Resm',i, GetTriggerPlayer() )
    else
    if i==2 then
    call UnitAddAbility( m, 'A0BH' )//闪烁
    call UnitAddAbility( m, 'A070' )
    call SetPlayerTechResearchedSwap( 'Resm',i, GetTriggerPlayer() )
    endif
    endif
    endif
call SetUnitVertexColor( m, 255, 130, 200, 255 )
call SetUnitScale( m, w, w, w )

call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Orc\\FeralSpirit\\feralspiritdone.mdl", m, "chest") )
    if i==4 then
    call DestroyTrigger( GetTriggeringTrigger() )
    endif

set m=null
endfunction

//===========================================================================
function InitTrig_learnrrrrrr takes nothing returns nothing
    set gg_trg_learnrrrrrr = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_learnrrrrrr, Condition( function Trig_learnrrrrrr_Conditions ) )
    call TriggerAddAction( gg_trg_learnrrrrrr, function Trig_learnrrrrrr_Actions )
endfunction
