class Restaurant < ApplicationRecord
    belongs_to :admin
    has_many :favorites, dependent: :destroy

    validates :restaurant_name, presence: true

    belongs_to :admin
    has_one_attached :image
    has_many :comments
    has_many :reservations
  end
