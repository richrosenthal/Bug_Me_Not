class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :user #creator of the ticket
  has_many :updates
  has_many :users, through: :updates #users who have submitted updates to the tickets

end
