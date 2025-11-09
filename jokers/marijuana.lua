SMODS.Joker{ --Marijuana 
    key = "marijuana",
    config = {
        extra = {
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Marijuana ',
        ['text'] = {
            [1] = 'When select a blind, it generates a dirty money.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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

    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_Fct_dirtymoney' })
                        if joker_card then
                            joker_card:set_edition("e_negative", true)
                            
                        end
                        
                        return true
                        end
                    }))
                    
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                    end
                    return true
                    end
                }
            end
        end,

    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.original_joker_slots = G.jokers.config.card_limit
        G.jokers.config.card_limit = 2
    end,

    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.original_joker_slots then
            G.jokers.config.card_limit = card.ability.extra.original_joker_slots
        end
    end
}