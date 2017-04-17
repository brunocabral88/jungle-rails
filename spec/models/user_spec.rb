require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new({
      first_name: "Bruno",
      last_name: "Farias",
      email: "bruno@bruno.com",
      password: "123123",
      password_confirmation: "123123"
    })
  end

  describe "Validations" do

    it "should not allow empty first name" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.messages.has_key?(:first_name)).to be true
    end

    it "should not allow empty last name" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.messages.has_key?(:last_name)).to be true
    end

    it "should not allow empty email" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.messages.has_key?(:email)).to be true
    end

    it "password and password confirmation must match" do
      @user.password_confirmation = "adasda"
      @user.save
      expect(@user.errors.messages.has_key?(:password_confirmation)).to be true
    end

    it "password must be at least 6 digits long" do
      @user.password = "123"
      @user.password_confirmation = "123"
      @user.save
      expect(@user.errors.messages.has_key?(:password)).to be true
    end

    it "should not allow duplicated emails" do
      @user.save
      @user2 = User.new({
        first_name: "Second",
        last_name: "User",
        email: "bruno@bruno.com",
        password: "123123",
        password_confirmation: "123123"
      })
      @user2.valid?
      expect(@user2.errors.messages.has_key?(:email)).to be true
    end
  end

  describe ".authenticate_with_credentials" do

    it "should return false for an invalid login/password" do
      @user.save
      authenticated = User.authenticate_with_credentials("bruno@bruno.com","aaaaaa")
      expect(authenticated).to be false
    end

    it "should return true for a valid login/password" do
      @user.save
      authenticated = User.authenticate_with_credentials("bruno@bruno.com","123123")
      expect(authenticated).to be true
    end

    it "should authenticate with uppercase emails" do
      @user.save
      authenticated = User.authenticate_with_credentials("BruNo@bruno.com","123123")
      expect(authenticated).to be true
    end

    it "should authenticate with leading blank spaces in email address" do
      @user.save
      authenticated = User.authenticate_with_credentials("   bruno@bruno.com","123123")
      expect(authenticated).to be true
    end

  end
end
