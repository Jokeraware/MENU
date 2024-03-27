class Restaurant < ApplicationRecord
    validates :restaurant_name, presence: true

    belongs_to :admin
    has_one_attached :image
    has_many :comments
    has_many :reservations
    belongs_to :city

    validates :city, presence: true
  end
