
//===========================================================================
// Trigger: esc
//===========================================================================
function Trig_esc_Conditions takes nothing returns boolean
    if  udg_CameraUnit != null  then
        call SelectUnitForPlayerSingle( udg_CameraUnit, Player(0) )
    else
        if udg_testmode==0 then
            set udg_testmode=1
            call DisplayTextToPlayer( Player(0), 0, 0, "test mode off" )
            set udg_CameraUnit=null
        else
            if GetUnitState(udg_testhero, UNIT_STATE_LIFE)<=0 then
                call ReviveHero( udg_testhero, -500, 250, true )
                call SaveInteger( udg_hash, GetHandleId(LoadTimerHandle(udg_hash,GetHandleId(udg_testhero),555)),4, -1)
            else
                set udg_testmode=0
                call SetUnitOwner( udg_testhero, Player(udg_testheroplayer), true )
                set udg_ExtraHero[udg_testheroplayer+1]=udg_testhero
                call DisplayTextToPlayer( Player(0), 0, 0, "test mode on" )
                set udg_testhero=null
            endif
        endif
    endif
    return false
endfunction



//===========================================================================
function InitTrig_esc takes nothing returns nothing
    set gg_trg_esc = CreateTrigger(  )
    call DisableTrigger( gg_trg_esc )
    call TriggerRegisterPlayerEventEndCinematic( gg_trg_esc, Player(0) )
    call TriggerAddCondition( gg_trg_esc, Condition( function Trig_esc_Conditions ) )
endfunction
