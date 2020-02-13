class Product < ApplicationRecord
  enum status: {on_sale: 0, discontinue: 1, replenish: 2}
  has_many_attached :images
  belongs_to :user

  validates :name, :sku, :list_price, :sell_price, :stock, presence: true
  validates :sku, uniqueness: true
end
