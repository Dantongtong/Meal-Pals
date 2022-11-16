require 'rails_helper'

RSpec.describe TimeslotsController, type: :controller do
    
  describe "GET #edit" do
    it "join a timeslot" do    
      @timeslot = Timeslot.create!(restaurant_id: 1, user_id: 1, status: 'Completed', start_time: '2022-10-11 12:37:00', max_number: 6)
      request.session[:user_id] = 1
      expect {
        get :edit, {:id => @timeslot.id, :status => 'active'}
      }
      @timeslot.reload
    end

    it "exit a timeslot" do
      @timeslot = Timeslot.create!(restaurant_id: 1, user_id: 1, status: 'Completed', start_time: '2022-10-11 12:37:00', max_number: 6)
      request.session[:user_id] = 1
      expect {
        get :edit, {:id => @timeslot.id, :status => nil}
      }
      @timeslot.reload
    end
  end
  
  context "timeslot#destroy" do
    it "destroys the timeslot" do
      @timeslot = Timeslot.create!(restaurant_id: 1, user_id: 1, status: 'Completed', start_time: '2022-10-11 12:37:00', max_number: 6)
      @guest = Guest.create!(timeslot_id: 1, user_id: 2)
      request.session[:user_id] = 1
      request.session[:timeslot_id] = 1
      expect {
        delete :destroy, {id: @guest.id}
      }.to change(Guest, :count).by(-1)
      expect {
        delete :destroy, {id: @timeslot.id}
      }.to change(Timeslot, :count).by(-1)
      expect(response).to redirect_to(restaurant_path(1))
    end
  end
end