class Restaurateur < ApplicationRecord
    belongs_to :city
    belongs_to :restaurant
end
