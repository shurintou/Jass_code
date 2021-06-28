
//===========================================================================
// Trigger: chongneng
//===========================================================================
function Trig_chongneng_Conditions takes nothing returns boolean
    local real r=GetEventDamage()
    return GetTriggerUnit() == GetEventDamageSource() and  r< 5 and r>0 
endfunction

function Trig_chongneng_Actions takes nothing returns nothing
local integer n2=GetHandleId(gg_trg_xuetongmo)
local integer i2=LoadInteger(udg_Hash1,n2,1)
local integer n1=GetHandleId(gg_trg_xueCCC)
local integer i1=LoadInteger(udg_Hash1,n1,1)
call SaveInteger(udg_Hash1,n2,1,i2-1)
call SaveInteger(udg_Hash1,n1,1,i1-1)
endfunction

//===========================================================================
function InitTrig_chongneng takes nothing returns nothing
    set gg_trg_chongneng = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_chongneng, Condition( function Trig_chongneng_Conditions ) )
    call TriggerAddAction( gg_trg_chongneng, function Trig_chongneng_Actions )
endfunction
