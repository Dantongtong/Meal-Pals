class RestaurantsController < ApplicationController
  def show
    restaurant_id = params[:id] # retrieve restaurant ID from URI route
    session[:restaurant_id] = restaurant_id
    @restaurant = Restaurant.find(restaurant_id) # look up restaurant by unique ID
    @reviews = Review.where(:restaurant_id => restaurant_id) 
    @timeslots = Timeslot.where(:restaurant_id => restaurant_id) 
    @current = Time.now.strftime("%Y-%m-%d %H:%M:%S")
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
    puts restaurant_params
    if restaurant_params["name"] != '' && restaurant_params["rating"] != '' && restaurant_params["address"] != '' && restaurant_params["details"] != ''
      @restaurant = Restaurant.create!(restaurant_params)
      redirect_to root_url, notice: 'Restaurant was successfully created.'
    else
      flash[:error] = 'Failed to create the new restaurant. Please fill all the blank before submit.'
      redirect_to root_url
    end
  end

  # PATCH/PUT /restaurants/1
  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes!(restaurant_params)
      flash[:success] = "Restaurant was successfully updated."
      redirect_to root_url
    end
  end

  # DELETE 
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to root_url, notice: 'Restaurant was successfully destroyed.'
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :rating, :address, :details, :image)
    end
end
