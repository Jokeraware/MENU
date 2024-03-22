class City < ApplicationRecord
    validates :city_name, presence: true

    has_many :restaurants
end
