class ProductsController < ApplicationController

  def index
    @product = product.all
  end
end
