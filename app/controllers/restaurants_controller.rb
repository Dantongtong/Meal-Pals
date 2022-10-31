class RestaurantsController < ApplicationController
  #GET /restaurants/1
  def index
    @restaurants = Restaurant.all
  end

  def show
    restaurant_id = params[:id] # retrieve restaurant ID from URI route
    session[:restaurant_id] = restaurant_id
    @restaurant = Restaurant.find(restaurant_id) # look up restaurant by unique ID
    @reviews = Review.where(:restaurant_id => restaurant_id) 
    @timeslots = Timeslot.where(:restaurant_id => restaurant_id) 
    # will render app/views/restaurant/show.<extension> by default
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.create!(restaurant_params)
    redirect_to root_url, notice: 'Restaurant was successfully created.'
  end

  # PATCH/PUT /restaurants/1
  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update_attributes!(restaurant_params)
    redirect_to root_url, notice: 'Restaurant was successfully updated.'
  end

  # DELETE 
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to root_url, notice: 'Restaurant was successfully destroyed.'
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :rating, :address, :details)
    end
end
