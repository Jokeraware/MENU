class Restaurant < ApplicationRecord
    belongs_to :city, optional: true

    validates :restaurant_name, presence: true
  end
