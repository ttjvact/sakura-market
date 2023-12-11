class CartsController < ApplicationController
    before_action :auth_user!
    def show
        @cart = get_current_cart
    end
    def create
        item_id = params[:item_id]
        item = Item.find(item_id)
        cart = add_cart(item_id)
        redirect_to cart_path
    end

    private
    def get_current_cart
        cart = Cart.where(user_id: current_user).last
        cart = Cart.create(user_id: current_user) unless cart
        cart
    end
    def add_cart(item_id)
        cart = get_current_cart
        detail = CartDetail.find_by(cart_id: cart.id, item_id: item_id)
        CartDetail.create(cart_id: cart.id, item_id: item_id, num: 1) unless detail
        detail.update(num: detail.num + 1) if detail
        cart
    end
end
