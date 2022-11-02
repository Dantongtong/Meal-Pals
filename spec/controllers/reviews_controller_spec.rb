require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
    
    describe "create" do
      it "create a review" do   
        @restaurant = Restaurant.create!(name: 'Ramen', rating: 'Good', details: 'Japanese food') 
        Restaurant.stub(:find).with(1).and_return( @restaurant)
        expect {
            post :create, {review: {restaurant_id: 1, user_id: 1, rating: 1, comment: 'Bad food.'}, :session => {:user_id => 1, :restaurant_id => 1}}
        }.to change(Review, :count).by(1)
        end
    end
end

