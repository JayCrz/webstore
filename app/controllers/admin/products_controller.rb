class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, except:[:index, :new, :create]
  def index
    @product = current_user.products
  end

  def show
  end

  def new 
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_root_path, notice:'新增成功' 
    else
      render :new
    end
  end

  def edit
    if params[:image_id]
      Product.find(params[:id]).images.attachments.find(params[:image_id]).delete
      redirect_to edit_admin_product_path(params[:id])
    end
  end

  def update
    redirect_to admin_product_path(params[:id]), notice:'更新成功' if @product.update(product_params)
  end

  def destroy
    redirect_to admin_root_path, notice:'刪除成功' if @product.destroy
  end
  private
  def product_params
    params.require(:product).permit(:name,
                                    :description,
                                    :sku,
                                    :list_price,
                                    :sell_price,
                                    :stock,
                                    :status,
                                    :user_id,
                                    images: [])
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
