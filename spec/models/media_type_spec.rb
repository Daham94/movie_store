require File.dirname(__FILE__) + '/../spec_helper'

RSpec.describe MediaType, type: :model do
  before(:each) do
    @media_type=MediaType.create!(name: "Blueray")
  end

  describe "validations" do
    it "name should be presence" do
      @media_type.name=nil
      expect(@media_type).to_not be_valid
    end
  end

  describe "when media_type is unique" do
    it "should be valid" do
      duplicate_media_type = @media_type.dup
      expect(@media_type).to be_valid
    end
  end
end

describe MediaType do
  it "should be valid" do
    MediaType.new.should be_valid
  end
end
