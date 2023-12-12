class OrderController < ApplicationController
    before_action :auth_user!
    def index
        @cart 
    end
end
