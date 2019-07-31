class BuyersController < ApplicationController
    before_action :authorized

    def show
        @buyer = Buyer.find(params[:id])
    end

    def new 
        @buyer = Buyer.new 
        @item = Item.find(params[:id])
        @seller = Seller.find_by(item_id: @item.id)
    end

    def create
        @buyer = Buyer.create(buyer_params)
        @seller = Seller.find_by(params[:item_id])
        @seller.delete
        redirect_to buyer_path(@buyer.id)
    end

    private

    def buyer_params
        params.require(:buyer).permit(:user_id, :item_id)
    end

end
