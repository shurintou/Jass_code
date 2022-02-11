
//===========================================================================
// Trigger: multiborad
//===========================================================================
function multiboradact takes nothing returns nothing
local integer i=1
local multiboarditem mbi

    
set mbi=MultiboardGetItem(udg_BlackBoard,i+1,1)
call MultiboardSetItemValue(mbi,udg_YANSE[i+1]+GetPlayerName(Player(i))+"|r")
call MultiboardSetItemWidth(mbi,0.10)
call MultiboardReleaseItem(mbi)
set mbi=MultiboardGetItem(udg_BlackBoard,i+1,2)
call MultiboardSetItemValue(mbi,I2S(GetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD)))
call MultiboardSetItemWidth(mbi,0.04)
call MultiboardReleaseItem(mbi)
set mbi=MultiboardGetItem(udg_BlackBoard,i+1,6)
call MultiboardSetItemValue(mbi,"0")
call MultiboardSetItemWidth(mbi,0.03)
call MultiboardReleaseItem(mbi)
set mbi=MultiboardGetItem(udg_BlackBoard,i+1,7)
call MultiboardSetItemWidth(mbi,0.01)
call MultiboardReleaseItem(mbi)
set mbi=MultiboardGetItem(udg_BlackBoard,i+1,0)
call MultiboardSetItemStyle( mbi, false, true )
call MultiboardReleaseItem(mbi)
set mbi=MultiboardGetItem(udg_BlackBoard,i+1,8)
call MultiboardSetItemWidth(mbi,0.02)
call MultiboardReleaseItem(mbi)
set mbi=MultiboardGetItem(udg_BlackBoard,i+1,10)
call MultiboardSetItemWidth(mbi,0.01)
call MultiboardReleaseItem(mbi)
set mbi=MultiboardGetItem(udg_BlackBoard,i+1,9)
call MultiboardSetItemWidth(mbi,0.01)
call MultiboardReleaseItem(mbi)
set mbi=MultiboardGetItem(udg_BlackBoard,i+1,11)
call MultiboardSetItemWidth(mbi,0.01)
call MultiboardReleaseItem(mbi)


call DestroyTrigger(gg_trg_multiborad)

set mbi=null
endfunction

//===========================================================================
function InitTrig_multiborad takes nothing returns nothing
    set gg_trg_multiborad = CreateTrigger(  )
endfunction
