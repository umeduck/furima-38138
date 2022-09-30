class HistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :bought, only: :index
  before_action :same_puroduct_user, only: :index
  

  def index
    @history_address = HistoryAddress.new
    @product = Product.find(params[:product_id])
  end


  def create
    @product_id = params[:product_id]
    @product = Product.find(@product_id)
    @history_address = HistoryAddress.new(history_address_params)
    if @history_address.valid?
      pay_product
      @history_address.save
      redirect_to root_path
    else
      @product = Product.find(params[:product_id])
      render :index
    end
  end

  private
  def history_address_params
    params.require(:history_address).permit(:postal_code, :area_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, product_id: @product_id, token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @product.price,
        card: history_address_params[:token],
        currency: 'jpy'
      )
  end
  
  def bought
    redirect_to root_path if History.exists?(product_id: params[:product_id])
  end

  def same_puroduct_user
    redirect_to root_path unless current_user.id ==  params[:product_id]
  end


  
end
