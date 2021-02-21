class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

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
    @item = Item.find(params[:id])
    @category = Category.find_by(id: @item.category_id)
    @quality = Quality.find_by(id: @item.quality_id)
    @burdenFee = BurdenFee.find_by(id: @item.burden_fee_id)
    @prefecture = Prefecture.find_by(id: @item.prefecture_id)
    @daysToShip = DaysToShip.find_by(id: @item.days_to_ship_id)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :quality_id, :burden_fee_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end

