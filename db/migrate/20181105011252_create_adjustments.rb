class CreateAdjustments < ActiveRecord::Migration[5.0]
  def change
    create_table :adjustments do |t|
    	t.references :promotion_action
    	t.integer :promotable_id
    	t.string  :promotable_type
    	t.boolean :eligible
        t.decimal :amount, precision: 8, scale: 2, default: 0.0, null: false
    	t.timestamps

    	t.index :promotable_id
    end
  end
end
