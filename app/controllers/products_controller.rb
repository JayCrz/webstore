class ProductsController < ApplicationController
  before_action :find_product, except:[:index, :new]
  def index
    @product = Product.all
  end

  def show
  end

  def new 
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    redirect_to products_path, notice:'新增成功' if @product.save
  end

  def edit
  end

  def update
    redirect_to root_path, notice:'更新成功' if @product.update(product_params)
  end

  def destroy
    redirect_to root_path, notice:'刪除成功' if @product.destroy
  end
  private
  def product_params
    params.require(:product).permit(:name,
                                    :description,
                                    :sku,
                                    :list_price,
                                    :sell_price,
                                    :stock,
                                    :status)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
