require 'spec_helper'

RSpec.describe DashboardController, type: :controller do
  render_views

  let(:user)   { FactoryGirl.create(:user) }

  before :each do
    sign_in(user)
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'index'

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end