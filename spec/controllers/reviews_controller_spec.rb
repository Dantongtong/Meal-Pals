require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
    
    describe "create" do
      it "create a review" do   
        # @restaurant = Restaurant.create!(name: 'Ramen', rating: 'Good', details: 'Japanese food')
        # Restaurant.stub(:find).with(1).and_return( @restaurant)
        request.session[:user_id] = 1
        request.session[:restaurant_id] = 1
        count = Review.count
        post :create, {review: { rating: 1, comment: 'Bad food.'}}
        expect(Review.count).to eql(count+1)
        expect(response).to redirect_to(restaurant_path(1))

        end
    end
end

