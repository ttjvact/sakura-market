class Admin::UsersController < ApplicationController
    before_action :auth_admin_user
    def index
        @users = User.all
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if user_permit[:password].blank?
            user_permit.delete(:password)
            user_permit.delete(:password_confirmation)
          end
        @user.update(user_permit)
        redirect_to admin_users_path
    end

    private
    def user_permit
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
