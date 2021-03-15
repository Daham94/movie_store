require File.dirname(__FILE__) + '/../spec_helper'

describe UserLevel do
  it "should be valid" do
    UserLevel.new.should be_valid
  end
end
