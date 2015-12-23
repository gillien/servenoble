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

    context 'with criteria' do
      before do
        get :index, format: :json, keywords: keywords
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

    context 'without criteria' do
      before do
        get :index, format: :json
      end

      subject(:results) { JSON.parse(response.body) }

      let(:keywords) { 'baked' }

      it 'returns one article' do
        expect(results.size).to eq(1)
      end
    end
  end


  describe "put" do
    let(:source)   { FactoryGirl.create(:source) }
    let!(:article) { FactoryGirl.create(:article, source: source, description: 'baked et voila!') }

    context 'update status valid' do
      before do
        put :update, format: :json, status: 'approved', id: article.id
      end

      subject(:results) { JSON.parse(response.body) }

      it 'returns one article' do
        expect(results['article']).to be_present
        expect(results['message']).to be_blank
      end
    end

    context 'update status invalid' do
      before do
        put :update, format: :json, status: '', id: article.id
      end

      subject(:results) { JSON.parse(response.body) }

      it 'returns one article' do
        expect(results['article']).to     be_present
        expect(results['message']).not_to be_blank
      end
    end
  end
end