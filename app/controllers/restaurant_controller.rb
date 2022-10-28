class RestaurantController < ApplicationController
    before_action :force_index_redirect, only: [:index]
  
    def show
      rest_id = params[:id] # retrieve restaurant ID from URI route
      @restaurant = Restaurant.find(rest_id) # look up restaurant by unique ID
      @reviews = Review.where(:restaurant_id => rest_id) 
      @timeslots = Timeslot.where(:restaurant_id => rest_id) 
      # will render app/views/restaurant/show.<extension> by default
    end

    def submit_review
        rest_id = params[:id]
        @restaurant = Restaurant.find(rest_id)
        @review = Review.create!(review_params)
        flash[:notice] = "This review was successfully created."
        redirect_to restaurant_path
      end
  end
  