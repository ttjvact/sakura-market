class ItemsController < ApplicationController
  def home
    @items = Item.where.not(hidden: 1).order(priority: :asc).paginate(page: params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end
end
