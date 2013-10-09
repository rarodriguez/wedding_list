class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :validate_password
  
  def validate_password
    unless params[:clave].blank?
      session[:password] = params[:clave]
    end
    password = session[:password]
    unless password.to_s == 'boda0712'
      redirect_to '/404.html'
    end
  end
  
end
