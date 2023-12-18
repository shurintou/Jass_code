
//===========================================================================
// Trigger: up
//===========================================================================
function updistanceofhero takes nothing returns nothing
    local unit t=GetEnumUnit()
    local real x
    local real y=GetUnitY(t)
    local real r
    
    if GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitVisible(t, Player(0)) == true and y>udg_Y then
        set x=GetUnitX(t)-udg_X
        set y=y-udg_Y
        set r=SquareRoot(x*x+y*y)
        if r<udg_Re then
            set udg_Re=r
            set udg_CameraUnit=t
        endif
    endif
    
    set t=null
endfunction


function Trig_up_Conditions takes nothing returns boolean
    if udg_CameraUnit!=null then
        set udg_X= GetUnitX(udg_CameraUnit)
        set udg_Y= GetUnitY(udg_CameraUnit)
        set udg_Re=99999
        call ForGroup(udg_HeroGroup, function updistanceofhero)
        call SelectUnitForPlayerSingle( udg_CameraUnit, Player(0) )
        
    else
        if IsUnitSelected(udg_ObserverUnit, Player(0)) then
            set udg_ActionIndex=udg_ActionIndex+1
            call BJDebugMsg( "action " + I2S(udg_ActionIndex))
            call SetUnitAnimationByIndex( udg_ObserverUnit, udg_ActionIndex )
            
        else
            set udg_Cameraheigh=udg_Cameraheigh+500
            call SetCameraFieldForPlayer( Player(0), CAMERA_FIELD_TARGET_DISTANCE, udg_Cameraheigh, 1.00 )
        endif
    endif
    return false
endfunction



//===========================================================================
function InitTrig_up takes nothing returns nothing
    set gg_trg_up = CreateTrigger(  )
    call DisableTrigger( gg_trg_up )
    call TriggerRegisterPlayerEvent( gg_trg_up, Player(0), EVENT_PLAYER_ARROW_UP_DOWN)
    call TriggerAddCondition( gg_trg_up, Condition( function Trig_up_Conditions ) )
endfunction
