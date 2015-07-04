require 'rails_helper'

RSpec.describe ArticleServices::Synchronize, type: :service_objects do
  let(:source)        { FactoryGirl.create(:source) }
  let(:article)       { FactoryGirl.create(:article, source: source) }
  let(:main_service)  { described_class.new(article) }

  describe 'call' do
    before :each do
      allow(Net::HTTP).to receive(:get).and_return '{ "shares": 12, "count": 10 }'
      main_service.call
    end

    it { expect(article.facebook).to  eq 12 }
    it { expect(article.linkedin).to  eq 10 }
    it { expect(article.twitter).to   eq 10 }
  end
end