class ReviewController < ApplicationController  
    def submit_review
        rest_id = params[:id]
        @restaurant = Restaurant.find(rest_id)
        @review = Review.create!(review_params)
        flash[:notice] = "This review was successfully created."
        redirect_to restaurant_path
      end
  end