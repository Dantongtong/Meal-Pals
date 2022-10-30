class RestaurantsController < ApplicationController
  # before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  
  # GET /restaurants/1
  def show
    rest_id = params[:id] # retrieve restaurant ID from URI route
    session[:rest_id] = rest_id
    @restaurant = Restaurant.find(rest_id) # look up restaurant by unique ID
    @reviews = Review.where(:restaurant_id => rest_id) 
    @timeslots = Timeslot.where(:restaurant_id => rest_id) 
    # will render app/views/restaurant/show.<extension> by default
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /restaurants/1
  def update
    if @restaurant.update(restaurant_params)
      redirect_to root_url, notice: 'Restaurant was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /restaurants/1
  def destroy
    @restaurant.destroy
    redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_restaurant
    #   @restaurant = Restaurant.find(params[:id])
    # end

    # Only allow a trusted parameter "white list" through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :rating, :address, :details)
    end
end
