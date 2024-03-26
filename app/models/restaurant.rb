class Restaurant < ApplicationRecord
    validates :restaurant_name, presence: true

    belongs_to :admin
    has_one_attached :image
    has_many :comments
  end
