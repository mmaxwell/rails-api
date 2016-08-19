class ItemsController < ApplicationController
  def index
    @items = Item.all
    
    if request.xhr?
      render json: @items
    end
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def new
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    
    if request.xhr?
      render json: @item
    else
      redirect_to @item
    end
  end
  
  private
    def item_params
      params.require(:item).permit(:name)
    end
end
