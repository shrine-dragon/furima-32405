class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :user
  has_one          :purechase
  has_one_attached :image
  belongs_to       :category, :quality, :burden_fee, :prefecture, :days_to_ship

  validates :image, :name, :description, presence: true
  
  with_options numericality: { other_than: 1} do
    validates :category_id, :quality_id, :burden_fee_id, :prefecture_id, :days_to_ship_id
  end
end
