require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "requires password and password confirmation to match" do
      user = User.new(
        name: "Sam",
        email: "samvschantz@gmail.com",
        password: "grugglydunk",
        password_confirmation: "snuffalupagus"
        )
      user.valid?
      expect(user.errors.messages).to include({:password_confirmation => ["doesn't match Password"]})
    end

    it "requires user to have a password & confirmation" do
      user = User.new(
        name: "Sam",
        email: "samvschantz@gmail.com",
        password: "password",
        password_confirmation: nil
        )
      user.valid?
      expect(user.errors.messages).to include(@messages={:password_confirmation=>["can't be blank"]})
    end

    it "requires an email" do
      user = User.new(
        name: "Sam",
        email: nil,
        password: "password",
        password_confirmation: "password"
        )
      user.valid?
      expect(user.errors.messages).to include({:email=>["can't be blank"]})
    end

    it "requires a name" do
      user = User.new(
        name: nil,
        email: "samvschantz@gmail.com",
        password: "password",
        password_confirmation: "password"
        )
      user.valid?
      expect(user.errors.messages).to include({:name=>["can't be blank"]})
    end

    it "requires a unique email" do
      user1 = User.create(
        name: "Sam",
        email: "samvschantz@gmail.com",
        password: "password",
        password_confirmation: "password"
        )
      user2 = User.create(
        name: "Sam",
        email: "samvschantz@gmail.com",
        password: "password",
        password_confirmation: "password"
        )
      expect(user2.errors.messages).to include({:email=>["has already been taken"]})
    end
  end
end
