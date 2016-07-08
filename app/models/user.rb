class User < ActiveRecord::Base
  before_save {self.email = email.downcase}
  before_create :save_remember_token
  validates :name, presence: true, length: {minimum: 4}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true, length: {minimum: 8}

  private
    def save_remember_token
      self.remember_digest = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64(20).to_s)
    end
end
