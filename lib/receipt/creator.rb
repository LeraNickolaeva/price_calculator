module Receipt
  class Creator
    def initialize(purchased_items)
      @purchased_items = purchased_items
    end

    def call
      generate_header
      generate_body
      generate_footer
    end

    private

    attr_reader :purchased_items

    def generate_header
      puts 'Item     Quantity      Price'
      puts '--------------------------------------'
    end

    def generate_body
      counted_items.map do |item, count|
        puts "#{item.ljust(10)} #{count.to_s.ljust(10)} $#{price(item, count)&.round(2)}"
      end
    end

    def generate_footer
      puts ''
      puts "Total price : $#{total_price&.round(2)}"
      puts "You saved $#{(origin_price - total_price).round(2)} today."
    end

    def counted_items
      @counted_items ||= purchased_items.each_with_object(Hash.new(0)) { |item, count| count[item] +=1 }
    end

    def price(item, count)
      PriceCalculator.new(item, count).call
    end

    def total_price
      counted_items.map do |item, count|
        price(item, count)
      end.reduce(:+)
    end

    def origin_price
      counted_items.map do |item, count|
        PriceCalculator.new(item, count).price
      end.reduce(:+)
    end
  end
end
