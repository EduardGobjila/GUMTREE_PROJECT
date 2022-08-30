class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id]) # ITEM not ITEMS we are referring to the model name!!!!!
  end

  # Edit a new item or card --ED

  def edit
   @item = Item.find(params[:id])
  end

  #  Updating the card
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to root_path
  end

  # Creatin new card --ED
  def new
   @item = Item.new
  end

  #  Creating a new card or item --ED
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user
    if @item.save
      redirect_to items_index_path
    else
      render :new
    end
  end

  private

  #  Using strong Params --ED
  def item_params
    params.require(:items).permit(:name, :description, :price, :category)
  end
end
