
//===========================================================================
// Trigger: setNumber
//
// -hum0102 
// HeroRandomNum[]
// hum 1 2
// orc  3 4
// und  5 6
// nig  7 8
//===========================================================================
function Trig_setNumber_Conditions takes nothing returns boolean
    local string s=GetEventPlayerChatString()
    local string r=SubString(s, 0, 4)
    local string st=SubString(s, 4, 6)
    local string en=SubString(s, 6, 8)
    
    if r =="-hum"  then
        set udg_HeroRandomNum[1]=S2I(st)
        set udg_HeroRandomNum[2]=S2I(en)
        call BJDebugMsg( r+st+","+en+",setting done")
    elseif r =="-orc" then
        set udg_HeroRandomNum[3]=S2I(st)
        set udg_HeroRandomNum[4]=S2I(en)
        call BJDebugMsg( r+st+","+en+",setting done")
    elseif r=="-und" then
        set udg_HeroRandomNum[5]=S2I(st)
        set udg_HeroRandomNum[6]=S2I(en)
        call BJDebugMsg( r+st+","+en+",setting done")
    elseif r =="-nig" then
        set udg_HeroRandomNum[7]=S2I(st)
        set udg_HeroRandomNum[8]=S2I(en)
        call BJDebugMsg( r+st+","+en+",setting done")
    elseif r =="-idr" then
        set udg_ItemRandomNum=S2I(st)
        call BJDebugMsg( "drop item"+","+st+",setting done")
    elseif r =="-obs" then
        set udg_Observer = S2ID(SubString(s, 4, 8))
        call BJDebugMsg( "observer unit is set done")
    elseif r =="-uvc" then
        call SetUnitVertexColor( udg_ObserverUnit, S2I(SubString(s, 4, 7)), S2I(SubString(s, 7, 10)), S2I(SubString(s, 10, 13)), 255 )
        call BJDebugMsg( "observer unit's color is set done")
    endif
    
    
    set s=null
    set r=null
    set st=null
    set en=null
    return false
endfunction



//===========================================================================
function InitTrig_setNumber takes nothing returns nothing
    set gg_trg_setNumber = CreateTrigger(  )
    call DisableTrigger( gg_trg_setNumber )
    call TriggerRegisterPlayerChatEvent( gg_trg_setNumber, Player(0), "-", false )
    call TriggerAddCondition( gg_trg_setNumber, Condition( function Trig_setNumber_Conditions ) )
endfunction
