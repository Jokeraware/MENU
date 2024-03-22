class Restaurant < ApplicationRecord
    belongs_to :city, optional: true
    belongs_to :admin, optional: true

    validates :restaurant_name, presence: true
  end
