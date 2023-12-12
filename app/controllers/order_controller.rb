class OrderController < ApplicationController
    before_action :auth_user!
    before_action :get_current_cart

    def index
        @addresses = current_user.addresses
    end

    def create
        order = Order.new
        order.address_id = params[:order_info][:address_id]
        order.payment_id = params[:order_info][:payment_id]
        order.cart_id = @cart.id
        order.user_id = current_user.id
        order.shipping_fee = @cart.shipping_fee
        order.cash_fee = @cart.cash_fee
        order.subtotal = @cart.item_cost
        order.total =  order.shipping_fee + order.cash_fee + order.subtotal
        order.total_tax = (order.total * 1.08).floor
        order.save
        redirect_to order_complete_path(order)
    end

    def complete
        @order = Order.find_by(id: params[:id])
    end
end
