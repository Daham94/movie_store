require File.dirname(__FILE__) + '/../spec_helper'

RSpec.describe Actor, type: :model do
  before(:each) do
    @actor=Actor.create!(name: "Test Name", age: "50", actor_gender_id: "1", actor_country_id: "1")
  end

  describe "validations" do
    it "name should be presence" do
      @actor.name=nil
      expect(@actor).to_not be_valid
    end

    it "age should be presence" do
      @actor.age=nil
      expect(@actor).to_not be_valid
    end

    it "gender should be presence" do
      @actor.actor_gender_id=nil
      expect(@actor).to_not be_valid
    end

    it "gender should be presence" do
      @actor.actor_country_id=nil
      expect(@actor).to_not be_valid
    end
  end

  describe "when actor is unique" do
    it "should be valid" do
      duplicate_actor = @actor.dup
      expect(@actor).to be_valid
    end
  end
end

describe Actor do
  it "should be valid" do
    Actor.new.should be_valid
  end
end
