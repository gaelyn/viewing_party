class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, presence: true
  validates :password, confirmation: true
  has_secure_password
end
