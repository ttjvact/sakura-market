class CartsController < ApplicationController
    before_action :auth_user!
    def show
        @cart = get_current_cart
    end
    def create
        item_id = params[:item_id]
        @item = Item.find(item_id)
        cart = get_current_cart
        CartDetail.create(cart_id: cart.id, item_id: item_id)
        redirect_to cart_path
    end

    private
    def get_current_cart
        cart = Cart.where(user_id: current_user).last
        cart = Cart.create(user_id: current_user) unless cart
        cart
    end
end
