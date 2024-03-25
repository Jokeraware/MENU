class Restaurant < ApplicationRecord
    belongs_to :admin

    validates :restaurant_name, presence: true

    has_one_attached :image
  end
