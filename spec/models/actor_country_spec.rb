require File.dirname(__FILE__) + '/../spec_helper'

RSpec.describe ActorCountry, type: :model do
  before(:each) do
    @actor_country=ActorCountry.create!(name: "Test Name")
  end

  describe "validations" do
    it "name should be presence" do
      @actor_country.name=nil
      expect(@actor_country).to_not be_valid
    end
  end

  describe "when country is unique" do
    it "should be valid" do
      duplicate_country = @actor_country.dup
      expect(@actor_country).to be_valid
    end
  end
end
describe ActorCountry do
  it "should be valid" do
    ActorCountry.new.should be_valid
  end
end
