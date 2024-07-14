
//===========================================================================
// Trigger: DZA
//===========================================================================
function Trig_DZA_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    local real r
    local real h
    local real n
    local real m
    local integer l=R2I((GetHeroLevel(u)-4)/6)
    call SetUnitAbilityLevel(u,'A01N',l)
    call SetUnitAbilityLevel(u,'A03G',l)
    if l!=GetUnitAbilityLevel(u,'ANpi') then
        call SetUnitAbilityLevel( u, 'ANpi', l )
        call PauseUnit( u, true )
        call PauseUnit( u, false)
    endif
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and GetOwningPlayer(t) != Player(PLAYER_NEUTRAL_AGGRESSIVE) then
        set r=GetUnitState(u, UNIT_STATE_LIFE)
        set m=GetUnitState(u, UNIT_STATE_MAX_LIFE)
        set h=GetUnitState(t, UNIT_STATE_LIFE)/GetUnitState(t, UNIT_STATE_MAX_LIFE)
        set n=r/m
        if n<h then
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\Effect-01.MDX", t, "chest") )
            call UnitDamageTarget( u, t, (m-r)*(h-n)*0.3 , true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
        endif
    endif
    if IsUnitType(t, UNIT_TYPE_HERO) == true then
        call IssueTargetOrderById(u, 852662,t)
    endif
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_DZA takes nothing returns nothing
    set gg_trg_DZA = CreateTrigger(  )
    call DisableTrigger( gg_trg_DZA )
    call TriggerAddCondition( gg_trg_DZA, Condition( function Trig_DZA_Conditions ) )
endfunction
