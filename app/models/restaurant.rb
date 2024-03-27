class Restaurant < ApplicationRecord
    validates :restaurant_name, presence: true

    belongs_to :admin
    has_one_attached :image
    has_many :comments
    has_many :reservations
    has_many :favorites
  end
