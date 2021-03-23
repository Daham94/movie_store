require 'rails_helper'

RSpec.describe Inventory, type: :model do
  before(:each) do
    @inventory=Inventory.create!(price: "10.0", total_copies: "5",
                        barcode_no: "asdf1234", movie_stock_id: "1", video_id: "1")
  end

  describe "validations" do
    it "price should be presence" do
      @inventory.price=nil
      expect(@inventory).to_not be_valid
    end
    it "total_copies should be presence" do
      @inventory.price=nil
      expect(@inventory).to_not be_valid
    end
    it "barcode_no should be presence" do
      @inventory.barcode_no=nil
      expect(@inventory).to_not be_valid
    end
    it "movie_stock_id should be presence" do
      @inventory.movie_stock_id=nil
      expect(@inventory).to_not be_valid
    end
    it "video_id should be presence" do
      @inventory.video_id=nil
      expect(@inventory).to_not be_valid
    end
  end
end
