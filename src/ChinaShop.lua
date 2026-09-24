SMODS.Challenge({
	key = "chinashop",
	rules = {
		custom = {
            { id = "fxtrt_chinashop5" },
            { id = "fxtrt_chinashop6" },
            { id = 'no_shop_jokers' },
			{ id = "fxtrt_chinashop1" },
            { id = "fxtrt_chinashop2" },
            { id = "fxtrt_chinashop3" },
            { id = "fxtrt_chinashop4" },
        },
		modifiers = {
            { id = 'joker_slots', value = 1 },
        }
    },
    restrictions = {
        banned_cards = {
            { id = 'c_judgement' },
            { id = 'c_wraith' },
            { id = 'c_soul' },
            { id = 'v_antimatter' },
            { id = 'p_buffoon_normal_1', ids = {
                'p_buffoon_normal_1', 'p_buffoon_normal_2', 'p_buffoon_jumbo_1', 'p_buffoon_mega_1',
            }
            },
        },
        banned_tags = {
            { id = 'tag_uncommon' },
            { id = 'tag_rare' },
            { id = 'tag_negative' },
            { id = 'tag_foil' },
            { id = 'tag_holographic' },
            { id = 'tag_polychrome' },
            { id = 'tag_buffoon' },
            { id = 'tag_top_up' },
        },
        banned_other = {
            { id = 'bl_final_heart', type = 'blind' },
            { id = 'bl_final_leaf',  type = 'blind' },
            { id = 'bl_final_acorn', type = 'blind' },
        }
	},
    jokers = {
    {
        id = "j_bull",
        eternal = "true"
    }
    },
	deck = {
		type = "Challenge Deck",
	},
    apply = function(self)
        G.GAME.starting_params.ante_scaling = 4
    end,
	calculate = function(self, context)
        local ret = {}
        if context.final_scoring_step then
            return {
                balance = true
            }
        end
	end
})