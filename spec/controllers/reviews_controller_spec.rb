require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
    
  describe "create" do
    it "create a review" do   
      request.session[:user_id] = 1
      request.session[:restaurant_id] = 1
      count = Review.count
      post :create, {review: { rating: 1, comment: 'Bad food.'}}
      expect(Review.count).to eql(count+1)
      expect(response).to redirect_to(restaurant_path(1))

    end

    it "empty review" do
      request.session[:user_id] = 1
      request.session[:restaurant_id] = 1
      count = Review.count
      post :create, {review: { rating: 1, comment: ''}}
      expect(Review.count).to eql(count)
      expect(response).to redirect_to(restaurant_path(1))
    end


    it "fail to create a new review" do
      class Fake
        attr_accessor :save
      end
        
      request.session[:user_id] = 1
      request.session[:restaurant_id] = 1
      count = Review.count
      @fake_res = Fake.new
      @fake_res.save = false
      Review.stub(:create!).with({"rating" => "1", "comment" => 'Bad food.', "user_id" => 1, "restaurant_id" => 1}).and_return(@fake_res)
      post :create, {review: { rating: 1, comment: 'Bad food.'}}  
      expect(Review.count).to eql(count)
      expect(response).to redirect_to(restaurant_path(1))
    end
  end
end

