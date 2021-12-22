
//===========================================================================
// Trigger: nianyou
//===========================================================================
function Trig_nianyou_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A09O' 
endfunction


function yui takes integer i returns integer
if i>10 then
return 10
else
return i
endif
endfunction

function Trig_nianyou_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local group g=CreateGroup()
local unit target
local unit m=LoadUnitHandle(udg_Hash1,GetHandleId(u),8502)
local player p=GetTriggerPlayer()
local integer n=0
local real dx=GetSpellTargetX()
local real dy=GetSpellTargetY()
local integer l
local integer lt
local integer level

call GroupEnumUnitsInRange(g,dx,dy,350,null)
loop
set target=FirstOfGroup(g)
exitwhen target==null
if IsUnitAlly(target, p) == false and GetUnitState(target, UNIT_STATE_LIFE) > 0.00 and IsUnitType(target, UNIT_TYPE_MAGIC_IMMUNE) == false then
set lt=GetHandleId(target)
set l=LoadInteger(udg_Hash1,lt,8503)
    if GetUnitAbilityLevel(target,'B035')>0 then
    call SaveInteger(udg_Hash1,lt,8503,yui(l+1))
    set level=yui(l+1)
    else
    call SaveInteger(udg_Hash1,lt,8503,1)
    set level=1
    endif
call SetUnitAbilityLevel( m, 'A09M', level)
call IssueTargetOrderById( m, 852075, target )
call CreateTextTagUnitBJ( I2S(level), target, 0, 18.00, 60, 255, 30, 0 )
call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
call SetTextTagPermanent( GetLastCreatedTextTag(), false )
call SetTextTagLifespan( GetLastCreatedTextTag(), 3.00 )
call SetTextTagFadepoint( GetLastCreatedTextTag(), 2.60 )
endif
call GroupRemoveUnit(g,target)
set target=null
endloop

loop
exitwhen n>8
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Orc\\Berserker\\Berserkertarget.mdl", dx+GetRandomReal(-350,350), dy+GetRandomReal(-350,350)) )
set n=n+1
endloop



call DestroyGroup(g)
set g=null
set u=null
set target=null
set m=null
endfunction

//===========================================================================
function InitTrig_nianyou takes nothing returns nothing
    set gg_trg_nianyou = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_nianyou, Condition( function Trig_nianyou_Conditions ) )
    call TriggerAddAction( gg_trg_nianyou, function Trig_nianyou_Actions )
endfunction
