class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :user #creator of the ticket
  has_many :updates
  has_many :users, through: :updates #users who have submitted updates to the tickets
  accepts_nested_attributes_for :project

  validates :title, presence: true
  validates :description, presence: true

  scope :order_by_alpha, -> {left_joins(:updates).group(:id).order('desc')}

  def ticket_and_project
   "#{title} - #{project.name}"
  end
end
