class CreateProduct < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
    	t.string :name
    	t.string :category
    	t.text :description
    	t.decimal :price, precision: 8, scale: 2, default: 0.0, null: false
    	t.timestamps
    end
  end
end
