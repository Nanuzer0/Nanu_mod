local sc = Card.set_cost
function Card:set_cost()
    sc(self)
    -- this works fine for one joker but if i add more this needs rework
    if (self.config.center.rarity == "nanu_dogsh" and self.config.center_key ~= 'j_nanu_wouldyourather') then
        self.cost = 0
    end
end