class Restaurant < ApplicationRecord
    belongs_to :admin
    has_many :favorites, dependent: :destroy

    validates :restaurant_name, presence: true

    has_one_attached :image
  end
