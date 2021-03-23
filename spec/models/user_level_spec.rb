require File.dirname(__FILE__) + '/../spec_helper'

RSpec.describe UserLevel, type: :model do
  before(:each) do
    @user_level=UserLevel.create!(level: "Super")
  end

  describe "validations" do
    it "level should be presence" do
      @user_level.level=nil
      expect(@user_level).to_not be_valid
    end
  end
end

describe UserLevel do
  it "should be valid" do
    UserLevel.new.should be_valid
  end
end
