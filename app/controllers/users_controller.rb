class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_permit)
        if @user.save
            redirect_to user_path(@user)
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
    def user_permit
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
