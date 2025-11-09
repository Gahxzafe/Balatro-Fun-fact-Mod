SMODS.Joker{ --Femboy kisser
    key = "femboykisser",
    config = {
        extra = {
            Meow = 0
        }
    },
    loc_txt = {
        ['name'] = 'Femboy kisser',
        ['text'] = {
            [1] = 'When a jack scores, meow',
            [2] = 'earn 15 Mult for every meow,',
            [3] = 'I won\'t say how many meows or Mult I have.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 11 then
                card.ability.extra.Meow = (card.ability.extra.Meow) + 15
                return {
                    message = "Meow"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.Meow
            }
        end
    end
}