require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user=User.create!(name: "Test Name", email: "email@gmail.com",
                        password: "foobar", password_confirmation: "foobar",
                          user_level_id: "1")
  end

  describe "validations" do
    it "name should be presence" do
      @user.name=nil
      expect(@user).to_not be_valid
    end
    it "email should be presence" do
      @user.email=nil
      expect(@user).to_not be_valid
    end
    it "password should be presence" do
      @user.password=nil
      expect(@user).to_not be_valid
    end
  end

  describe "maximum length validation" do
    it "name should not be longer than 50 " do
      @user.name="j"*51
      expect(@user).to_not be_valid
    end
    it "email should not be too long " do
      @user.email="a" * 244 + "@example.com"
      expect(@user).to_not be_valid
    end
  end
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@example,com user_at_foo.org user.name@example.
                  foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
            @user.email = invalid_address
            expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                  first.last@foo.jp alice+bob@baz.cn]
      addresses.each do |valid_address|
            @user.email = valid_address
            expect(@user).to be_valid
      end
    end
  end

  describe "when email is unique" do
    it "should be valid" do
      duplicate_user = @user.dup
      expect(@user).to be_valid
    end
  end

  describe "minimum password length validation" do
    it "should not be blank" do
      @user.password=" "*6
      expect(@user).to_not be_valid
    end
    it "should not be too short" do
      @user.password=@user.password_confirmation="a" * 5
      expect(@user).to_not be_valid
    end
  end
end
