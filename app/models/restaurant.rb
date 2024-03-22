class Restaurant < ApplicationRecord
    belongs_to :city
    belongs_to :admin, class_name: "User"

    validates :restaurant_name, presence: true
  end 
