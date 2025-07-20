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
    },
    shiny = true
}