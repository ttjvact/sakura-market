class OrderController < ApplicationController
    before_action :auth_user!
    before_action :get_current_cart

    def index
        @addresses = current_user.addresses
    end

    def create
    end
end
