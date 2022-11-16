require 'rails_helper'

RSpec.describe TimeslotsController, type: :controller do

  describe "GET #new" do
    it "enter a blank timeslot form page" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "POST #create" do
    it "creates a new timeslot" do
      request.session[:restaurant_id] = 1
      expect {
        post :create, {timeslot: {restaurant_id: 1, user_id: 1, max_number: 6}, start_time: '11/16/2022 11:59 AM'}
      }.to change(Timeslot, :count).by(1)
      expect(response).to redirect_to(restaurant_path(1))
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      @timeslot = Timeslot.create!(restaurant_id: 1, user_id: 1, status: 'Completed', start_time: '2022-10-11 12:37:00', max_number: 6)
      get :show, {:id => @timeslot.id}
      expect(response).to be_success
    end
  end
    
  describe "GET #edit" do
    it "join a timeslot" do    
      @timeslot = Timeslot.create!(restaurant_id: 1, user_id: 1, status: 'Completed', start_time: '2022-10-11 12:37:00', max_number: 6)
      request.session[:user_id] = 1
      request.session[:restaurant_id] = 1
      get :edit, {:id => @timeslot.id, :status => 'active'}
      @timeslot.reload
      expect(response).to redirect_to(restaurant_path(1))
    end

    it "exit a timeslot" do
      @timeslot = Timeslot.create!(restaurant_id: 1, user_id: 1, status: 'Completed', start_time: '2022-10-11 12:37:00', max_number: 6)
      request.session[:user_id] = 1
      request.session[:restaurant_id] = 1
      get :edit, {:id => @timeslot.id, :status => nil}
      @timeslot.reload
      expect(response).to redirect_to(restaurant_path(1))
    end
  end

  context "timeslot#destroy" do
    it "destroys the timeslot" do
      @timeslot = Timeslot.create!(restaurant_id: 1, user_id: 1, status: 'Completed', start_time: '2022-10-11 12:37:00', max_number: 6)
      request.session[:user_id] = 1
      request.session[:restaurant_id] = 1
      expect {
        delete :destroy, {id: @timeslot.id}
      }.to change(Timeslot, :count).by(-1)
      expect(response).to redirect_to(restaurant_path(1))
    end
  end
end