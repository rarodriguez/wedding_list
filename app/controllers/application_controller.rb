class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :validate_password
  before_action :store_user_info
  
  def validate_password
    unless params[:clave].blank?
      session[:password] = params[:clave]
    end
    password = session[:password]
    unless password.to_s == 'boda0712'
      redirect_to '/404.html'
    end
  end
  
  def store_user_info
    if session[:user_information]
      visitor = AppVisitor.find(session[:user_information])
      visitor.update_attribute(:last_request, Time.now)
    else
      agent = AgentOrange::UserAgent.new(request.env['HTTP_USER_AGENT'] || '')
      visitor = AppVisitor.create(user_ip: request.remote_ip, visit_date: Time.now, first_request: Time.now, 
                        last_request: Time.now, browser: agent.device.engine.browser, platform: agent.device.platform,
                        os: agent.device.operating_system)
      session[:user_information] = visitor.id 
    end 
  end
  
end
