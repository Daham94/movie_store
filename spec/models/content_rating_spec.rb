require File.dirname(__FILE__) + '/../spec_helper'

RSpec.describe ContentRating, type: :model do
  before(:each) do
    @content_rating=ContentRating.create!(name: "Test Name")
  end

  describe "validations" do
    it "name should be presence" do
      @content_rating.name=nil
      expect(@content_rating).to_not be_valid
    end
  end

  describe "when name is unique" do
    it "should be valid" do
      duplicate_content_rating = @content_rating.dup
      expect(@content_rating).to be_valid
    end
  end
end

describe ContentRating do
  it "should be valid" do
    ContentRating.new.should be_valid
  end
end
