class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :number, presence: true
  validates :date, presence: true
  validates :time, presence: true

end
