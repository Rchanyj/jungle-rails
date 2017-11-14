class User < ActiveRecord::Base

  has_secure_password

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user_email = email.strip.downcase
    User.update_all('email = LOWER(email)')
    @user = User.find_by_email(user_email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

end
