class ItemPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  # 空欄時のバリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly" }
    validates :city
    validates :house_number
    validates :phone_number format: { with: only_integer: true, message: "Input only number" }
  end
  # 桁数に関するバリデーション
  validates :phone_number,  format: {less_than_or_equal_to: 11, message: "is out of setting range"}
  # 選択肢に関するバリデーション
  validates :prefecture_id, numericality: { other_than: 0, message: "Select" }

  def save
    purchase = Purchase.new
    user = User.new
    item = Item.new
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, purchase_id: purchase.id)

    Purchase.create(user_id: user.id, item_id: item.id)
  end
end