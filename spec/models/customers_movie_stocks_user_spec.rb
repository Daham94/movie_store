require 'rails_helper'

RSpec.describe CustomersMovieStocksUser, type: :model do
  before(:each) do
    @customer_movie_stock_user=CustomersMovieStocksUser.create!(price: "10.0", late_fee: "1",
                        discount: "1", rented_date: "2021-03-01", returned_date: "2021-03-10", movie_stock_id: "1", customer_id: "1", user_id: "1")
  end

  describe "validations" do
    it "price should be presence" do
      @customer_movie_stock_user.price=nil
      expect(@customer_movie_stock_user).to_not be_valid
    end
    it "rented_date should be presence" do
      @customer_movie_stock_user.rented_date=nil
      expect(@customer_movie_stock_user).to_not be_valid
    end
    it "movie_stock_id should be presence" do
      @customer_movie_stock_user.movie_stock_id=nil
      expect(@customer_movie_stock_user).to_not be_valid
    end
    it "customer_id should be presence" do
      @customer_movie_stock_user.customer_id=nil
      expect(@customer_movie_stock_user).to_not be_valid
    end
    it "user_id should be presence" do
      @customer_movie_stock_user.user_id=nil
      expect(@customer_movie_stock_user).to_not be_valid
    end
  end
end
