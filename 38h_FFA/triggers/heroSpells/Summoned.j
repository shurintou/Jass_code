
//===========================================================================
// Trigger: Summoned
//===========================================================================
function checkwhether takes nothing returns nothing
local unit u=GetEnumUnit()

if LoadInteger(udg_Hash1,GetHandleId(u),252)==1 and IsUnitEnemy(u, GetOwningPlayer(udg_lsu)) == true then
call SetUnitX(udg_lsu,GetUnitX(u))
call SetUnitY(udg_lsu,GetUnitY(u))
call IssueTargetOrderById( udg_lsu, 851983, u )
call SaveInteger(udg_Hash1,GetHandleId(u),252,0)
endif

set u=null
endfunction



function Trig_Summoned_Actions takes nothing returns nothing
    local unit u=GetSummonedUnit()
    local integer i=GetHandleId(GetSummoningUnit()) 
    local unit t=LoadUnitHandle(udg_Hash1,i,1)
    call SetUnitPathing( u, false )
    call SetUnitX(u,GetUnitX(t))
    call SetUnitY(u,GetUnitY(t))
    call IssueTargetOrderById( u, 851983, t )
    call FlushChildHashtable( udg_Hash1, i )
    //set udg_lsu=u
    //call ForGroup(udg_CheckHpGroup,function checkwhether)
    set u=null
    set t=null
endfunction

//===========================================================================
function InitTrig_Summoned takes nothing returns nothing
    set gg_trg_Summoned = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Summoned, function Trig_Summoned_Actions )
endfunction
