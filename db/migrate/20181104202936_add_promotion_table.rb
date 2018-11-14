class AddPromotionTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :promotions do |t|
      t.string :name, limit: 256
  		t.string :code, limit: 15
  		t.datetime :expiry_date
  		t.boolean :default_apply
  		t.text :description
  		t.integer :usage_limit
      t.integer :priority, null: false
  		t.timestamps

  		t.index :code, unique: true
  	end
  end
end
