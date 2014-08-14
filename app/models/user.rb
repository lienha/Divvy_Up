class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  attr_accessor :name, :email

	has_many :tours, foreign_key: 'creator_id'
	has_many :comments

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
  validates :username, presence: true, length: {in: 2..16}
  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
