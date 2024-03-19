class City < ApplicationRecord
    has_many :users
    has_many :restaurants
    has_many :restaurateurs

end
