require 'rails_helper'

RSpec.describe TimeslotsController, type: :controller do
    
  describe "show" do
    it "join a timeslot" do    
    @timeslot = Timeslot.create!(restaurant_id: 1, user_id: 1, status: 'Completed', start_time: '2022-10-11 12:37:00')
    request.session[:user_id] = 1
    get :show, {:id => @timeslot.id, :status => 'active'}
    @timeslot.reload
    # expect(@timeslot.guest).to eql 1
    end

    it "exit a timeslot" do
      @timeslot = Timeslot.create!(restaurant_id: 1, user_id: 1, status: 'Completed', start_time: '2022-10-11 12:37:00')
      request.session[:user_id] = 1
      expect {
        delete :destroy, {id: @timeslot.id}
      }
      @timeslot.reload
    end


  end
end