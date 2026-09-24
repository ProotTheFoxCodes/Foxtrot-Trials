--[[
Nepotism?

- Can have an unlimited amount of debt
- Money can't go above $0
- Every dollar of debt reduces starting score by 5% of blind requirements
- 5 rerolls per shop
]]
SMODS.Challenge({
	key = "nepo",
	rules = {
		custom = {
			{ id = "fxtrt_nepo1" },
			{ id = "fxtrt_nepo2" },
			{ id = "fxtrt_nepo3" },
			{ id = "fxtrt_nepo4" },
			{ id = "fxtrt_nepo5" },
		},
		modifiers = {
            { id = 'dollars',  value = 0 },
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
	-]]
	deck = {
		type = "Challenge Deck",
	},
	apply = function(self)
		G.GAME.bankrupt_at = -1.7e308
	end,
	calculate = function(self, context)
		if context.setting_blind then
			G.GAME.chips = G.GAME.dollars * (G.GAME.blind.chips * 0.025)
		end
	end
})

old_shop_reroll = G.FUNCS.reroll_shop
function G.FUNCS.reroll_shop(e)
	G.GAME.fxtrt_round_rerolls = (G.GAME.fxtrt_round_rerolls or 0) + 1
	if G.GAME.challenge == "c_fxtrt_nepo" then
		if G.GAME.fxtrt_round_rerolls < 6 then
			old_shop_reroll(e)
		end
	else
		old_shop_reroll(e)
	end
	return (ret or 0)
end