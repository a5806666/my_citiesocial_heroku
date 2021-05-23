require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:cart) { Cart.new }

  it "每個 Cart Item 都可以計算它自己的金額（小計）。" do
      # cart = Cart.new

      p1 = FactoryBot.create(:product, sell_price: 5)
      p2 = FactoryBot.create(:product, sell_price: 10)

      3.times { cart.add_item(p1.id) }
      2.times { cart.add_item(p2.id) }

      expect(cart.items.first.total_price).to eq 15
      expect(cart.items.last.total_price).to eq 20
  end
end
