class ItemsController < ApplicationController
    before_action :authorized 

    def index 
        #@sellers = Seller.all

        if params[:query]

            # @items = Item.where(name: params[:query])
            # @sellers = Seller.where("name LIKE ?", "%#{params[:query]}%")
            # @sellers = Seller.where("name LIKE ?","%#{params[:query]}%")  
            @sellers = Seller.all.select { |seller| seller.item.name.downcase.include?(params[:query].downcase)  }
          else
            @sellers = Seller.all
          end

    end

    def show
        find_item
    end

    def new 
        @item = Item.new 
        @seller = Seller.new 
    end

    def create
        @item = Item.create(item_params)
        @seller = Seller.create(item_id: @item.id, user_id: @user_id)
        if @item.valid? && @seller.valid?
            redirect_to item_path(@item.id)
        else
            flash[:errors] = @item.errors.full_messages
            redirect_to new_item_path
        end
    end

    def edit
        find_item
    end

    def update
        find_item
        @item.update(item_params)
        if @item.valid?
            redirect_to edit_item_path
        else
            flash[:errors] = @item.errors.full_messages 
            redirect_to item_path(@item.id)
        end
    end

    def destroy
        find_item
        @seller = Seller.find_by(item_id: @item.id)
        @seller.destroy
        @item.destroy 
        redirect_to items_path
    end

    private

    def find_item
        @item = Item.find(params[:id])
    end

    def item_params
        params.require(:item).permit(:name, :price, :img_url, :description, :category)
    end

    def seller_params
        params.require(:seller).permit(:user_id, :item_id)
    end
end
