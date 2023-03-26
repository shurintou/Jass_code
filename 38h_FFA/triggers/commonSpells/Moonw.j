
//===========================================================================
// Trigger: Moonw
//===========================================================================
function Trig_Moonw_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A04Q' 
endfunction

function UnitIsNotMW takes nothing returns boolean 
return  GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00 ==true and IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true
endfunction 

function Trig_Moonw_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local integer level=GetUnitAbilityLevel(u,'A04Q')
local unit m=CreateUnit(GetTriggerPlayer(),'n001',x,y,0)
local group g=CreateGroup()
local boolexpr b

call UnitAddAbility( m, 'ACsi' )
call SetUnitAbilityLevel( m, 'ACsi', level )
call IssuePointOrderById( m, 852592, x, y )
call UnitApplyTimedLife( m, 'BTLF', 2 )

set b=Condition(function UnitIsNotMW)
set udg_lsu=u
call GroupEnumUnitsInRange(g,x,y,420,b) 
loop
exitwhen IsUnitGroupEmptyBJ(g) == true
set m=FirstOfGroup(g)
call UnitDamageTarget( u, m, level*60, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call GroupRemoveUnit(g,m)
endloop
call GroupClear(g)
call DestroyGroup(g)
call DestroyBoolExpr(b)


set g=null
set b=null
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_Moonw takes nothing returns nothing
    set gg_trg_Moonw = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Moonw, Condition( function Trig_Moonw_Conditions ) )
    call TriggerAddAction( gg_trg_Moonw, function Trig_Moonw_Actions )
endfunction
