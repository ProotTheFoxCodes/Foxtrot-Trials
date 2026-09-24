SMODS.Achievement {
    key = "pow5",
    bypass_all_unlocked = true,
    hidden_name = false,
    hidden_text = false,
    unlock_condition = function(self,args)
        return(args.type == "pow5")
    end,
}

SMODS.Achievement {
    key = "oblivion",
    bypass_all_unlocked = true,
    hidden_name = false,
    hidden_text = false,
    unlock_condition = function(self,args)
        return(args.type == "oblivion")
    end,
}

SMODS.Achievement {
    key = "artist",
    bypass_all_unlocked = true,
    hidden_name = false,
    hidden_text = false,
    unlock_condition = function(self,args)
        return(args.type == "artist")
    end,
}

SMODS.Achievement {
    key = "collector1",
    bypass_all_unlocked = true,
    hidden_name = false,
    hidden_text = false,
    unlock_condition = function(self,args)
        return(args.type == "collector1")
    end,
}

SMODS.Achievement {
    key = "collector2",
    bypass_all_unlocked = true,
    hidden_name = false,
    hidden_text = false,
    unlock_condition = function(self,args)
        return(args.type == "collector2")
    end,
}

SMODS.Achievement {
    key = "negative",
    bypass_all_unlocked = true,
    hidden_name = false,
    hidden_text = false,
    unlock_condition = function(self,args)
        if G.jokers and not G.GAME.challenge then
            local negatives = 0
            for i=1, #G.jokers.cards do
                if G.jokers.cards[i].edition and G.jokers.cards[i].edition.key == "e_negative" then negatives = negatives + 1 end
            end
            if negatives >= 2 then
                return true
            end
        end
    end,
}

SMODS.Achievement {
    key = "yr_oue",
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,
    reset_on_startup = true,
    unlock_condition = function(self,args)
        if G.jokers and not G.GAME.challenge then
            local your = {
                localize("fxtrt_your"),
                localize("fxtrt_you_re"),
                localize("fxtrt_youre"),
            }
            for _, joker in ipairs(G.jokers.cards) do
                if next(G.jokers.cards) then
                    for _, find in ipairs(your) do
                        if string.find(
                            table.concat(localize{
                                type = "raw_descriptions",
                                set = "Joker",
                                key = joker.config.center.key,
                                vars = {},
                            }," "),find
                        ) then return true end
                    end
                end
            end
        end
    end,
}

SMODS.Achievement {
    key = "level",
    bypass_all_unlocked = true,
    hidden_name = false,
    hidden_text = false,
    unlock_condition = function(self,args)
        if G.GAME and G.GAME.fxtrt_oml then
            for k,v in pairs(G.GAME.hands) do
                if v.level >= 10 then return true end
            end
        end
    end,
}

SMODS.Achievement {
    key = "abscission",
    bypass_all_unlocked = true,
    hidden_name = false,
    hidden_text = false,
    unlock_condition = function(self,args)
        if G.GAME and G.GAME.fxtrt_leafsell == false and G.GAME.won then
            return true
        end
    end,
}

SMODS.Achievement {
    key = "rich",
    bypass_all_unlocked = true,
    hidden_name = false,
    hidden_text = false,
    unlock_condition = function(self,args)
        if G.GAME and G.GAME.dollars >= 1000 then
            return true
        end
    end,
}

SMODS.Achievement {
    key = "nostalgic",
    bypass_all_unlocked = true,
    hidden_name = false,
    hidden_text = false,
    unlock_condition = function(self,args)
        if G.GAME and G.GAME.won and G.GAME.fxtrt_nostalgic then
            return true
        end
    end,
}

SMODS.Achievement {
    key = "blackjack",
    bypass_all_unlocked = true,
    hidden_name = true,
    hidden_text = false,
    unlock_condition = function(self,args)
        if G.GAME and G.GAME.won and G.GAME.fxtrt_blackjack then
            return true
        end
    end,
}

