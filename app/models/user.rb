class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  validates :password,:password_confirmation, length: { minimum: 6 }

  has_many :ratings
  
  has_secure_password
end
