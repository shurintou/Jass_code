
//===========================================================================
// Trigger: Dawn
//===========================================================================
function Trig_Dawn_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A042' 
endfunction


function checknumberhero takes nothing returns nothing
local unit u=GetEnumUnit()
local unit m
local player p=GetOwningPlayer(udg_lsu)

if IsUnitEnemy(u, p) == true and GetUnitState(u, UNIT_STATE_LIFE)>0 then
set m=CreateUnit(p,'n001',GetUnitX(u),GetUnitY(u),0)
call SaveUnitHandle(udg_Hash1,GetHandleId(m),1,u)//将每一个目标绑定到幻象的召唤者身上,再由召唤的触发取得这个单位
call UnitAddAbility( m, 'A043' )
call SetUnitAbilityLevel( m, 'A043', GetUnitAbilityLevel(udg_lsu, 'A042') )
call SaveInteger(udg_Hash1,GetHandleId(u),252,1)
call UnitApplyTimedLife( m, 'BTLF', 1 )
call IssueTargetOrderById( m, 852274, udg_lsu )
endif


set m=null
set p=null
set u=null
endfunction


function movetooff takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local player p=GetOwningPlayer(u)

call SetPlayerAbilityAvailable( p, 'A047', false )
call SetPlayerAbilityAvailable( p, 'A042', true )
call DisableTrigger( gg_trg_MoveTo )
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set u=null
set p=null
endfunction

function Trig_Dawn_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer i=0
local timer tm=CreateTimer()
local player p=GetTriggerPlayer()

call SaveUnitHandle(udg_Hash1,GetHandleId(tm),1,u)
call PlaySoundBJ( gg_snd_ug )
call SetPlayerAbilityAvailable( p, 'A042', false )
call SetPlayerAbilityAvailable( p, 'A047', true )
set udg_lsu=u
call EnableTrigger( gg_trg_MoveTo )
call EnableTrigger( gg_trg_Summoned )
call ForGroup(udg_CheckHpGroup,function checknumberhero)
call TimerStart(tm,6,false,function movetooff)
call DisableTrigger( gg_trg_Summoned )
    
set u=null
set tm=null
set p=null
endfunction

//===========================================================================
function InitTrig_Dawn takes nothing returns nothing
    set gg_trg_Dawn = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Dawn, Condition( function Trig_Dawn_Conditions ) )
    call TriggerAddAction( gg_trg_Dawn, function Trig_Dawn_Actions )
endfunction
