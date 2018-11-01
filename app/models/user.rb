class User < ActiveRecord::Base
  has_secure_password
  has_many :trips
  has_many :attends
  has_many :attending, through: :attends, source: :trip
  validates :first_name, :last_name, :email, presence: true
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false }, format: {with: EMAIL_REGEX}
  validates :password, :presence => { :minimum => 8}
end
