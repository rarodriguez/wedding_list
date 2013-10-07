class GiftsController < ApplicationController
  def index  
    @gifts = Gift.order('name').all
    @menu_item = GIFT_LIST
  end
end