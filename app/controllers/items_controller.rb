class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id]) # ITEM not ITEMS we are referring to the model name!!!!!
  end
end
