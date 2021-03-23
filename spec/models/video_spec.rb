require 'rails_helper'

RSpec.describe Video, type: :model do
  before(:each) do
    @video=Video.create!(title: "Movie Name", description: "Lorem ipsum, or lipsum as it is sometimes known...",
                        thumbnail: "1.jpg", released_date: "2020-11-03", rating: "5.0", content_rating_id: "1")
  end

  describe "validations" do
    it "title should be presence" do
      @video.title=nil
      expect(@video).to_not be_valid
    end
    it "description should be presence" do
      @video.description=nil
      expect(@video).to_not be_valid
    end
    it "thumbnail should be presence" do
      @video.thumbnail=nil
      expect(@video).to_not be_valid
    end
    it "released_date should be presence" do
      @video.released_date=nil
      expect(@video).to_not be_valid
    end
    it "content_rating_id should be presence" do
      @video.content_rating_id=nil
      expect(@video).to_not be_valid
    end
  end
end
