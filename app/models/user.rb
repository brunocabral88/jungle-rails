class User < ActiveRecord::Base
  before_validation { self.email = self.email.downcase if self.email }
  validates :first_name, :last_name, :email, presence: true
  validates :password,:password_confirmation, length: { minimum: 6 }
  validates :email, uniqueness: true

  has_many :ratings
  
  has_secure_password

  def self.authenticate_with_credentials(email,password)
    user = User.find_by(email: email.downcase.strip)
    if user && user.authenticate(password)
      return user
    else
      return false
    end
  end
end
