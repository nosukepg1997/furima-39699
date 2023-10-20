class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @item = Item.find(params[:item_id])
    @history = History.find_by(item_id: @item.id)
    if @item.user_id == current_user.id
      redirect_to root_path
    elsif @history.present?
      if @item.id == History.find(@item.id).item_id
        redirect_to root_path
      end
    end
    @order = Order.new
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end


  private

  def order_params
    @item = Item.find(params[:item_id])
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

  

  def pay_item
    Payjp.api_key = "sk_test_5a5381563b2cf42f59e51e30" 
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
