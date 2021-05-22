class Cart
    # def items
    #     return @items
    # end
    #  ↓
    attr_reader :items

    def initialize
        @items = []
    end

    def add_item(product_id)
        found = @items.find { |cart_item| cart_item.product_id == product_id }

        if found
            found.increment!
        else
            @items << CartItem.new(product_id)
        end

        
    end

    def empty?
        @items.empty?
    end
end