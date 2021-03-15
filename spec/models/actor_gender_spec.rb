require File.dirname(__FILE__) + '/../spec_helper'

describe ActorGender do
  it "should be valid" do
    ActorGender.new.should be_valid
  end
end
