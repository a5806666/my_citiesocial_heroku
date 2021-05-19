class Product < ApplicationRecord
  include CodeGenerator
  belongs_to :vendor
  belongs_to :category, optional: true
  
  # 文字編輯 & 圖片上傳
  has_rich_text :description
  has_one_attached :cover_image

  validates :name, presence: true
  validates :list_price, :sell_price, numericality: { greater_than: 0, allow_nil: true }
  validates :code, uniqueness: true

  # Nested forms
  has_many :skus
  accepts_nested_attributes_for :skus, reject_if: :all_blank, allow_destroy: true
end
