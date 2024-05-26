
//===========================================================================
// Trigger: GhostShip
//
// 
// Amnx
//===========================================================================
function drouhtb takes nothing returns boolean
    local unit u=GetFilterUnit()
    if IsUnitEnemy(u, udg_P) == true and GetUnitState(u, UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel(u,'Aloc')==0 and IsUnitType(u, UNIT_TYPE_MAGIC_IMMUNE) == false and IsUnitType(u, UNIT_TYPE_STRUCTURE) == false then
        call UnitDamageTarget( udg_U, u, udg_Re, true, false,  ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        set u=null
        return true
    endif
    set u=null
    return false
endfunction


function droughtend takes nothing returns nothing
    local unit m=GetEnumUnit()
    local real r
    call UnitRemoveAbility(m,'A027')
    set r=GetUnitDefaultFlyHeight(m)
    if r<35 then
        call SetUnitFlyHeight( m, r,500.00 )
    endif
    set m=null
endfunction

function drouhtdown takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local group g=LoadGroupHandle(udg_hash,i,1)
    
    call ForGroup(g,function droughtend)
    call GroupClear(g)
    call DestroyGroup(g)
    call DestroyEffect(LoadEffectHandle(udg_hash,i,3))
    call FlushChildHashtable( udg_hash, i )
    call DestroyTimer(tm)
    
    set tm=null
    set g=null
endfunction


function drouhtupact takes nothing returns nothing
    local unit u=GetEnumUnit()
    if GetUnitDefaultFlyHeight(u)<35 then
        call UnitAddAbility( u, 'Amrf' )
        call UnitRemoveAbility( u, 'Amrf' )
        call SetUnitFlyHeight(  u, 500.00, 500.00 )
    endif
    call UnitAddAbility(u,'A027')
    set u=null
endfunction

/////////////////////////////////////////////////////////////////////////////up is drought//////////////////////////////////////////////////////

function Trig_GhostShip_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit m
    local group g
    local boolexpr b
    local timer tm
    local real f
    local real fa
    local real x
    local real y
    local integer i=GetSpellAbilityId()
    
    if  i == 'A028' then
        set  u=GetTriggerUnit()
        set  fa=GetUnitFacing(u)
        set  f=Deg2Rad(fa)
        set  x=GetUnitX(u)
        set  y=GetUnitY(u)
        set m=CreateUnit(getcorrectplayer(u),'hbsh',x-1044*Cos(f),y-1044*Sin(f),fa)
        call UnitRemoveAbility(m,'Aloc')
        call IssuePointOrderById( m, 852232, x+522*Cos(f), y+522*Sin(f) )
        call UnitApplyTimedLife( m, 'BTLF', 3.3 )
    elseif i == 'A025' then
        set g=CreateGroup()
        set b=Condition(function drouhtb)
        set udg_P=GetOwningPlayer(u)
        set udg_U=u
        set udg_Re=GetHeroLevel(u)*5
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set x=GetSpellTargetX()
        set y=GetSpellTargetY()
        call GroupEnumUnitsInRange(g,x,y,300,b)
        call SaveGroupHandle(udg_hash,i,1,g)
        call SaveEffectHandle(udg_hash,i,3,AddSpecialEffect("war3mapImported\\Captain1.mdx", x,y))
        call TimerStart(tm,1,false,function drouhtdown)
        call ForGroup(g,function drouhtupact)
        call DestroyBoolExpr(b)
        call SetUnitAbilityLevel(u,'A02C',R2I((GetHeroLevel(u)-3)/7)+GetUnitAbilityLevel(u,'B01T'))
    elseif  i=='ACwe' then
        set m=CreateUnit(getcorrectplayer(u),'nglm',GetUnitX(u),GetUnitY(u),0)
        call UnitApplyTimedLife( m, 'BTLF', 75 )
        call SetUnitAbilityLevel(m,'Amnx',R2I((GetHeroLevel(u)-3)/7))
    endif
    
    
    
    set u=null
    set m=null
    set g=null
    set b=null
    set tm=null
    return false
endfunction



//===========================================================================
function InitTrig_GhostShip takes nothing returns nothing
    set gg_trg_GhostShip = CreateTrigger(  )
    call DisableTrigger(gg_trg_GhostShip)
    call TriggerAddCondition( gg_trg_GhostShip, Condition( function Trig_GhostShip_Conditions ) )
endfunction
