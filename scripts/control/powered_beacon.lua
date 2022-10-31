local model = {}

function model.update_fluid_storages()
    if not global.ei.fluid_entity then
        return
    end

    if not global.ei.copper_beacon then
        return
    end

    if not global.ei.copper_beacon.fluid_script_break_point and next(global.ei.fluid_entity) then
        global.ei.copper_beacon.fluid_script_break_point,_ = next(global.ei.fluid_entity)
    end

    local i = global.ei.copper_beacon.fluid_script_break_point

    -- for hot coolant let pipe explode, liquid-nitrogen turns into nitrogen-gas
    if global.ei.fluid_entity[i] and global.ei.fluid_entity[i].valid then
        local nitrogen_count = global.ei.fluid_entity[i].get_fluid_count("ei_liquid-nitrogen")
        if nitrogen_count > 0 then
            -- clear liquid-nitrogen from pipe and add nitrogen-gas to pipe with same amount
            global.ei.fluid_entity[i].remove_fluid({name = "ei_liquid-nitrogen", amount = nitrogen_count})
            global.ei.fluid_entity[i].insert_fluid({name = "ei_nitrogen-gas", amount = nitrogen_count})

            -- global.ei.fluid_entity[i].die(global.ei.fluid_entity[i].force)
        end
    end

    if next(global.ei.fluid_entity, i) then
        global.ei.copper_beacon.fluid_script_break_point,_ = next(global.ei.fluid_entity, i)
    else 
        global.ei.copper_beacon.fluid_script_break_point,_ = next(global.ei.fluid_entity)
    end

end

function model.update()
    if not global.ei.copper_beacon.master then
        return
    end
    
    if not global.ei.copper_beacon.script_break_point and next(global.ei.copper_beacon.master) then
        global.ei.copper_beacon.script_break_point,_ = next(global.ei.copper_beacon.master)
    end

    local i = global.ei.copper_beacon.script_break_point

    if global.ei.copper_beacon.master[i] then
        if global.ei.copper_beacon.master[i].entity then
            local id = global.ei.copper_beacon.master[i].slaves.slave_assembler

            update_beacon(global.ei.copper_beacon.slave[id].entity, global.ei.copper_beacon.master[i].entity)
        end
    end 

    if next(global.ei.copper_beacon.master, i) then
        global.ei.copper_beacon.script_break_point,_ = next(global.ei.copper_beacon.master, i)
    else 
        global.ei.copper_beacon.script_break_point,_ = next(global.ei.copper_beacon.master)
    end

end

--next usage
--[[
foo = {}
foo[1] = "a"
foo[2] = "b"
foo[3] = "c"
foo[4] = "d"
foo[5] = "e"
foo[6] = "f"

function update(foo, i, l)
    local k = i
    for m=1,l do
        print(foo[k])
        k,_ = next(foo, k)
        if k == nil then k,_ = next(foo) end
    end

    return k
end

print(update(foo,next(foo) ,12))
--]]


function update_beacon(slave_entity, master_entity)
    --game.print(slave_entity.energy)
    if slave_entity.energy > 0 then
        --global.ei.copper_beacon.master[master_entity.unit_number].state = false
        master_entity.active = true
        --game.print("on")
    else
        --global.ei.copper_beacon.master[master_entity.unit_number].state = true
        master_entity.active = false
        --game.print("off")
    end
end


return model