class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Entrez une adresse email valide." }
        
         has_many :restaurants #adminReservation
         has_many :reservations, through: :restaurants #adminReservation
         
end
