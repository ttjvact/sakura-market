class ItemController < ApplicationController
  def home
    @items = Item.paginate(page: params[:page])
  end
end
