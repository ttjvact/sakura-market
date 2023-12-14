class LoginController < ApplicationController
    def index
    end

    def create
        user = User.find_by(email: params[:login][:email])
        if user&.authenticate(params[:login][:password])
            session[:user_id] = user.id
            redirect_to users_path
        else
            flash.now[:danger] = 'ログインできませんでした'
            render 'index', status: :unprocessable_entity
        end
    end

    def destroy
        session[:user_id].delete
    end
end
