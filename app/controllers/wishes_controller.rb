class WishesController < ApplicationController
  def create
    gift = Gift.find(params[:id])
    # create the best wishes detail
    wish = Wish.new(wishes:params[:best_wishes].to_s.strip)
    wish.gift = gift
    wish.save!
    @gifts = Gift.all
  end
  
  def index
    @wishes = Wish.where("wishes != ''").all
    @wishes += Confirmation.where("message != ''").all
    @menu_item = WISHES_LIST
  end
end