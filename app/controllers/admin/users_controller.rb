class Admin::UsersController < ApplicationController
    before_action :auth_admin_user
    def index
    
    end
end
