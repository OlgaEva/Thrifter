class Buyer < ApplicationRecord
    has_many :sellers
    has_many :items, through: :sellers

end