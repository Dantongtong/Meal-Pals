require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  context "session#create" do
    it 'log in successfully and then log out' do
      user = User.create(email: 'rspec@columbia.edu', password: '1234', username: 'rspec', email_confirmed: true)
      post :create, { email: user.email, password: user.password}
      expect(response).to redirect_to(root_path)

    end
    it 'fail to log in because of unconfirmed account' do
      user = User.create(email: 'rspec2@columbia.edu', password: '1234', username: 'rspec2')
      post :create, { email: user.email, password: user.password}
      expect(response).to render_template('new')
    end
    it 'fail to log in because of incorrect email or password' do
      user = User.create(email: 'rspec2@columbia.edu', password: '1234', username: 'rspec2')
      post :create, { email: user.email, password: '1234333333333'}
      expect(response).to render_template('new')
    end
  end
  context "session#logout" do
    it 'logout' do
      user = User.create(email: 'rspec@columbia.edu', password: '1234', username: 'rspec', email_confirmed: true)
      # get(:logout, params: {session: {'user_id' => user.id}})
      request.session[:user_id] = user.id
      get :logout, {id: user.id}
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(root_path)
    end
  end

  context "session#slots" do
    before(:each) do
      @user_id = 1
      @slot = Timeslot.create(restaurant_id: 1, user_id: @user_id, status:"Completed", start_time: '2022-10-11 12:37:00', max_number: 6)
    end
    it "show my slots" do
      get :slots, {id: @user_id}
      expect(response).to render_template('slots')
    end
  end
end
