class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :sku

  # 計算訂單總金額(注文履歴view )
  def total_price
    quantity * sku.product.sell_price    
  end
end
