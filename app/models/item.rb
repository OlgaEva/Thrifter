class Item < ApplicationRecord

    validates :name, :price, :description, presence: true

    has_one :seller
    has_one :user, through: :seller

    has_one :buyer
    has_one :user_who_buys_me, through: :buyer, source: :user

end