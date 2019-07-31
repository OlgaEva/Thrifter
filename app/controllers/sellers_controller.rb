class SellersController < ApplicationController

    def delete
        @seller = Seller.find_by(item_id)
        @seller.delete 
    end
end
