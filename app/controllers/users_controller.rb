class UsersController < ApplicationController
    before_action :auth_user, only: [:show]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_permit)
        if @user.save
            redirect_to users_path
        end
    end

    def show
        @user = User.find(current_user.id)
    end

    private
    def user_permit
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
