require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  context "#logged_in" do
    it "returns true" do
      session[:user_id] = 1
      expect(helper.logged_in?).to be_truthy
    end
    it "returns false" do
      expect(helper.logged_in?).to be_falsey
    end
  end
  context "#current_user" do
    it "returns user" do
      user = User.create(email: 'rspec@columbia.edu', password: '1234', username: 'rspec', email_confirmed: true)
      session[:user_id] = user.id
      expect(helper.current_user).to eql(user)
    end
    it "returns false" do
      expect(helper.current_user).to be_nil
    end
  end
end