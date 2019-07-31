class BuyersController < ApplicationController

    def new 
        @buyer = Buyer.new 
        @item = Item.find(params[:id])
        @seller = Seller.find_by(item_id: @item.id)
    end

    def create
        @buyer = Buyer.create(buyer_params)
        @seller = Seller.find_by(params[:item_id])
        @seller.delete
        redirect_to items_path
    end

    def show
        
        end

    private

    def buyer_params
        params.require(:buyer).permit(:user_id, :item_id)
    end
    
end
