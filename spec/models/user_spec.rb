require 'rails_helper'

RSpec.describe User, type: :model do
  context "confirmation_token method" do
    it "execute confirmation_token method before create" do
      @user = User.create(email: 'test@columbia.edu', password: '123', first_name: 'test')
      expect(@user.confirm_token).not_to be_nil
    end
  end

end
