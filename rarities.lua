SMODS.Rarity {
    key = "marinuanarar",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.1,
    badge_colour = HEX('5d862f'),
    loc_txt = {
        name = "Marinuana"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "marinuana_copy",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.1,
    badge_colour = HEX('5d862f'),
    loc_txt = {
        name = "Marinuana"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}