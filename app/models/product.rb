class Product < ApplicationRecord
  belongs_to :vendor
  validates :name, presence: true
  validates :list_price, :sell_price, numericality: { greater_than: 0, allow_nil: true }

  # FriendlyId
  extend FriendlyId
  friendly_id :code_generator, use: :slugged, slug_column: :code

  validates :code, uniqueness: true
  private
  def code_generator
      SecureRandom.hex(10)
  end
end
