require 'rails_helper'

RSpec.describe TimeslotsController, type: :controller do
    
  describe "show" do
    it "join a timeslot" do    
    @timeslot = Timeslot.create!(restaurant_id: 1, owner: 1, guest: nil, start_time: '10-Nov-2022 12:00:00')
    get :show, {:id => @timeslot.id, params:{:status => 'active'}, :session => {:user_id => 1} }
    @timeslot.reload
    expect(@timeslot.guest).to eql 1
    end
  end
end