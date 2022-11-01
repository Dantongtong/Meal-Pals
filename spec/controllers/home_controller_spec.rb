require 'rails_helper'

RSpec.describe HomeController, type: :controller do
    describe "home#index" do
        it "show restaurant list" do
            get :index
            expect(response).to render_template('index')
        end
    end      
end
