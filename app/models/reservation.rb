class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user


  validates :date, presence: true
  validates :time, presence: true

end
