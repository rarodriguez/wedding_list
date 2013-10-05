class CreateConfirmationsTable < ActiveRecord::Migration
  def change
    create_table :confirmations do |t|
      t.string :family_name
      t.integer :number_of_guests
      t.text :message
      t.string :user_ip
      
      t.timestamps
    end
  end
end
