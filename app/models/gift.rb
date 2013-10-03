class Gift < ActiveRecord::Base
  has_many :wishes 
  
  def pending_elements
    total = quantity.to_i - self.wishes.count 
    total < 0 ? 0 : total
  end
  
  def already_gifted?
    pending_elements < 1
  end
end