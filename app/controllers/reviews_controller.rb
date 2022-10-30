class ReviewsController < ApplicationController  
    def create
        rest_id = session[:rest_id]
        user_id = session[:user_id]
        @restaurant = Restaurant.find(rest_id)
        @review = Review.create!(review_params)
        flash[:notice] = "This review was successfully created."
        redirect_to restaurant_path
      end

    def review_params
        params.require(:review).permit(:rating, :content)
    end
  end