
//===========================================================================
// Trigger: Gromchaofeng
//===========================================================================
function chaofengtiaojian takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 then
        call UnitAddAbility(t,'A035')
        call UnitDamageTarget( udg_U, t, 300, true, false,  ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call IssueTargetOrderById( t, 851983, udg_U )
        set t=null
        return true
    endif
    set t=null
    return false
endfunction

function timerchixuchaofeng takes nothing returns nothing
    call IssueTargetOrderById( GetEnumUnit(), 851983, udg_U )
endfunction

function shanchuchaofengbuff takes nothing returns nothing
    local unit u=GetEnumUnit()
    call UnitRemoveAbility(u,'A035')
    call UnitRemoveAbility(u,'B00V')
    set u=null
endfunction

function buduanchaofeng takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local integer n=LoadInteger(udg_hash,i,2)
    local group g=LoadGroupHandle(udg_hash,i,3)
    
    if GetUnitState(u, UNIT_STATE_LIFE)>0 and n>0 then
        set udg_U=u
        call ForGroup(g,function timerchixuchaofeng)
        call SaveInteger(udg_hash,i,2,n-1)
    else
        call UnitRemoveAbility(u,'AId0')
        call ForGroup(g,function shanchuchaofengbuff)
        call GroupClear( g )
        call DestroyGroup( g )
        call FlushChildHashtable( udg_hash,i)
        call DestroyTimer( tm )
    endif
    
    set u=null
    set g=null
    set tm=null
endfunction

function Trig_Gromchaofeng_Conditions takes nothing returns boolean
    local group g
    local unit u
    local boolexpr b
    local timer tm
    local integer i
    if  GetSpellAbilityId() == 'A00K' then
        set u=GetTriggerUnit()
        call UnitAddAbility(u,'AId0')
        set g=CreateGroup()
        set udg_P=GetOwningPlayer(u)
        set udg_U=u
        set b=Condition(function chaofengtiaojian)
        call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),500,b)
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        call SaveUnitHandle(udg_hash,i,1,u)
        call SaveInteger(udg_hash,i,2,10)
        call SaveGroupHandle(udg_hash,i,3,g)
        call DestroyBoolExpr(b)
        call TimerStart(tm,0.3,true,function buduanchaofeng)
    endif
    
    set g=null
    set u=null
    set b=null
    set tm=null
    return false
endfunction




//===========================================================================
function InitTrig_Gromchaofeng takes nothing returns nothing
    set gg_trg_Gromchaofeng = CreateTrigger(  )
    call DisableTrigger( gg_trg_Gromchaofeng )
    call TriggerAddCondition( gg_trg_Gromchaofeng, Condition( function Trig_Gromchaofeng_Conditions ) )
endfunction
