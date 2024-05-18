
//===========================================================================
// Trigger: NightKingE
//===========================================================================
function Trig_NightKingE_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer i=GetHeroLevel(u)
    local unit t=GetAttacker()
    local real uh = GetUnitState(u, UNIT_STATE_LIFE)
    local real th = GetUnitState(t, UNIT_STATE_LIFE)
    local real r = uh/ GetUnitState(u, UNIT_STATE_MAX_LIFE)
    local real x = GetUnitX(t)
    local real y = GetUnitY(t)
    
    if r<0.4 and r < th/ GetUnitState(t, UNIT_STATE_MAX_LIFE) then
        if 10>GetRandomInt((GetUnitLevel(t)-i),50)  then
            call IssueTargetOrderById( udg_DeathKnight, 852227, t )
            call SetUnitState( u, UNIT_STATE_LIFE,uh+GetRandomInt(i,2*i))
            call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIhe\\AIheTarget.mdl", u, "chest") )
            call SetUnitState( t, UNIT_STATE_LIFE,th-GetRandomInt(i,2*i))
        endif
    endif
    
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE) == false and IsUnitType(t, UNIT_TYPE_MECHANICAL) == false then
        call IssuePointOrderById( u, 852218, x, y )
    endif
    
    if IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssuePointOrderById( u, 852224, x, y )
    endif
    
    set t=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_NightKingE takes nothing returns nothing
    set gg_trg_NightKingE = CreateTrigger(  )
    call DisableTrigger( gg_trg_NightKingE )
    call TriggerAddCondition( gg_trg_NightKingE, Condition( function Trig_NightKingE_Conditions ) )
endfunction
