class ConfirmationsController < ApplicationController
  def create
    @confirmation = Confirmation.new(confirmation_params)
    @confirmation.message = @confirmation.message.strip
    @confirmation.user_ip = request.remote_ip
    @confirmation.save
  end
  
  private
  # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def confirmation_params
      params.require(:confirmation).permit(:family_name, :number_of_guests, :message)
    end
end