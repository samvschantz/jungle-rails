class User < ActiveRecord::Base
  has_secure_password
  validates :password_confirmation, presence: { on: :create }
  validates :email, uniqueness: true , presence: { on: :create }
  validates :name, presence: { on: :create }
end
