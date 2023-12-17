
//===========================================================================
// Trigger: herolevelup
//===========================================================================
function maintainitem takes unit u,integer i,integer level returns nothing
    local item it=UnitItemInSlot(u, 0)
    local integer g=0
    local integer e=GetUnitPointValue(u)
    local integer ui=GetUnitTypeId(u)
    if it!=null and GetItemUserData(it)==100 and level<23 then
        if GetItemTypeId(it)!='I000' then
            call UnitDropItemSlot(u, it, i )
        endif
    else
        set it=UnitItemInSlot(u, i)
        if it==null then
            if e==50 or e==60 then
                if GetRandomInt(1,10)>udg_ItemRandomNum then
                    set it = CreateItem('nspi', 0, 0)
                    call BJDebugMsg(  GetUnitName(u) + GetItemName(it)  )
                else
                    set it = CreateItem(udg_Item[returnonenumberoftwo(62,61)], 0, 0)
                endif
            elseif e==51 or e==61 then
                if GetRandomInt(1,10)>udg_ItemRandomNum then
                    set it = CreateItem('asbl', 0, 0)
                    call BJDebugMsg(  GetUnitName(u) + GetItemName(it)  )
                else
                    if ui=='Oshd' or ui=='Orkn' or ui=='E003'or ui=='N00A' then
                        set it = CreateItem(udg_Item[returnonenumberoftwo(52,54)], 0, 0)
                    else
                        set it = CreateItem(udg_Item[returnonenumberoftwo(41,72)], 0, 0)
                    endif
                endif
            else
                if GetRandomInt(1,10)>udg_ItemRandomNum then
                    set it = CreateItem('gsou', 0, 0)
                    call BJDebugMsg(  GetUnitName(u) + GetItemName(it)  )
                else
                    set it = CreateItem(udg_Item[returnonenumberoftwo(52,54)], 0, 0)
                endif
            endif
            call UnitAddItem( u, it )
            call SetItemUserData(it, 100 )
            call UnitDropItemSlot(u, it, i )
        else
            set g=GetItemUserData(it)
            if g!=100 then
                call RemoveItem(it)
                if e==50 or e==60 then
                    if GetRandomInt(1,10)>udg_ItemRandomNum then
                        set it = CreateItem('nspi', 0, 0)
                        call BJDebugMsg(  GetUnitName(u) + GetItemName(it)  )
                    else
                        set it = CreateItem(udg_Item[returnonenumberoftwo(62,61)], 0, 0)
                    endif
                elseif e==51 or e==61 then
                    if GetRandomInt(1,10)>udg_ItemRandomNum then
                        set it = CreateItem('asbl', 0, 0)
                        call BJDebugMsg(  GetUnitName(u) + GetItemName(it)  )
                    else
                        if ui=='Oshd' or ui=='Orkn' or ui=='E003'or ui=='N00A' then
                            set it = CreateItem(udg_Item[returnonenumberoftwo(52,54)], 0, 0)
                        else
                            set it = CreateItem(udg_Item[returnonenumberoftwo(41,72)], 0, 0)
                        endif
                    endif
                else
                    if GetRandomInt(1,10)>udg_ItemRandomNum then
                        set it = CreateItem('gsou', 0, 0)
                        call BJDebugMsg(  GetUnitName(u) + GetItemName(it)  )
                    else
                        set it = CreateItem(udg_Item[returnonenumberoftwo(52,54)], 0, 0)
                    endif
                endif
                call UnitAddItem( u, it )
                call SetItemUserData(it, 100 )
                call UnitDropItemSlot(u, it, i )
            endif
        endif
    endif
    set it=null
endfunction

function changeitem takes unit u,integer i returns nothing
    local item it=UnitItemInSlot(u, i)
    local integer g= GetItemUserData(it)
    local player p
    
    if i==0 then
        call RemoveItem(it)
        set it = CreateItem('I000', 0, 0)
        call UnitAddItem( u, it )
        call SetItemUserData(it, 100 )
        call UnitDropItemSlot(u, it, i )
        set it=null
        set p=null
        return
    endif
    
    call RemoveItem(it)
    set it = CreateItem(udg_Item[g], 0, 0)
    call UnitAddItem( u, it )
    call SetItemUserData(it, 100 )
    call UnitDropItemSlot(u, it, i )
    
    
    set p=GetOwningPlayer(u)
    if udg_Item[g] == 'rat9' then
        set g=GetUnitTypeId(u)
        if g=='Hamg' or g=='Ofar' or g=='Ulic' or g=='Ekee' then
            call SetPlayerTechResearched(p, 'R00F', 1)
        elseif g=='Hblm' or g=='Oshd' or g=='Emoo' then
            call SetPlayerTechResearched(p, 'R00E', 1)
        else
            call SetPlayerTechResearched(p, 'R000', 1)
        endif
        
    elseif udg_Item[g] == 'I00I' then
        set g=GetUnitTypeId(u)
        if g=='Hamg' or g=='Ofar' or g=='Ulic' or g=='Ekee' then
            call SetPlayerTechResearched(p, 'R00F', 2)
        elseif g=='Hblm' or g=='Oshd' or g=='Emoo' then
            call SetPlayerTechResearched(p, 'R00E', 2)
        else
            call SetPlayerTechResearched(p, 'R000', 2)
        endif
        
        
    elseif udg_Item[g]== 'rde4' then
        set g=GetUnitTypeId(u)
        if g=='Udea' or g=='Otch' or g=='Hpal' then
            call SetPlayerTechResearched(p, 'R001', 1)
        elseif g=='Hmkg' or g=='Udre' then
            call SetPlayerTechResearched(p, 'R002', 1)
        elseif g=='Ucrl' then
            call SetPlayerTechResearched(p, 'R003', 1)
        else
            call SetPlayerTechResearched(p, 'R004', 1)
        endif
        
    endif
    
    set p=null
    set it=null
endfunction


function Trig_herolevelup_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer l=GetHeroLevel(u)
    local integer h=R2I(l/10)+1
    local integer i
    local integer g=GetUnitPointValue(u)
    local integer n=h*2
    local race r
    local player p=GetTriggerPlayer()
    
    if l>10 then
        call ModifyHeroSkillPoints( u, bj_MODIFYMETHOD_SET, 0 )
        if l==18 and g>59 then
            set r=GetUnitRace(u)
            set i=GetUnitTypeId(u)
            if r==RACE_HUMAN then
                if i=='Hpal' then
                    call SetUnitAbilityLevel(u,'AHhb',2)
                    call SetUnitAbilityLevel(u,'AHds',2)
                    call SetUnitAbilityLevel(u,'AHad',2)
                elseif i=='Hamg' then
                    call SetUnitAbilityLevel(u,'AHbz',2)
                    call SetUnitAbilityLevel(u,'AHab',2)
                    call SetUnitAbilityLevel(u,'AHwe',2)
                elseif i=='Hmkg' then
                    call SetUnitAbilityLevel(u,'AHtc',2)
                    call SetUnitAbilityLevel(u,'AHtb',2)
                    call SetUnitAbilityLevel(u,'AHbh',2)
                else
                    call SetUnitAbilityLevel(u,'AHfs',2)
                    call SetUnitAbilityLevel(u,'AHbn',2)
                    call SetUnitAbilityLevel(u,'AHdr',2)
                endif
            elseif r==RACE_ORC then
                if i=='Obla' then
                    call SetUnitAbilityLevel(u,'AOwk',2)
                    call SetUnitAbilityLevel(u,'AOcr',2)
                    call SetUnitAbilityLevel(u,'AOmi',2)
                elseif i=='Ofar' then
                    call SetUnitAbilityLevel(u,'AOfs',2)
                    call SetUnitAbilityLevel(u,'AOsf',2)
                    call SetUnitAbilityLevel(u,'AOcl',2)
                elseif i=='Otch' then
                    call SetUnitAbilityLevel(u,'AOsh',2)
                    call SetUnitAbilityLevel(u,'AOae',2)
                    call SetUnitAbilityLevel(u,'AOws',2)
                else
                    call SetUnitAbilityLevel(u,'AOhw',2)
                    call SetUnitAbilityLevel(u,'AOhx',2)
                    call SetUnitAbilityLevel(u,'AOsw',2)
                endif
            elseif r==RACE_UNDEAD then
                if i=='Udea' then
                    call SetUnitAbilityLevel(u,'AUdc',2)
                    call SetUnitAbilityLevel(u,'AUdp',2)
                    call SetUnitAbilityLevel(u,'AUau',2)
                elseif i=='Ulic' then
                    call SetUnitAbilityLevel(u,'AUfn',2)
                    call SetUnitAbilityLevel(u,'AUfu',2)
                    call SetUnitAbilityLevel(u,'AUdr',2)
                elseif i=='Udre' then
                    call SetUnitAbilityLevel(u,'AUav',2)
                    call SetUnitAbilityLevel(u,'AUsl',2)
                    call SetUnitAbilityLevel(u,'AUcs',2)
                else
                    call SetUnitAbilityLevel(u,'AUim',2)
                    call SetUnitAbilityLevel(u,'AUts',2)
                    call SetUnitAbilityLevel(u,'AUcb',2)
                endif
            else
                if i=='Ekee' then
                    call SetUnitAbilityLevel(u,'AEer',2)
                    call SetUnitAbilityLevel(u,'AEfn',2)
                    call SetUnitAbilityLevel(u,'AEah',2)
                elseif i=='Emoo' then
                    call SetUnitAbilityLevel(u,'AHfa',2)
                    call SetUnitAbilityLevel(u,'AEst',2)
                    call SetUnitAbilityLevel(u,'AEar',2)
                elseif i=='Ewar' then
                    call SetUnitAbilityLevel(u,'AEbl',2)
                    call SetUnitAbilityLevel(u,'AEfk',2)
                    call SetUnitAbilityLevel(u,'AEsh',2)
                else
                    call SetUnitAbilityLevel(u,'AEmb',2)
                    call SetUnitAbilityLevel(u,'AEim',2)
                    call SetUnitAbilityLevel(u,'AEev',2)
                endif
            endif
        elseif l==22 and g>59  then
            set r=GetUnitRace(u)
            set i=GetUnitTypeId(u)
            if r==RACE_HUMAN then
                if i=='Hpal' then
                    call SetUnitAbilityLevel(u,'AHhb',3)
                    call SetUnitAbilityLevel(u,'AHds',3)
                    call SetUnitAbilityLevel(u,'AHad',3)
                elseif i=='Hamg' then
                    call SetUnitAbilityLevel(u,'AHbz',3)
                    call SetUnitAbilityLevel(u,'AHab',3)
                    call SetUnitAbilityLevel(u,'AHwe',3)
                elseif i=='Hmkg' then
                    call SetUnitAbilityLevel(u,'AHtc',3)
                    call SetUnitAbilityLevel(u,'AHtb',3)
                    call SetUnitAbilityLevel(u,'AHbh',3)
                else
                    call SetUnitAbilityLevel(u,'AHfs',3)
                    call SetUnitAbilityLevel(u,'AHbn',3)
                    call SetUnitAbilityLevel(u,'AHdr',3)
                endif
            elseif r==RACE_ORC then
                if i=='Obla' then
                    call SetUnitAbilityLevel(u,'AOwk',3)
                    call SetUnitAbilityLevel(u,'AOcr',3)
                    call SetUnitAbilityLevel(u,'AOmi',3)
                elseif i=='Ofar' then
                    call SetUnitAbilityLevel(u,'AOfs',3)
                    call SetUnitAbilityLevel(u,'AOsf',3)
                    call SetUnitAbilityLevel(u,'AOcl',3)
                elseif i=='Otch' then
                    call SetUnitAbilityLevel(u,'AOsh',3)
                    call SetUnitAbilityLevel(u,'AOae',3)
                    call SetUnitAbilityLevel(u,'AOws',3)
                else
                    call SetUnitAbilityLevel(u,'AOhw',3)
                    call SetUnitAbilityLevel(u,'AOhx',3)
                    call SetUnitAbilityLevel(u,'AOsw',3)
                endif
            elseif r==RACE_UNDEAD then
                if i=='Udea' then
                    call SetUnitAbilityLevel(u,'AUdc',3)
                    call SetUnitAbilityLevel(u,'AUdp',3)
                    call SetUnitAbilityLevel(u,'AUau',3)
                elseif i=='Ulic' then
                    call SetUnitAbilityLevel(u,'AUfn',3)
                    call SetUnitAbilityLevel(u,'AUfu',3)
                    call SetUnitAbilityLevel(u,'AUdr',3)
                elseif i=='Udre' then
                    call SetUnitAbilityLevel(u,'AUav',3)
                    call SetUnitAbilityLevel(u,'AUsl',3)
                    call SetUnitAbilityLevel(u,'AUcs',3)
                else
                    call SetUnitAbilityLevel(u,'AUim',3)
                    call SetUnitAbilityLevel(u,'AUts',3)
                    call SetUnitAbilityLevel(u,'AUcb',3)
                endif
            else
                if i=='Ekee' then
                    call SetUnitAbilityLevel(u,'AEer',3)
                    call SetUnitAbilityLevel(u,'AEfn',3)
                    call SetUnitAbilityLevel(u,'AEah',3)
                elseif i=='Emoo' then
                    call SetUnitAbilityLevel(u,'AHfa',3)
                    call SetUnitAbilityLevel(u,'AEst',3)
                    call SetUnitAbilityLevel(u,'AEar',3)
                elseif i=='Ewar' then
                    call SetUnitAbilityLevel(u,'AEbl',3)
                    call SetUnitAbilityLevel(u,'AEfk',3)
                    call SetUnitAbilityLevel(u,'AEsh',3)
                else
                    call SetUnitAbilityLevel(u,'AEmb',3)
                    call SetUnitAbilityLevel(u,'AEim',3)
                    call SetUnitAbilityLevel(u,'AEev',3)
                endif
            endif
        elseif l==20 and g>59  then
            set r=GetUnitRace(u)
            set i=GetUnitTypeId(u)
            if r==RACE_HUMAN then
                if i=='Hpal' then
                    call SetUnitAbilityLevel(u,'AHre',2)
                elseif i=='Hamg' then
                    call SetUnitAbilityLevel(u,'AHmt',2)
                elseif i=='Hmkg' then
                    call SetUnitAbilityLevel(u,'AHav',2)
                else
                    call SetUnitAbilityLevel(u,'AHpx',2)
                    call SetPlayerTechResearched(Player(0), 'R009', 1)
                    call SetPlayerTechResearched(p, 'R009', 1)
                endif
            elseif r==RACE_ORC then
                if i=='Obla' then
                    call SetUnitAbilityLevel(u,'AOww',2)
                elseif i=='Ofar' then
                    call SetUnitAbilityLevel(u,'AOeq',2)
                elseif i=='Otch' then
                    call SetUnitAbilityLevel(u,'AOre',2)
                else
                    call SetUnitAbilityLevel(u,'AOvd',2)
                endif
            elseif r==RACE_UNDEAD then
                if i=='Udea' then
                    call SetUnitAbilityLevel(u,'AUan',2)
                elseif i=='Ulic' then
                    call SetUnitAbilityLevel(u,'AUdd',2)
                elseif i=='Udre' then
                    call SetUnitAbilityLevel(u,'AUin',2)
                else
                    call SetUnitAbilityLevel(u,'AUls',2)
                endif
            else
                if i=='Ekee' then
                    call SetUnitAbilityLevel(u,'AEtq',2)
                elseif i=='Emoo' then
                    call SetUnitAbilityLevel(u,'AEsf',2)
                elseif i=='Ewar' then
                    call SetUnitAbilityLevel(u,'AEsv',2)
                    call SetPlayerTechResearched(Player(0), 'R00A', 1)
                    call SetPlayerTechResearched(p, 'R00A', 1)
                else
                    call SetUnitAbilityLevel(u,'AEme',2)
                endif
            endif
        elseif l==24 and g>59  then
            set r=GetUnitRace(u)
            set i=GetUnitTypeId(u)
            if r==RACE_HUMAN then
                if i=='Hpal' then
                    call SetUnitAbilityLevel(u,'AHre',3)
                elseif i=='Hamg' then
                    call SetUnitAbilityLevel(u,'AHmt',3)
                elseif i=='Hmkg' then
                    call SetUnitAbilityLevel(u,'AHav',3)
                else
                    call SetUnitAbilityLevel(u,'AHpx',3)
                    call SetPlayerTechResearched(Player(0), 'R009', 2)
                    call SetPlayerTechResearched(p, 'R009', 2)
                endif
            elseif r==RACE_ORC then
                if i=='Obla' then
                    call SetUnitAbilityLevel(u,'AOww',3)
                elseif i=='Ofar' then
                    call SetUnitAbilityLevel(u,'AOeq',3)
                elseif i=='Otch' then
                    call SetUnitAbilityLevel(u,'AOre',3)
                else
                    call SetUnitAbilityLevel(u,'AOvd',3)
                endif
            elseif r==RACE_UNDEAD then
                if i=='Udea' then
                    call SetUnitAbilityLevel(u,'AUan',3)
                elseif i=='Ulic' then
                    call SetUnitAbilityLevel(u,'AUdd',3)
                elseif i=='Udre' then
                    call SetUnitAbilityLevel(u,'AUin',3)
                else
                    call SetUnitAbilityLevel(u,'AUls',3)
                endif
            else
                if i=='Ekee' then
                    call SetUnitAbilityLevel(u,'AEtq',3)
                elseif i=='Emoo' then
                    call SetUnitAbilityLevel(u,'AEsf',3)
                elseif i=='Ewar' then
                    call SetUnitAbilityLevel(u,'AEsv',3)
                    call SetPlayerTechResearched(Player(0), 'R00A', 2)
                    call SetPlayerTechResearched(p, 'R00A', 2)
                else
                    call SetUnitAbilityLevel(u,'AEme',3)
                endif
            endif
        endif
    endif
    
    if g==50 or g==60 then
        set i=GetRandomInt(h-1,R2I(Pow(2, h-1)))
        call SetHeroStr( u, ( GetHeroStr(u, false) +i+1 ), true )
        set n=n-i
        if n>h then
            set i=GetRandomInt(0,h)
        else
            set i=GetRandomInt(0,n)
        endif
        call SetHeroAgi( u, ( GetHeroAgi(u, false) + i ), true )
        set n=n-i
        call SetHeroInt( u, ( GetHeroInt(u, false) + n ), true )
        
    elseif g==51 or g==61 then
        set i=GetRandomInt(0,R2I(Pow(2, h-1)))
        call SetHeroAgi( u, ( GetHeroAgi(u, false) + i+1 ), true )
        set n=n-i
        if n>h then
            set i=GetRandomInt(0,h)
        else
            set i=GetRandomInt(0,n)
        endif
        call SetHeroStr( u, ( GetHeroStr(u, false) +i ), true )
        set n=n-i
        call SetHeroInt( u, ( GetHeroInt(u, false) + n ), true )
        
    else
        set i=GetRandomInt(0,R2I(Pow(2, h-1)))
        call SetHeroInt( u, ( GetHeroInt(u, false) + i+1 ), true )
        set n=n-i
        if n>h then
            set i=GetRandomInt(0,h)
        else
            set i=GetRandomInt(0,n)
        endif
        call SetHeroStr( u, ( GetHeroStr(u, false) +i ), true )
        set n=n-i
        call SetHeroAgi( u, ( GetHeroAgi(u, false) + n ), true )
    endif
    
    if l<15 then
        set p=null
        set r=null
        set u=null
        return false
    elseif l==15 then
        call changeitem(u,5)
    elseif l>15 and l<19 then
        call maintainitem(u,5,l)
    elseif l==19  then
        call changeitem(u,4)
        call maintainitem(u,5,l)
    elseif l>19 and l<22 then
        call maintainitem(u,4,l)
    elseif l==22  then
        call changeitem(u,3)
    elseif l==23 then
        call changeitem(u,0)
        call maintainitem(u,3,l)
    elseif l==24  then
        call changeitem(u,2)
        call maintainitem(u,3,l)
    elseif l==25  then
        call changeitem(u,1)
        call maintainitem(u,2,l)
    elseif l>25 and l<28 then
        call maintainitem(u,1,l)
    endif
    
    set p=null
    set r=null
    set u=null
    return false
endfunction


//===========================================================================
function InitTrig_herolevelup takes nothing returns nothing
    set gg_trg_herolevelup = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_herolevelup, Condition( function Trig_herolevelup_Conditions ) )
endfunction
