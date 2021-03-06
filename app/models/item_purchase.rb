class ItemPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number, :user_id, :item_id,
                :purchase_id, :token

  # 空欄時のバリデーション
  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :addresses
    validates :phone_number, numericality: { only_integer: true, message: 'Input only number' }
    validates :user_id, :item_id
  end

  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Input correctly' }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    address = Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses,
                             building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
