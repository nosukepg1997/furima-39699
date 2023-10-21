class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :set_item, only:[:index]

  def index
    @history = History.find_by(item_id: @item.id)
    if @item.user_id == current_user.id
      redirect_to root_path
    elsif @history.present?
      redirect_to root_path
    end
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      set_item
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end


  private

  def order_params
    set_item
    params.require(:order).permit(:post_code, 
                                  :prefecture_id, 
                                  :city, 
                                  :street_address, 
                                  :building, 
                                  :telephone
                                ).merge(user_id: current_user.id, 
                                        item_id: @item.id, 
                                        token: params[:token]
                                      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
