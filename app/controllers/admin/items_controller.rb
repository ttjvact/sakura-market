class Admin::ItemsController < ApplicationController
    before_action :auth_admin_user
    def index
        @items = Item.all
    end

    def new
        @item = Item.new
    end

    def edit
        @item = Item.find(params[:id])
    end

    def create
        @item = Item.new(item_permit)
        @item.save
        redirect_to admin_items_path
    end

    def update
        @item = Item.find(params[:id])
        @item.update(item_priority_permit)
        redirect_to admin_items_path
    end

    private
    def item_priority_permit
        params.require(:item).permit(:priority)
    end

    def item_permit
        params.require(:item).permit(:product_name, :product_image, :price, :description, :hidden, :priority)
    end
end
