class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :date, presence: true
  validates :time, presence: true
  validates :reservation_limit, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
