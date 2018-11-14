class CreateOrder < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
    	t.string :number, limit: 15
    	t.decimal :total, precision: 8, scale: 2, default: 0.0, null: false
    	t.decimal :item_total, precision: 8, scale: 2, default: 0.0, null: false
    	t.decimal :discount_total, precision: 8, scale: 2, default: 0.0, null: false
    	t.string :state
    	t.timestamps

        t.index :number, unique: true
    end
  end
end
