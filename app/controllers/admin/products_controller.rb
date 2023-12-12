class Admin::ProductsController < ApplicationController
    before_action :auth_admin_user
end
