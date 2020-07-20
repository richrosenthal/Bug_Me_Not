class User < ApplicationRecord
  has_many :updates
  has_many :updated_tickets, through: :updates, source: :ticket
  has_many :tickets #that the user created

  has_secure_password #for the bcrypt gem
  validates :username, presence: true #simple validation
  validates :username, uniqueness: true
end
