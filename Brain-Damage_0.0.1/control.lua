script.on_event(defines.events.on_tick, function(event)
    -- number of minutes is settings.startup["Brain-Damage-interval"].value
	if event.tick % 60*60*settings.startup["Brain-Damage-interval"].value  == 0 then
        -- find all researched technologies
        local researched_technologies = {}
        for technology_name, technology in pairs(game.players[1].force.technologies) do
            if technology.researched then
                table.insert(researched_technologies, technology_name)
            end
        end

        -- randomly select one
        local index = math.random(1, #researched_technologies)
		game.players[1].force.technologies[researched_technologies[index]].researched = false

        -- print what was forgotten
        game.players[1].print("You have forgotten " .. researched_technologies[index])
	end
end)