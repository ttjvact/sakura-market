class ApplicationController < ActionController::Base
    def auth_user!
        redirect_to login_index_path unless !!session[:user_id]
    end

    def current_user
        user_id = session[:user_id]
        user = User.find_by(id: user_id)
        user
    end

    def get_current_cart
        @cart = Cart.where(user_id: current_user.id).last
        @cart = Cart.create(user_id: current_user.id) unless @cart
        @cart
    end
end
