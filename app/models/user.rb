class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Please enter a valid email adress" }

     after_create :welcome_send
     has_one_attached :avatar
     has_many :comments
     has_many :reservations

     def welcome_send
       UserMailer.welcome_email(self).deliver_now
     end
end
