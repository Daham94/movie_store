require 'rails_helper'

RSpec.describe Review, type: :model do
  before(:each) do
    @review=Review.create!(rating: "5", comment: "good...")
  end

  describe "validations" do
    it "rating should be presence" do
      @review.rating=nil
      expect(@review).to_not be_valid
    end
    it "comment should be presence" do
      @review.comment=nil
      expect(@review).to_not be_valid
    end
  end
end
