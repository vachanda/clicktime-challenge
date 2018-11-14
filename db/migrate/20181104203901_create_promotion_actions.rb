class CreatePromotionActions < ActiveRecord::Migration[5.0]
  def change
    create_table :promotion_actions do |t|
    	t.references :promotion
    	t.string :type
    	t.text :preferences
    	
    	t.timestamps
    end
  end
end
