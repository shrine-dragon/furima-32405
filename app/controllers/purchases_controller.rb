class PurchasesController < ApplicationController
  def index
  end
 
  def new
    @item_purchase = ItemPurchase.new
  end
 
  def create
    @item_purchase = ItemPurchase.new(purchase_params)   #「UserDonation」に編集
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
