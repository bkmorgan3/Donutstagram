class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  before_save {self.email = email.downcase} #
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness:true, length: {maximum: 50}, format: { with: VALID_EMAIL_REGEX }
  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 20}
end
