require 'rails_helper'

RSpec.describe AdminArticle do
  let(:source)    { FactoryGirl.build(:source) }
  let(:article)   { FactoryGirl.build(:article, source: source) }

  subject(:upmin) { described_class.new(article) }

  it { expect(upmin).to be_valid }
  it { expect(upmin.title).to eq article.title }

  describe 'Article synchronization' do
    before :each do
      expect_any_instance_of(ArticleServices::Synchronize).
        to receive(:call).and_return is_valid
    end

    context 'valid synchronization' do
      let(:is_valid) { true }

      it { expect(upmin.update_social_attributes).to eq 'Completed' }
    end

    context 'invalid sync' do
      let(:is_valid) { false }

      before :each do
        article.errors.add(:fake_error, 'Fake Error')
      end

      it { expect(upmin.update_social_attributes).to include 'Fake Error' }
    end
  end
end
