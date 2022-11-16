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

    it "fails to create a new timeslot without filling" do
      count = Timeslot.count
      request.session[:restaurant_id] = 1
      post :create, {timeslot: {restaurant_id: 1, user_id: 1, max_number: 6}, start_time: ''}
      expect(Timeslot.count).to eql(count)
      expect(response).to redirect_to(restaurant_path(1))
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      @timeslot = Timeslot.create!(restaurant_id: 1, user_id: 1, start_time: '2022-10-11 12:37:00', max_number: 6)
      get :show, {:id => @timeslot.id}
      expect(response).to be_success
    end
  end
    
  describe "GET #edit" do
    it "join a timeslot" do    
      request.session[:user_id] = 2
      request.session[:restaurant_id] = 1
      @timeslot = Timeslot.create!(restaurant_id: 1, user_id: 1, start_time: '2022-10-11 12:37:00', max_number: 6)
      expect {
        get :edit, {:id => @timeslot.id, :status => 'active'}
      }.to change(Guest, :count).by(1)
      @timeslot.reload

    end

    it "exit a timeslot" do
      request.session[:user_id] = 2
      request.session[:restaurant_id] = 1
      @timeslot = Timeslot.create!(restaurant_id: 1, user_id: 1, start_time: '2022-10-11 12:37:00', max_number: 6)
      Guest.create!(:timeslot_id =>@timeslot.id, :user_id => 2 )
      count = Timeslot.count
      expect {
        get :edit, {:id => @timeslot.id, :status => ''}
      }.to change(Guest, :count).by(-1)
      @timeslot.reload
      expect(response).to redirect_to(restaurant_path(1))
    end
  end

  context "timeslot#destroy" do
    it "destroys the timeslot" do
      @timeslot = Timeslot.create!(restaurant_id: 1, user_id: 1, start_time: '2022-10-11 12:37:00', max_number: 6)
      @guest = Guest.create!(timeslot_id: 1, user_id: 2)
      request.session[:user_id] = 1
      request.session[:timeslot_id] = 1
      request.session[:restaurant_id] = 1
      expect {
        delete :destroy, {id: @timeslot.id}
      }.to change(Timeslot, :count).by(-1)
      expect(response).to redirect_to(restaurant_path(1))
    end 

    it "destroys the guest entry" do
      @timeslot = Timeslot.create!(restaurant_id: 1, user_id: 1,  start_time: '2022-10-11 12:37:00', max_number: 6)
      @guest = Guest.create!(timeslot_id: 1, user_id: 2)
      request.session[:user_id] = 1
      request.session[:timeslot_id] = 1
      request.session[:restaurant_id] = 1
      expect {
        delete :destroy, {id: @guest.id}
      }.to change(Guest, :count).by(-1)
      expect(response).to redirect_to(restaurant_path(1))
    end
  end

  context "timeslot#create" do
    it "invalid timeslot" do
      request.session[:user_id] = 1
      request.session[:restaurant_id] = 1

      count = Timeslot.count
      post :create, {"start_time":"", timeslot: { restaurant_id: 1, user_id: 1, start_time: '2022-10-11 12:37:00', max_number: 6}}
      expect(Timeslot.count).to eql(count)
      expect(response).to redirect_to(restaurant_path(1))

    end
  
    it "creates the timeslot" do
      request.session[:user_id] = 1
      request.session[:restaurant_id] = 1
      count = Timeslot.count
      post :create, {"start_time": '11/16/2022 12:55 PM', timeslot: { restaurant_id: 1, user_id: 1, max_number: 6}}
      expect(Timeslot.count).to eql(count+1)    
    end

    it "fail to create a new timeslot" do
      class Fake
        attr_accessor :save
      end
        
      request.session[:user_id] = 1
      request.session[:restaurant_id] = 1
      count = Timeslot.count
      @fake_res = Fake.new
      @fake_res.save = false
      count = Timeslot.count
      Timeslot.stub(:create!).and_return(@fake_res)
      post :create, {start_time: '11/16/2022 12:55 PM', timeslot: { restaurant_id: 1, user_id: 1, max_number: 6, start_time: '11/16/2022 12:55 PM' }}
      expect(Timeslot.count).to eql(count)
    end
  end

  context "timeslot#show" do
    it "returns a success response" do
      @timeslot = Timeslot.create!({ restaurant_id: 1, user_id: 1, start_time: '2022-10-11 12:37:00', max_number: 6})
      request.session[:user_id] = 1
      request.session[:id] = @timeslot.id

      get :show, {:id => @timeslot.id}
      expect(response).to be_success
    end
  end

  describe "timeslot#new" do
    it "new page" do
      get :new
      expect(response).to render_template('new')
    end
  end


end