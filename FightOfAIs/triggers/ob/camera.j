
//===========================================================================
// Trigger: camera
//
// 0 get harm
// 1 give harm
// 3 kill unit
//===========================================================================
function Trig_camera_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local player p=GetOwningPlayer(u)
    
    if GetUnitTypeId(u) == udg_Observer then
        if udg_lockcamara==0 then
            set udg_lockcamara=1
            call DisplayTextToPlayer( Player(0), 0, 0, "lock camara off" )
        else
            set udg_lockcamara=0
            call DisplayTextToPlayer( Player(0), 0, 0, "lock camara on" )
        endif
        call ResetToGameCameraForPlayer( Player(0), 0.00 )
        call SetCameraFieldForPlayer( Player(0), CAMERA_FIELD_TARGET_DISTANCE, udg_Cameraheigh, 0.00 )
        set udg_CameraUnit=null
        set p=null
        set u=null
        return false
    endif
    
    if GetUnitTypeId(u) != udg_Observer and IsUnitType(u, UNIT_TYPE_HERO) == true then
        if udg_testmode==0 then
            if udg_lockcamara==0 then
                call SetCameraTargetControllerNoZForPlayer( Player(0), u, 0, 0, true )
                call SetCameraFieldForPlayer( Player(0), CAMERA_FIELD_TARGET_DISTANCE, udg_Cameraheigh, 0.00 )
            endif
            set udg_CameraUnit=u
        else
            if IsUnitAlly(u, Player(0)) == true then
                if udg_testhero==null then
                    set udg_testhero=u
                    set udg_testheroplayer=GetConvertedPlayerId(GetOwningPlayer(u))-1
                    call SetUnitOwner( u, Player(0), true )
                    set udg_ExtraHero[udg_testheroplayer+1]=null
                else
                    if udg_testhero!=u then
                        if GetUnitState(udg_testhero, UNIT_STATE_LIFE)<=0 then
                            call ReviveHero( udg_testhero, -500, 250, true )
                            call SaveInteger( udg_hash, GetHandleId(LoadTimerHandle(udg_hash,GetHandleId(udg_testhero),555)),4, -1)
                        endif
                        call SetUnitOwner( udg_testhero, Player(udg_testheroplayer), true )
                        set udg_ExtraHero[udg_testheroplayer+1]=udg_testhero
                        set udg_testhero=u
                        set udg_testheroplayer=GetConvertedPlayerId(GetOwningPlayer(u))-1
                        call SetUnitOwner( u, Player(0), true )
                        set udg_ExtraHero[udg_testheroplayer+1]=null
                    endif
                endif
            endif
        endif
    else
        call ResetToGameCameraForPlayer( Player(0), 0.00 )
        call SetCameraFieldForPlayer( Player(0), CAMERA_FIELD_TARGET_DISTANCE, udg_Cameraheigh, 0.00 )
        set udg_CameraUnit=null
    endif
    
    if p!=udg_testplayer and p!=Player(0) then
        call SetPlayerAlliance(udg_testplayer , Player(0), ALLIANCE_SHARED_ADVANCED_CONTROL, false )
        set udg_testplayer=p
        call SetPlayerAlliance(p , Player(0), ALLIANCE_SHARED_ADVANCED_CONTROL, true )
    endif
    set p=null
    set u=null
    return false
endfunction





//===========================================================================
function InitTrig_camera takes nothing returns nothing
    set gg_trg_camera = CreateTrigger(  )
    call DisableTrigger( gg_trg_camera )
    call TriggerRegisterPlayerUnitEvent( gg_trg_camera, Player(0), EVENT_PLAYER_UNIT_SELECTED, null)
    call TriggerAddCondition( gg_trg_camera, Condition( function Trig_camera_Conditions ) )
endfunction
