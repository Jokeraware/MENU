class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :city_id, presence: true
         validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Please enter a valid email adress" }

         has_one_attached :image
         has_one :restaurant 
         belongs_to :city

end
