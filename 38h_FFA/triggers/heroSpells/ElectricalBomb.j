
//===========================================================================
// Trigger: ElectricalBomb
//===========================================================================
function Trig_ElectricalBomb_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A06N' 
endfunction

function Trig_ElectricalBomb_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local player p=GetTriggerPlayer()
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local real dx=GetSpellTargetX()
local real dy=GetSpellTargetY()
local integer level=GetUnitAbilityLevel(u,'A06N' )
local unit n=CreateUnit(p,'n001',x,y,0)//伤害
local unit m=CreateUnit(p,'n001',dx,dy,0)//耗魔

call UnitAddAbility( n, 'ACbz' )
call SetUnitAbilityLevel( n, 'ACbz', level )
call UnitApplyTimedLife( n, 'BTLF', 10 )
call IssuePointOrderById( n, 852089, dx, dy )
call UnitAddAbility( m, 'Adtn' )
call SetUnitAbilityLevel( m, 'Adtn', level )
call UnitApplyTimedLife( m, 'BTLF', 10 )
call IssuePointOrderById( m, 852145, dx, dy )

set u=null
set n=null
set m=null
set p=null
endfunction

//===========================================================================
function InitTrig_ElectricalBomb takes nothing returns nothing
    set gg_trg_ElectricalBomb = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_ElectricalBomb, Condition( function Trig_ElectricalBomb_Conditions ) )
    call TriggerAddAction( gg_trg_ElectricalBomb, function Trig_ElectricalBomb_Actions )
endfunction
