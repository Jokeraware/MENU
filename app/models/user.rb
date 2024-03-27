class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Entrez une adresse email valide." }

     has_one_attached :avatar
     has_many :comments
     has_many :reservations
     has_many :favorites, dependent: :destroy
     after_create :welcome_send

     def welcome_send
       UserMailer.welcome_email(self).deliver_now
     end


end
