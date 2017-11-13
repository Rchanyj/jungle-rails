class User < ActiveRecord::Base

  has_secure_password

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

end
