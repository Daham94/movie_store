require 'rails_helper'

RSpec.describe MovieStock, type: :model do
  before(:each) do
    @movie_stock=MovieStock.create!(is_rented: "false", inventory_id: "1")
  end

  describe "validations" do
    it "is_rented should be presence" do
      @movie_stock.is_rented=nil
      expect(@movie_stock).to_not be_valid
    end
    it "inventory_id should be presence" do
      @movie_stock.inventory_id=nil
      expect(@movie_stock).to_not be_valid
    end
  end
end
