require 'rails_helper'
require 'carrierwave/test/matchers'

RSpec.describe ProfilesController, type: :controller do
  before(:each) do
    @profile = Profile.create(id: 2, user_id: 1, first_name: 'rspec_first', phone: '1234')
  end
  describe "profile#edit" do
    it "show profile info" do
      get :edit, {id: @profile.id}
      expect(@profile.avatar.url).to match("/assets/fallback/default")
      expect(response).to render_template('edit')
    end
  end

  describe "profile#update" do
    it "update profile" do
      put :update, {id: 2, profile: {phone: '1111', gender: 'Male', avatar: fixture_file_upload( '/1.png', "image/png")}}
      @profile.reload
      expect(@profile.phone).to eql('1111')
      expect(response).to redirect_to(edit_profile_path(2))
    end
    it "failed to update profile" do
      put :update, {id: 2, profile: {phone: 'eeeeee', gender: 'Male'}}
      expect(response).to redirect_to(edit_profile_path(2))
    end
  end



end