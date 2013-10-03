class HomeController < ApplicationController
  def index
    @menu_item = MAIN
  end
  
  def contact_us
    @menu_item = CONTACT
  end
end