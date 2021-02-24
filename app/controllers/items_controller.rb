class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item,           only:   [:show, :edit, :update]
  before_action :move_to_root_path,  only:   [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if user_signed_in? && current_user.id == @item.user_id 
      item.destroy
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :quality_id, :burden_fee_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_root_path
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end