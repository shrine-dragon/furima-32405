class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :user
  has_one          :purechase
  has_one_attached :image
  belongs_to       :category, :quality, :burden_fee, :prefecture, :days_to_ship
end
