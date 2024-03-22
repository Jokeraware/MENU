class Restaurant < ApplicationRecord
    belongs_to :city
    

    validates :restaurant_name, presence: true
  end
