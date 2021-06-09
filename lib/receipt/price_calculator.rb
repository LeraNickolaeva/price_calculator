module Receipt
  class PriceCalculator
    def initialize(item, count)
      @item = item
      @count = count
    end

    def call
      discounted_price || price
    end

    def price
      return unless purchased_item

      purchased_item * count
    end

    def discounted_price
      return unless sale_item

      (count / sale_item[:quantity] * sale_item[:price]) + (count % sale_item[:quantity] * price)
    end

    private

    attr_reader :item, :count

    def sale_item
      @sale_item ||= SaleItem.all[item]
    end

    def purchased_item
      @purchased_item ||= PurchasedItem.all[item]
    end
  end
end
