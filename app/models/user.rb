class User < ActiveRecord::Base
	has_many :tours, foreign_key: 'creator_id'
	has_many :comments

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
  validates :username, presence: true, length: {in: 2..16}
  has_secure_password
end
