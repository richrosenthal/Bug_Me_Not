class User < ApplicationRecord
  has_many :updates
  has_many :updated_tickets, through: :updates, source: :ticket
  has_many :tickets #that the user created

  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true
end
