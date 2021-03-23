require File.dirname(__FILE__) + '/../spec_helper'

RSpec.describe ActorGender, type: :model do
  before(:each) do
    @actor_gender=ActorGender.create!(gender: "Test Name")
  end

  describe "validations" do
    it "gender should be presence" do
      @actor_gender.gender=nil
      expect(@actor_gender).to_not be_valid
    end
  end

  describe "when gender is unique" do
    it "should be valid" do
      duplicate_gender = @actor_gender.dup
      expect(@actor_gender).to be_valid
    end
  end
end

describe ActorGender do
  it "should be valid" do
    ActorGender.new.should be_valid
  end
end
