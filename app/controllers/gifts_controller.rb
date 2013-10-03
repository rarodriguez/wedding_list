class GiftsController < ApplicationController
  def index  
    @gifts = Gift.all
    @menu_item = GIFT_LIST
  end
end