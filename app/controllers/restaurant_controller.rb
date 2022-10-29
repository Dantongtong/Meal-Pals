class RestaurantController < ApplicationController
    before_action :force_index_redirect, only: [:index]
  
    def show
      rest_id = params[:id] # retrieve restaurant ID from URI route
      @restaurant = Restaurant.find(rest_id) # look up restaurant by unique ID
      @reviews = Review.where(:restaurant_id => rest_id) 
      @timeslots = Timeslot.where(:restaurant_id => rest_id) 
      # will render app/views/restaurant/show.<extension> by default
    end
  end
  