class User < ActiveRecord::Base
  attr_accessor :remember_token
  before_save {self.email = email.downcase}
  before_create :remember
  validates :name, presence: true, length: {minimum: 4}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true, length: {minimum: 8}

  has_many :posts

  def authenticated?(token)
    Digest::SHA1.hexdigest(remember_digest) == (token)
  end

  def User.new_token
    Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64(20).to_s)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, remember_token)
  end
end
