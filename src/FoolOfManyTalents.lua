SMODS.Challenge({
	key = "talents",
	rules = {
		custom = {
			{ id = "fxtrt_talents1" },
            { id = "fxtrt_talents2" },
			{ id = "fxtrt_talents3" },
			{ id = "fxtrt_talents4" },
			{ id = "fxtrt_talents5" },
			{ id = "fxtrt_talents6" },
			{ id = "fxtrt_talents7" },
			{ id = "fxtrt_talents8" },
			{ id = "fxtrt_talents9" },
			{ id = "fxtrt_talents10" },
		},
	},
    jokers = {
        {
            id = "j_triboulet",
            eternal = "true"
        }
    },
	restrictions = {
		banned_cards = {
			{ id = "v_magic_trick", ids = {
				"v_magic_trick", "v_illusion"
			}},
			{ id = "c_cryptid" },
			{ id = "c_death" },
            { id = "c_ouija" },
			{ id = "c_familiar"},
            { id = "j_certificate" },
            { id = "j_marble" },
			{ id = "j_mail" },
            { id = 'p_standard_normal_1', ids = {
                'p_standard_normal_1', 'p_standard_normal_2',
                'p_standard_normal_3', 'p_standard_normal_4',
                'p_standard_jumbo_1', 'p_standard_jumbo_2',
                'p_standard_mega_1', 'p_standard_mega_2' }
            },

		},
		banned_tags = {
			{ id = "tag_standard" },
		}
	},
	deck = {
		type = "Challenge Deck",
		cards = {
			{ s = "S", r = "7" },
			{ s = "S", r = "7" },
			{ s = "S", r = "7" },
			{ s = "S", r = "7" },
			{ s = "S", r = "7" },
			{ s = "S", r = "7" },
			{ s = "S", r = "7" },
			{ s = "S", r = "7" },
			{ s = "S", r = "7" },
			{ s = "S", r = "7" },
			{ s = "S", r = "7" },
			{ s = "S", r = "7" },
			{ s = "S", r = "7" },
			{ s = "H", r = "7" },
			{ s = "H", r = "7" },
			{ s = "H", r = "7" },
			{ s = "H", r = "7" },
			{ s = "H", r = "7" },
			{ s = "H", r = "7" },
			{ s = "H", r = "7" },
			{ s = "H", r = "7" },
			{ s = "H", r = "7" },
			{ s = "H", r = "7" },
			{ s = "H", r = "7" },
			{ s = "H", r = "7" },
			{ s = "H", r = "7" },
			{ s = "C", r = "7" },
			{ s = "C", r = "7" },
			{ s = "C", r = "7" },
			{ s = "C", r = "7" },
			{ s = "C", r = "7" },
			{ s = "C", r = "7" },
			{ s = "C", r = "7" },
			{ s = "C", r = "7" },
			{ s = "C", r = "7" },
			{ s = "C", r = "7" },
			{ s = "C", r = "7" },
			{ s = "C", r = "7" },
			{ s = "C", r = "7" },
			{ s = "D", r = "7" },
			{ s = "D", r = "7" },
			{ s = "D", r = "7" },
			{ s = "D", r = "7" },
			{ s = "D", r = "7" },
			{ s = "D", r = "7" },
			{ s = "D", r = "7" },
			{ s = "D", r = "7" },
			{ s = "D", r = "7" },
			{ s = "D", r = "7" },
			{ s = "D", r = "7" },
			{ s = "D", r = "7" },
			{ s = "D", r = "7" },
		}
	},
	calculate = function(self, context)
		if context.individual and context.cardarea == G.play and not context.end_of_round then
			ret = {}
			if SMODS.has_enhancement(context.other_card, "m_bonus") then
---@diagnostic disable-next-line: discard-returns
				SMODS.modify_rank(context.other_card, 1)
				ret.message = localize("fxtrt_rank_up")
				if pseudorandom("fun fact: polar bears have black skin, it's just hidden by the white fur", 0, 3) > 2 then
					context.other_card:set_ability("c_base")
					ret.extra = {message = localize("fxtrt_fool")}
				end
			end
			if context.other_card:get_id() ~= "King" and context.other_card:get_id() ~= "Queen" then
				if pseudorandom("shoutouts to gay foxgirls please draw yuri of them", 0, 1) > 0.5 then
					-- just looking back on my headmate's old code, can you also draw yuri of sylveon girls too? :3 /hj
					a = hand_chips * -0.3
					b = 0
				else
					a = 0
					b = mult * -0.3
				end
				ret.chips = a
				ret.mult = b
				--[[
					table.insert(ret, "chips = a")
					table.insert(ret, "xmult = b")
					table.insert(ret, "remove_default_message = true")
				]]
			end
			--print(ret)
			return ret
		end
	end
})