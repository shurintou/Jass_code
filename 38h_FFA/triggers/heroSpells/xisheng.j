
//===========================================================================
// Trigger: xisheng
//===========================================================================
function Trig_xisheng_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0D5' 
endfunction

function Trig_xisheng_Actions takes nothing returns nothing
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()
local integer i=0
local player p=GetTriggerPlayer()
local integer g=GetPlayerScore(p, PLAYER_SCORE_HEROES_KILLED)-LoadInteger(udg_Hash1,GetHandleId(gg_trg_sigedead),1)*2

if g>0 then
loop
exitwhen i>g
call CreateCorpse(p,ChooseRandomCreep(-1),x+GetRandomReal(-300,300),y+GetRandomReal(-300,300),GetRandomReal(-360,360))
set i=i+1
endloop
endif
set p=null
endfunction

//===========================================================================
function InitTrig_xisheng takes nothing returns nothing
    set gg_trg_xisheng = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_xisheng, Condition( function Trig_xisheng_Conditions ) )
    call TriggerAddAction( gg_trg_xisheng, function Trig_xisheng_Actions )
endfunction
