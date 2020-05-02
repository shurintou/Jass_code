
//===========================================================================
// Trigger: 未命名触发器 184
//===========================================================================
function Trig_184_Func010C takes nothing returns boolean
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(5) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(6) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(7) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(8) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(9) ) ) then
        return true
    endif
    return false
endfunction

function Trig_184_Conditions takes nothing returns boolean
    if ( not Trig_184_Func010C() ) then
        return false
    endif
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_184_Func002C takes nothing returns boolean
    if ( not ( udg_Tianzaisharenshu == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_184_Func003C takes nothing returns boolean
    if ( not ( udg_Tianzaisharenshu == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_184_Func004C takes nothing returns boolean
    if ( not ( udg_Tianzaisharenshu == 7 ) ) then
        return false
    endif
    return true
endfunction

function Trig_184_Func005C takes nothing returns boolean
    if ( not ( udg_Tianzaisharenshu == 9 ) ) then
        return false
    endif
    return true
endfunction

function Trig_184_Func006C takes nothing returns boolean
    if ( not ( udg_Tianzaisharenshu == 11 ) ) then
        return false
    endif
    return true
endfunction

function Trig_184_Func007C takes nothing returns boolean
    if ( not ( udg_Tianzaisharenshu == 14 ) ) then
        return false
    endif
    return true
endfunction

function Trig_184_Func008C takes nothing returns boolean
    if ( not ( udg_Tianzaisharenshu == 17 ) ) then
        return false
    endif
    return true
endfunction

function Trig_184_Func009C takes nothing returns boolean
    if ( not ( udg_Tianzaisharenshu == 20 ) ) then
        return false
    endif
    return true
endfunction

function Trig_184_Actions takes nothing returns nothing
    set udg_Tianzaisharenshu = ( GetPlayerScore(Player(5), PLAYER_SCORE_HEROES_KILLED) + ( GetPlayerScore(Player(6), PLAYER_SCORE_HEROES_KILLED) + ( GetPlayerScore(Player(7), PLAYER_SCORE_HEROES_KILLED) + ( GetPlayerScore(Player(8), PLAYER_SCORE_HEROES_KILLED) + GetPlayerScore(Player(9), PLAYER_SCORE_HEROES_KILLED) ) ) ) )
    if ( Trig_184_Func002C() ) then
        call PlaySoundBJ( gg_snd_Killing_Spree )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_5902" )
    else
    endif
    if ( Trig_184_Func003C() ) then
        call PlaySoundBJ( gg_snd_Dominating )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_5903" )
    else
    endif
    if ( Trig_184_Func004C() ) then
        call PlaySoundBJ( gg_snd_MegaKill )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_5904" )
    else
    endif
    if ( Trig_184_Func005C() ) then
        call PlaySoundBJ( gg_snd_Unstoppable )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_5905" )
    else
    endif
    if ( Trig_184_Func006C() ) then
        call PlaySoundBJ( gg_snd_WhickedSick )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_5906" )
    else
    endif
    if ( Trig_184_Func007C() ) then
        call PlaySoundBJ( gg_snd_monster_kill )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_5907" )
    else
    endif
    if ( Trig_184_Func008C() ) then
        call PlaySoundBJ( gg_snd_GodLike )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_5908" )
    else
    endif
    if ( Trig_184_Func009C() ) then
        call PlaySoundBJ( gg_snd_HolyShit )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_5909" )
    else
    endif
endfunction

//===========================================================================
function InitTrig_184 takes nothing returns nothing
    set gg_trg_184 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_184, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_184, Condition( function Trig_184_Conditions ) )
    call TriggerAddAction( gg_trg_184, function Trig_184_Actions )
endfunction
