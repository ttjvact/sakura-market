class Cart < ApplicationRecord
    has_many :cart_details

    def item_cost
        cart_details.sum { | detail | detail.num * detail.item.price }
    end

    def cash_fee
        fee = case item_cost
        when 0...10000
            300
        when 10000...30000
            400
        when 30000...100000
            600
        else
            10000
        end
    end
end
