require File.dirname(__FILE__) + '/../spec_helper'

RSpec.describe Genre, type: :model do
  before(:each) do
    @genre=Genre.create!(name: "Test Name")
  end

  describe "validations" do
    it "name should be presence" do
      @genre.name=nil
      expect(@genre).to_not be_valid
    end
  end

  describe "when genre is unique" do
    it "should be valid" do
      duplicate_genre = @genre.dup
      expect(@genre).to be_valid
    end
  end
end

describe Genre do
  it "should be valid" do
    Genre.new.should be_valid
  end
end
