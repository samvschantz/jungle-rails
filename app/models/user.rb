class User < ActiveRecord::Base
  has_secure_password
  validates :password_confirmation, presence: { on: :create }
  validates :password, length: { minimum: 6 }
  validates :email, uniqueness: true , presence: { on: :create }
  validates :name, presence: { on: :create }


  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
