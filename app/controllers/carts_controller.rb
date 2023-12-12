class CartsController < ApplicationController
    before_action :auth_user!
    def show
        cart_id = params[:id]
        @cart = Cart.find(cart_id)
        @item = Item.find(@cart.cart_detail[0].item_id)
    end
    def create
        item_id = params[:item_id]
        @item = Item.find(item_id)
        @cart = Cart.create
        CartDetail.create(cart_id: @cart.id, item_id: item_id)
        redirect_to cart_path(@cart)
    end
end
