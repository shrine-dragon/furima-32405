class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :name,            null: false
      t.text        :description,     null: false
      t.integer     :category_id,     null: false
      t.integer     :quality_id,      null: false
      t.integer     :burden_fee_id,   null: false
      t.integer     :prefecture_id,   null: false
      t.integer     :days_to_ship_id, null: false
      t.integer     :price,           null: false, index: true
      t.references  :user,      foreign_key: true
      t.timestamps
    end
  end
end
