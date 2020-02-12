class Product < ApplicationRecord
  enum status: {on_sale: 0, discontinue: 1, replenish: 2}
  has_many_attached :images
end
