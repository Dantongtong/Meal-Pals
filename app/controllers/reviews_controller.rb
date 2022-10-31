class ReviewsController < ApplicationController  
  def create
    restaurant_id = session[:restaurant_id]
    user_id = session[:user_id]
    rv = review_params
    rv['restaurant_id'] = restaurant_id
    rv['user_id'] = user_id
    @restaurant = Restaurant.find(restaurant_id)
    @review = Review.create!(rv)
    if @review.save
      flash[:notice] = "This review was successfully created."
      redirect_to restaurant_path(restaurant_id)
    else
      render 'show'
    end
  end

  def review_params
      params.require(:review).permit(:rating, :comment)
  end
end