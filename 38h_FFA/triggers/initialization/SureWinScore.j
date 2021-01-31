
//===========================================================================
// Trigger: SureWinScore
//===========================================================================

function Trig_SureWinScore_Actions takes nothing returns nothing
local integer i=S2I(SubStringBJ(GetEventPlayerChatString(), 5, 8))
if i<20 or i>600 then
call DisplayTextToPlayer( Player(0), 0, 0, "|cffff0303输入的数字过大或过小，请重新输入|r" )
else
call DisplayTimedTextToForce( udg_OnlinePlayer, 30, "本场比赛获得胜利所需的得分为|cffff0303"+I2S(i)+"|r，游戏正式开始!")
set udg_WinScore=i
call DestroyTrigger( GetTriggeringTrigger() )
endif
endfunction

//===========================================================================
function InitTrig_SureWinScore takes nothing returns nothing
    set gg_trg_SureWinScore = CreateTrigger(  )
    
    call TriggerAddAction( gg_trg_SureWinScore, function Trig_SureWinScore_Actions )
endfunction
