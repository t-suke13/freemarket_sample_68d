class OrdersController < ApplicationController
  def new
    @item = Item.find(params[:id])
    @item_image = @item.item_images[0].url
    
  end
end
