class ApplicationController < ActionController::Base
    def create
        @item_id = params[:item_id]
        
    end
end
