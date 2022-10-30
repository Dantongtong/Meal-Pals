require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context "user#new" do
    it 'new user' do
      get :new
      expect(response).to render_template('new')
    end
  end

  context "user#create" do
    it 'create user successfully' do
      count = User.count
      post :create, {user: { email: 'rspec@columbia.edu', password: '1234', first_name: 'rspec' }}
      expect(User.count).to eql(count+1)
      expect(response).to redirect_to(new_session_path)
    end
    it 'fail to create user' do
      count = User.count
      post :create, {user: { email: 'rspec.columbia.edu', password: '1234', first_name: 'rspec' }}
      expect(User.count).to eql(count)
    end
  end

  context "user#confirm_email" do
    before(:each) do
      @user = User.create(email: 'rspec@columbia.edu', password: '1234', first_name: 'rspec')
    end
    it 'activate account successfully' do
      @user = User.create(email: 'test@columbia.edu', password: '123', first_name: 'test')
      puts @user.confirm_token
      get :confirm_email, {id: @user.confirm_token}
      @user.reload
      expect(@user.email_confirmed).to be_truthy
      expect(response).to redirect_to(new_session_path)
    end
    it 'fail to activate account' do
      get :confirm_email, { id: 0}
      expect(@user.email_confirmed).to be_nil
      expect(response).to redirect_to(new_session_path)
    end
  end
end
