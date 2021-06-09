class PurchasedItem
  @@purchased_items = {}

  def initialize(name, price)
    @name = name
    @price = price
    @@purchased_items[name] = price
  end

  def self.all
    @@purchased_items
  end
end
