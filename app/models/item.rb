class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :user
  has_one          :purechase
  has_one_attached :image
  belongs_to       :category, :quality, :burden_fee, :prefecture, :days_to_ship

  with_options presence: true do
    validates :image, :name, :description
    validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
  end

  # priceの金額指定に関するバリデーション
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

  # active_hashのデータ
  with_options numericality: { other_than: 0, message: "must be other than 0" } do
    validates :category_id, :quality_id, :burden_fee_id, :days_to_ship_id, :prefecture_id
  end
end
