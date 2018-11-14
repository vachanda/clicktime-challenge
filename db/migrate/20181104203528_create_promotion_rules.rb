class CreatePromotionRules < ActiveRecord::Migration[5.0]
  def change
    create_table :promotion_rules do |t|
    	t.references :promotion
    	t.string :type
    	t.text :preferences
    	
    	t.timestamps
    end
  end
end
