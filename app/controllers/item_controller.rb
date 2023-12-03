class ItemController < ApplicationController
  def home
    @items = Item.paginate(page: params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end
end
