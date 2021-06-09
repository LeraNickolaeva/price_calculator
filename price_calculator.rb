require_relative 'lib/purchased_item'
require_relative 'lib/sale_item'
require_relative 'lib/receipt/printer'
require_relative 'lib/input_handler'
require_relative 'lib/receipt/creator'
require_relative 'lib/receipt/price_calculator'

PurchasedItem.new('Milk', 3.97)
PurchasedItem.new('Bread', 2.17)
PurchasedItem.new('Apple', 0.89)
PurchasedItem.new('Banana', 0.99)

SaleItem.new('Milk', 2, 5.00)
SaleItem.new('Bread', 3, 6.00)

Receipt::Printer.call
