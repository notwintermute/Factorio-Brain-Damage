-- function to forget a random technology and optionally its prereqs
function forget_random_technology(player, prereqs)
    -- find all researched technologies
    local researched_technologies = {}
    for technology_name, technology in pairs(player.force.technologies) do
        if technology.researched then
            table.insert(researched_technologies, technology_name)
        end
    end

    -- randomly select one to be forgotten
    local index = math.random(1, #researched_technologies)
    local selected_technology = player.force.technologies[researched_technologies[index]]

    -- unresearch it
    selected_technology.researched = false

    -- print what was forgotten
    player.print("You have forgotten " .. selected_technology.name)

    -- find and forget prereqs
    if prereqs then
        for technology_name, technology in pairs(selected_technology.prerequisites) do
            technology.researched = false
            player.print("You have also forgotten its prerequisite " .. technology_name)
        end
    end
end

script.on_event(defines.events.on_tick, function(event)
    -- number of minutes is settings.startup["Brain-Damage-interval"].value
	if settings.startup["Brain-Damage-forget-on-interval"].value then
        if event.tick % 60*60*settings.startup["Brain-Damage-interval"].value  == 0 then
            forget_random_technology(game.players[1], settings.startup["Brain-Damage-forget-prereqs"].value)
        end
	end
end)

script.on_event(defines.events.on_entity_damaged, function(event)
    if event.entity and event.entity.type == "character" then 
        if settings.startup["Brain-Damage-forget-on-damage"].value then 
            local roll = math.random(1, 1000)
            if roll/10 <= settings.startup["Brain-Damage-forget-on-damage-chance"].value then
                forget_random_technology(game.players[1], settings.startup["Brain-Damage-forget-prereqs"].value)
            end
        end
    end
end)