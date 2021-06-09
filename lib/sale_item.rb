class SaleItem
  @@sale_items = {}

  def initialize(name, quantity, price)
    @name = name
    @quantity = quantity
    @price = price
    @@sale_items[name] = { quantity: quantity, price: price }
  end

  def self.all
    @@sale_items
  end
end
