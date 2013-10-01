class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name
      t.integer :quantity
      t.string :description
      t.integer :total_gifted
      t.boolean :completed
    end
  end
end
