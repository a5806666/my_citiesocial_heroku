class Product < ApplicationRecord
  include CodeGenerator
  has_rich_text :description
  belongs_to :vendor
  validates :name, presence: true
  validates :list_price, :sell_price, numericality: { greater_than: 0, allow_nil: true }
  validates :code, uniqueness: true
end
