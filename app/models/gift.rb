class Gift < ActiveRecord::Base
  def pending_elements
    total = quantity.to_i - total_gifted.to_i 
    total < 0 ? 0 : total
  end
end