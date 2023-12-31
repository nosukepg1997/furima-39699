class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, only: [:edit]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index 
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    set_history
  end

  def edit
    if @item.history && @item.history.id.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  private

  def item_params
    params.require(:item).permit(
      :image, 
      :product_name, 
      :description, 
      :category_id, 
      :condition_id, 
      :delivery_cost_id, 
      :prefecture_id, 
      :days_until_send_id,
      :price
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    if user_signed_in? && current_user.id != @item.user_id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_history
    if @item.history && @item.history.id.present?
      @history = @item.history.id
    end
  end
  

end
