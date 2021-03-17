require File.dirname(__FILE__) + '/../spec_helper'

describe MediaType do
  it "should be valid" do
    MediaType.new.should be_valid
  end
end
