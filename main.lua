
fxtrt = {}

fxtrt.config = SMODS.current_mod.config

SMODS.Sound{
    key = "music_gay1",
    path = "music_futuristic_gay_game.wav",
    pitch = 1,
    volume = 1.4,
    select_music_track = function (self)
        if G and ((not G.screenwipe or fxtrt.config.continueplaying) and (G.STAGE == 1 or fxtrt.config.continueplaying) and fxtrt.config.maintheme.gay1) then
            return 1e308
        end
    end
}

SMODS.Sound{
    key = "music_gay2",
    path = "music_futuristic_gay_game_2.wav",
    pitch = 1,
    volume = 1.6,
    select_music_track = function (self)
        if G and ((not G.screenwipe or fxtrt.config.continueplaying) and (G.STAGE == 1 or fxtrt.config.continueplaying) and fxtrt.config.maintheme.gay2) then
            return 1e308
        end
    end
}

function G.FUNCS.change_maintheme(args)
    for k,_ in pairs(fxtrt.config.maintheme) do
        if k == "gay"..args.cycle_config.current_option then
            fxtrt.config.maintheme[k] = true
        else
            fxtrt.config.maintheme[k] = false
        end
    end
    SMODS.save_mod_config(SMODS.current_mod)
end
SMODS.current_mod.config_tab = function()
	return {n = G.UIT.ROOT, config = {

	}, nodes = {
		create_option_cycle({label = localize('fxtrt_settings_maintheme'),scale = 0.8, options = localize("fxtrt_settings_song"), opt_callback = 'change_maintheme', current_option = ((fxtrt.config.maintheme.gay1 and 1) or (fxtrt.config.maintheme.gay2 and 2))}),
        create_toggle({label = localize("fxtrt_settings_continuesong"), ref_table = fxtrt.config, ref_value = "continueplaying"})
    }}
end

local order = {
    "achievements",
    "ModGlobal",
    "ahf2",
    "FoolOfManyTalents",
    "jest",
    "WardenOfWine",
    "premonitions",
    "NotQuiteNepo",
    "ChinaShop",
    "Flawless4oak",
    "demise",
}
for _, key in ipairs(order) do
    assert(SMODS.load_file('src/'..key..'.lua'))()
end

