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
        @items << product_id
    end

    def items
    end

    def empty?
        @items.empty?
    end
end