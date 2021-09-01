
//===========================================================================
// Trigger: learnluanwu
//
// and IsUnitGroupDeadBJ(g) then
//===========================================================================
function Trig_learnluanwu_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A0CY' 
endfunction


function checkhuolv takes nothing returns nothing
local unit u=GetEnumUnit()
if GetUnitState(u, UNIT_STATE_LIFE)>0 and IsUnitType(u, UNIT_TYPE_ETHEREAL) == false then
call SaveInteger(udg_Hash1,GetHandleId( gg_trg_learnluanwu),10,10)
endif
set u=null
endfunction


function checkwuwuwuw takes nothing returns nothing
local unit u=LoadUnitHandle(udg_Hash1,GetHandleId(GetExpiredTimer()),1)
local integer i=GetHandleId(gg_trg_wuqiluanwu)
local group g=LoadGroupHandle(udg_Hash1, i, 4)
local unit target
if GetUnitAbilityLevel(u, 'A0D0')>0 then
call ForGroup(g,function checkhuolv)
if LoadInteger(udg_Hash1,GetHandleId( gg_trg_learnluanwu),10)!=10 then
call DisableTrigger( gg_trg_buzhuowuqi )
call DisableTrigger( gg_trg_buzhuomubiaodanwei )
set target=LoadUnitHandle(udg_Hash1, i, 2)
call SetUnitX(u,GetUnitX(target)+GetRandomReal(-45,45))
call SetUnitY(u,GetUnitY(target)+GetRandomReal(-45,45))
call UnitRemoveAbility( u, 'A03E' )
call UnitRemoveAbility( u, 'A0D0' )
//call UnitRemoveAbility( u, 'ACm2' )
call DestroyEffect( LoadEffectHandle(udg_Hash1, i, 3) )
call SelectUnitForPlayerSingle( u, GetOwningPlayer(u) )
call SetUnitAnimation( u, "stand" )
call FlushChildHashtable( udg_Hash1, i )
//call SetUnitInvulnerable( u, false )
call SetUnitVertexColor( u, 255, 255, 255, 255 )
call IssueTargetOrderById( u, 851983, target )
call GroupClear(g)
call DestroyGroup(g)
endif
endif
call SaveInteger(udg_Hash1,GetHandleId( gg_trg_learnluanwu),10,0)
set u=null
    set target=null
    set g=null
    
endfunction


function Trig_learnluanwu_Actions takes nothing returns nothing
local timer tm=CreateTimer()
call SaveUnitHandle(udg_Hash1,GetHandleId(tm),1,GetTriggerUnit())
call TimerStart(tm,1,true,function checkwuwuwuw)
call DisableTrigger( GetTriggeringTrigger() )
set tm=null
endfunction

//===========================================================================
function InitTrig_learnluanwu takes nothing returns nothing
    set gg_trg_learnluanwu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_learnluanwu, Condition( function Trig_learnluanwu_Conditions ) )
    call TriggerAddAction( gg_trg_learnluanwu, function Trig_learnluanwu_Actions )
endfunction
