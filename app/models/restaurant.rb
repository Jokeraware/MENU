class Restaurant < ApplicationRecord
    #belongs_to :city
    belongs_to :admin

    validates :restaurant_name, presence: true
    #validates :city_id, presence: true
    #validates :admin_id, presence: true

    has_one_attached :image
  end
