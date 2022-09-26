class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @product = Product.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :explanation, :category_id, :state_id, :price_id, :load_id, :area_id,
                                    :delivery_id, :image).merge(user_id: current_user.id)
  end
end
