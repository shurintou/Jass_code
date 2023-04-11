
//===========================================================================
// Trigger: ReturntoX
//===========================================================================
function Trig_ReturntoX_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A04K' 
endfunction

function Trig_ReturntoX_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm=LoadTimerHandle(udg_Hash3,GetHandleId(u),641)
local integer i=GetHandleId(tm)
local unit m=LoadUnitHandle(udg_Hash3,i,5)
local real x=LoadReal(udg_Hash3,i,2)
local real y=LoadReal(udg_Hash3,i,3)

call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\EMPBomb.mdx", m, "chest") )
call UnitRemoveAbility( u, 'A04K' )
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A04J', true )
call DestroyEffect(LoadEffectHandle(udg_Hash3,i,4))
if IsUnitType(m, UNIT_TYPE_MAGIC_IMMUNE) == false and IsUnitHidden(m)==false and IsUnitLoaded(m)==false then
call SetUnitX(m,x)
call SetUnitY(m,y)
endif
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_ReturntoX takes nothing returns nothing
    set gg_trg_ReturntoX = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_ReturntoX, Condition( function Trig_ReturntoX_Conditions ) )
    call TriggerAddAction( gg_trg_ReturntoX, function Trig_ReturntoX_Actions )
endfunction
