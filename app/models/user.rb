class User < ActiveRecord::Base
	has_many :tours, foreign_key: 'creator_id'
	has_many :comments
  before_save :email_convert
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
  validates :username, presence: true, length: {in: 2...17}
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: {minimum: 6}
  has_secure_password

  def email_convert
    email.downcase!
  end
end
