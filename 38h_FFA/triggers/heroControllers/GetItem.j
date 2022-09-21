
//===========================================================================
// Trigger: GetItem
//
// and GetItemPlayer(t)!=p then
//     call SetItemPlayer(t,p,false)
//     call DisplayTextToPlayer( Player(0), 0, 0, GetPlayerName(GetItemPlayer(t)) )
// else
//     call UnitRemoveItem(u,t)
//     call DisplayTextToPlayer( Player(0), 0, 0, GetPlayerName(GetItemPlayer(t)) )
//     set u=null
//     set t=null
//     set p=null
//     return false
// endif
//     set u=null
//     set t=null
//     set p=null
// if i=='ram3' then//不朽5
//     call dropbx(u,t)
//     else
//===========================================================================
function changeiceeye takes unit u,item t returns nothing
if IsUnitType(u, UNIT_TYPE_RANGED_ATTACKER) == true then
call RemoveItem(t)
call UnitAddItemById( u,'rump')
else
call RemoveItem(t)
call UnitAddItemById( u,'I01A')
endif
endfunction
 
function dropxwshoe takes unit u,item t returns nothing
if ciwh(u,'tmmt')>=2 or ciwh(u,'I01D')>=1 then
call UnitRemoveItem(u,t)
endif
endfunction

function droparm takes unit u ,item t returns nothing
if ciwh(u,'frhg')>=2 or ciwh(u,'gvsm')>=1 then
call UnitRemoveItem(u,t)
endif
endfunction

function DieJia takes unit u ,item t returns nothing
local integer i=0
local integer n=GetItemTypeId(t)
local item e
loop
exitwhen i>=6 
set e=UnitItemInSlot(u, i)
if n==GetItemTypeId(e) and t!=e then
call SetItemCharges(e,GetItemCharges(t)+GetItemCharges(e))
call RemoveItem(t)
set i=6
endif
set i=i+1
endloop
set e=null
endfunction


function dropbx takes unit u,item t returns nothing
if ciwh(u,'ram3')>=2 then
call UnitRemoveItem(u,t)
endif
endfunction


function dropmb takes unit u,item t returns nothing
if ciwh(u,'wlsd')>=2 then
call UnitRemoveItem(u,t)
endif
endfunction


function dropsgc takes unit u,item t returns nothing
if ciwh(u,'sor3')>=2 then
call UnitRemoveItem(u,t)
endif
endfunction

function dropqiehuan takes unit u,item t returns nothing
if ciwh(u,'sor5') + ciwh(u,'I02Y')>=2 then
call UnitRemoveItem(u,t)
endif
endfunction

function droptiaodao takes unit u,item t returns nothing
if ciwh(u,'desc')>=2 or ciwh(u,'I03K')>=1 then
call UnitRemoveItem(u,t)
endif
endfunction 

function tiaodaoTimer takes unit u returns nothing
local integer i=GetHandleId(u)
if LoadInteger(udg_Hash2,i,9998)==9998 then
else
call TimerStart(LoadTimerHandle(udg_Hash2,i,9999),0.3,true,function removetiaodao)
call SaveInteger(udg_Hash2,i,9998,9998)
endif
endfunction 

function huifubyxuejing takes nothing returns nothing
local integer i=GetHandleId(GetExpiredTimer())
local unit u=LoadUnitHandle(udg_Hash4,i,1)
local integer h=GetHandleId(u)
local item t=LoadItemHandle(udg_Hash4,i,2)
local real r=GetUnitState(u, UNIT_STATE_LIFE)
local integer n=LoadInteger(udg_Hash4,h,333)//死了一次就储存一次，消了点数再消
local integer g=GetItemCharges(t)

if UnitHasItem(u, t) then
   if n==0 then
   call SetItemCharges( t, R2I(2*g/3) )
   call SaveInteger(udg_Hash4,h,333,1)
   endif
   call SetUnitState( u, UNIT_STATE_LIFE, r+1*g )
   call SetUnitState( u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MANA)+2*g )
else
call FlushChildHashtable( udg_Hash4, i )
call DestroyTimer(GetExpiredTimer())
endif

set u=null
set t=null
endfunction


function dedaoxuejing takes unit u,item t returns nothing
   local timer tm
   local integer n=0
   if ciwh(u,'ram2')>=2 then
   call UnitRemoveItem(u,t)
   else
   set tm=CreateTimer()
   call SetItemDropOnDeath( t, false )
   //call SetItemDroppable( t, false )
   set n=GetHandleId(tm)
   call SaveUnitHandle(udg_Hash4,n,1,u)
   call SaveItemHandle(udg_Hash4,n,2,t)
   call SaveInteger(udg_Hash4,GetHandleId(u),333,1)
   call TimerStart(tm,0.5,true,function huifubyxuejing)
   endif
set tm=null
endfunction


function sharenshudiao takes nothing returns nothing
local integer i=GetHandleId(GetExpiredTimer())
local unit u=LoadUnitHandle(udg_Hash4,i,1)
local integer h=GetHandleId(u)
local item t=LoadItemHandle(udg_Hash4,i,2)
local integer n=LoadInteger(udg_Hash4,h,444)//444是是否死了紫怨的boolean
local integer g=GetItemCharges(t)

if UnitHasItem(u, t) then
   call SaveInteger(udg_Hash4,GetHandleId(u),1112,g)//杀人数层数存储于此
   if n==0 then
   call SetItemCharges( t, R2I(2*g/3) )
   call SaveInteger(udg_Hash4,h,444,1)
   endif
else
call FlushChildHashtable( udg_Hash4, i )
call DestroyTimer(GetExpiredTimer())
endif

set u=null
set t=null
endfunction


function sharenshudd takes unit u,item t returns nothing//杀人书
   local timer tm
   local integer n=0
   if ciwh(u,'dtsb')>=2 then
   call UnitRemoveItem(u,t)
   else
   set tm=CreateTimer()
   call SetItemDropOnDeath( t, false )
   //call SetItemDroppable( t, false )
   set n=GetHandleId(tm)
   call SaveUnitHandle(udg_Hash4,n,1,u)
   call SaveItemHandle(udg_Hash4,n,2,t)
   call SaveInteger(udg_Hash4,GetHandleId(u),444,1)
   call TimerStart(tm,0.5,true,function sharenshudiao)
   endif
set tm=null
endfunction

function huangjinzhixinact takes nothing returns nothing
local integer i=GetHandleId(GetExpiredTimer())
local unit u=LoadUnitHandle(udg_Hash3,i,1)
local item t=LoadItemHandle(udg_Hash3,i,2)
local player p


if UnitHasItem(u, t) then
set p=GetOwningPlayer(u)
call SetPlayerState( p, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD)+20 )  
else
call FlushChildHashtable( udg_Hash3, i )
call DestroyTimer(GetExpiredTimer())
endif

set p=null
set u=null
set t=null
endfunction


function huangjinzhixin takes unit u,item t returns nothing//黄金之心
   local timer tm
   local integer n=0
   if ciwh(u,'rugt')>=2 then
   call UnitRemoveItem(u,t)
   else
   set tm=CreateTimer()
   call SetItemDropOnDeath( t, false )
   //call SetItemDroppable( t, false )
   set n=GetHandleId(tm)
   call SaveUnitHandle(udg_Hash3,n,1,u)
   call SaveItemHandle(udg_Hash3,n,2,t)
   //call SaveInteger(udg_Hash3,GetHandleId(u),444,1)
   call TimerStart(tm,10,true,function huangjinzhixinact)
   endif
set tm=null
endfunction

function kejiqiang takes unit u returns nothing//科技枪
local integer i=ciwh(u,'tmsc')
if i==1 then
call UnitAddAbility( u, 'A0DW' )
call UnitAddAbility( u, 'A0E8' )
else
call SetUnitAbilityLevel( u, 'A0DW', i )
call SetUnitAbilityLevel( u, 'A0E8', i )
endif
endfunction

function Trig_GetItem_Conditions takes nothing returns boolean
    local unit u=GetManipulatingUnit()
    local item t=GetManipulatedItem()
    local integer i=GetItemTypeId(t)
    local player p=GetOwningPlayer(u)
    call DisableTrigger( GetTriggeringTrigger() )
    if i=='I01A' or i=='rump' then//1冰眼1
    call changeiceeye(u,t)
    else
    if i=='tmmt' then//相位2
    call dropxwshoe(u,t)
    else
    if i=='frhg' then//臂章 3 
    call droparm(u,t)
    else
    if GetItemType(t) == ITEM_TYPE_PURCHASABLE then//叠加4
    call DieJia(u,t)
    else
    if i=='wlsd' then//魔棒6
    call dropmb(u,t)
    else
    if i=='sor3' then//碎骨锤7
    call dropsgc(u,t)
    else
    if i=='sor5' or i=='I02Y' then//震魂8
    call dropqiehuan(u,t)
    else 
    if i=='desc' then//跳刀9
    call droptiaodao(u,t)
    call tiaodaoTimer(u)
    else
    if i=='thdm' then//龙心10
        if ciwh(u,'thdm')==1 then
        call UnitAddAbility(u,'ACnr')
        endif
    else
    if i=='ram2' then//血精
    call dedaoxuejing(u,t)    
    else
    if i=='dtsb' then//杀人书
    call sharenshudd(u,t)    
    else
    if i=='ssil' then//国王宝剑
        if ciwh(u,'ssil')==1 then
        call UnitAddAbility(u,'A0DJ')
        call SetUnitAbilityLevel( u, 'A0DJ', GetItemCharges(t)+1 )
        else
        call UnitRemoveItem(u,t)
        endif
    else
    if i=='rugt' then//黄金之心
    call huangjinzhixin(u,t)
    else
    if i=='tmsc' then//科技枪
    call kejiqiang(u)
    else
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    endif
    call EnableTrigger( GetTriggeringTrigger() )
    set u=null
    set t=null
    set p=null
    return false
endfunction



//===========================================================================
function InitTrig_GetItem takes nothing returns nothing
    set gg_trg_GetItem = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_GetItem, Condition( function Trig_GetItem_Conditions ) )
endfunction
