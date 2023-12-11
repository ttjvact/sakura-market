class AddressesController < ApplicationController
    before_action :auth_user!
    def new
        @address = Address.new
    end

    def create
        address = Address.new(address_permit)
        postal_code = "#{params[:postal_code1]}#{params[:postal_code2]}"
        address.postal_code = postal_code 
        address.user_id = current_user.id
        address.save
        redirect_to user_path(current_user)
    end

    private
    def address_permit
        params.require(:address).permit(:prefecture, :city, :town, :building)
    end
end
