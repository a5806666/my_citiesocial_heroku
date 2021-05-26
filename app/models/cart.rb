class Cart
    # def items
    #     return @items
    # end
    #  ↓
    attr_reader :items

    def initialize(items = [])
        @items = items
    end

    def self.from_hash(hash = nil)
        # {
        #     "items" => [
        #       {"sku_id" => 1, "quantity" =>3},
        #       {"sku_id" => 2, "quantity" =>2},
        #     ]
        # }

        if hash && hash["items"]
            items = hash["items"].map { |item|
                CartItem.new(item["sku_id"], item["quantity"])
            }
            Cart.new(items)
        else
            Cart.new    
        end
    end

    def add_sku(sku_id, quantity)
        found = @items.find { |cart_item| cart_item.sku_id == sku_id }

        if found
            found.increment!(quantity)
        else
            @items << CartItem.new(sku_id, quantity)
        end

        
    end

    def serialize
        # items = [
        #     {"sku_id" => 1, "quantity" => 3},
        #     {"sku_id" => 1, "quantity" => 2},
        # ]

        items = @items.map { |item|  {"sku_id" => item.sku_id, "quantity" => item.quantity} }

        { "items" => items }
    end

    def empty?
        @items.empty?
    end

    def total_price
        @items.reduce(0) { |sum, item| sum = sum + item.total_price }

        # total = 0
        # @items.each do |item|
        #     total = total + item.total_price
        # end
        # total # return 
    end
end