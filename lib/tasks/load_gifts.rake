require 'csv'
task :load_gift_list => :environment do
  count = 0
  CSV.foreach("imports/lista_regalos.csv") do |row|
    row.inspect
    gift = Gift.new()
    gift.name = row[0]
    gift.quantity = row[1]
    gift.description = row[2]
    # Save the gift
    gift.save!
    
    # Now, check if the gift is already gifted
    gift.wishes << Wish.create(wishes:'') unless row[3].blank?
    count += 1
  end
  puts "Imported #{count} gifts"

end