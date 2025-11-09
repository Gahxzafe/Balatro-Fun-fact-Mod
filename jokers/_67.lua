SMODS.Joker{ --67
    key = "_67",
    config = {
        extra = {
            Sixseven = 0,
            odds = 1000,
            odds2 = 1000
        }
    },
    loc_txt = {
        ['name'] = '67',
        ['text'] = {
            [1] = 'By scoring a 6 or a 7,',
            [2] = 'there\'s a 1 in 1000 chance of losing the game,',
            [3] = 'but if not wins 6x Mult',
            [4] = 'You have {X:red,C:white}X#1#{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 67,
    rarity = "funfactm_marinuanarar",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["funfactm_funfactm_jokers"] = true },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_funfactm__67') 
        return {vars = {card.ability.extra.Sixseven, new_numerator, new_denominator}}
    end,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 6 then
                card.ability.extra.Sixseven = (card.ability.extra.Sixseven) + 6
                if SMODS.pseudorandom_probability(card, 'group_0_e0bcaa6e', 1, card.ability.extra.odds, 'j_funfactm__67', false) then
                        SMODS.calculate_effect({func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Lmao", colour = G.C.RED})
                            G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                end
                            end
                        }))
                        
                        return true
                        end}, card)
                    end
                elseif context.other_card:get_id() == 7 then
                    card.ability.extra.Sixseven = (card.ability.extra.Sixseven) + 6
                    if SMODS.pseudorandom_probability(card, 'group_0_d203ced2', 1, card.ability.extra.odds, 'j_funfactm__67', false) then
                            SMODS.calculate_effect({func = function()
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Lmao", colour = G.C.RED})
                                G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.5,
                                func = function()
                                    if G.STAGE == G.STAGES.RUN then 
                                        G.STATE = G.STATES.GAME_OVER
                                        G.STATE_COMPLETE = false
                                    end
                                end
                            }))
                            
                            return true
                            end}, card)
                        end
                    end
                end
                if context.cardarea == G.jokers and context.joker_main  then
                    return {
                        Xmult = card.ability.extra.Sixseven,
                        message = "SIX SEVEEN"
                    }
                end
            end
}