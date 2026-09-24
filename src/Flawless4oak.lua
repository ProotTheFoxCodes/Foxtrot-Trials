SMODS.Challenge({
	key = "flawless4oak",
	rules = {
		custom = {
			{ id = "fxtrt_4oak1" },
			{ id = "fxtrt_4oak2" },
			{ id = "fxtrt_4oak3" },
			{ id = "fxtrt_4oak4" },
			{ id = "fxtrt_4oak5" },
			{ id = "fxtrt_4oak6" },
			{ id = "fxtrt_4oak7" },
			{ id = "fxtrt_4oak8" },
		},
		modifiers = {
            { id = 'hands',  value = 2 },
			{ id = "discards", value = 1 },
			{ id = "hand_size", value = 12 }
        }
	},
	--[[
    jokers = {},
	restrictions = {
		banned_cards = {
			--{ id = " "},
            },

		},
		banned_tags = {
			--{ id = " },
		}
	},
	]]
	deck = {
		type = "Challenge Deck",
	},

	apply = function(self)
		G.GAME.win_ante = 1.8e308
	end,

	calculate = function(self, context)
		if context.before then
			local aces = 0
			if #G.play.cards >= 4 then
				for i=1, #G.play.cards do
					if G.play.cards[i]:get_id() == 14 then
						aces = aces + 1
					end
				end
				if aces == 4 then
					win_game()
					G.GAME.won = true
				end
			end
		end
	end
})