
//===========================================================================
// Trigger: left
//===========================================================================
function leftdistanceofhero takes nothing returns nothing
    local unit t=GetEnumUnit()
    local real x=GetUnitX(t)
    local real y
    local real r
    
    if GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitVisible(t, Player(0)) == true and x<udg_X then
        set x=x-udg_X
        set y=GetUnitY(t)-udg_Y
        set r=SquareRoot(x*x+y*y)
        if r<udg_Re then
            set udg_Re=r
            set udg_CameraUnit=t
        endif
    endif
    
    set t=null
endfunction


function Trig_left_Conditions takes nothing returns boolean
    if udg_CameraUnit!=null then
        set udg_X= GetUnitX(udg_CameraUnit)
        set udg_Y= GetUnitY(udg_CameraUnit)
        set udg_Re=99999
        call ForGroup(udg_HeroGroup, function leftdistanceofhero)
        call SelectUnitForPlayerSingle( udg_CameraUnit, Player(0) )
    endif
    
    return false
endfunction



//===========================================================================
function InitTrig_left takes nothing returns nothing
    set gg_trg_left = CreateTrigger(  )
    call DisableTrigger( gg_trg_left )
    call TriggerRegisterPlayerEvent( gg_trg_left, Player(0), EVENT_PLAYER_ARROW_LEFT_DOWN)
    call TriggerAddCondition( gg_trg_left, Condition( function Trig_left_Conditions ) )
endfunction
