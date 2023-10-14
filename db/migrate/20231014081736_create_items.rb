class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :product_name, null:false
      t.text :description, null:false
      t.integer :category_id, null:false
      t.integer :condition_id, null:false
      t.integer :delivery_cost_id, null:false
      t.integer :prefecture_id, null:false
      t.integer :days_until_send_id, null:false
      t.integer :price, null:false
      t.references :user, null:false, foreign_key: true
    end
  end
end
