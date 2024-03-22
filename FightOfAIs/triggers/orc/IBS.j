
//===========================================================================
// Trigger: IBS
//===========================================================================
function Trig_IBS_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    local integer level=GetHeroLevel(u)
    local unit m
    local integer n=GetConvertedPlayerId(GetTriggerPlayer())
    local integer g=R2I((level-3)/7)
    local unit t
    if l=='A09J' then
        call gangbeitanshe(u,100+(2*(level+udg_Chaoxi[n])),700+(10*level))
    elseif l=='A09K' then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set m=CreateUnit(getcorrectplayer(u),'o00I',GetUnitX(u),GetUnitY(u),GetUnitFacing(u))
            call UnitDamageTarget( u, t,100+(100*g), true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
            call SetUnitAbilityLevel(m,'A09L',g  )
            call IssueTargetOrderById( m, 851985, t)
            call UnitApplyTimedLife( m, 'BTLF', 1.50 )
        endif
    endif
    
    if GetUnitAbilityLevel(u,'B028')>0 then
        set udg_Chaoxi[n]=  udg_Chaoxi[n]+g
    else
        set udg_Chaoxi[n]=g
    endif
    if udg_Chaoxi[n]>=20+level then
        set udg_Chaoxi[n]=20+level
    endif
    call UnitAddAbility(u,'A09M')
    call UnitRemoveAbility(u,'A09M')
    call SetUnitAbilityLevel(u,'A02P',udg_Chaoxi[n])
    call SetUnitMoveSpeed( u, GetUnitDefaultMoveSpeed(u)+(4*udg_Chaoxi[n]) )
    set u=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_IBS takes nothing returns nothing
    set gg_trg_IBS = CreateTrigger(  )
    call DisableTrigger( gg_trg_IBS )
    call TriggerAddCondition( gg_trg_IBS, Condition( function Trig_IBS_Conditions ) )
endfunction
