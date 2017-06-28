class User < ApplicationRecord
  has_many :posts
  before_save {self.email = email.downcase}
  has_secure_password
  validates :email, presence: true, uniqueness:true
end
