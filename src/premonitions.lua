SMODS.Challenge({
	key = "6s",
	rules = {
		custom = {
			{ id = "fxtrt_6s1" },
			{ id = "fxtrt_6s2" },
			{ id = "fxtrt_6s3" },
			{ id = "fxtrt_6s4" },
			
        },
		modifiers = {
            --{ id = 'dollars',  value = 14 },
        }
	},
    jokers = {
    {
        id = "j_sixth_sense", 
		eternal = true,
    },
	{
		id = "j_ice_cream"
	}
    },
	restrictions = {
		banned_cards = {
			{ id = "c_strength" },	
			{ id = "c_tower" },	
			{ id = "c_familiar" },
			{ id = "c_grim" },
			{ id = "c_incantation" },
			{ id = "c_ouija" },
			{ id = "v_magic_trick" },
			{ id = "j_marble" },
			{ id = "j_certificate" },
			{ id = 'p_standard_normal_1', ids = {
                'p_standard_normal_1', 'p_standard_normal_2',
                'p_standard_normal_3', 'p_standard_normal_4',
                'p_standard_jumbo_1', 'p_standard_jumbo_2',
                'p_standard_mega_1', 'p_standard_mega_2' }
            },
			
--[[
			{ id = "j_"},
            { id = "c_" },
            { id = "v_"},
]]
        },
		banned_tags = {
			{ id = "tag_standard" },
		},
		banned_other = {
			{ id = "bl_psychic", type = "blind" }
		}
	},
	deck = {
		type = "Challenge Deck",
		cards = {
			{ s = "S", r = "6" },
			{ s = "S", r = "6" },
			{ s = "S", r = "6" },
			{ s = "S", r = "6" },
			{ s = "S", r = "6" },
			{ s = "S", r = "6" },
			{ s = "S", r = "6" },
			{ s = "S", r = "6" },
			{ s = "S", r = "6" },
			{ s = "S", r = "6" },
			{ s = "S", r = "6" },
			{ s = "S", r = "6" },
			{ s = "S", r = "6" },
			{ s = "H", r = "6" },
			{ s = "H", r = "6" },
			{ s = "H", r = "6" },
			{ s = "H", r = "6" },
			{ s = "H", r = "6" },
			{ s = "H", r = "6" },
			{ s = "H", r = "6" },
			{ s = "H", r = "6" },
			{ s = "H", r = "6" },
			{ s = "H", r = "6" },
			{ s = "H", r = "6" },
			{ s = "H", r = "6" },
			{ s = "H", r = "6" },
			{ s = "C", r = "6" },
			{ s = "C", r = "6" },
			{ s = "C", r = "6" },
			{ s = "C", r = "6" },
			{ s = "C", r = "6" },
			{ s = "C", r = "6" },
			{ s = "C", r = "6" },
			{ s = "C", r = "6" },
			{ s = "C", r = "6" },
			{ s = "C", r = "6" },
			{ s = "C", r = "6" },
			{ s = "C", r = "6" },
			{ s = "C", r = "6" },
			{ s = "D", r = "6" },
			{ s = "D", r = "6" },
			{ s = "D", r = "6" },
			{ s = "D", r = "6" },
			{ s = "D", r = "6" },
			{ s = "D", r = "6" },
			{ s = "D", r = "6" },
			{ s = "D", r = "6" },
			{ s = "D", r = "6" },
			{ s = "D", r = "6" },
			{ s = "D", r = "6" },
			{ s = "D", r = "6" },
			{ s = "D", r = "6" },
		}
	},
    apply = function(self)
        SMODS.change_play_limit(-4)
    end
})

