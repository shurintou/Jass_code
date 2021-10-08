
//===========================================================================
// Trigger: Stone
//
// Atan2(dy-y,dx-x)*bj_RADTODEG
// if n=='Hpb1' then//XF1
// call SetUnitVertexColor(m , 160, 200, 255, 255 )
// else
// if n=='Osam' then//MR2
// call SetUnitVertexColor(m , 255, 90, 80, 255 )
// else
// if n=='Ulic' then//Lion3
// call SetUnitVertexColor(m , 60, 200, 100, 255 )
// else
// if n=='Udre' then//Kimi4
// call SetUnitVertexColor(m , 160, 160, 150, 255 )
// else
// if n=='Npld' then//猛犸5
// call SetUnitVertexColor(m , 255, 225, 130, 255 )
// else
// if n=='Nplh' then//38h6
// call SetUnitVertexColor(m , 150, 175, 255, 255 )
// else
// if n=='Ekee' then//搞死棍7
// call SetUnitVertexColor(m , 255, 255, 150, 255 )
// else
// if n=='Ewar' then//ljz8
// call SetUnitVertexColor(m , 180, 255, 255, 255 )
// else
// if n=='Efur' then//VIP9
// call SetUnitVertexColor(m , 60, 255, 0, 255 )
// else
// if n=='Emns' then//V姐
// call SetUnitVertexColor(m , 150, 110, 70, 255 )
// else
// if n=='Ogld' then//MAY
// call SetUnitVertexColor(m , 255, 50, 50, 255 )
// else
// if n=='O002' then//赏金
// call SetUnitVertexColor(m , 255, 220, 0, 255 )
// else
// call SetUnitVertexColor(m , 255, 255, 255, 255 )
// endif
// endif
// endif
// endif
// endif
// endif
// endif
// endif
// endif
// endif
// endif
// endif
//===========================================================================
function Trig_Stone_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A03F' 
endfunction


function stoneover takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local group g=LoadGroupHandle(udg_Hash1,i,2)
local integer n=0
local unit m
local integer e
local integer level

loop
exitwhen IsUnitGroupEmptyBJ(g) == true
set m=FirstOfGroup(g)
set n=GetUnitTypeId(m)
call GroupRemoveUnit( g,m )
call SetUnitTurnSpeed( m, GetUnitDefaultTurnSpeed(m) )
set e=GetHandleId(m)
set level=GetUnitAbilityLevel(m,'Acdb')//醉拳
if level>0 then //调整颜色
call SetUnitVertexColor( u, LoadInteger(udg_Hash2,e,10002), LoadInteger(udg_Hash2,e,10003), LoadInteger(udg_Hash2,e,10004), R2I(255-(level/100)*255) )
else
call SetUnitVertexColor( u, LoadInteger(udg_Hash2,e,10002), LoadInteger(udg_Hash2,e,10003), LoadInteger(udg_Hash2,e,10004),255)
endif
endloop
call UnitRemoveAbility( u, 'Amgr' )
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A03F', true )


call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
call GroupClear(g)
call DestroyGroup(g)

set g=null
set tm=null
set u=null
set m=null
endfunction


function stoneact takes nothing returns nothing
local unit u=GetEnumUnit()
local real face=GetUnitFacing(u)
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local real dx=GetUnitX(udg_lsu)
local real dy=GetUnitY(udg_lsu)
local real ey=dy-y
local real ex=dx-x
local real angle=realangle(ey,ex)*180/3.1415926
local unit m=CreateUnit(GetOwningPlayer(udg_lsu),'n001',dx,dy,0)
local integer level=GetUnitAbilityLevel(udg_lsu,'A03F')
local integer n=UnitCountBuffsEx(u, true, true, false, false, true, true, false)

call UnitAddAbility( m, 'Aslo' )
call SetUnitAbilityLevel( m, 'Aslo', level )
if  RAbsBJ(angle-face)<75 then
call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\SandExplosion.mdx", u, "origin") )
call SetUnitVertexColor(u , 60, 60, 60, 255 )
call SetUnitTurnSpeed( u, 0.01 )
call UnitRemoveBuffs( u, true, true )
call IssueTargetOrderById( m, 852075, u )
call IssueTargetOrderById( m, 852075, u )
call UnitDamageTarget( udg_lsu, u, n*(10*level), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
else
call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\SandTrap.mdx", u, "origin") )
call UnitDamageTarget( udg_lsu, u, 50+(100*level), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
endif
call UnitApplyTimedLife( m, 'BTLF', 5.00 )

set u=null
set m=null
endfunction



function UnitIsNotSC takes nothing returns boolean
return IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true and GetUnitAbilityLevel(GetFilterUnit(),'Aloc')==0
endfunction

function Trig_Stone_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local group g
local boolexpr b 
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)

set g=CreateGroup()
set b=Condition(function UnitIsNotSC)
set udg_lsu=u
call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),800,b)
call ForGroup(g,function stoneact)
call SaveGroupHandle(udg_Hash1,i,2,g)
call SaveUnitHandle(udg_Hash1,i,1,u)
call TimerStart(tm,5.5,false,function stoneover)
call DestroyBoolExpr(b)
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A03F', false )
call UnitAddAbility( u, 'Amgr' )

set u=null
set tm=null
set g=null
set b=null
endfunction

//===========================================================================
function InitTrig_Stone takes nothing returns nothing
    set gg_trg_Stone = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Stone, Condition( function Trig_Stone_Conditions ) )
    call TriggerAddAction( gg_trg_Stone, function Trig_Stone_Actions )
endfunction
