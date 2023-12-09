class LoginController < ApplicationController
    def index
    end

    def create
        user = User.find_by(email: params[:login][:email])
        if user&.authenticate(params[:login][:password])
            redirect_to user_path(user)
        end
    end

end
