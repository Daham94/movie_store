require File.dirname(__FILE__) + '/../spec_helper'

describe Actor do
  it "should be valid" do
    Actor.new.should be_valid
  end
end
