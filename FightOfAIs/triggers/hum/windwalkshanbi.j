
//===========================================================================
// Trigger: windwalkshanbi
//===========================================================================
function removewindwork takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash, i, 1)
    
    call SetUnitMoveSpeed( u, GetUnitDefaultMoveSpeed(u) )
    call SetUnitPathing(u, true )
    call UnitRemoveAbility(u,'A07W')
    call FlushChildHashtable( udg_hash, i )
    call DestroyTimer(tm)
    
    set u=null
    set tm=null
endfunction


function Trig_windwalkshanbi_Conditions takes nothing returns boolean
    local timer tm
    local unit u
    local integer l=GetSpellAbilityId()
    if  l == 'A00B'  then
        set tm=CreateTimer()
        set u=GetTriggerUnit()
        call UnitAddAbility(u,'A07W')
        call SaveUnitHandle(udg_hash,GetHandleId(tm),1,u)
        call SetUnitMoveSpeed( u, 522 )
        call SetUnitPathing( u, false )
        call TimerStart(tm,10,false,function removewindwork)
    elseif l== 'A00A' then
        set udg_SpellTimer[GetConvertedPlayerId(GetTriggerPlayer())]=1
        call SetUnitAnimationByIndex(GetTriggerUnit(), 11 )
    endif
    
    set tm=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_windwalkshanbi takes nothing returns nothing
    set gg_trg_windwalkshanbi = CreateTrigger(  )
    call DisableTrigger(gg_trg_windwalkshanbi)
    call TriggerAddCondition( gg_trg_windwalkshanbi, Condition( function Trig_windwalkshanbi_Conditions ) )
    
endfunction
