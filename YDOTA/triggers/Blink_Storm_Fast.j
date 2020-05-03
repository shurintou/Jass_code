
//===========================================================================
// Trigger: Blink Storm Fast
//===========================================================================
function Trig_Blink_Storm_Fast_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0C8' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Blink_Storm_Fast_Func007Func010Func001002003001 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false )
endfunction

function Trig_Blink_Storm_Fast_Func007Func010Func001002003002001 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_Blink_Storm_Fast_Func007Func010Func001002003002002001 takes nothing returns boolean
    return ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())])) == true )
endfunction

function Trig_Blink_Storm_Fast_Func007Func010Func001002003002002002 takes nothing returns boolean
    return ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_GROUND) == true )
endfunction

function Trig_Blink_Storm_Fast_Func007Func010Func001002003002002 takes nothing returns boolean
    return GetBooleanAnd( Trig_Blink_Storm_Fast_Func007Func010Func001002003002002001(), Trig_Blink_Storm_Fast_Func007Func010Func001002003002002002() )
endfunction

function Trig_Blink_Storm_Fast_Func007Func010Func001002003002 takes nothing returns boolean
    return GetBooleanAnd( Trig_Blink_Storm_Fast_Func007Func010Func001002003002001(), Trig_Blink_Storm_Fast_Func007Func010Func001002003002002() )
endfunction

function Trig_Blink_Storm_Fast_Func007Func010Func001002003 takes nothing returns boolean
    return GetBooleanAnd( Trig_Blink_Storm_Fast_Func007Func010Func001002003001(), Trig_Blink_Storm_Fast_Func007Func010Func001002003002() )
endfunction

function Trig_Blink_Storm_Fast_Func007Func010Func002C takes nothing returns boolean
    if ( not ( IsUnitGroupEmptyBJ(udg_Blink_Storm_Targets[GetConvertedPlayerId(GetTriggerPlayer())]) == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_Blink_Storm_Fast_Actions takes nothing returns nothing
    call TriggerSleepAction( 0.40 )
    set udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())] = GetSpellAbilityUnit()
    call SelectUnitRemove( udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())] )
    call SetUnitVertexColorBJ( udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())], 100, 100, 100, 40.00 )
    call SetUnitInvulnerable( udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())], true )
    set udg_Blink_Storm_Target[GetConvertedPlayerId(GetTriggerPlayer())] = GetSpellTargetUnit()
    set udg_Player_Integer[GetConvertedPlayerId( GetTriggerPlayer(  ) )] = 1
    loop
        exitwhen udg_Player_Integer[GetConvertedPlayerId( GetTriggerPlayer(  ) )] > 1
        call AddSpecialEffectTargetUnitBJ( "weapon", udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())], "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl" )
        set udg_Pheon_Missile[GetConvertedPlayerId(GetTriggerPlayer())] = GetLastCreatedEffectBJ()
        call AddSpecialEffectTargetUnitBJ( "chest", udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())], "Abilities\\Spells\\NightElf\\Blink\\BlinkCaster.mdl" )
        call SetUnitPositionLocFacingBJ( udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())], PolarProjectionBJ(GetUnitLoc(udg_Blink_Storm_Target[GetConvertedPlayerId(GetTriggerPlayer())]), 50.00, GetRandomDirectionDeg()), AngleBetweenPoints(GetUnitLoc(udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())]), GetUnitLoc(udg_Blink_Storm_Target[GetConvertedPlayerId(GetTriggerPlayer())])) )
        call UnitDamageTargetBJ( udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())], udg_Blink_Storm_Target[GetConvertedPlayerId(GetTriggerPlayer())], ( GetRandomReal(75.00, 97.00) + ( I2R(GetHeroLevel(udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())])) * 2.00 ) ), ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL )
        call SetUnitAnimation( udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())], "attack" )
        call TriggerSleepAction( 0.20 )
        call SelectUnitRemove( udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())] )
        call DestroyEffect( GetLastCreatedEffectBJ() )
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = ( 2 + ( GetUnitAbilityLevelSwapped('A0C8', udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())]) * 4 ) )
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            set udg_Blink_Storm_Targets[GetConvertedPlayerId(GetTriggerPlayer())] = GetUnitsInRangeOfLocMatching(600.00, GetUnitLoc(udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())]), Condition(function Trig_Blink_Storm_Fast_Func007Func010Func001002003))
            if ( Trig_Blink_Storm_Fast_Func007Func010Func002C() ) then
                set udg_Target_Random[GetConvertedPlayerId(GetTriggerPlayer())] = GroupPickRandomUnit(udg_Blink_Storm_Targets[GetConvertedPlayerId(GetTriggerPlayer())])
                call AddSpecialEffectTargetUnitBJ( "chest", udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())], "Abilities\\Spells\\NightElf\\Blink\\BlinkCaster.mdl" )
                call SetUnitPositionLocFacingBJ( udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())], PolarProjectionBJ(GetUnitLoc(udg_Target_Random[GetConvertedPlayerId(GetTriggerPlayer())]), 50.00, GetRandomDirectionDeg()), AngleBetweenPoints(GetUnitLoc(udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())]), GetUnitLoc(udg_Target_Random[GetConvertedPlayerId(GetTriggerPlayer())])) )
                call UnitDamageTargetBJ( udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())], udg_Target_Random[GetConvertedPlayerId(GetTriggerPlayer())], ( GetRandomReal(75.00, 97.00) + ( I2R(GetHeroLevel(udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())])) * 2.00 ) ), ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL )
                call SetUnitAnimation( udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())], "attack" )
                call TriggerSleepAction( 0.20 )
                call SelectUnitRemove( udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())] )
                call DestroyEffect( GetLastCreatedEffectBJ() )
            else
                call DoNothing(  )
            endif
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        call GroupClear( udg_Blink_Storm_Targets[GetConvertedPlayerId(GetTriggerPlayer())] )
        call SelectUnitForPlayerSingle( udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())], GetTriggerPlayer() )
        call SetUnitInvulnerable( udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())], false )
        call SetUnitVertexColorBJ( udg_Blink_Storm_Caster[GetConvertedPlayerId(GetTriggerPlayer())], 100, 100, 100, 0.00 )
        call DestroyEffect( udg_Pheon_Missile[GetConvertedPlayerId(GetTriggerPlayer())] )
        set udg_Player_Integer[GetConvertedPlayerId( GetTriggerPlayer(  ) )] = udg_Player_Integer[GetConvertedPlayerId( GetTriggerPlayer(  ) )] + 1
    endloop
endfunction

//===========================================================================
function InitTrig_Blink_Storm_Fast takes nothing returns nothing
    set gg_trg_Blink_Storm_Fast = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Blink_Storm_Fast, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_Blink_Storm_Fast, Condition( function Trig_Blink_Storm_Fast_Conditions ) )
    call TriggerAddAction( gg_trg_Blink_Storm_Fast, function Trig_Blink_Storm_Fast_Actions )
endfunction
