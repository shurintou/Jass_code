
//===========================================================================
// Trigger: 未命名触发器 178
//===========================================================================
function Trig_178_Func001C takes nothing returns boolean
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(0) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(1) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(2) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(3) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(4) ) ) then
        return true
    endif
    return false
endfunction

function Trig_178_Conditions takes nothing returns boolean
    if ( not Trig_178_Func001C() ) then
        return false
    endif
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_178_Func003C takes nothing returns boolean
    if ( not ( udg_Shenglingsharenshu == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_178_Func004C takes nothing returns boolean
    if ( not ( udg_Shenglingsharenshu == 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_178_Func005C takes nothing returns boolean
    if ( not ( udg_Shenglingsharenshu == 7 ) ) then
        return false
    endif
    return true
endfunction

function Trig_178_Func006C takes nothing returns boolean
    if ( not ( udg_Shenglingsharenshu == 9 ) ) then
        return false
    endif
    return true
endfunction

function Trig_178_Func007C takes nothing returns boolean
    if ( not ( udg_Shenglingsharenshu == 11 ) ) then
        return false
    endif
    return true
endfunction

function Trig_178_Func008C takes nothing returns boolean
    if ( not ( udg_Shenglingsharenshu == 14 ) ) then
        return false
    endif
    return true
endfunction

function Trig_178_Func009C takes nothing returns boolean
    if ( not ( udg_Shenglingsharenshu == 17 ) ) then
        return false
    endif
    return true
endfunction

function Trig_178_Func010C takes nothing returns boolean
    if ( not ( udg_Shenglingsharenshu == 20 ) ) then
        return false
    endif
    return true
endfunction

function Trig_178_Actions takes nothing returns nothing
    set udg_Shenglingsharenshu = ( GetPlayerScore(Player(0), PLAYER_SCORE_HEROES_KILLED) + ( GetPlayerScore(Player(1), PLAYER_SCORE_HEROES_KILLED) + ( GetPlayerScore(Player(2), PLAYER_SCORE_HEROES_KILLED) + ( GetPlayerScore(Player(3), PLAYER_SCORE_HEROES_KILLED) + GetPlayerScore(Player(4), PLAYER_SCORE_HEROES_KILLED) ) ) ) )
    if ( Trig_178_Func003C() ) then
        call PlaySoundBJ( gg_snd_Killing_Spree )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_5891" )
    else
    endif
    if ( Trig_178_Func004C() ) then
        call PlaySoundBJ( gg_snd_Dominating )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_5893" )
    else
    endif
    if ( Trig_178_Func005C() ) then
        call PlaySoundBJ( gg_snd_MegaKill )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_5895" )
    else
    endif
    if ( Trig_178_Func006C() ) then
        call PlaySoundBJ( gg_snd_Unstoppable )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_5897" )
    else
    endif
    if ( Trig_178_Func007C() ) then
        call PlaySoundBJ( gg_snd_WhickedSick )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_5898" )
    else
    endif
    if ( Trig_178_Func008C() ) then
        call PlaySoundBJ( gg_snd_monster_kill )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_5899" )
    else
    endif
    if ( Trig_178_Func009C() ) then
        call PlaySoundBJ( gg_snd_GodLike )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_5900" )
    else
    endif
    if ( Trig_178_Func010C() ) then
        call PlaySoundBJ( gg_snd_HolyShit )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_5901" )
    else
    endif
endfunction

//===========================================================================
function InitTrig_178 takes nothing returns nothing
    set gg_trg_178 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_178, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_178, Condition( function Trig_178_Conditions ) )
    call TriggerAddAction( gg_trg_178, function Trig_178_Actions )
endfunction
