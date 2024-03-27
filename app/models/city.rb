class City < ApplicationRecord
    has_many :restaurants
    validates :city_name, presence: true
end
