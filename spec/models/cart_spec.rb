require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:cart) { Cart.new }
  # let(:cart) { Cart.new } 寫了這行 可以取代 cart = Cart.new
  context "基本功能" do
    it "可以把商品丟到到購物車裡，然後購物車裡就有東西了。" do
      # cart = Cart.new

      cart.add_sku(2,1)
      
      expect(cart.empty?).to be false
    end

    it "加了相同種類的商品到購物車裡，購買項目（CartItem）並不會增加，但商品的數量會改變" do
      # cart = Cart.new

      3.times { cart.add_sku(1,5) }
      2.times { cart.add_sku(2,1) }

      expect(cart.items.count).to be 2
      expect(cart.items.first.quantity).to be 15
    end

    it "商品可以放到購物車裡，也可以再拿出來" do
      # cart = Cart.new

      # v1 = Vendor.create(title: 'v1')
      # p1 = Product.create(name: 'p1', list_price: '10', sell_price: '5', vendor: v1)
      p1 = FactoryBot.create(:product, :with_skus)

      cart.add_sku(p1.skus.first.id, 2)

      expect(cart.items.first.product).to be_a Product
    end

    it "可以計算整台購物車的總消費金額。" do
      # cart = Cart.new

      p1 = FactoryBot.create(:product, :with_skus, sell_price: 5)
      p2 = FactoryBot.create(:product, :with_skus, sell_price: 10)

      3.times { cart.add_sku(p1.skus.first.id, 1) }
      2.times { cart.add_sku(p2.skus.first.id, 2) }
      
      expect(cart.total_price).to eq 55
    end
  end

  context "進階功能" do
    it "可以將購物車內容轉換成 Hash 並存到 Session 裡。" do
      # cart = Cart.new

      p1 = FactoryBot.create(:product, :with_skus)
      p2 = FactoryBot.create(:product, :with_skus)

      3.times { cart.add_sku(p1.id, 2) }
      2.times { cart.add_sku(p2.id, 1) }

      expect(cart.serialize).to eq cart_hash
    end

    it "也可以存放在 Session 的內容（Hash 格式），還原成購物車的內容" do
      cart = Cart.from_hash(cart_hash)

      expect(cart.items.first.quantity).to be 6
    end

    private
    def cart_hash
      {
        "items" => [
          {"sku_id" => 1, "quantity" =>6},
          {"sku_id" => 2, "quantity" =>2},
        ]
      }
    end
  end  
end
