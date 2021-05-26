class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  validates :recipient, :tel, :address, presence: true

  # 訂單狀態更改(aasm)
  include AASM
  
  aasm column: 'state' do
    state :pending, initial: true
    state :paid, :delivered, :cancelled

    event :pay do
      transitions from: :pending, to: :paid

      before do |args|
        self.transaction_id = args[:transaction_id]
        self.paid_at = Time.now
      end
    end

    event :deliver do
      transitions from: :paid, to: :delivered
    end

    event :cancel do
      transitions from: [:pending, :paid, :delivered], to: :cancelled
    end
  end

  # 計算訂單總金額(注文履歴view )
  def total_price
    order_items.reduce(0) { |sum, item| sum + item.total_price }
  end

  # 建立LINE PAY交易代碼
  before_create :generate_order_num
  private
  def generate_order_num
    self.num = SecureRandom.hex(5) unless num
  end
end
