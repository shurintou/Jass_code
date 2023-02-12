
//===========================================================================
// Trigger: DirtyPower
//
// 任意单位释放技能
//===========================================================================
function Trig_DirtyPower_Conditions takes nothing returns boolean
    local integer i=GetSpellAbilityId()
    return i != 'ANba' and i!='AEim' and i!='A01J' and i!='ANfa'
endfunction

function Trig_DirtyPower_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit m=GetSpellTargetUnit()
local player p=GetOwningPlayer(m)
local integer level=GetUnitAbilityLevel(m,'AUau')

if IsUnitEnemy(m, GetTriggerPlayer())==true and level>0 then
set m=CreateUnit(p,'n001',0,0,0)
call UnitAddAbility( m, 'Aprg' )
call SetUnitAbilityLevel( m, 'Aprg', level )
call UnitApplyTimedLife( m, 'BTLF', 5 )
call IssueTargetOrderById( m, 852111, u )
call UnitDamageTarget( CreateUnit(GetOwningPlayer(m),'n00T',0,0,0), u, 20+20*level, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
endif

set u=null
set m=null
set p=null
endfunction

//===========================================================================
function InitTrig_DirtyPower takes nothing returns nothing
    set gg_trg_DirtyPower = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_DirtyPower, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_DirtyPower, Condition( function Trig_DirtyPower_Conditions ) )
    call TriggerAddAction( gg_trg_DirtyPower, function Trig_DirtyPower_Actions )
endfunction
