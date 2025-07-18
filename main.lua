SMODS.Joker {
	key = 'smartman',
	loc_txt = {
		name = 'smart man in glasses',
		text = {
            "download wallpaper"
		}
	},
	rarity = "nanu_dogsh",
	pos = { x = 1, y = 0 },
	cost = 0,
    atlas = 'jonklers',
    add_to_deck = function (self, card, from_debuff)
        card.sell_cost = 0
        -- this had to be added cuz the function was being called when the jokers were being placed at the shop
        if #SMODS.find_card('j_nanu_smartman', false) ~= 0 then return end 
        card:set_eternal(true)
        -- add custom bg image
        G.SPLASH_BACK:remove()
        G.SPLASH_BACK = nil
        G.SPLASH_BACK = Sprite(0, 0, 23, 13, G.ASSET_ATLAS["nanu_smartbg"], {x = 0, y = 0})
        G.SPLASH_BACK:set_alignment({
            major = G.ROOM_ATTACH,
            type = 'cm',
            offset = {x=0,y=0}
        })
    end,
    -- ig i don't need this now lol
    -- remove_from_deck = function (self, card, from_debuff)
    --     -- return to normal
    --     -- technically not how you should properly do this but ehh whatever
    --     if #SMODS.find_card('j_nanu_smartman', false) ~= 0 then return end
    --     G.SPLASH_BACK:remove()
    --     G.SPLASH_BACK = nil
    --     G.SPLASH_BACK = Sprite(-30, -6, G.ROOM.T.w+60, G.ROOM.T.h+12, G.ASSET_ATLAS["ui_1"], {x = 2, y = 0})
    --     G.SPLASH_BACK:set_alignment({
    --         major = G.play,
    --         type = 'cm',
    --         bond = 'Strong',
    --         offset = {x=0,y=0}
    --     })
    --     G.SPLASH_BACK:define_draw_steps({{
    --     shader = 'background',
    --     send = {
    --         {name = 'time', ref_table = G.TIMERS, ref_value = 'REAL_SHADER'},
    --         {name = 'spin_time', ref_table = G.TIMERS, ref_value = 'BACKGROUND'},
    --         {name = 'colour_1', ref_table = G.C.BACKGROUND, ref_value = 'C'},
    --         {name = 'colour_2', ref_table = G.C.BACKGROUND, ref_value = 'L'},
    --         {name = 'colour_3', ref_table = G.C.BACKGROUND, ref_value = 'D'},
    --         {name = 'contrast', ref_table = G.C.BACKGROUND, ref_value = 'contrast'},
    --         {name = 'spin_amount', ref_table = G.ARGS.spin, ref_value = 'amount'}
    --     }}})
    
    -- end,
    calculate = function (self, card, context)
        
        if context.starting_shop or context.reroll_shop then
            local c = 0
            -- doesn't look that good but whatever
            for k, v in pairs(G.shop_jokers.cards) do
                if v.ability.set == 'Joker' then
                    v:start_dissolve()
                    c = c + 1
                end
            end
            if c > 0 then
                for i = 1, c do
                    local joker = SMODS.add_card({set = 'Joker', key = 'j_nanu_smartman', area = G.shop_jokers})
                    create_shop_card_ui(joker, 'Joker', G.shop_jokers)
                end
            end
        end
        -- k i'm too lazy to figure ts out whatever
        -- if context.open_booster then
        --     local c = 0
        --     for k, v in pairs(G.shop_booster.cards) do
        --         if v.ability.set == 'Joker' then
        --             v:start_dissolve()
        --             c = c + 1
        --         end
        --     end
        --     if c > 0 then
        --         for i = 1, c do
        --             local joker = SMODS.add_card({set = 'Joker', key = 'j_nanu_smartman', area = G.shop_booster})
        --             create_shop_card_ui(joker, 'Joker', G.shop_booster)
        --         end
        --     end
        -- end
    end
}
SMODS.Joker {
	key = 'abysmal',
	loc_txt = {
		name = "Abysmal joker",
		text = {
            '{C:mult}-#1# {} Mult',
            '{C:chips}-#2#{} Chips',
            '{X:mult,C:white} X#3# {} Mult',
            '',
            '{C:red}OK I SWEAR TO GOD{}',
            '{C:red}I HAVEN\'T SEEN{}',
            '{C:red}THE CRYPTPOSTING MOD{}',
            '{C:red}BEFORE MAKING THIS{}',
            '{C:red}I HAVE NO IDEA{}',
            '{C:red}HOW WE BASICALLY MADE THE SAME JOKER{}'
		}
	},
    config = { extra = { mult = 2, chips = 30, Xmult = 0.75 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.Xmult } }
	end,

	rarity = "nanu_dogsh",
	pos = { x = 0, y = 0 },
	cost = 0,
    atlas = 'jonklers',
    calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = -card.ability.extra.mult,
                Xmult_mod = card.ability.extra.Xmult,
                chip_mod = -card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.mult } },
                delay = 0.7,
                extra = {
                    message = localize { type = 'variable', key = 'a_chips_minus', vars = { card.ability.extra.chips } },
                    delay = 0.7,
                    extra = {
                        message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
                    }
                }
			}
		end
	end,
    add_to_deck = function (self, card, from_debuff)
        card.sell_cost = 0
    end
    
}
SMODS.Joker {
    key = 'ape',
    loc_txt = {
        name = 'Red Ape',
        text = {
            'fuck'
        }
    },
    rarity = 'nanu_dogsh',
    pos = { x = 2, y = 0 },
	cost = 0,
    atlas = 'jonklers',
    calculate = function (self, card, context)
        if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
            return {
                play_sound('nanu_fuck', 1.0, 0.7),
                delay = 0.5,
                message = 'fuck'
            }
        end
    end,
    add_to_deck = function (self, card, from_debuff)
        card.sell_cost = 0
    end
}
SMODS.Joker {
	key = 'chuddy',
	loc_txt = {
		name = 'Chuddy',
		text = {
            "{C:green}#1# in #2#{} chance",
            "that something happens",
            "gains {X:mult,C:white} X#3# {} Mult",
            "every time nothing happens",
            "gains {X:mult,C:white} X#4# {} Mult",
            "per every nothingburger",
            "{C:inactive}(Currently {X:mult,C:white} X#5#{C:inactive} Mult)"
		}
	},
	rarity = 3,
	pos = { x = 3, y = 0 },
	cost = 10,
    atlas = 'jonklers',
    config = {
        extra = {
            odds = 999999,
            Xmultgain1 = 0.1,
            Xmultgain2 = 0.5,
            Xmult = 1.0
        }
    },
    eternal_compat = false,
    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'chuddy')
		return { vars = { new_numerator, new_denominator, card.ability.extra.Xmultgain1, card.ability.extra.Xmultgain2, card.ability.extra.Xmult } }
	end,
    calculate = function(self, card, context)
        if context.joker_main then
            if card.ability.extra.Xmult ~= 1.0 then
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
                    Xmult_mod = card.ability.extra.Xmult
                }
            end
		end
        if context.pseudorandom_result and context.trigger_obj~=card then
            if not context.result then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmultgain1
                return {
                    message = 'Nothing ever happens'
                }
            else
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmultgain2
                return {
                    message = 'Nothingburger'
                }
            end
        end
        if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'chuddy', 1, card.ability.extra.odds, 'chuddy') then
                G.E_MANAGER:add_event(Event({
					func = function()
                        card:start_dissolve()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
							delay = 2.0,
							blockable = false,
                            func = function()
                                local joker = SMODS.create_card({set = 'Joker', key = 'j_nanu_holyfuck'})
                                joker:add_to_deck()
                                G.jokers:emplace(joker)
                                return true
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = 'IT\'S HAPPENING!'
                }
            else
                return {
                    message = 'Nothing ever happens'
                }
            end
        end
	end
}
-- actually useful template lol
SMODS.Joker {
	key = 'nothing',
	loc_txt = {
		name = '',
		text = {
            ""
		}
	},
	rarity = "nanu_dogsh",
	pos = { x = 4, y = 0 },
	cost = 0,
    atlas = 'jonklers',
    -- well except for this part ig
    add_to_deck = function (self, card, from_debuff)
        card.sell_cost = 0
    end
}
SMODS.Joker {
	key = 'snake',
	loc_txt = {
		name = 'Real Invisible Joker',
		text = {
            "Can you even say",
            "{C:red,E:1,S:1.2}his name?",
            "{C:inactive}({C:attention}#2#{C:inactive}/#1#)"
		}
	},
	rarity = "nanu_dogsh",
	pos = { x = 5, y = 0 },
	cost = 0,
    atlas = 'jonklers',
    eternal_compat = false,
    add_to_deck = function (self, card, from_debuff)
        card.sell_cost = 0
    end,
    config = { extra = { invis_rounds = 0, total_rounds = 1 } },
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.total_rounds, card.ability.extra.invis_rounds } }
    end,
    calculate = function (self, card, context)
        if context.selling_self and (card.ability.extra.invis_rounds >= card.ability.extra.total_rounds) and not context.blueprint then
            local joker = SMODS.create_card({set = 'Joker', key = 'j_nanu_snake'})
            joker:add_to_deck()
            G.jokers:emplace(joker)
        end
        -- copypasta from vanillaremade lol
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.invis_rounds = card.ability.extra.invis_rounds + 1
            if card.ability.extra.invis_rounds == card.ability.extra.total_rounds then
                local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)
            end
            return {
                message = (card.ability.extra.invis_rounds < card.ability.extra.total_rounds) and
                    (card.ability.extra.invis_rounds .. '/' .. card.ability.extra.total_rounds) or
                    localize('k_active_ex'),
                colour = G.C.FILTER
            }
        end
    end
}
SMODS.Joker {
    key = "hardwired",
    loc_txt = {
        name = "Hardwired... to Self-Destruct",
        text = {
            "Doubles all {C:attention}listed",
            "{C:green,E:1,S:1.1}probabilities",
            "at the beginning of every round",
            "{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}2 in 3{C:inactive})",
            "{C:green}#1# in #2#{} chance to",
            "{S:1.1,C:red,E:2}self-destruct{}"
        },
    },
    blueprint_compat = false,
    atlas = 'jonklers',
    rarity = 2,
    cost = 6,
    pos = { x = 0, y = 1 },
    config = { extra = { oddsMult = 1, oddsDest = 256 } },
    eternal_compat = false,
    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.oddsDest, 'hardwired')
        return { vars = { new_numerator, new_denominator } }
    end,
    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint then
            return {
                numerator = context.numerator * card.ability.extra.oddsMult
            }
        end
        if context.setting_blind and not context.blueprint then
            card.ability.extra.oddsMult = card.ability.extra.oddsMult * 2
            return {
                message = 'Doubled!'
            }
        end
        if context.end_of_round and context.game_over == false and not context.repetition and not context.blueprint then
			if SMODS.pseudorandom_probability(card, 'hardwired', 1, card.ability.extra.oddsDest, 'hardwired') then
                card:start_dissolve()
                return {
                    message = 'Self-destruct!'
                }
            else
                return {
                    message = 'Safe!'
                }
            end
		end
    end
}
SMODS.Joker {
    key = 'gamba',
	loc_txt = {
		name = 'Gambling Addiction',
		text = {
            "{C:tarot}The Wheel of Fortune{} is",
            "always available in the",
            "{C:attention}shop{} but has only {C:green}1 in 8",
            "chance to trigger"
		}
	},
	rarity = 3,
	pos = { x = 1, y = 1 },
	cost = 8,
    atlas = 'jonklers',
    calculate = function (self, card, context)
        if context.fix_probability and context.identifier == 'wheel_of_fortune' and not context.blueprint then
            return {
                numerator = 1,
                denominator = 8
            }
        end
        if context.starting_shop then
            local tarot = SMODS.add_card({set = 'Tarot', key = 'c_wheel_of_fortune', area = G.shop_jokers})
            create_shop_card_ui(tarot, 'Tarot', G.shop_jokers)
        end
    end
}
SMODS.Joker {
    key = 'holyfuck',
	loc_txt = {
		name = 'S... Something happened?....',
		text = {
            "ok, a few things happened"
		}
	},
	rarity = 'nanu_impossible',
    no_collection = true,
	pos = { x = 2, y = 1 },
	cost = 200000,
    atlas = 'jonklers',
}
SMODS.Atlas {
    key = 'jonklers',
    path = 'jonklers.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'smartbg',
    path = 'smartbg.png',
    px = 384,
    py = 256
}
SMODS.Rarity {
    key = 'dogsh',
    loc_txt = {
        name = 'Dogshit'
    },
    badge_colour = HEX("964B00"),
    -- lol
    default_weight = 0.000001,
    pools = {
        -- ok i honestly don't hnow what rate does pls halp
        ["Joker"] = { rate = 0.1 },
    }
}
SMODS.Rarity {
    key = 'impossible',
    loc_txt = {
        name = 'Impossible'
    },
    badge_colour = HEX("000000"),
}
SMODS.Sound {
    key = 'fuck',
    path = 'fuck.ogg'
}
SMODS.Stake {
    name = "Dogshit Stake",
    key = "dogsh_s",
    applied_stakes = { "gold" },
    prefix_config = { applied_stakes = { mod = false } },
    atlas = 'chips',
    pos = { x = 1, y = 0 },
    sticker_atlas = 'stickers',
    sticker_pos = { x = 3, y = 1 },
    modifiers = function()
        -- idk if that's the best way to do this but idk how else i would
        G.GAME.nanu_dogsh_mod = 300000
    end,
    colour = HEX("964B00"),
    loc_txt = {
        name = "Dogshit Stake",
        text = {
            "Shop can have {C:attention}Dogshit{} Jokers",
            "{C:red}The end times are upon us",
            "{C:red}God have mercy"
        },
        sticker = {
            name = "Dogshit sticker",
            text = {"why"}
        }
    }
}
SMODS.Atlas {
    key = 'stickers',
    path = 'stickers.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'chips',
    path = 'chips.png',
    px = 29,
    py = 29
}

local sc = Card.set_cost
function Card:set_cost()
    sc(self)
    if (self.config.center.rarity == "nanu_dogsh") then
        self.cost = 0
    end
end