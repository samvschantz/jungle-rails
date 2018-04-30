class User < ActiveRecord::Base
  has_secure_password
  validates :password_confirmation, presence: { on: :create }
  validates :password, length: { minimum: 6 }
  validates :email, uniqueness: true , presence: { on: :create }
  validates :name, presence: { on: :create }


  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    if user && user.match_password(password)
      return @user
    else
      return nil
    end
end
