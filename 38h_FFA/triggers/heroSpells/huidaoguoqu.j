//===========================================================================
// Trigger: huidaoguoqu
//===========================================================================
function Trig_huidaoguoqu_Conditions takes nothing returns boolean
    return GetUnitAbilityLevel(GetTriggerUnit(), 'A02S') > 0 and GetEventDamage()<6000 and GetUnitTypeId(GetEventDamageSource())!= 'e000'
endfunction

function Trig_huidaoguoqu_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer i=GetUnitAbilityLevel(u, 'A02S')
local real h
local real r
local integer n=GetRandomInt(1,100)
if n<8*i then    
set r=GetUnitState(u, UNIT_STATE_LIFE)
set h=GetEventDamage()
  if r-h<=1 and GetUnitAbilityLevel(u,'B02B')>0 then
  else
  call SetUnitState( u, UNIT_STATE_LIFE, r+h ) 
  call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\SpellShieldAmulet\\SpellShieldCaster.mdl",u, "chest") )
  endif
endif  
set u=null
endfunction

//===========================================================================
function InitTrig_huidaoguoqu takes nothing returns nothing
    set gg_trg_huidaoguoqu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_huidaoguoqu, Condition( function Trig_huidaoguoqu_Conditions ) )
    call TriggerAddAction( gg_trg_huidaoguoqu, function Trig_huidaoguoqu_Actions )
endfunction
