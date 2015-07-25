require 'spec_helper'

RSpec.describe ArticlesController, type: :controller do
  render_views

  let(:user)   { FactoryGirl.create(:user) }

  before :each do
    sign_in(user)
  end

  describe "index" do
    let(:source)   { FactoryGirl.create(:source) }
    let!(:article) { FactoryGirl.create(:article, source: source, description: 'baked et voila!') }

    before do
      get :index, format: :json, q: keywords
    end

    subject(:results) { JSON.parse(response.body) }

    let(:keywords) { 'baked' }

    it 'returns one article' do
      expect(results.size).to eq(1)
    end

    it "includes article title" do
      expect(results[0]["title"]).to eq article.title
    end
  end
end