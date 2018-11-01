class Trip < ActiveRecord::Base
  belongs_to :user
  validates :name, :location, :description, presence: true
  has_many :attends
  has_many :attendees, through: :attends, source: :user 
  has_many :users, through: :attends
end
