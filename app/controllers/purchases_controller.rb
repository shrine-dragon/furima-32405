class PurchasesController < ApplicationController
  def index
    @item_purchase = ItemPurchase.new
    @item = Item.find(params[:id])
  end

  def create
    @item_purchase = ItemPurchase.new(purchase_params)
    if @item_purchase.valid?
      @item_purchase.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:item_purchase).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)
  end
end
