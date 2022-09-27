class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :product_find, only: [:show, :edit, :update, :destroy]
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
  end

  def edit
    redirect_to root_path unless current_user.id == @product.user_id
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @product.delete
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :explanation, :category_id, :state_id, :price_id, :load_id, :area_id,
                                    :delivery_id, :image).merge(user_id: current_user.id)
  end

  def product_find
    @product = Product.find(params[:id])
  end
end
