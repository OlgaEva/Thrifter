class SellersController < ApplicationController
    before_action :authorized

    def delete
        @seller = Seller.find_by(item_id)
        @seller.delete 
    end
end
