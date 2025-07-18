local sc = Card.set_cost
function Card:set_cost()
    sc(self)
    if (self.config.center.rarity == "nanu_dogsh") then
        self.cost = 0
    end
end