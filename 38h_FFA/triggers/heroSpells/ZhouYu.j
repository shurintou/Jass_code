
//===========================================================================
// Trigger: ZhouYu
//
// if n>=10 then
// call PlaySoundAtPointBJ( gg_snd_AcolyteMining, 100, l, 0 )
// call SaveInteger(udg_Hash1,i,3,0)
// else
// call SaveInteger(udg_Hash1,i,3,n+1)
// endif
//===========================================================================
function Trig_ZhouYu_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A099' 
endfunction

function zhouyubb takes nothing returns boolean
return IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true and GetUnitAbilityLevel(GetFilterUnit(),'Aloc')==0 and IsUnitType(GetFilterUnit(), UNIT_TYPE_GIANT) == false
endfunction


function zhouyuharm takes nothing returns nothing
local unit t=GetEnumUnit()
call UnitDamageTarget( udg_lsu, t, 2+(4*GetUnitAbilityLevel(udg_lsu,'A099')), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call IssuePointOrderById( t, 851986, GetRandomReal(udg_XMIN,udg_XMAX), GetRandomReal(udg_YMIN,udg_YMAX) )
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\TalkToMe\\TalkToMe.mdl", t, "overhead") )
set t=null
endfunction

function zhouyuact takes nothing returns nothing
local integer i=GetHandleId(GetExpiredTimer())
local group g=LoadGroupHandle(udg_Hash1,i,2)
local integer n=LoadInteger(udg_Hash1,i,3)
set udg_lsu=LoadUnitHandle(udg_Hash1,i,1)
call ForGroup(g,function zhouyuharm)
if n>=5 then
call PlaySoundAtPointBJ( gg_snd_AcolyteMining, 100, LoadLocationHandle(udg_Hash1,i,6), 0 )
call SaveInteger(udg_Hash1,i,3,0)
else
call SaveInteger(udg_Hash1,i,3,n+1)
endif
set g=null
endfunction

function Trig_ZhouYu_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer n=GetHandleId(tm)
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()
local unit u=GetTriggerUnit()
local group g
local boolexpr b
local location l=GetSpellTargetLoc()

call PlaySoundAtPointBJ( gg_snd_AcolyteMining, 100, l, 0 )
set udg_lsu=u
set g=CreateGroup()
set b=Condition(function zhouyubb)
call GroupEnumUnitsInRange(g,x,y,550,b)
call SaveGroupHandle(udg_Hash1,n,2,g)
call SaveUnitHandle(udg_Hash1,n,1,u)
call SaveInteger(udg_Hash1,n,3,0)
call SaveLocationHandle(udg_Hash1,n,6,l)
call SaveUnitHandle(udg_Hash1,n,5,CreateUnit(GetTriggerPlayer(),'ugar',x,y,0))
call SaveTimerHandle(udg_Hash1,GetHandleId(u),819,tm)
call TimerStart(tm,0.1,true,function zhouyuact)
call DestroyBoolExpr(b)

set tm=null
set g=null
set l=null
set u=null
set b=null
endfunction

//===========================================================================
function InitTrig_ZhouYu takes nothing returns nothing
    set gg_trg_ZhouYu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_ZhouYu, Condition( function Trig_ZhouYu_Conditions ) )
    call TriggerAddAction( gg_trg_ZhouYu, function Trig_ZhouYu_Actions )
endfunction
