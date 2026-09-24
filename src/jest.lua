SMODS.Challenge({
	key = "jest",
	rules = {
		custom = {
			{ id = "fxtrt_jest1" },
			{ id = "fxtrt_jest2" },
			{ id = "fxtrt_jest3" },
			{ id = "fxtrt_jest4" },
			
        },
		modifiers = {
            { id = 'dollars',  value = 14 },
        }
	},
    jokers = {
    {
        id = "j_yorick", 
        eternal = "true"
    },
    },
	restrictions = {
		banned_cards = {
			{ id = "j_invisible"},
			{ id = "c_soul"},
			{ id = "c_ankh" },
        },
		banned_other = {
			{ id = "bl_water", type = "blind" }
		}
	},
	deck = {
		type = "Challenge Deck",
	},
    apply = function(self)
		G.E_MANAGER:add_event(Event({
			trigger = "immediate",
			blocking = false,
			func = function() 
				add_tag(Tag("tag_double", false, 'Small'))
				return true 
			end
		}))
    end,
	calculate = function(self, context)
        local ret = {}
		if context.setting_blind and G.GAME.round_resets.ante == 8 and G.GAME.blind.config.blind.boss.showdown then
            local rickastley = SMODS.find_card("j_yorick")[1]
			local rickmult = rickastley.ability.x_mult
			if rickmult > 19 then
				win_game()
				G.GAME.won = true
			else
				-- if statement not needed here because we know its being run in a challenge
				G.STATE = G.STATES.GAME_OVER
				G.FILE_HANDLER.force = true
				G.STATE_COMPLETE = false
			end
        end
	end
})

