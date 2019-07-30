class User < ApplicationRecord

    validates :user_name, presence: true

    has_many :sellers
    has_many :tems, through: :sellers

    has_many :buyers
    has_many :bought_items, through: :buyers, source: :item

end