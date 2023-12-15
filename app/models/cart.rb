class Cart < ApplicationRecord
    has_many :cart_details
    belongs_to :user
    def item_cost
        cart_details.sum { | detail | detail.num * detail.item.price }
    end

    def item_num
        cart_details.sum { | detail | detail.num }
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
            1000
        end
    end

    def shipping_fee
        item_num
        groups = (item_num.to_f / 5).ceil
        fee = groups * 600
    end
end
