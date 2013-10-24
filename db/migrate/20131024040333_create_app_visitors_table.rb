class CreateAppVisitorsTable < ActiveRecord::Migration
  def change
    create_table :app_visitors do |t|
      t.string :user_ip
      t.datetime :visit_date
      t.string :browser
      t.string :platform
      t.string :os
      t.datetime :first_request
      t.datetime :last_request
    end
  end
end
