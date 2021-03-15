require File.dirname(__FILE__) + '/../spec_helper'

describe ContentRating do
  it "should be valid" do
    ContentRating.new.should be_valid
  end
end
