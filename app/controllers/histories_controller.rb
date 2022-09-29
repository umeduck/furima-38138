class HistoriesController < ApplicationController
  def index
    @history_address = HistoryAddress.new
    @product = Product.find(params[:product_id])
  end


  def create
    @product_id = params[:product_id]
    @history_address = HistoryAddress.new(history_address_params)
    if @history_address.valid?
      @history_address.save
      redirect_to root_path
    else
      @product = Product.find(params[:product_id])
      render :index
    end
  end

  private
  def history_address_params
    params.require(:history_address).permit(:postal_code, :area_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, product_id: @product_id)
  end
end
