
//===========================================================================
// Trigger: billizardorder
//===========================================================================
function moveam takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash,i,5)
    call UnitRemoveAbility(u,'A09U')
    call IssuePointOrderById( u, 851986, GetUnitX(u)+GetRandomReal(-100,100), GetUnitY(u)+GetRandomReal(-100,100) )
    call FlushChildHashtable( udg_hash,i)
    call DestroyTimer( tm )
    set tm=null
    set u=null
endfunction

function Trig_billizardorder_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit m
    local timer tm
    local integer l
    if GetIssuedOrderId() ==852089 then
        
        set m=CreateUnit(getcorrectplayer(u),'u000',0,0,0)
        call UnitApplyTimedLife( m, 'BTLF', 15.00 )
        call UnitAddAbility(m,'A01Z')
        if GetUnitAbilityLevel(u,'B01T')>0 then
            set l=R2I((GetHeroLevel(u)+5)/10)+1
            call SetUnitAbilityLevel(m,'A01Z',l)
            call SetUnitAbilityLevel(u,'AHwe',l)
            call SetUnitAbilityLevel(u,'AHab',l)
        else
            call SetUnitAbilityLevel(m,'A01Z',R2I((GetHeroLevel(u)+5)/10))
        endif
        call IssuePointOrderById( m, 852089, GetOrderPointX(),GetOrderPointY() )
        if GetUnitAbilityLevel(u,'A09U')==0 then
            set tm=CreateTimer()
            call UnitAddAbility(u,'A09U')
            call SaveUnitHandle(udg_hash,GetHandleId(tm),5,u)
            call TimerStart(tm,2,false,function moveam)
        endif
    endif
    set m=null
    set tm=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_billizardorder takes nothing returns nothing
    set gg_trg_billizardorder = CreateTrigger(  )
    call DisableTrigger( gg_trg_billizardorder )
    call TriggerAddCondition( gg_trg_billizardorder, Condition( function Trig_billizardorder_Conditions ) )
endfunction
