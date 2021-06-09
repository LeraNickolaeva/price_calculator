module Receipt
  class Printer
    OUTPUT_TEXT = 'Please enter all the items purchased separated by a comma'
    EMPTY_INPUT_TEXT = 'There are no any purchased items'

    class << self
      def call
        purchased_items.any? ? print_receipt : (puts EMPTY_INPUT_TEXT)
      end

      def purchased_items
        @purchased_items ||= input.split(',').map(&:strip)
      end

      def input
        @input ||= InputHandler.call(OUTPUT_TEXT)
      end

      def print_receipt
        Creator.new(purchased_items).call
      end
    end
  end
end
