--[[
Actors Have Feelings Too
]]
SMODS.Challenge({
	key = "ahf2",
	rules = {
		custom = {
			{ id = "fxtrt_ahf21" },
			{ id = "fxtrt_ahf22" },
			{ id = "fxtrt_ahf23" },
			{ id = "fxtrt_ahf24" },
			{ id = "fxtrt_ahf25" },
			{ id = "fxtrt_ahf26" },
			{ id = "fxtrt_ahf27" },
			{ id = "fxtrt_ahf28" },
			{ id = "fxtrt_ahf29" },
			{ id = "fxtrt_ahf210" },
			
		},
		modifiers = {
            { id = 'hands',  value = 5 },
			{ id = "discards", value = 4}
        }
	},
    jokers = {
		{
            id = "j_caino",
            eternal = "true"
        }
	},
	--[[
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


	calculate = function(self, context)
		ret = {}
		if context.remove_playing_cards then --and context.remove_playing_cards.scoring_hand then
			for i=1, #context.removed do
				if context.removed[i]:is_face() then
					local comedy_card = pseudorandom_element(G.playing_cards, "non faces", {
					in_pool = function(v)
						return not v:is_face() and not v.fxtrt_tragic
					end
					})
					comedy_card.fxtrt_tragic = true
					SMODS.destroy_cards(comedy_card)
				end
			end
			ret.message = localize("fxtrt_comedy")
			return ret
		end
	end
})

local discard_old = G.FUNCS.discard_cards_from_highlighted
function G.FUNCS.discard_cards_from_highlighted(e,hook)
	if G.GAME.fxtrt_from_canio or G.GAME.challenge ~= "c_fxtrt_ahf2" or G.GAME.current_round.hands_left <= 0 then
		discard_old(e,hook)
		G.GAME.fxtrt_from_canio = nil
	else
		if SMODS.pseudorandom_probability(nil, "canio discard", 1, 4) then
			G.FUNCS.play_cards_from_highlighted(nil)
			G.GAME.fxtrt_from_canio = true
		else
			discard_old(e,hook)
		end
	end
end

local play_old = G.FUNCS.play_cards_from_highlighted
function G.FUNCS.play_cards_from_highlighted(e)
	if G.GAME.fxtrt_from_canio or G.GAME.challenge ~= "c_fxtrt_ahf2" or G.GAME.current_round.discards_left <= 0 then
		play_old(e)
		G.GAME.fxtrt_from_canio = nil
	else
		if SMODS.pseudorandom_probability(nil, "canio play", 1, 4) then
---@diagnostic disable-next-line: redundant-parameter
			G.FUNCS.discard_cards_from_highlighted(e)
			G.GAME.fxtrt_from_canio = true
		else
			play_old(e)
		end
	end
end