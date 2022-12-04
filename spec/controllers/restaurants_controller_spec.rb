require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
  describe "GET #new" do
    it "enter a blank restaurant page" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      @restaurant = Restaurant.create!(name: 'Ramen', rating: 'Good', details: 'Japanese food')
      restaurant_id = @restaurant.id
      @reviews = Review.where(:restaurant_id => @restaurant.id) 
      @timeslots = Timeslot.where(:restaurant_id => @restaurant.id) 
      get :show, {:id => @restaurant.id}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "edit currrent restaurant info" do
      @restaurant = Restaurant.create!(name: 'Ramen', rating: 'Good', details: 'Japanese food')
      get :edit, {:id => @restaurant.id}
      expect(response).to have_http_status(200)
      #expect(response).to redirect_to(edit_restaurant_path(@restaurant))
    end
  end

  describe "POST #create" do
    it "creates a new Restaurant" do
      expect {
        post :create, {restaurant: {name: 'Ramen Soup', rating: 'Good', details: 'Japanese food'}}
      }.to change(Restaurant, :count).by(1)
    end

    it "redirects to the created restaurant" do
      post :create, {restaurant: {name: 'Ramen Soup', rating: 'Good', details: 'Japanese food'}}
      expect(response).to redirect_to(root_path)
    end

    it "fails to create a new Restaurant" do
      post :create, {restaurant: {name: ''}}
      expect(response).to redirect_to(root_path)
    end
  end

  describe "PUT #update" do
    it "updates the requested restaurant" do
      @restaurant = Restaurant.create!(name: 'Ramen', rating: 'Good', details: 'Japanese food')
      put :update, {id: @restaurant.id, restaurant: {rating: 'Not Good'}}
      @restaurant.reload
      expect(@restaurant.rating).to eql 'Not Good'
    end

    it "redirects to the restaurants list" do
      @restaurant = Restaurant.create!(name: 'Ramen', rating: 'Good', details: 'Japanese food')
      put :update, {id: @restaurant.id, restaurant: {rating: 'Not Good'}}
      expect(response).to redirect_to(root_path)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested restaurant" do
      @restaurant = Restaurant.create!(name: 'Ramen', rating: 'Good', details: 'Japanese food')
      expect {
        delete :destroy, {id: @restaurant.id}
      }.to change(Restaurant, :count).by(-1)
    end

    it "redirects to the restaurants list" do
      @restaurant = Restaurant.create!(name: 'Ramen', rating: 'Good', details: 'Japanese food')
      delete :destroy, {id: @restaurant.id}
      expect(response).to redirect_to(root_path)
    end
  end

end
