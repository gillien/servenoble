require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:source)      { FactoryGirl.build(:source) }
  subject(:article) { FactoryGirl.build(:article, source: source) }

  it { expect(article).to be_valid }

  describe 'search' do
    it { expect(Article.search(keywords: 'query', source_id: source.id, status: 1)).to eq [] }

    context 'it has no criteria' do
      before :each do
        expect(Article).not_to receive(:search_or_none)
      end

      it { expect(Article.search({})).to eq [] }
    end
  end
end
