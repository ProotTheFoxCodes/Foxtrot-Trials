fxtrt.config = SMODS.current_mod.config

start_old = Game.start_run

function Game.start_run(self,args)
    local ret = start_old(self,args)
    G.GAME.fxtrt_oml = true
    G.GAME.fxtrt_blackjack = true
    G.GAME.fxtrt_nostalgic = true
    G.GAME.fxtrt_discarded = {}
    G.GAME.fxtrt_handsize = 0
    return ret
end

round_old = end_round

function end_round()
    if G.GAME.fxtrt_wall then
        G.GAME.fxtrt_wall = nil
        return
    end
    round_old()
end

select_old = G.FUNCS.select_blind

function G.FUNCS.select_blind(e)
    if not G.GAME.fxtrt_leafstate then select_old(e) end
end

function fxtrt.demisePassiveCheck()
    local _type = G.GAME.blind:get_type()
    return _type == "Small" or _type == "Big"
end

function fxtrt.setBacks(args)
    local rarityBacks = {
        { x = 0, y = 2 },
        { x = 2, y = 2 },
        { x = 0, y = 0 },
        { x = 4, y = 2 },
    }
    local atlasPos = {}
    for _,card in ipairs(G.jokers.cards) do
        if card.children.back then card.children.back:remove() end
        if args.rarity then
            atlasPos = rarityBacks[card.config.center.rarity] or args.pos or { x = 0, y = 4 }
        elseif args.pos then
            atlasPos = args.pos
        end
        card.children.back = SMODS.create_sprite(card.T.x, card.T.y, card.T.w, card.T.h, "centers", atlasPos)
        card.children.back.states.hover = card.states.hover
        card.children.back.states.click = card.states.click
        card.children.back.states.drag = card.states.drag
        card.children.back.states.collide.can = false
        card.children.back:set_role({ major = card, role_type = 'Glued', draw_major = card })
    end
end

SMODS.current_mod.calculate = function(self, context)

    if G.GAME.fxtrt_leafstate then
        SMODS.calculate_effect{{message = localize("k_nope_ex")},G.deck.cards[1] or G.deck}
        G.GAME.fxtrt_leafstate = nil
    end

    if context.setting_blind then
        if G.GAME.blind.config.blind.key == "bl_final_leaf" then
            G.GAME.fxtrt_leafsell = false
        end
        if not G.GAME.blind.boss then
            G.GAME.fxtrt_nostalgic = false
        end
        G.GAME.fxtrt_round_rerolls = 0
        G.GAME.fxtrt_discarded["round"] = false
        if G.GAME.round_resets.ante >= 6 then
            G.GAME.fxtrt_oml = false
        end
    end

    if context.pre_discard then
        local discard = G.GAME.fxtrt_discarded
        discard["round"], discard["run"] = true, true
    end

    if context.before and next(context.poker_hands['Flush Five']) and not G.GAME.selected_back.effect.config.randomize_rank_suit and not G.GAME.challenge then
        if not G.GAME.fxtrt_discarded["round"] then
            check_for_unlock({type = "pow5"})
        end
        if not G.GAME.fxtrt_discarded["run"] then
            check_for_unlock({type = "oblivion"})
        end
    end

    if context.before then
        local total = 0
        for _, icard in pairs(G.play.cards) do
            total = total + icard:get_id()
        end
        if total > 21 then G.GAME.fxtrt_blackjack = false end
	end

    if context.card_added then
        local card_jokers = {
            "j_joker",
            "j_baseball",
            "j_trading",
            "j_loyalty_card",
            "j_ticket",
            "j_business",
            "j_credit_card",
            "j_drivers_license",
        }
        G.GAME.fxtrt_has_cj = {}
        local cj_amt = 0
        for _, key in pairs(card_jokers) do
            G.GAME.fxtrt_has_cj[key] = not not next(SMODS.find_card(key))
        end
        for key in pairs(G.GAME.fxtrt_has_cj) do
            if G.GAME.fxtrt_has_cj[key] then  cj_amt = cj_amt + 1 end
        end
        if G.GAME.fxtrt_has_cj["j_baseball"] and G.GAME.fxtrt_has_cj["j_trading"] then
            check_for_unlock({type = "collector1"})
        end
        if cj_amt >= 4 then
            check_for_unlock({type = "collector2"})
        end
    end

    if context.selling_card and context.card.config.set == "Joker" and G.GAME.blind.config.blind.key == "bl_final_leaf" then
        G.GAME.fxtrt_leafsell = true
    end
end

function SMODS.current_mod.reset_game_globals(from_game_start)
    -- Win ante and other similar modifications moved to challenge apply functions 
end

old_money = ease_dollars
function ease_dollars(mod)
    if mod > 0 and (G.GAME.challenge == "c_fxtrt_nepo" or (G.GAME.challenge == "c_fxtrt_demise" and G.GAME.round_resets.blind_choices.Boss == "bl_tooth")) then
        mod = 0
    else
        old_money(mod)
    end
    return (ret or 0)
end

function G.UIDEF.view_banned(args)
    local deck_tables = {}
    local bans = {}
    for k,v in pairs(G.GAME.banned_keys) do
        if v then bans[#bans+1] = k end
    end
    table.sort(bans)
    local view_deck = CardArea(
    G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
    6.5*G.CARD_W,
    0.6*G.CARD_H,
    {card_limit = #bans, type = 'title', view_deck = true, highlight_limit = 0, card_w = G.CARD_W*0.7, draw_layers = {'card'}})
    table.insert(deck_tables, 
    {n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
    {n=G.UIT.O, config={object = view_deck}}
    }}
    )

    for _,v in ipairs(bans) do
        local copy = SMODS.create_card(G.P_CENTERS[v])
        copy:set_ability(v)
        copy.T.x = view_deck.T.x + view_deck.T.w/2
        copy.T.y = view_deck.T.y
        copy:hard_set_T()
        view_deck:emplace(copy)
    end
    return {
        n = G.UIT.ROOT, 
        config = {align = "cm", padding = 0.1, colour = G.C.CLEAR}, 
        nodes = deck_tables
    }
end

