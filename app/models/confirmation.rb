class Confirmation < ActiveRecord::Base
  validates :family_name, presence: true
  validates :number_of_guests, presence: true, numericality: { only_integer: true, greater_than: 0 } 
end