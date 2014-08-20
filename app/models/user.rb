class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token


  has_many :tours, foreign_key: 'creator_id'
  has_many :comments
  has_many :recommendations
  has_many :votes 
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
  validates :username, presence: true, length: {in: 2...17}
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: {minimum: 6}
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
