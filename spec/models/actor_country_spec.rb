require File.dirname(__FILE__) + '/../spec_helper'

describe ActorCountry do
  it "should be valid" do
    ActorCountry.new.should be_valid
  end
end
