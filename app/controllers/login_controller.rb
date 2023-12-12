class LoginController < ApplicationController
    def index
    end

    def create
        user = User.find_by(email: params[:login][:email])
        if user&.authenticate(params[:login][:password])
            session[:user_id] = user.id
            redirect_to users_path
        end
    end
end
