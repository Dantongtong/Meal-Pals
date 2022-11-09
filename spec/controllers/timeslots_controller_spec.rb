require 'rails_helper'

RSpec.describe TimeslotsController, type: :controller do
    
  describe "show" do
    it "join a timeslot" do    
    @timeslot = Timeslot.create!(restaurant_id: 1, user_id: 1, guest: nil, start_time: '10-Nov-2022 12:00:00')
    request.session[:user_id] = 1
    get :show, {:id => @timeslot.id, :status => 'active'}
    @timeslot.reload
    expect(@timeslot.guest).to eql 1
    end

    it "exit a timeslot" do
      @timeslot = Timeslot.create!(restaurant_id: 1, user_id: 1, guest: 1, start_time: '10-Nov-2022 12:00:00')
      request.session[:user_id] = 1
      get :show, {:id => @timeslot.id, :status => nil}
      @timeslot.reload
      expect(@timeslot.guest).to eql nil
    end


  end
end