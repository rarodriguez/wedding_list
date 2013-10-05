class ConfirmationsController < ApplicationController
  def create
    confirmation = Confirmation.new
    confirmation.family_name = params[:name]
    confirmation.number_of_guests = params[:count]
    confirmation.message = params[:message]
    confirmation.save!
  end
  
end