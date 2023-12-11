class ApplicationController < ActionController::Base
    def auth_user!
        redirect_to login_index_path unless !!session[:user_id]
    end
end
