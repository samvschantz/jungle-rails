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

    #must use create because users will have to be saved in database to accurately test
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

      it "requires a password over 6 characters in length" do
      user = User.new(
        name: "Sam",
        email: "samvschantz@gmail.com",
        password: "pswrd",
        password_confirmation: "pswrd"
        )
      user.valid?
      expect(user.errors.messages).to include({:password=>["is too short (minimum is 6 characters)"]})
    end

  end
end
