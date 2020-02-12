class Product < ApplicationRecord
  enum status: {on_sale: 0, discontinue: 1, replenish: 2}
end
