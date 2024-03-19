class Restaurant < ApplicationRecord
    belongs_to :city
    belongs_to :restaurateur
    has_many :bookings
end
