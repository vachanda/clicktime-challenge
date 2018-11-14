class CreateLineItem < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
    	t.references :order
    	t.integer :quantity, default: 0
    	t.decimal :price, precision: 8, scale: 2, default: 0.0, null: false
    	t.decimal :total, precision: 8, scale: 2, default: 0.0, null: false
    	t.decimal :discount_total, precision: 8, scale: 2, default: 0.0, null: false
    	t.timestamps
    end
  end
end
