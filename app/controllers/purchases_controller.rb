class PurchasesController < ApplicationController
  before_action :authenticate_user!
  def index
    @purchase_order = PurchaseOrder.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_order = PurchaseOrder.new(purchase_params)
    if @purchase_order.valid?
      pay_item
      @purchase_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_order).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number,).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
