class ItemsController < ApplicationController
  def index
    @items = Item.all
    
    # If we're fetching via AJAX,
    # render all items as JSON
    
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
    # Create and save the item
    # This is the same regardless of how we're hitting
    # this route.
    @item = Item.new(item_params)
    @item.save
    
    # If we're hitting via AJAX, render the item as JSON,
    # otherwise redirect to the item's page
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
