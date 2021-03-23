require 'rails_helper'

RSpec.describe Customer, type: :model do
  before(:each) do
    @customer=Customer.create!(name: "Test Name", email: "email@gmail.com",
                        password: "foobar", is_user: "false")
  end

  describe "validations" do
    it "name should be presence" do
      @customer.name=nil
      expect(@customer).to_not be_valid
    end
    it "email should be presence" do
      @customer.email=nil
      expect(@customer).to_not be_valid
    end
    it "password should be presence" do
      @customer.password=nil
      expect(@customer).to_not be_valid
    end
    it "is_user should be false" do
      @customer.password=false
      expect(@customer).to be_valid
    end
  end

  describe "maximum length validation" do
    it "name should not be longer than 50 " do
      @customer.name="j"*51
      expect(@customer).to_not be_valid
    end
    it "email should not be too long " do
      @customer.email="a" * 244 + "@example.com"
      expect(@customer).to_not be_valid
    end
  end
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@example,com user_at_foo.org user.name@example.
                  foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
            @customer.email = invalid_address
            expect(@customer).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                  first.last@foo.jp alice+bob@baz.cn]
      addresses.each do |valid_address|
            @customer.email = valid_address
            expect(@customer).to be_valid
      end
    end
  end

  describe "when email is unique" do
    it "should be valid" do
      duplicate_customer = @customer.dup
      expect(@customer).to be_valid
    end
  end

  describe "minimum password length validation" do
    it "should not be blank" do
      @customer.password=" "*6
      expect(@customer).to_not be_valid
    end
    it "should not be too short" do
      @customer.password="a" * 5
      expect(@customer).to_not be_valid
    end
  end
end
