class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  validates :recipient, :tel, :address, presence: true

  # 建立LINE PAY交易代碼
  before_create :generate_order_num
  private
  def generate_order_num
    self.num = SecureRandom.hex(5) unless num
  end
end
