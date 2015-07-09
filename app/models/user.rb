class User < ActiveRecord::Base
  has_many :tweets
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
  validates :email, uniqueness: true, presence: true
end
