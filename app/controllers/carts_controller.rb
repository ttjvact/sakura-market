class CartsController < ApplicationController
    before_action :auth_user
    before_action :get_current_cart
    def show
    end
    def create
        item_id = params[:item_id]
        item = Item.find(item_id)
        add_cart(item_id)
        redirect_to cart_path
    end

    private
    def add_cart(item_id)
        detail = CartDetail.find_by(cart_id: @cart.id, item_id: item_id)
        CartDetail.create(cart_id: @cart.id, item_id: item_id, num: 1) unless detail
        detail.update(num: detail.num + 1) if detail
    end
end
