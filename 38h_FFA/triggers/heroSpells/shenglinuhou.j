
//===========================================================================
// Trigger: shenglinuhou
//===========================================================================
function Trig_shenglinuhou_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0DC' 
endfunction

function Trig_shenglinuhou_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local group g
local unit t
local player p=GetOwningPlayer(u)
local integer level=GetUnitAbilityLevel(u,'A0DC')
local real r=15+15*level
local real y=GetHeroInt(u,true)*0.4

  set g=CreateGroup()
  call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),350,null)
  call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+r+y ) 
  loop
  set t=FirstOfGroup(g)
  exitwhen t==null
  if IsUnitAlly(t, p)==true and GetUnitState(t, UNIT_STATE_LIFE) >0.00 and GetUnitAbilityLevel(t,'Aloc')==0 and IsUnitType(t, UNIT_TYPE_MECHANICAL) ==false  and IsUnitType(t, UNIT_TYPE_GIANT) == false then
  call SetUnitState( t, UNIT_STATE_LIFE, GetUnitState(t, UNIT_STATE_LIFE)+r+y )
  call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\EmeraldPortal.mdx", t, "origin") )
  endif
  call GroupRemoveUnit(g,t)
  set t=null
  endloop

call DestroyGroup(g)
set u=null
set g=null
set t=null
set p=null  
endfunction

//===========================================================================
function InitTrig_shenglinuhou takes nothing returns nothing
    set gg_trg_shenglinuhou = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_shenglinuhou, Condition( function Trig_shenglinuhou_Conditions ) )
    call TriggerAddAction( gg_trg_shenglinuhou, function Trig_shenglinuhou_Actions )
endfunction
