class CreateWishesTable < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.text :wishes
      t.integer :gift_id
      
      t.timestamps
    end
  end
end
