class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|

      t.timestamps
      t.string :post_code, null:false
      t.integer :prefecture_id, null:false
      t.string :city, null:false
      t.string :street_address, null:false
      t.string :building
      t.string :telephone, null:false
      t.references :history, null:false, foreign_key: true
    end
  end
end