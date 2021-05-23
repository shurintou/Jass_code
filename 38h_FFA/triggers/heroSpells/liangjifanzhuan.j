
//===========================================================================
// Trigger: liangjifanzhuan
//===========================================================================
function Trig_liangjifanzhuan_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A00M' 
endfunction

function UnitIsNotTJ takes nothing returns boolean 
return IsUnitIdType(GetUnitTypeId(GetFilterUnit()), UNIT_TYPE_STRUCTURE) == false and GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00 ==true and IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true
endfunction 


function Trig_liangjifanzhuan_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local group g=CreateGroup()
local boolexpr b
local unit m



set b=Condition(function UnitIsNotTJ)
set udg_lsu=u
call GroupEnumUnitsInRange(g,x,y,460,b) 
loop
exitwhen IsUnitGroupEmptyBJ(g) == true
set m=FirstOfGroup(g)
call SetUnitX(m,x)
call SetUnitY(m,y)
call GroupRemoveUnit(g,m)
endloop
call GroupClear(g)
call DestroyGroup(g)
call DestroyBoolExpr(b)

set u=null
set g=null
set b=null
set m=null
endfunction

//===========================================================================
function InitTrig_liangjifanzhuan takes nothing returns nothing
    set gg_trg_liangjifanzhuan = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_liangjifanzhuan, Condition( function Trig_liangjifanzhuan_Conditions ) )
    call TriggerAddAction( gg_trg_liangjifanzhuan, function Trig_liangjifanzhuan_Actions )
endfunction
