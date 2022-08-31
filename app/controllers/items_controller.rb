class ItemsController < ApplicationController
  def index
    @items = Item.all

    @markers = @items.geocoded.map do |item|
      {
      lat: item.latitude,
      lng: item.longitude
    }
    end
  end

  def show
    @item = Item.find(params[:id])
    @user_id = @item.user_id
    @user = User.find(@user_id)

<<<<<<< HEAD
  #   @geocode = @item.geocode
  #   @markers =
  #     {
  #     lat: @geocode[0],
  #     lng: @geocode[1]
  # }
=======
    @geocode = @item.geocode
    @markers =
      {
      lat: @geocode[0],
      lng: @geocode[1]
  }
>>>>>>> 10d83cb3d56ce8eed74e3f05a0ca32a9f126e74c
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

  #  Creating a new card or item --ED, adding image -- RORY
  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to item_path
    else
      render :new, stauts: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path, notice: 'Post was successfully destroyed.', status: :see_other
  end

  private

  #  Using strong Params --ED
  def item_params
    params.require(:item).permit(:name, :description, :price, :category, photos: [])
  end
end
