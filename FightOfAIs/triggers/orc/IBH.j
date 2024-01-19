
//===========================================================================
// Trigger: IBH
//===========================================================================
function gangbei takes nothing returns boolean
    local unit u=GetFilterUnit()
    local integer i=GetUnitTypeId(u)
    if IsUnitType(u, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(u, udg_PG) == true and GetUnitAbilityLevel(u, 'Aloc') == 0 and GetUnitState(u, UNIT_STATE_LIFE)>0 and i != 'Udth' and i != 'O00H' then
        call UnitDamageTarget( udg_UG, u, udg_Re, true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
    endif
    set u=null
    return false
endfunction



function gangbeitanshe takes unit u, real harm, real distance returns nothing
    local boolexpr b
    set udg_UG=u
    set udg_PG=GetOwningPlayer(u)
    set udg_Re=harm
    set b=Condition(function gangbei)
    call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),distance ,b)
    call DestroyBoolExpr(b)
    set b=null
endfunction

function Trig_IBH_Conditions takes nothing returns boolean
    local unit u= GetTriggerUnit()
    local real r=RAbsBJ(GetUnitFacing(u) - GetUnitFacing(GetEventDamageSource()))
    local integer i=GetConvertedPlayerId(GetTriggerPlayer())
    local real h=GetEventDamage()
    local unit m
    local integer l=GetHeroLevel(u)
    
    if  r > 180.00 then
        set r=RAbsBJ( r - 360.00 )
    endif
    set h=((r/240)*h)
    call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+h  )
    set h=h+udg_UGharm[i]
    if h>2000 then
        set m=CreateUnit(getcorrectplayer(u),'u000',GetUnitX(u),GetUnitY(u),0)
        call UnitAddAbility(m,'A09J')
        call UnitApplyTimedLife( m, 'BTLF', 1.50 )
        call IssueImmediateOrderById( m, 852526 )
        set h=h-2000
        call gangbeitanshe(u,100+(2*(l+udg_Chaoxi[i])),700+(10*l))
        if GetUnitAbilityLevel(u,'B028')>0 then
            set udg_Chaoxi[i]=  udg_Chaoxi[i]+1
        else
            set udg_Chaoxi[i]=R2I((l-3)/7)
        endif
        if udg_Chaoxi[i]>=20+l then
            set udg_Chaoxi[i]=20+l
        endif
        call UnitAddAbility(u,'A09M')
        call UnitRemoveAbility(u,'A09M')
        call SetUnitAbilityLevel(u,'A02P',udg_Chaoxi[i])
        call SetUnitMoveSpeed( u, GetUnitDefaultMoveSpeed(u)+(4*udg_Chaoxi[i]) )
    endif
    set udg_UGharm[i]=h
    
    
    
    set u=null
    set m=null
    return false
endfunction

//===========================================================================
function InitTrig_IBH takes nothing returns nothing
    set gg_trg_IBH = CreateTrigger(  )
    call DisableTrigger( gg_trg_IBH )
    call TriggerAddCondition( gg_trg_IBH, Condition( function Trig_IBH_Conditions ) )
endfunction
