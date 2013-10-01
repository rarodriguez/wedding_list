class GiftsController < ApplicationController
  def index  
    @gifts = Gift.all
    @menu_item = 2
  end
end