SMODS.Back {
    key = "matter",
    loc_txt = {
        name = "Matter Deck",
        text = {
            "Applies the {C:red,E:1}downsides{}",
            "of {C:attention}every{} deck",
		},
    },
    atlas = 'decks',
    pos = { x = 0, y = 0 },
    config = {
        no_interest = true, -- Green Deck (no interest)
        hands = -1, -- Black Deck (-1 hand)
        consumable_slot = -1, -- Nebula Deck (-1 consumable slot)
        joker_slot = -1, -- Painted Deck (-1 Joker slot)
        ante_scaling = 2 -- Plasma Deck (x2 Blind size)
    },
}