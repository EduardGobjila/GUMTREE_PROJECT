class ItemsController < ApplicationController
  def index
    if params[:query].present?
      @items = Item.where(name: params[:query])
     else

    @items = Item.all
     end
      
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @items = Item.where(sql_query, query: "%#{params[:query]}%")
    else
      @items = Item.all
    end


  end

  def show
    @item = Item.find(params[:id])
    @user_id = @item.user_id
    @user = User.find(@user_id)

    if @item.geocode
    @geocode = @item.geocode
    @markers =
      [{
      lat: @geocode[0],
      lng: @geocode[1]
  }]
    end


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
      redirect_to item_path(@item)
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
    params.require(:item).permit(:name, :description, :price, :category, :location, photos: [])
  end
end
