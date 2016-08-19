class ItemsController < ApplicationController
  def index
    @items = Item.all
    
    respond_to do | format |
      # format html requests normally
      format.html
      # for json requests, we'll use the built in serializer
      format.json { render json: @items }
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
    
    respond_to do | format |
      # format html requests normally
      format.html
      # for json requests, we'll use the built in serializer
      format.json { render json: @item }
    end
  end
  
  private
    def item_params
      params.require(:item).permit(:name)
    end
end
