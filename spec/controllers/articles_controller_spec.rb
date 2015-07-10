require 'spec_helper'

RSpec.describe ArticlesController, :type => :controller do
  render_views

  describe "index" do
    let(:source)   { FactoryGirl.create(:source) }
    let!(:article) { FactoryGirl.create(:article, source: source) }

    before do
      xhr :get, :index, format: :json, keywords: keywords
    end

    subject(:results) { JSON.parse(response.body)['articles'] }

    context "when the search finds results" do
      let(:keywords) { 'baked' }

      it 'returns one article' do
        expect(results.size).to eq(1)
      end

      it "includes article title" do
        expect(results[0]["title"]).to eq article.title
      end
    end

    context "when the search doesn't find results" do
      let(:keywords) { 'foo' }

      it 'returns no results' do
        expect(results.size).to eq(0)
      end
    end
  end
end