class User < ApplicationRecord

    validates :user_name, :password, presence: true, uniqueness: true

    has_many :sellers
    has_many :items, through: :sellers

    has_many :buyers
    has_many :bought_items, through: :buyers, source: :item

    has_secure_password
end